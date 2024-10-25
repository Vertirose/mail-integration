# Mail Integeration

Objektid dalam projek ini adalah peserta sebagai system administrator dapat menyiapkan dan mengurus mail server, web server, dan DNS. Peserta akan diminta untuk mengkonfigurasi mail server dengan protokol seperti SMTP, IMAP, dan POP3. Mereka juga akan mengatur web server untuk aplikasi dan laman web, serta mengurus DNS untuk pengendalian nama domain yang tepat.

## TechStack

- [Nginx](https://nginx.org/en/) - Web Server Engine
- [PostFix](https://www.postfix.org/) - Sebagai Mail Transfer Agent
- [Dovecot](https://www.dovecot.org/) - Sebagai Mail Delivery Agent
- [MariaDB](https://mariadb.org/) - Database Engine
- [PHPMyAdmin](https://www.phpmyadmin.net/) - Administrasi Database
- [Wordpress](https://wordpress.com/id/) - Content Management System
- [Bind9](https://www.isc.org/bind/) - DNS Server

### Prerequisite

update system package dengan melakukan perintah berikut

```
apt update
```

install semua package berikut ini

```
apt -y install php-{mysql,json,fpm,curl,gd,intl,mbstring,soap,xml,xmlrpc,zip} mariadb-server mariadb-client
```

setup database dengan menyiapkan dua dabase sesuai dengan soal yakni _`[nama]_[nis]_wordpress`_ dan juga _`[nama]_[nis]_roundcube`_ bisa dengan melakukan perintah berikut

> ```
> CREATE DATABASE [nama]_[nis]_wordpress;
> CREATE DATABASE [nama]_[nis]_roundcube;
> ```

### Domain Name System

semua konfigurasi untuk dns sudah ditampilkan di soal dan untuk sample konfigurasi forwarder dan reverse zone filenya bisa dilihat [disini](/sample/dns/)

---

untuk instalasi bind9 sebagai dns server bisa dengan melakukan perintah berikut

```
apt -y install bind9 dnsutils
```

### WebServer

sama halnya seperti domain name system semua konfigurasi virtual host sudah dijelaskan di soal disini hanya berfokus untuk instalasi dan sample konfigurasi filenya berada [disini](/sample/nginx.conf)

---

untuk instalasi nginx sebagai web server engine bisa dengan melakukan perintah berikut

```
apt -y install nginx
```

### WordPress

file wordpress dapat diunduh [disini](./wordpress-latest.zip) dan untuk konfigurasinya sesuaikan dengan apa yang sudah ada di soal, baca setiap perintahnya dengan seksama dan teliti

### PHPMyAdmin

pada phpmyadmin tidak diminta konfigurasi macam-macam hanya saja yang diminta adalah disable root login untuk phpmyadmin, untuk instalasinya adalah sebagai berikut

```
apt -y install phpmyadmin
```

untuk konfigurasi filenya berada disini **_/etc/phpmyadmin/config.inc.php_** tambahkan baris yang diberi tanda `+` jika belum ada dalam konfigurasi filenya

> ```
> if (!empty($dbname)) {
>   /* Authentication type */
>   $cfg['Servers'][$i]['auth_type'] = 'cookie';
> + $cfg['Servers'][$i]['AllowRoot'] = false;
>   /* Server parameters */
>   if (empty($dbserver)) $dbserver = 'localhost';
>
> ...
> ```

### Mail Server

pada mail server akan ada 3 core yang digunakan yakni `postfix` sebagai _mail transfer agent_, `dovecot` sebagai _mail delivery agent_, dan juga `roundcube` sebagai _webmail_ kektiga komponen harus terinstall pada server karena oleh karena itu untuk instalasinya adalah sebagai berikut

```
apt -y install postfix dovecot-imapd dovecot-pop3d roundcube
```

lakukan konfigurasi sesuai dengan soal dan untuk hint untuk nginx konfigurasi max file size attachment ada di file _*/fpm/php.ini*_ dan kata kuncinya adalah disini `upload_max_filesize` dan `post_max_size` :)

## Submitting

Untuk mengirim jika semua aspek dalam tugas ini sudah selesai dapat dikirim ke email 13901@smkn22jakarta.sch.id dengan subject (Penilaian Seleksi - [nama]\_[nis]) laporan berupa link google drive dari masing-masing peserta sesuai dengan keterangan di soal
