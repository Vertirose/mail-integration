-- Veriable nama dan nis
SET @nama = 'your_name';
SET @nis = 'your_nis';

-- Database untuk WordPress
SET @db_wordpress = CONCAT(@nama, '_', @nis, '_wordpress');
CREATE DATABASE IF NOT EXISTS @db_wordpress;

-- Database untuk Roundcube
SET @db_roundcube = CONCAT(@nama, '_', @nis, '_roundcube');
CREATE DATABASE IF NOT EXISTS @db_roundcube;

-- Password
SET @admin_password = CONCAT('antix', @nis);
SET @support_password = CONCAT('antix', @nis);

-- Buat User Admin Kalau Belum Ada
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY @admin_password;

-- Buat User Support Kalau Belum Ada
CREATE USER IF NOT EXISTS 'support'@'localhost' IDENTIFIED BY @support_password;

-- Berikan hak akses penuh kepada admin@localhost untuk semua database
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';

-- Berikan hak akses penuh kepada support@localhost untuk kedua database
GRANT ALL PRIVILEGES ON @db_wordpress.* TO 'support'@'localhost';
GRANT ALL PRIVILEGES ON @db_roundcube.* TO 'support'@'localhost';

-- Terapkan perubahan hak akses
FLUSH PRIVILEGES;
