-- Nama : M Syakir Arridho
-- NIM : 23241066
-- Kelas : B
-- Modul : ORDER BY, Fungsi, Agregasi, GROUB BY, HAVING

USE ptimart;
-- menggunakan ptimart

-- ORDER BY
-- Ambil data produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- ambil nama produk dan qty dari tabel penjualan urutkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- Latihan Mandiri 1
-- tampilkan semua kolom dari tabel penjualan dan urutkan qty dan tgl transaksinya
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;

-- tampilkan semua kolom dari tabel pelanggan dan urutkan nama pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- tampilkan semua kolom pelanggan urutkan berdasarkan alamat
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- ORDER BY ASC dan DESC 
-- ambil nama produk, qty dari tabel penjualan urutkan qty besar ke kecill
SELECT nama_produk, qty FROM tr_penJualan ORDER BY qty DESC;

-- ambil nama produk, qty dari tabel penjualan urutkan qty dan nama produk besar ke kecill
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- Latihan Mandiri 2
-- tampilkan semua kolom dari tabel penjualan dan urutkan qty dan tgl transaksinya secara DESC dan qty SEC
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi DESC;

-- tampilkan semua kolom dari tabel pelanggan dan urutkan nama pelanggan secara DESC
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;

-- tampilkan semua kolom pelanggan urutkan berdasarkan alamat secara DESC
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- ORDER BY dari hasil perhitungan
-- ambil nama produk, qty, harga, qty*harga, dari tabel penjualan urutkan harga*qty besar ke kecil
SELECT nama_produk, harga, qty, harga*qty as total FROM tr_penjualan ORDER BY total DESC;

-- Latihan Mandiri 3
-- cobalah mengurutkan dengan ekspresi total harga menggunakan rumusan jumlah barang di kali harga barang di kurangi diskon
SELECT nama_produk, harga, qty, diskon_persen, qty*harga as total_harga, ((qty*harga) - ((diskon_persen/100)*harga)) as total_bayar
FROM tr_penjualan
ORDER BY diskon_persen DESC, total_bayar DESC;

-- tidak menampilkan yang krang dari 0
SELECT nama_produk, harga, qty, diskon_persen, qty*harga as total_harga, ((qty*harga) - ((diskon_persen/100)*harga)) as total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0 
ORDER BY diskon_persen DESC, total_bayar DESC;

-- ORDER BY menggunakan WHERE
-- ambil nama produk dan qty dari tabel penjualan yang berawalan huruf f urutkan secara qty
SELECT nama_produk, qty FROM tr_penjualan WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;