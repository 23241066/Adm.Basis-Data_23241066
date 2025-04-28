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
    Id_P INT,
    FOREIGN KEY (NIK) REFERENCES Karyawan(NIK),
    FOREIGN KEY (Id_P) REFERENCES Produk(Id_P)
);

-- Membuat tabel Player
CREATE TABLE Player (
    Id_PR VARCHAR(50),
    No_Telp VARCHAR(15),
    NIK INT,
    Id_P INT,
    FOREIGN KEY (NIK) REFERENCES Karyawan(NIK),
    FOREIGN KEY (Id_P) REFERENCES Produk(Id_P)
);

-- Membuat tabel Supplier
CREATE TABLE Supplier (
    Nama_S VARCHAR(100),
    Id_S INT PRIMARY KEY,
    Alamat VARCHAR(255),
    No_Telp VARCHAR(15),
    Email VARCHAR(150)
);

-- Menambahkan data ke tabel Karyawan
INSERT INTO Karyawan (Nama_K, NIK, No_Telp, jenis_Kelamin, Alamat)
VALUES 
  ('adam_aja', 521007999, '87776775772', 'Laki-Laki', 'Jln. Apa aja no 1 monjok Kel, Monjok timur kec, Selaparang, Kota Mataram, prov. NTB, Negara Indonesia'),
  ('Bima_tok', 521009021, '087776775146', 'Laki-Laki', 'Jln. Tok aja no 5 montok, Kel montok timur, kec Selaparang, kota Mataram, prov. NTB, Negara Indonesia'),
  ('ini_Abdul', 521901029, '087776775138', 'Laki-Laki', 'Jln. ini aja no 8 linggis, Kel Linggis timur, kec Selaparang, kota Mataram, prov NTB, Negara Indonesia'),
  ('Putu', 521007189, '087776775898', 'Perempuan', 'Jln. Ada aja no 3 Monjok, Kel. Batu, kec Selaparang, Kota Mataram, prov NTB, Negara Indonesia');

-- Menambahkan data ke tabel Produk
INSERT INTO Produk (Nama_P, Harga_P, Id_P)
VALUES 
  ('Diamond', 'Rp. 3000 - Rp. 1.000.000', 1),
  ('Weekly Diamond past', 'Rp. 30.000', 2),
  ('Twilight Past','Rp. 80.000', 3);

-- Menambahkan data ke tabel Reseller
INSERT INTO Reseller (Nama_R, Id_R, Alamat, No_Telp, Email, NIK, Id_P)
VALUES 
  ('Codashop', 1, 'Jln. Ahmad Yani No 2 RT/RW 001/293 Gubug Batu Kel. Monjok Timur Kec. Selaparang Kota. Mataram Prov. NTB Negara Indonesia', '+681443', 'Codashop@gmail.com', 521007999, 1),
  ('Lapak Gaming', 2, 'Jln. Terusan No 4 RT/RW 009/287 Ampenan Kel. Ampenan Kec. Ampenan Kota. Mataram Prov. NTB Negara Indonesia', '+683321', 'Lapakgaming@gmail.com', 521009021, 2);

-- Menambahkan data ke tabel Player
INSERT INTO Player (Id_PR, No_Telp, NIK, Id_P)
VALUES 
  ('78807241 (5017)', '087860002632', 521007999, 1),
  ('78807242 (5018)', '087860002773', 521009021, 2),
  ('78807243 (9491)', '087860002344', 521901029, 3),
  ('78807244 (9491)', '087860002214', 521007189, 1);

-- Menambahkan data ke tabel Supplier
INSERT INTO Supplier (Nama_S, Id_S, Alamat, No_Telp, Email)
VALUES 
  ('Moonton', 1, 'Jln. Ahmad Gaji No 8 RT/RW 006/293 Harum Manis Kel. Jakarta Siang Kec. Jakarta Kota, Jakarta Prov. Jakarta Negara Indonesia', '+681526', 'MoontonDeveloper@gmail.com');

-- 1 Menampilkan semua data para tabel
SELECT * FROM Karyawan;
SELECT * FROM Produk;
SELECT * FROM Reseller;
SELECT * FROM Player;
SELECT * FROM Supplier;

-- 2 Menampilkan nama dan nomor telepon karyawan
SELECT Nama_K, No_Telp FROM Karyawan;

-- 3 Menampilkan semua produk dan harga
SELECT Nama_P, Harga_P FROM Produk;

-- 4 Menampilkan nama reseller beserta produk yang dijual
SELECT Reseller.Nama_R, Produk.Nama_P
FROM Reseller
JOIN Produk ON Reseller.Id_P = Produk.Id_P;

-- 5 Menampilkan semua player beserta produk yang mereka beli
SELECT Player.Id_PR, Produk.Nama_P
FROM Player
JOIN Produk ON Player.Id_P = Produk.Id_P;

-- 6 Menampilkan supplier yang ada di Jakarta
SELECT * FROM Supplier
WHERE Alamat LIKE '%Jakarta%';

-- 7 Menampilkan daftar reseller lengkap dengan alamat dan email
SELECT Nama_R, Alamat, Email FROM Reseller;

-- 8 Menampilkan semua player yang membeli produk "Diamond"
SELECT Player.Id_PR, Produk.Nama_P
FROM Player
JOIN Produk ON Player.Id_P = Produk.Id_P
WHERE Produk.Nama_P = 'Diamond';

-- 9 Menampilkan jumlah player berdasarkan produk
SELECT Produk.Nama_P, COUNT(Player.Id_PR) AS Jumlah_Player
FROM Produk
LEFT JOIN Player ON Produk.Id_P = Player.Id_P
GROUP BY Produk.Nama_P;

-- 10 Menampilkan jumlah reseller untuk setiap produk
SELECT Produk.Nama_P, COUNT(Reseller.Id_R) AS Jumlah_Reseller
FROM Produk
LEFT JOIN Reseller ON Produk.Id_P = Reseller.Id_P
GROUP BY Produk.Nama_P;
