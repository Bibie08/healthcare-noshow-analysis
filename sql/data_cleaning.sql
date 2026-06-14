
#Membuat tabel baru cleaning
create healthcare_noshows_clean
like healthcare_noshows_raw;

#Memasukan data mentah tabel raw ke dataseset clean 
insert into healthcare_noshows_clean
select * from healthcare_noshows_raw;

#Pemprofilan data untuk memeriksa deperti jumlah data, jumlah kolom dll nya
select count(*) from healthcare_noshows_clean; #jumlah data 106987
describe healthcare_noshows_clean ; #menampilkan detail table berupa jumlah kolom dan type data 
select count(distinct trim(gender)) ,
	   count(distinct PatientId), 
	   count(distinct Neighbourhood), 
	   count(distinct Age ) from healthcare_noshows_clean; # Menampilkan jumlah nilai unik dari kolom gender,PatientId dll nya
select * from healthcare_noshows_clean limit 10; #menampilkan contoh 10 baris

/* Cek duplikat pada table 
menggunakan tips windows function paakai row number */
select *,
row_number() over(partition by PatientId, Appointmentid, Gender, Scheduledday,Appointmentday, Age) as row_numbers
from healthcare_noshows_clean;

#Membuat CTE dan cari row number yg lebih dari 1 udah otomatis duplikat
with kolomduplikat as (
select *,
row_number() over(partition by PatientId, Appointmentid, Gender, Scheduledday,Appointmentday, Age) as row_numbers
from healthcare_noshows_clean
)
select * from kolomduplikat
where row_numbers > 1;
#kebeutlan tidak ada data duplikat


#Standarisasi Nama Kolom
select Hipertension as Hypertension, Handcap as Handicap, SMS_received as SMSReceived,
	   Showed_up as ShowedUp from healthcare_noshows_clean; #memastikan nama kolom benar sebelum di alter table / ubah
	   
alter table healthcare_noshows_clean rename column Hipertension to Hypertension;
alter table healthcare_noshows_clean rename column Handcap to Handicap;
alter table healthcare_noshows_clean rename column SMS_received to SMSReceived;
alter table healthcare_noshows_clean rename column Showed_up to ShowedUp; 
	#melakukan perubahan nama kolom pakai altertable krn tidak bisa palai , jadinya exceute satu2..
			 
/* mengubah kolom yang awalnya terbaca sebagai text TRUE/FALSE 
menjadi tipe yang lebih sesuai untuk analisis, yaitu binary flag 1/0. */

#seperti biasa sblm update crosscheck dulu apakah benar sesuai keinginan kalosudah sesuai baru update
select  
    case when trim(upper(scholarship)) = 'true' then 1 when trim(upper(scholarship)) = 'false' then 0 else null end as test_scholarship,
    case when trim(upper(hypertension)) = 'true' then 1 when trim(upper(hypertension)) = 'false' then 0 else null end as test_hypertension,
    case when trim(upper(alcoholism)) = 'true' then 1 when trim(upper(alcoholism)) = 'false' then 0 else null end as test_alcoholism,
    case when trim(upper(handicap)) = 'true' then 1 when trim(upper(handicap)) = 'false' then 0 else null end as test_handicap,
    case when trim(upper(smsreceived)) = 'true' then 1 when trim(upper(smsreceived)) = 'false' then 0 else null end as test_smsreceived,
    case when trim(upper(diabetes)) = 'true' then 1 when trim(upper(diabetes)) = 'false' then 0 else null end as test_diabetes,
    case when trim(upper(showedup)) = 'true' then "Showed Up" when trim(upper(showedup)) = 'false' then "No Show" else null end as showedup
from healthcare_noshows_clean
limit 15; #memastikan isi data benar sebelum di update table

#update data kolom yg berisi true false untuk diubah ke binary flag 0 dan 1
update healthcare_noshows_clean
set scholarship = case when trim(upper(scholarship)) = 'true' then 1 when trim(upper(scholarship)) = 'false' then 0 else null end,
	hypertension =  case when trim(upper(hypertension)) = 'true' then 1 when trim(upper(hypertension)) = 'false' then 0 else null end,
	alcoholism = case when trim(upper(alcoholism)) = 'true' then 1 when trim(upper(alcoholism)) = 'false' then 0 else null end,
	handicap = case when trim(upper(handicap)) = 'true' then 1 when trim(upper(handicap)) = 'false' then 0 else null end,
	smsreceived = case when trim(upper(smsreceived)) = 'true' then 1 when trim(upper(smsreceived)) = 'false' then 0 else null end,
	diabetes =  case when trim(upper(diabetes)) = 'true' then 1 when trim(upper(diabetes)) = 'false' then 0 else null end,
	showedup = case when trim(upper(showedup)) = 'true' then "Showed Up" when trim(upper(showedup)) = 'false' then "No Show" else null end;
	#showedup diubah ke teks biar lebih enak dibaca di visualisasi

#Standarisasi Tipe Data
describe healthcare_noshows_clean; #cek tipe data yg tidak sesuai
alter table healthcare_noshows_clean
	modify column scheduledday date,
	modify column appointmentday date,
	modify column scholarship boolean,
	modify column hypertension boolean,
	modify column diabetes boolean,
	modify column alcoholism boolean,
	modify column handicap boolean,
	modify column smsreceived boolean,
	modify column showedup varchar(20);
	#mengubah tipe data seusai degnan isi data nya


/* cleaning spasi berlebih di semua kolom teks
awali dengan select dulu sblm eksekusi update */

select trim(gender) as gender_clean , trim(neighbourhood) as clean_neighbour , trim(showedup) as clean_showedup
from healthcare_noshows_clean limit 5;

#lanjut upadate
 update healthcare_noshows_clean
 set gender = trim(gender),
 	 neighbourhood = trim(neighbourhood),
 	 showedup = trim(showedup);

#cek null value/blank value

select *
from healthcare_noshows_clean
where (gender is null or trim(gender) = '')
or (age is null or trim(age) = '')
or (neighbourhood is null or trim(neighbourhood) = '')
or (showedup is null or trim(showedup) = '')
or (waitingdays is null or trim(waitingdays) = '');
/* semua kolom telah diperiksa dan dipastikan bebas dari nilai null/blank.
data siap digunakan untuk proses analisis selanjutnya. */


#Validasi waktu tunggu dan jadwal temu
select scheduledday, appointmentday, MAX(waitingdays)waitingdays from healthcare_noshows_clean 
group by scheduledday, appointmentday
order by waitingdays desc
limit 100;

/* setelah waitingdays dicek secara ascending dan descending, ditemukan nilai maksimum sebesar 179 hari. 
   nilai ini termasuk extreme value tetapi masih valid secara logika. 
   namun, terdapat data anomali dengan waitingdays bernilai negatif 
   karena tanggal appointment lebih awal daripada tanggal booking. */

#menghapus data anomali waiting days yg berniali negatif
select waitingdays from healthcare_noshows_clean 
where waitingdays <0;
#eksekusi deelete
delete from healthcare_noshows_clean
where waitingdays < 0;

/* validasi umur:
nilai minimum dan maksimum pada kolom age dicek untuk menemukan kemungkinan anomali.
ditemukan nilai maksimum umur sebesar 115 tahun, yang termasuk extreme value tetapi masih valid secara logika.
karena tidak ditemukan umur negatif, kolom age dianggap layak digunakan untuk analisis.
*/
select MIN(age),MAX(age) from healthcare_noshows_clean;




