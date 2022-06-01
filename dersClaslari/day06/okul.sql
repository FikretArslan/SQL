use okul;

create table ogrenciler
(
okul_no int primary key,
ogrenci_ismi varchar(30),
sinif varchar(5),
cinsiyet char
);

insert into ogrenciler values('100', 'Eymen Bal', 9, 'E');

select * from ogrenciler;

create table notlar
(
ogrenci_ismi varchar(30),
fizik int,
matematik int,
kimya int,
tarih int
);

insert into notlar values('Eymen Bal', 40, 50, 60 ,70);

select * from notlar;
