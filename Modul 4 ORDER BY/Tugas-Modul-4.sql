-- Nama : M Syakir Arridho
-- NIM : 23241066
-- Kelas : B
-- Modul : ORDER BY, Fungsi, Agregasi, GROUB BY, HAVING

USE ptimart;
-- menggunakan ptimart

-- Tugas Modul 4 --

-- Latihan Mandiri 4

-- Tampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi:
SELECT *
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY harga DESC;


-- Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan yang memiliki harga minimal 100.000 dan diurutkan berdasarkan harga tertinggi:
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan yang memiliki harga minimal 100.000 ATAU nama produk berawalan 'T', dan diurutkan berdasarkan diskon tertinggi:
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

