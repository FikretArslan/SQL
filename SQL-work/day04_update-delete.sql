
use day03;

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

select * from tedarikciler;
   
CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_ismi VARCHAR(50), 
musteri_ismi VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);   

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    select *from urunler;
    select * from tedarikciler;
    
    select * from tedarikciler,urunler where 
    tedarikciler.vergi_no=urunler.ted_vergino;

-- 1
update tedarikciler set firma_ismi='Vestel' where vergi_no=102;
-- 2
update tedarikciler set firma_ismi='casper';
-- 3
update tedarikciler 
set firma_ismi='Casper' , irtibat_ismi='Ali Veli'
where vergi_no=101;

-- 4
update tedarikciler 
set irtibat_ismi='Bill Gates'
where firma_ismi='casper';
select *from urunler;

-- 5
update urunler
set urun_ismi='telefon'
where urun_ismi='phone';
-- 6
update urunler
set urun_id=urun_id+1
where urun_id>1004;
-- 7
update urunler
set urun_id=urun_id+ted_vergino;
-- 8
--  SORU8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci  tablosunda irtibat_ismi 
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
update urunler
set urun_ismi=
(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eva')
where musteri_ismi='Ali Bak';

-- 9
update urunler
set musteri_ismi=(select irtibat_ismi from tedarikciler where firma_ismi='Apple' )
 where urun_ismi='Laptop';




