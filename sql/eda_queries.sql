#Melakukan EDA Sebelum lanjut visualisasi di Power BI

describe healthcare_noshows_clean;

#1.	Total appointment? sekitar 106982 apointment di dataset
select COUNT(appointmentday)appointmentday from healthcare_noshows_clean;

#Berapa pasien datang dan tidak datang? Showedup total 85307 dan Noshown 21675
select showedup, count(showedup) as pasiendatang from healthcare_noshows_clean
group by showedup;

# Waiting days paling umum ?
# 5 durasi waktu tunggu paling umum (berdasarkan urutan jumlah terbanyak): 0 hari, 2 hari, 4 hari, 1 hari, dan 7 hari. 
select waitingdays, count(waitingdays) as waitingdayss from healthcare_noshows_clean
group by waitingdays
order by waitingdayss desc
limit 5;

# Age group terbanyak apa?
# Age Group Paling banyak (berdasarkan urutan jumlah terbanyak): Umur 1 Tahun, Umur 52 Tahun, Umur 49 Tahun, Umur 53 Tahun, dan Umur 56 Tahun
select Age, count(age) as total from healthcare_noshows_clean
group by Age
order by total desc
limit 5;

# SMS paling banyak diterima atau tidak? lebih banyak sms yg tidak diterima sebanyak 72397 dan diterima sebanyak 34585
select smsreceived, count(smsreceived) as total from healthcare_noshows_clean
group by smsreceived
order by total desc;

#Neighbourhood dengan appointment terbanyak apa? Lokasi nya ada  di Jardim Camburi
select Neighbourhood, count(appointmentday) as total from healthcare_noshows_clean
group by Neighbourhood
order by total desc
limit 1;