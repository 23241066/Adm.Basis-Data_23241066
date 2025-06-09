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

-- FUNGSI AGREGASI
-- di gunakan untuk mengolah beberapa baris/ raw data untuk menghasilkan nilai baru

-- praktek 7
-- Hitung atau jumlahkan seluruh nilai dari baris qty pada tabel penjualan
SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan;

-- praktek 8
-- hitung seluruh baris pada tabel penjualan
SELECT * FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- praktek 9
-- mengunakan 2 fungsi agregasi dala satu query sql
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- praktek 10
-- hitung rata rata penjualan, penjualan tertinggi per transaksi dan penjualan terendah per transaksi
SELECT AVG(qty), MAX(qty), MIN(qty)
FROM tr_penjualan;

-- praktek 11
-- mengombinasikan fungsi agregasi dengan kolom tertentu nama_produk, kolom tgl_transaksi
SELECT tgl_transaksi, nama_produk, MAX(qty) FROM tr_penjualan;

-- praktek 12
-- COUNT(DISTINCT)
-- di gunakan untuk menghitung nilai yang unik saja
-- menghitung nilai unik yang ada di nama_produk di tabel penjualan
-- tanpa DISTINCT
SELECT COUNT(nama_produk) FROM tr_penjualan;
-- dengan DISTINCT
SELECT COUNT(DISTINCT nama_produk) FROM tr_penjualan;
-- dua duanya langsung
SELECT COUNT(nama_produk), COUNT(DISTINCT nama_produk) FROM tr_penjualan;

-- GROUB BY
-- mengelommpokan isi data dari satu atau beberapa kolom, biasanya di gabung dengan fungsi agregasi
-- GROUB BY 1 Kolom
-- praktek 14
-- mengelompokan nilai nama_produk pada tabel penjualan
SELECT nama_produk FROM tr_penjualan ORDER BY nama_produk;
SELECT nama_produk FROM tr_penjualan;

-- praktek 15 
-- mengelompokan nilai, nama_produk dan qty dari tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan ORDER BY nama_produk, qty;

-- praktek 16 
-- ambil qty berdasarkan dari nama produk erdasarkan dari hasil pengelommpokan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk;

-- praktek 17
-- ambil qty berdasarkan dari nama produk erdasarkan dari hasil pengelommpokan nama produk dan urutkan dari besar ke kecil
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk ORDER BY SUM(qty)DESC;

-- HAVING
-- di gunakan sebagai filtering untuk GROUP BY dan fungsi agregasi
-- praktek 1
-- ambil jumlah dari nama produk yang jumlah qty > dari 2 berdasarkan hasil pengelompokan nama produk dan urutkan dari besar ke kecil
SELECT nama_produk, SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 2
ORDER BY SUM(qty) DESC;


-- Latihan Mandiri

-- Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk di atas nilai 4.
SELECT nama_produk, SUM(qty) AS total_qty
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 4
ORDER BY total_qty DESC;

-- Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9.
SELECT nama_produk, SUM(qty) AS total_qty
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) = 9;

-- Melihat daftar kelompok nama produk dan total nilai penjualan (harga × jumlah - diskon), diurutkan berdasarkan nilai penjualan terbesar.
SELECT nama_produk, 
SUM((qty * harga) - ((diskon_persen / 100) * qty * harga)) AS total_penjualan
FROM tr_penjualan
GROUP BY nama_produk
ORDER BY total_penjualan DESC;