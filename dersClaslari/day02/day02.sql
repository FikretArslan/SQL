-- SELECT - WHERE
use batch60_61;
create table ogrenciler(
id int, isim varchar(45),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values('120', 'Ali Can', 'Ankara', '75');
insert into ogrenciler values('121', 'Veli Mert', 'Trabzon', '85');
insert into ogrenciler values('122', 'Ayşe Tan', 'Bursa', '65');
insert into ogrenciler values('123', 'Derya Soylu', 'Istanbul', '95');
insert into ogrenciler values('124', 'Yavuz Bal', 'Ankara', '80');

select * from ogrenciler;

/*
Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
SELECT ile birlikte WHERE komutu kullanılır.
SELECT sutun1, sutun2 ....
FROM tablo adı WHERE koşul
*/

-- SORU01: Sınav notu 80'den büyük olan öğrencilerin bilgileri listele
select * from ogrenciler where sinav_notu>80;

-- SORU02: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
select isim, adres from ogrenciler where adres = 'Ankara';

-- SORU03: id'si 124 olan öğrencilerin tüm bilgilerini listele
select * from ogrenciler where id=124;


-- SELECT - BETWEEN
create table personel
(
id char(4),
isim varchar(50),
maas int
);


insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel;

-- BETWEEN belirttiğiniz 2 veri arasındaki bilgileri listeler
-- BETWEEN de; belirttigini degerler de, listelemeye dahildir.

/*
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
Bir tanesi gerçekleşmez ise listelemez.

SELECT * FROM matematik sinav1 > 50 AND sinav2 > 50
Hem sinav1 hemde sinav2 alanı, 50'de büyük olan kayıtları listeler.

OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir.

SELECT * FROM matematik sinav1 > 50 OR sinav2 > 50
Hem sinav1 veya sinav2 alanı, 50'de büyük olan kayıtları listeler.
*/

-- SORU04: id'si 1002 ile 1005 arasında olan personel bilgilerini listele
-- 1. YOL
select * from personel where id between '1002' and '1005';

-- 2. YOL
select * from personel where id>='1002' and id<='1005';

-- SORU05: Derya Soylu ile Yavuz Bal arasındaki personel bilgilerini listele
select * from personel where isim between 'Derya Soylu' and 'Yavuz Bal';

-- SORU06: Maaşı 70000 ve ismi Sena olan personeli listele
select * from personel where maas=70000 or isim= 'Sena Beyaz';

/*
IN: Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutla
 yazabilme imkanı verir.
 
 SELECT sutun1, sutun2 ....
 FROM tablo_adı
 where sutun_adı IN (deger1, deger2)
*/

-- SORU07: id'si 1001,1002 ve 1004 olan prsonel bilgilerini listele
-- 1. YOL
select * from personel where id = '1001' or id = '1002' or id = '1004';

-- 2. YOL
select * from personel where id in(1001,1002,1004);

-- SORU08: Maaşı sadece 70000 100000 olan personeli listele
select * from personel where maas in(70000,100000);
-- Farklı sutunlar için IN kullanılamaz.

/*
SELECT - LIKE
LIKE: Sorgulama yaparken belirli patternleri kullanabilmezi sağlar

SELECT sutun1, sutun2, ...
FROM tablo_adı WHERE sutünN LIKE pattern

PATTERN İÇİN
% -> 0 veya daha fazla karakteri belirtir.
_ -> Tek bir karakteri belirtir.
*/

-- SORU09: İsmi A harfi ile başlayan personeli listele
select * from personel where isim like 'A%';

-- SORU10: İsmi N harfi ile biten personeli listele
select * from personel where isim like '%N';

-- SORU11: İsminin 2. harfi E olan personeli listeleyin
select * from personel where isim like '_E%';

-- SORU12: İsminin 2. harfi E olup diğer harflerinde Y olan personel
select * from personel where isim like '_E%Y%';

-- SORU13: İsminde A harfi olmayan personeli listeleyin
select * from personel where isim not like '%A%';

-- SORU14: Maaşı 6 haneli olan personeli listeleyin
select * from personel where maas like '______';

-- SORU15: 1. harfi A ve 7. harfi A olan personeli listeleyin
select * from personel where isim like 'A_____A%';