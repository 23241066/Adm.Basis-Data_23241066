-- Membuat database
CREATE DATABASE Top_up_ML_Murah_Berkah;

-- Menggunakan database Top_up_ML_Murah_Berkah
USE Top_up_ML_Murah_Berkah;

-- Membuat tabel Karyawan
CREATE TABLE Karyawan (
    Nama_K VARCHAR(100),
    NIK INT PRIMARY KEY,
    No_Telp VARCHAR(15),
    jenis_Kelamin VARCHAR(20),
    Alamat VARCHAR(255)
);

-- Membuat tabel Produk
CREATE TABLE Produk (
    Nama_P VARCHAR(100),
    Harga_P VARCHAR(50),
    Id_P INT PRIMARY KEY
);

-- Membuat tabel Reseller
CREATE TABLE Reseller (
    Nama_R VARCHAR(100),
    Id_R INT PRIMARY KEY,
    Alamat VARCHAR(255),
    No_Telp VARCHAR(15),
    Email VARCHAR(150),
    NIK INT,
    Id_P INT
);

-- Membuat tabel Player
CREATE TABLE Player (
    Id_PR VARCHAR(50),
    No_Telp VARCHAR(15),
    NIK INT,
    Id_P INT
);

-- Membuat tabel Supplier
CREATE TABLE Supplier (
    Nama_S VARCHAR(100),
    Id_S INT PRIMARY KEY,
    Alamat VARCHAR(255),
    No_Telp VARCHAR(15),
    Email VARCHAR(150)
);

-- SELECT --

-- 1 Melihat semua informasi dari tabel Karyawan.
SELECT * FROM Karyawan;

-- 2 Hanya ingin melihat nama dan no telepon dari karyawan.
SELECT Nama_K, No_Telp FROM Karyawan;

-- 3 Menampilkan daftar nama produk dan harga produk yang tersedia.
SELECT Nama_P, Harga_P FROM Produk;

-- 4 Mencari reseller yang menjual produk dengan Id_P = 1.
SELECT Nama_R, No_Telp, Id_P FROM Reseller WHERE Id_P = 1;

-- 5 Melihat ID Player dan No Telp mereka.
SELECT Id_PR, No_Telp FROM Player;

-- 6 Mencari supplier yang berlokasi di Jakarta (atau mengandung kata "Jakarta").
SELECT Nama_S, Alamat FROM Supplier WHERE Alamat LIKE '%Jakarta%';

-- 7 Menggabungkan tabel Reseller dan Produk untuk mengetahui reseller menjual produk apa.
SELECT Reseller.Nama_R, Produk.Nama_P
FROM Reseller
JOIN Produk ON Reseller.Id_P = Produk.Id_P;

-- 8 Menampilkan data player dan nama produk yang dibeli.
SELECT Player.Id_PR, Produk.Nama_P
FROM Player
JOIN Produk ON Player.Id_P = Produk.Id_P;

-- 9 Menghitung berapa banyak reseller untuk masing-masing produk.
SELECT Produk.Nama_P, COUNT(Reseller.Id_R) AS Jumlah_Reseller
FROM Produk
LEFT JOIN Reseller ON Produk.Id_P = Reseller.Id_P
GROUP BY Produk.Nama_P;

-- 10 Melihat jumlah karyawan berdasarkan jenis kelamin (misal: laki-laki dan perempuan).
SELECT jenis_Kelamin, COUNT(*) AS Jumlah_Karyawan
FROM Karyawan
GROUP BY jenis_Kelamin;