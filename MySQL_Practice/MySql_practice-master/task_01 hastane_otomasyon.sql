/* ========================== HASTA PROJESI =================================*/   
   use mysql_practice;
   create table if not exists hastaneler(
   id char(5) primary key,
   isim varchar(50),
   sehir varchar(10),
   ozel char(1)
  --  ozel boolean default true
  
   );
   
   insert into hastaneler values('H101','ACİ MADEM HASTANESİ','İSTANBUL','Y');
   insert into hastaneler values('H102','HAZSEKİ HASTANESİ','İSTANBUL','Y');
   insert into hastaneler values('H103','MEDİKOL HASTANESİ','İZMİR','Y');
   insert into hastaneler values('H104','MEMORYİ HASTANESİ','ANKARA','Y');

create table if not exists hastalar
(
kimlik_no varchar(11) primary key,
isim varchar(30),
teshis varchar(30)
);
insert into hastalar values ('12345678901','Ali Can','Gizli Seker');
insert into hastalar values ('45678901121','Ayşe Yılmaz','Hipertansiyon');
insert into hastalar values ('78901123451','Steve Job','Pankreatit');
insert into hastalar values ('12344321251','Tom Hanks','COVID19');

create table if not exists bolumler
(
bolum_id char(5) primary key,
bolum_adi varchar(30)
);
insert into bolumler values ('DHL','DAHILIYE');
insert into bolumler values ('KBB','KULAK-BURUN-BOGAZ');
insert into bolumler values ('NRJ','NOROLOJI');
insert into bolumler values ('GAST','GASTROLOJI');
insert into bolumler values ('KARD','KARDIOLOJI');
insert into bolumler values ('PSK','PSIKIYATRI');
insert into bolumler values ('GOZ','GOZ HASTALIKLARI');

create table if not exists hasta_kayitlar
(
kimlik_no char(11) primary key,
hast_isim varchar(30) default 'NONAME',
hastane_adi varchar(30) NULL,
bolum_adi varchar(30) NULL,
teshis varchar(30) NULL
);

insert into hasta_kayitlar(kimlik_no) values('1111');
insert into hasta_kayitlar(kimlik_no) values('2222');
insert into hasta_kayitlar(kimlik_no) values('3333');
SELECT * FROM hastaneler;
SELECT * FROM hasta_kayitlar;
SELECT * FROM hastalar;
SELECT * FROM bolumler;

-- 5)
update hasta_kayitlar 
set hast_isim ='Salvadore Dali',
 hastane_adi='John Hopins' ,
 bolum_adi='Noroloji',
 teshis='Parkinson'
--  kimlik_no=99991111222
where kimlik_no=3333;

-- 5)
update hasta_kayitlar
set hast_isim=(SELECT isim from hastalar where isim='Ali Can'),
 hastane_adi=(SELECT isim from hastaneler where id='H104'),
 bolum_adi=(SELECT bolum_adi from bolumler where bolum_id='DHL'),
 teshis=(SELECT teshis from hastalar where isim='Ali Can'),
 teshis=(SELECT kimlik_no from hastalar where isim='Ali Can')
 where kimlik_no='1111';
 
 
-- 6)
update hasta_kayitlar
set hast_isim=(SELECT isim from hastalar where isim='Ayse Yilmaz'),
 hastane_adi=(SELECT isim from hastaneler where id='H103'),
 bolum_adi=(SELECT bolum_adi from bolumler where bolum_id='KBB'),
 teshis=(SELECT teshis from hastalar where isim='Tom Hanks'),
 teshis=(SELECT kimlik_no from hastalar where isim='Stevev Job')
 where kimlik_no='2222';




