# Healthcare Appointment No-Show Analysis
Data analysis of healthcare appointment no-shows using SQL and Power BI.

🌍 **Language / Bahasa:** This README is available in English and Bahasa Indonesia.

---
## 📊 Dashboard Preview
**1. Executive Overview**
<img width="2194" height="1244" alt="overview_page" src="https://github.com/user-attachments/assets/6c5f08d1-a2e7-4f38-b440-f2e982df5057" />


**2. Scheduling & SMS Reminder Analysis**
<img width="2534" height="1426" alt="patient_location_page" src="https://github.com/user-attachments/assets/51e82474-0546-40af-9693-7b5df6680338" />


**3. Patient & Location Risk Analysis**
<img width="2532" height="1424" alt="scheduling_sms_page" src="https://github.com/user-attachments/assets/3ccd9f91-da7f-41b3-9d3e-917d0cc6f153" />


<details open>
  <summary>🇬🇧 <b>English Version</b></summary>
  <br>

  ## Project Overview
  This project analyzes historical healthcare appointment data to identify patterns related to patient attendance and no-shows. The analysis focuses on understanding how scheduling behavior, SMS reminders, patient age groups, and neighbourhood-level patterns are associated with appointment attendance.

  The final output is an interactive Power BI dashboard consisting of three main pages:
  1. Executive Overview
  2. Scheduling & SMS Reminder Analysis
  3. Patient & Location Risk Analysis

  ## Dataset
  The dataset was obtained from Kaggle: [Healthcare Appointment Dataset](https://www.kaggle.com/code/pavankumar4757/healthcare-appointment-dataset-no-show-prediction/input).
  
  The dataset contains historical healthcare appointment records from 2015–2016, including patient demographics, appointment scheduling information, medical conditions, SMS reminder status, and attendance status.
  
  > **Important note:** This dataset is historical. Therefore, the insights should be interpreted as pattern analysis rather than a direct reflection of current healthcare operations.

  ## Problem Statement
  Hospitals and clinics often face operational challenges caused by patients missing their scheduled appointments. Patient no-shows can lead to unused service slots, inefficient use of doctors’ time, and longer waiting times for other patients.
  
  This project aims to analyze patient attendance patterns based on factors such as waiting days, SMS reminders, age group, location, social welfare status, and medical conditions. The analysis is intended to help healthcare providers identify patterns related to no-shows and support better appointment management decisions.

  ## Business Questions
  This project aims to answer the following questions:
  * What is the overall patient attendance and no-show rate?
  * How does the waiting time between scheduling date and appointment date relate to patient no-show rate?
  * Do patients who received SMS reminders have a different attendance pattern compared to patients who did not receive SMS reminders?
  * Which neighbourhoods have the highest no-show risk when considering both appointment volume and no-show rate?
  * Which age groups have the highest no-show rate?
  * Is there any difference in attendance patterns between patients enrolled in the social welfare program and those who are not?
  * Do patients with certain medical conditions, such as hypertension, diabetes, alcoholism, or disability status, show different attendance patterns?

  ## Tools Used
  * **SQL (DBeaver)**
  * **Power BI**
  * **Excel**
  * **GitHub**

  ## Project Workflow
  
  ### 1. Data Understanding
  The dataset was reviewed to understand the meaning of each column and identify the target variable. Key columns include: `PatientId`, `AppointmentID`, `Gender`, `ScheduledDay`, `AppointmentDay`, `Age`, `Neighbourhood`, `Scholarship`, `Hypertension`, `Diabetes`, `Alcoholism`, `Handicap`, `SMSReceived`, `ShowedUp`, `WaitingDays`.
  * The target variable is **ShowedUp**, which indicates whether a patient attended the scheduled appointment.

  ### 2. Data Cleaning
  The raw CSV file was imported into a SQL database using DBeaver. Boolean-like columns were initially imported as text to avoid parsing errors during the CSV import process. The cleaning process included:
  * Preserving the raw table
  * Profiling the dataset
  * Checking duplicate records and unique IDs
  * Standardizing column names and data types
  * Cleaning text fields and checking null/blank values
  * Validating appointment dates and waiting days
  * Checking outliers, especially age and waiting days
  * Removing or hiding unused columns only after validation
  * Creating a clean table for analysis

  ### 3. Data Validation
  Several validation checks were performed before dashboard development:
  * Duplicate appointment records were checked using `AppointmentID`.
  * Appointment dates were validated to ensure they did not occur before scheduling dates.
  * Negative waiting days were treated as invalid.
  * Extreme values were reviewed, including the maximum age and maximum waiting days.
  * Boolean-like fields were standardized for analysis.

  ### 4. Feature Engineering
  Additional analytical columns were created to support dashboard analysis: `AgeGroup`, `WaitingDaysGroup`, `WaitingDaysSort`, `SMS status label`, and `Attendance status label`.
  
  **Waiting Days Groups:**
  * Same Days (0 days)
  * Short Wait (1-7 days)
  * Medium Wait (8-30 days)
  * Long Wait (31-90 days)
  * Very Long Wait (91+ days)

  ### 5. Exploratory Data Analysis
  Before building the dashboard, initial exploratory analysis was performed to answer basic questions from the clean dataset regarding total appointments, show-up percentages, most common waiting day groups, and appointment volumes across age groups and neighbourhoods.

  ## Key Insights
  1. **Overall Attendance Pattern:** The overall show-up rate was approximately 79.74%, while the no-show rate was approximately 20.26%. Around one in five scheduled appointments resulted in a no-show.
  2. **Waiting Time and No-Show Rate:** Same-day appointments had the lowest no-show rate. Longer waiting periods were generally associated with higher no-show rates.
  3. **SMS Reminder Pattern:** Patients who received SMS reminders showed a higher no-show rate. However, this is a correlation, not causation. SMS reminders may have been sent more frequently to patients with longer waiting times or higher-risk appointment patterns.
  4. **Age Group Risk:** Teenagers showed the highest no-show rate among age groups, indicating younger patient groups may require different reminder strategies.
  5. **Neighbourhood Risk:** Santos Dumont had the highest no-show rate among neighbourhoods with at least 100 appointments.

  ## Recommendations
  Based on the analysis, healthcare providers may consider the following actions:
  * Prioritize follow-up reminders for appointments with longer waiting times.
  * Review same-day appointment patterns, as they show lower no-show rates.
  * Analyze SMS reminder strategies more carefully, especially for patients with longer scheduling gaps.
  * Develop targeted communication strategies for age groups with higher no-show rates.
  * Focus operational review on neighbourhoods with both sufficient appointment volume and high no-show rates.

  ## Limitations
  * The dataset is historical and may not reflect current healthcare operations.
  * The analysis identifies patterns and associations, not causal relationships.
  * Neighbourhood-level analysis does not include exact distance, travel time, or transportation access.
  * External factors such as weather, clinic capacity, doctor availability, and patient socioeconomic details are not available.

  ## Dashboard Preview
  **1. Executive Overview**
  *(Drag & Drop Gambar Page 1 Milikmu ke Sini)*

  **2. Scheduling & SMS Reminder Analysis**
  *(Drag & Drop Gambar Page 2 Milikmu ke Sini)*

  **3. Patient & Location Risk Analysis**
  *(Drag & Drop Gambar Page 3 Milikmu ke Sini)*

  ## Conclusion
  This project demonstrates how SQL and Power BI can be used to analyze healthcare appointment no-show patterns. The analysis found that waiting time, patient age group, SMS reminder status, and neighbourhood-level patterns are associated with patient attendance behavior. The dashboard helps summarize key attendance metrics, identify scheduling-related risks, and highlight patient and location segments that may need further attention.

</details>

<br>

<details>
  <summary>🇮🇩 <b>Versi Bahasa Indonesia</b></summary>
  <br>

  ## Ringkasan Proyek
  Proyek ini menganalisis data historis janji temu layanan kesehatan untuk mengidentifikasi pola yang berkaitan dengan kehadiran dan ketidakhadiran pasien (*no-show*). Analisis difokuskan pada pemahaman tentang bagaimana perilaku penjadwalan, pengingat SMS, kelompok usia pasien, dan tren wilayah (*neighbourhood*) saling terkait dengan tingkat kehadiran.

  Hasil akhir dari proyek ini adalah *dashboard* Power BI interaktif yang terdiri dari tiga halaman utama:
  1. Tinjauan Eksekutif (*Executive Overview*)
  2. Analisis Penjadwalan & Pengingat SMS (*Scheduling & SMS Reminder Analysis*)
  3. Analisis Risiko Pasien & Lokasi (*Patient & Location Risk Analysis*)

  ## Kumpulan Data (Dataset)
  Dataset diperoleh dari Kaggle: [Healthcare Appointment Dataset](https://www.kaggle.com/code/pavankumar4757/healthcare-appointment-dataset-no-show-prediction/input).
  
  Dataset ini berisi catatan historis janji temu kesehatan dari tahun 2015–2016, yang mencakup demografi pasien, informasi penjadwalan janji temu, kondisi medis, status pengingat SMS, dan status kehadiran.
  
  > **Catatan Penting:** Dataset ini bersifat historis. Oleh karena itu, wawasan (*insights*) yang dihasilkan harus diinterpretasikan sebagai analisis pola masa lalu dan bukan gambaran langsung dari operasi layanan kesehatan saat ini.

  ## Pernyataan Masalah (*Problem Statement*)
  Rumah sakit dan klinik sering menghadapi tantangan operasional akibat pasien yang tidak hadir pada jadwal janji temu mereka. Ketidakhadiran ini dapat menyebabkan slot layanan tidak terpakai, inefisiensi waktu dokter, dan antrean pasien lain yang semakin panjang.
  
  Proyek ini bertujuan untuk menganalisis pola kehadiran pasien berdasarkan faktor-faktor seperti waktu tunggu, pengingat SMS, kelompok usia, lokasi, status bantuan sosial, dan kondisi kesehatan. Analisis ini diharapkan dapat membantu penyedia layanan kesehatan mengidentifikasi pola *no-show* dan mendukung pengambilan keputusan manajemen jadwal yang lebih baik.

  ## Pertanyaan Bisnis (*Business Questions*)
  Proyek ini bertujuan untuk menjawab beberapa pertanyaan berikut:
  * Bagaimana tingkat kehadiran dan persentase *no-show* pasien secara keseluruhan?
  * Bagaimana pengaruh waktu tunggu (selisih antara tanggal penjadwalan dan tanggal janji temu) terhadap tingkat *no-show*?
  * Apakah terdapat perbedaan pola kehadiran antara pasien yang menerima SMS pengingat dan yang tidak?
  * Wilayah mana yang memiliki risiko *no-show* tertinggi, dengan mempertimbangkan volume janji temu dan persentasenya?
  * Kelompok usia manakah yang memiliki tingkat *no-show* tertinggi?
  * Apakah terdapat perbedaan pola kehadiran antara pasien peserta program bantuan sosial dan yang bukan peserta?
  * Apakah pasien dengan riwayat medis tertentu (hipertensi, diabetes, alkoholisme, atau disabilitas) menunjukkan pola kehadiran yang berbeda?

  ## Alat yang Digunakan
  * **SQL (DBeaver)**
  * **Power BI**
  * **Excel**
  * **GitHub**

  ## Alur Kerja Proyek (*Project Workflow*)
  
  ### 1. Pemahaman Data (*Data Understanding*)
  Dataset ditinjau untuk memahami arti dari setiap kolom dan mengidentifikasi variabel target. Kolom utama meliputi: `PatientId`, `AppointmentID`, `Gender`, `ScheduledDay`, `AppointmentDay`, `Age`, `Neighbourhood`, `Scholarship`, `Hypertension`, `Diabetes`, `Alcoholism`, `Handicap`, `SMSReceived`, `ShowedUp`, dan `WaitingDays`.
  * Variabel targetnya adalah **ShowedUp**, yang menunjukkan apakah pasien hadir atau tidak.

  ### 2. Pembersihan Data (*Data Cleaning*)
  File CSV mentah diimpor ke dalam *database* SQL menggunakan DBeaver. Proses pembersihan meliputi:
  * Mempertahankan tabel mentah (*raw table*).
  * Melakukan *profiling* data.
  * Memeriksa duplikasi data dan ID unik.
  * Menstandardisasi nama kolom dan tipe data.
  * Membersihkan bidang teks dan memeriksa nilai kosong (*null/blank*).
  * Memvalidasi tanggal janji temu dan perhitungan waktu tunggu.
  * Memeriksa nilai *outlier*, terutama pada kolom usia dan waktu tunggu.
  * Menghapus atau menyembunyikan kolom yang tidak terpakai setelah proses validasi.
  * Membuat tabel bersih (*clean table*) untuk analisis lebih lanjut.

  ### 3. Validasi Data
  Beberapa pemeriksaan validasi dilakukan sebelum pembuatan *dashboard*:
  * Catatan janji temu ganda diperiksa menggunakan `AppointmentID`.
  * Tanggal divalidasi agar tidak ada tanggal janji temu yang terjadi mendahului tanggal penjadwalan.
  * Waktu tunggu bernilai negatif dianggap tidak valid secara logika dan dibersihkan.
  * Nilai ekstrem ditinjau, termasuk batas usia maksimal dan waktu tunggu paling lama.
  * Data *Boolean* (benar/salah) distandardisasi.

  ### 4. Rekayasa Fitur (*Feature Engineering*)
  Beberapa kolom analitis tambahan dibuat untuk mendukung *dashboard*: `AgeGroup`, `WaitingDaysGroup`, `WaitingDaysSort`, label status SMS, dan label status kehadiran.
  
  **Pengelompokan Waktu Tunggu (*Waiting Days Group*):**
  * Same Days: 0 hari (Daftar dan periksa di hari yang sama)
  * Short Wait: 1-7 hari
  * Medium Wait: 8-30 hari
  * Long Wait: 31-90 hari
  * Very Long Wait: Lebih dari 91 hari

  ### 5. Analisis Data Eksploratif (EDA)
  Sebelum merakit *dashboard*, analisis awal dilakukan untuk menjawab pertanyaan dasar dari dataset yang sudah bersih, seperti menghitung total janji temu, persentase kehadiran, kelompok waktu tunggu yang paling umum, serta distribusi pasien berdasarkan kelompok usia dan lokasi.

  ## Temuan Utama (*Key Insights*)
  1. **Pola Kehadiran Keseluruhan:** Tingkat kehadiran keseluruhan berada di angka 79,74%, sedangkan tingkat ketidakhadiran sebesar 20,26%. Artinya, sekitar satu dari lima janji temu berakhir menjadi *no-show*.
  2. **Waktu Tunggu:** Janji temu di hari yang sama (*same-day*) memiliki tingkat *no-show* terendah. Semakin lama rentang waktu tunggu, semakin tinggi pula risiko pasien untuk tidak hadir.
  3. **Pengingat SMS:** Pasien yang menerima SMS justru menunjukkan tingkat *no-show* yang lebih tinggi. Namun, ini adalah bentuk **korelasi, bukan sebab-akibat**. Hal ini terjadi kemungkinan karena SMS pengingat lebih sering dikirim secara otomatis kepada pasien yang memiliki waktu tunggu lebih lama (yang secara alami memang memiliki risiko absen lebih tinggi).
  4. **Risiko Berdasarkan Usia:** Kelompok usia Remaja (*Teenagers*) memiliki persentase ketidakhadiran tertinggi. Ini mengindikasikan bahwa kelompok usia muda mungkin memerlukan strategi komunikasi yang berbeda.
  5. **Risiko Wilayah:** Santos Dumont merupakan wilayah dengan angka *no-show* tertinggi di antara wilayah-wilayah yang memiliki minimal 100 janji temu.

  ## Rekomendasi
  Berdasarkan analisis di atas, pihak penyedia layanan kesehatan dapat mempertimbangkan tindakan berikut:
  * Memprioritaskan pengingat lanjutan (*follow-up*) untuk pasien dengan rentang waktu tunggu yang panjang.
  * Mengevaluasi kemudahan jadwal *same-day appointment* karena terbukti menghasilkan tingkat ketidakhadiran yang sangat rendah.
  * Meninjau ulang efektivitas strategi SMS pengingat, khususnya untuk pasien yang telah dijadwalkan sejak jauh hari.
  * Mengembangkan strategi pendekatan atau komunikasi yang lebih tepat sasaran bagi kelompok pasien remaja.
  * Memfokuskan tinjauan operasional di wilayah (*neighbourhood*) yang memiliki volume pasien besar namun diiringi tingkat *no-show* yang tinggi.

  ## Batasan Proyek (*Limitations*)
  * Dataset bersifat historis dan mungkin tidak sepenuhnya merepresentasikan kondisi operasional saat ini.
  * Analisis ini sebatas mengidentifikasi pola dan korelasi, bukan membuktikan hubungan sebab-akibat (*causality*).
  * Analisis tingkat wilayah tidak memasukkan faktor jarak spesifik, waktu tempuh, atau kemudahan akses transportasi.
  * Faktor eksternal seperti cuaca, kapasitas maksimum klinik, ketersediaan dokter secara *real-time*, dan kondisi sosial ekonomi pasien tidak tersedia di dalam dataset ini.

  ## Pratinjau Dashboard (*Dashboard Preview*)
  **1. Tinjauan Eksekutif**
  *(Drag & Drop Gambar Page 1 Milikmu ke Sini)*

  **2. Analisis Penjadwalan & Pengingat SMS**
  *(Drag & Drop Gambar Page 2 Milikmu ke Sini)*

  **3. Analisis Risiko Pasien & Lokasi**
  *(Drag & Drop Gambar Page 3 Milikmu ke Sini)*

  ## Kesimpulan
  Proyek ini mendemonstrasikan bagaimana SQL dan Power BI dapat dikolaborasikan untuk membedah masalah operasional layanan kesehatan. Analisis membuktikan bahwa durasi waktu tunggu, kelompok usia pasien, status penerimaan SMS, dan lokasi wilayah memiliki keterkaitan erat dengan perilaku kehadiran pasien. *Dashboard* yang dihasilkan mampu merangkum metrik secara efektif, memetakan risiko operasional, serta menyoroti segmen yang membutuhkan penanganan lebih lanjut dari pihak manajemen rumah sakit.

</details>

---
