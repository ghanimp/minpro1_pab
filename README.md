# ⚽ Futsal Arena - Booking App

## Deskripsi Aplikasi

Futsal Arena merupakan aplikasi mobile berbasis Flutter yang dirancang untuk membantu proses pencatatan dan pengelolaan booking lapangan futsal secara digital. Aplikasi ini dibuat sebagai implementasi pembelajaran konsep dasar pemrograman mobile, khususnya dalam penerapan StatefulWidget, navigasi antar halaman, serta operasi CRUD (Create, Read, Update, Delete).

Secara umum, aplikasi ini berfungsi sebagai sistem pencatatan sederhana yang memungkinkan pengguna (admin) untuk menambahkan data penyewaan lapangan, melihat daftar booking yang telah dibuat, melakukan perubahan data apabila terjadi kesalahan, serta menghapus data dengan sistem konfirmasi.

Dalam penggunaannya, aplikasi ini tidak menggunakan database eksternal, melainkan memanfaatkan struktur data List<Map<String, String>> sebagai penyimpanan sementara (in-memory). Hal ini bertujuan untuk fokus pada pemahaman logika pemrograman dan manajemen state dalam Flutter.
Data yang dikelola meliputi:
* Nama penyewa
* Lapangan
* Jam bermain
* Nomor HP

## Fitur Aplikasi
- Tambah Booking: Menambahkan data booking melalui form input.

- Tampilkan Booking: Menampilkan daftar booking dalam bentuk Card menggunakan ListView.

- Edit Booking: Mengubah data booking yang sudah ada.

- Hapus Booking: Menghapus data booking dengan konfirmasi dialog.

## Widget yang Digunakan
Struktur Dasar
- MaterialApp
- Scaffold
- AppBar
- StatefulWidget

Layout
- Column
- Row
- Expanded
- Padding
- SizedBox
- Container
- Center

List & Tampilan Data
- ListView.builder
- Card
- Icon
- Text

Form Input
- TextField
- DropdownButtonFormField
- TextEditingController
- ElevatedButton

Navigasi
- Navigator.push()
- Navigator.pop()

Dialog
- showDialog()
- AlertDialog
- TextButton


## Tampilan Applikasi
1. Tampilan homepage ketika tidak ada data booking lapangan
<img width="731" height="915" alt="image" src="https://github.com/user-attachments/assets/23a51e42-6125-40a4-99eb-d9261a64b186" />


2. Tampilan menu untuk menambah data booking lapangan
<img width="723" height="942" alt="image" src="https://github.com/user-attachments/assets/0d42b58c-c809-4620-8b78-43803922a652" />


3. Tampilan saat menambahkan data booking lapangan
<img width="725" height="947" alt="image" src="https://github.com/user-attachments/assets/ce10c928-bb58-4e61-a3bc-2f82913e5843" />


4. Tampilan homepage saat ada data booking lapangan
<img width="727" height="947" alt="image" src="https://github.com/user-attachments/assets/42815902-2bb6-407f-93db-a4514dac8c14" />


5. Tampilan saat ingin menambahkan data namun belum memasukkan data
<img width="734" height="953" alt="image" src="https://github.com/user-attachments/assets/e8283332-5ace-4d1a-9f74-3da8f16f1044" />


6. Tampilan menu update data booking lapangan
<img width="734" height="946" alt="image" src="https://github.com/user-attachments/assets/4f427d57-8877-4604-bcc6-09d2d75643b3" />


7. Tampilan menu menghapus data booking lapangan
<img width="740" height="949" alt="image" src="https://github.com/user-attachments/assets/6c2d7d31-eb7c-4e23-9c50-5be5cb6c5685" />
