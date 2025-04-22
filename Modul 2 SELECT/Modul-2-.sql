-- Nama : M. Syakir Arridho
-- NIM : 23241066
-- Kelas : PTI 4 B 
-- Modul : 2

-- membuat database PTImart
CREATE DATABASE PTImart;

-- menggunakan database
USE PTImart;

-- cek kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT
-- menggunakan select untuk 1 tabel
-- mengambil kolom nama produk dari tabel produk

SELECT nama_produk FROM ms_produk;

-- mengambil lebih dari 1 kolom dari 1 tabel
SELECT nama_produk, harga FROM ms_produk;

-- mengambil semua koloma dari 1 tabel
SELECT * FROM ms_produk;

-- LATIHAN
-- mengambil kode produk dan nama produk dari tabel produk
-- mengambil seluruh kolom dari tabel pemnjualan

-- JAWABAN
SELECT kode_produk, nama_produk FROM ms_produk;
SELECT * FROM tr_penjualan;

-- PREFIX dan ALIAS
-- prefic adalah objek database yang hirarkinya lebih tinggi

-- menggunakan  prefix nama tabel untuk kolom nama produk dari  tabel produk
SELECT ms_produk.nama_produk FROM ms_produk;

-- menggunakan nama databaase dengan tabel sebagai prfix untuk kolom nama_produk
SELECT PTImart.ms_produk.nama_produk FROM ms_produk;

-- Alias nama sementara untuk objek database
-- mengganti sementara kolom nama_produk dengan ALIAS
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- mengganti sementara tabel dengan Alias
SELECT nama_produk FROM ms_produk AS msp;

-- kombinasikan prefix dan alias
SELECT msp.nama_produk FROM ms_produk AS msp;

-- CASE 1
-- nama list customer dan alamatnya
SELECT nama_pelanggan,alamat FROM ms_pelanggan;

-- CASE 
-- nama produk dan harga dari semua tabel
SELECT nama_produk, harga FROM ms_produk;
SELECT nama_produk, harga FROM tr_penjualan;


