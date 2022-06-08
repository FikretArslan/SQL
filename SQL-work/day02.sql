create Schema day2;
drop schema day1;
use day2;

create table ogrenciler(
id int,
isim varchar(40),
adres varchar(50),
sinav_notu int
);

insert into ogrenciler values('100','Ali Can','Midyat',100);
insert into ogrenciler values(101,'Veli Can','Mardin',90);
insert into ogrenciler values(102,'Ayse Can','Dargecit',85);
insert into ogrenciler values('103','Can Can','Diyarbekir',50);

select * from ogrenciler;
-- 1
select * from ogrenciler where sinav_notu<80;
-- 2
select * from ogrenciler where adres='Mardin';
select isim,adres from ogrenciler where adres='Mardin';
-- 3
select * from ogrenciler where id=100;

-- SELECT-BETWEEN-and-or
CREATE table personel(
id char(4),
isim varchar(50),
maas int
);

insert into personel values(1001,'Ali Can',7000);
insert into personel values(1002,'Veli Can',5000);
insert into personel values(1003,'Ayse Can',10000);
insert into personel values(1004,'Dag Can',2000);
insert into personel values(1005,'Dag dag',20000);
select * from personel;

-- 4
select * from personel where id between 1002 and 1004;
select * from personel where id>=1002 and id<=1005;

-- 5
select * from personel where isim between 'Ayse Can' and 'Dag dag';

-- 6
select * from personel where isim='Ali Can' and maas=7000;

-- 7
select * from personel where id in(1001,1002,1004);
-- 8
select * from personel where maas in(7000,10000);
select * from personel where isim in('Ali Can','Ayse Can');
select * from ogrenciler where isim in('Ayse Can','Can Can');

-- 9
select * from personel where isim like 'A%';

-- 10
SELECT * FROM personel where isim like '%n';
SELECT * FROM personel where maas like '2%';

-- 11
select * from personel where isim like '_y%';
select * from personel where maas like '70%';

-- 12
select * from personel where isim like '_a%g%';

-- 13
select * from personel where isim not like '%Y%';
select * from personel where isim  like '%Y%';

-- 14
SELECT * FROM PERSONEL WHERE maas like '____';
SELECT * FROM PERSONEL WHERE maas like '_____';

-- 15
select * from personel where isim like 'A_____%N';






