-- Nama : M. Syakir Arridho
-- NIM : 23241066
-- Kelas : PTI 4 B 

-- membuat database
CREATE DATABASE mandalika_mart;

-- menggunakan database mandalika_mart
USE mandalika_mart;

-- membuat table dalam database mandalika_mart
CREATE TABLE member (
Member_id varchar(10),
Username varchar(20),
Nama varchar(100),
Tanggal_lahir datetime,
Angka_favorite int);

CREATE TABLE produk (
Id_produk varchar(10),
Nama_produk varchar(25),
Kategori varchar(15),
Harga int,
Qty int);

CREATE TABLE transaksi_penjualan (
Tgl_jual datetime,
Id_produk varchar(10),
Member_id varchar(10),
Nama_produk varchar(25),
Harga int,
Qty int);

-- mengupdate primary key table member, produk
ALTER TABLE member
ADD PRIMARY KEY (member_id);

ALTER TABLE produk
ADD PRIMARY KEY (id_produk);

-- mengupdate foreign key table transaksi_penjualan
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_membertTransaksi
FOREIGN KEY (member_id) REFERENCES member(member_id);

ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_produkTransaksi
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);

-- mengisi data tabel
INSERT INTO member (member_id, username, nama, tanggal_lahir, angka_favorit)
VALUES ('10-01','jojo','Admin','2004-09-20','7');

-- mengakses isi data pada tabel member
SELECT * FROM member;