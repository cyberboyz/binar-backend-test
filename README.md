# binar-backend-test

Repository ini digunakan untuk menjawab Binar Backend Test, di mana terdapat layanan ujian online sederhana untuk aplikasi e-learning. Pada layanan ujian online sederhana ini terdapat beberapa jenis ujian dan tiap ujian berbentuk pilihan ganda dengan empat opsi jawaban.

Rancangan Database MySQL

Database yang digunakan adalah binar_backend_test.sql di mana terdapat empat tabel, yaitu tabel data pengguna, soal ujian, jenis ujian, dan jawaban ujian. Adapun keterangan detail terkait kolom dan tipe data yang digunakan dapat dilihat dengan melakukan import file database binar_backend_test.sql.

Rancangan RESTful API Sederhana

API yang akan dibuat dirancang terlebih dahulu untuk mempermudah proses pembuatan API dengan menggunakan Apiary (apiary.io). Pada API ini, keamanan komunikasi data dilakukan dengan autentikasi terlebih dahulu dengan OAuth 2.0 atau JWT. Setelah pengguna mendapatkan token autentikasi, pengguna dapat mengakses API berdasarkan privilege yang dimiliki. Operasi yang dapat dilakukan melalui API ini antara lain adalah :
- Operasi create, read, delete, dan update (CRUD) pada data pengguna dan soal ujian dengan privilege admin
- Operasi autentikasi user dan pemilihan serta penyimpanan jawaban ujian

File blueprint API : apiary.apib
