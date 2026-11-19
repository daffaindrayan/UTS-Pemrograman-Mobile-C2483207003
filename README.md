# TugasKu — Aplikasi Pencatat Tugas dan Tenggat Kuliah Berbasis Flutter

## Deskripsi Aplikasi

TugasKu adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu mahasiswa dalam mencatat, mengelola, dan memantau tugas perkuliahan beserta tenggat pengumpulannya.

Aplikasi ini memungkinkan pengguna untuk menambahkan tugas baru, melihat detail tugas, mengedit informasi tugas, dan menghapus tugas yang sudah tidak diperlukan. Setiap tugas memiliki informasi berupa judul, mata kuliah, deskripsi, tenggat pengumpulan, prioritas, serta status penyelesaian.

Aplikasi ini dibuat sebagai pemenuhan tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile.

## Identitas Pengembang

- **Nama:** Daffa Shafiyyul
- **NIM:** C2483207003
- **Kelas:** PTI5
- **Program Studi:** Pendidikan Teknologi Informasi
- **Universitas:** Universitas Muhammadiyah Tasikmalaya

## Teknologi yang Digunakan

- **Flutter** — Framework untuk membangun aplikasi mobile.
- **Dart** — Bahasa pemrograman yang digunakan.
- **Material Design** — Komponen untuk membangun antarmuka aplikasi.
- **List** — Struktur data untuk menyimpan daftar tugas sementara selama aplikasi berjalan.
- **Android Studio** — IDE untuk pengembangan dan pengujian aplikasi.

## Daftar Fitur

1. **Daftar Tugas**  
   Menampilkan seluruh tugas yang telah ditambahkan.

2. **Ringkasan Tugas**  
   Menampilkan jumlah seluruh tugas, tugas yang sudah selesai, dan tugas yang belum selesai.

3. **Tambah Tugas**  
   Menambahkan tugas baru dengan mengisi judul, mata kuliah, deskripsi, tenggat, dan prioritas.

4. **Detail Tugas**  
   Menampilkan informasi lengkap dari tugas yang dipilih.

5. **Edit Tugas**  
   Mengubah informasi tugas yang sudah tersimpan.

6. **Hapus Tugas**  
   Menghapus tugas dengan konfirmasi terlebih dahulu.

7. **Validasi Formulir**  
   Memastikan data yang dimasukkan sesuai ketentuan, termasuk validasi tanggal dengan format DD-MM-YYYY.

8. **Status Penyelesaian**  
   Menyimpan status tugas, apakah sudah selesai atau belum.

9. **Notifikasi**  
   Menampilkan pemberitahuan menggunakan SnackBar setelah tindakan tertentu.

## Struktur Folder

```text
lib/
├── main.dart
├── models/
│   └── tugas.dart
└── screens/
    ├── daftar_tugas_screen.dart
    ├── form_tugas_screen.dart
    └── detail_tugas_screen.dart
```

## Cara Instalasi dan Menjalankan Aplikasi

### 1. Persyaratan

Pastikan perangkat telah memiliki:

- Flutter SDK
- Dart SDK
- Android Studio atau Visual Studio Code
- Android SDK atau Google Chrome untuk menjalankan versi web

### 2. Clone Repository

Buka terminal atau PowerShell, kemudian jalankan:

```bash
git clone https://github.com/USERNAME/REPOSITORY.git
```

Ganti `USERNAME/REPOSITORY` dengan alamat repository GitHub yang sebenarnya.

### 3. Masuk ke Folder Proyek

```bash
cd REPOSITORY
```

### 4. Mengunduh Dependencies

```bash
flutter pub get
```

### 5. Menjalankan Aplikasi

Untuk menjalankan aplikasi pada perangkat Android:

```bash
flutter run
```

Untuk menjalankan aplikasi melalui Google Chrome:

```bash
flutter run -d chrome
```

## Penyimpanan Data

Aplikasi TugasKu menggunakan struktur data `List` untuk menyimpan data tugas sementara selama aplikasi berjalan. Aplikasi ini belum menggunakan database, API, maupun Firebase.

## Screenshot Aplikasi

Tambahkan screenshot hasil implementasi aplikasi pada bagian berikut.

### 1. Halaman Utama

![Halaman Utama](screenshots/halaman-utama.png)

### 2. Halaman Daftar Tugas

![Halaman Daftar](screenshots/halaman-daftar.png)

### 3. Form Tambah Tugas

![Form Tambah](screenshots/halaman-tambah.png)

### 4. Halaman Detail Tugas

![Halaman Detail](screenshots/halaman-detail.png)

### 5. Form Edit Tugas

![Form Edit](screenshots/halaman-edit.png)

### 6. Konfirmasi Hapus

![Konfirmasi Hapus](screenshots/notifikasi-hapus.png)

### 7. Hasil Tambah Tugas

![Hasil Tambah](screenshots/halaman-awal2.png)

### 8. Hasil Update Tugas

![Hasil Update](screenshots/halaman-awal-updated.png)

### 9. Hasil Delete Tugas

![Hasil Delete](screenshots/halaman-awal.png)


## Video Demonstrasi

Video demonstrasi aplikasi TugasKu yang berisi penjelasan kode program dan praktik penggunaan fitur aplikasi dapat dilihat melalui tautan berikut:

**Link YouTube:** https://youtu.be/T8Lfb7IDxSo

## Informasi Tugas

- **Mata Kuliah:** Pemrograman Mobile
- **Dosen Pengampu:** Alamsyah Firdaus, M.Kom.
- **Semester:** 5
- **Tahun Akademik:** 2026/2027 Ganjil
- **Program Studi:** Pendidikan Teknologi Informasi
- **Universitas:** Universitas Muhammadiyah Tasikmalaya

---

**Tugas Ujian Tengah Semester Pemrograman Mobile**  
**Aplikasi TugasKu — Flutter & Dart**
