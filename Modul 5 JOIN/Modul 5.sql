-- Nama : M Syakir Arridho
-- NIM : 23241066
-- Kelas : B
-- Modul : JOIN, UNION, LIMIT

USE ptimart;
-- menggunakan ptimart

-- JOIN
-- menggunakan duah buah tabel berdasarkan olom yang sama

-- praktek 1
-- ambil nama pelanggan yang pernah transaksi
-- artinya mengambil kolom_pelanggan, nama_pelanggan, dan qty
-- dari penggabungan tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- praktek 2
-- menggabungkan dua tabel tanpa memerhatikan relation key
-- amnbil kolom_pelanggan, nama_pelanggan, dan qty
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa
-- memperhatikan kolom yang menjadi primary key
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON true;

-- INNER JOIN
-- join yang mengambil data dari dua sisi tabel yang berhubungan saja

-- praktek 2
-- ambil kode_pelanggan, nama_pelanggan, nama_produk, dan qty
-- dari hasil join dari tabel_pelanggan dan tabel_penjualan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Latihan Mandiri
-- Join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT tp.kode_pelanggan, tp.qty, mp.nama_pelanggan, mpr.kategori_produk
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
JOIN ms_produk as mpr
ON true;

-- Join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk dengan LEFT JOIN
SELECT 
    mp.nama_pelanggan, 
    tp.nama_produk, 
    mpr.kategori_produk
FROM ms_pelanggan AS mp
LEFT JOIN tr_penjualan AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk AS mpr ON tp.kode_produk = mpr.kode_produk
WHERE tp.qty IS NOT NULL;

-- Join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk dengan INNER JOIN
SELECT 
    mp.nama_pelanggan, 
    tp.nama_produk, 
    mpr.kategori_produk,
    SUM(tp.qty) AS total_qty
FROM ms_pelanggan AS mp
INNER JOIN tr_penjualan AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk AS mpr ON tp.kode_produk = mpr.kode_produk
WHERE tp.qty IS NOT NULL
GROUP BY mpr.kategori_produk;

-- join ms_produk dengan table ms_produk dengan colom relationship kode_produk
SELECT 
    mpra.kode_produk, 
    mprb.nama_produk
FROM ms_produk AS mpra
JOIN ms_produk AS mprb ON mpra.kode_produk = mprb.kode_produk;





