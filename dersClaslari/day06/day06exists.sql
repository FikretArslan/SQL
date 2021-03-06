/*=========================== EXISTS, NOT EXIST ================================
	EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer olarak,
	EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
	bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar. 
   
	EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür. 
    EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek 
    için kullanılır.
    
    Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE 
    değer döndürür. Aksi takdirde, FALSE değer döndürecektir.
    
    Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır
    
    SYTAX:
    SELECT kolan_ismi  
	FROM tablo_ismi  
	WHERE [NOT] EXISTS (  
    SELECT kolon_ismi   
    FROM tablo_ismi   
    WHERE koşul  
); 
==============================================================================*/

use batch60_61;

CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);
    
CREATE TABLE nisan 
(
	urun_id int ,
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);
    
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
   
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
    
select * from mart;
select * from nisan;
    
   /* -----------------------------------------------------------------------------
  SORU1: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/        
-- 1. YOL
select urun_id, musteri_isim
from mart
where exists
(select urun_id
from nisan
where mart.urun_id = nisan.urun_id);

-- 2. YOL
select urun_id, musteri_isim from mart where urun_id in (select urun_id from nisan where mart.urun_id = nisan.urun_id);

    
/* -----------------------------------------------------------------------------
SORU2: Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
-----------------------------------------------------------------------------*/ 
select urun_isim, musteri_isim
from nisan as nisan_tablo
where exists
(select urun_isim
from mart as mart_tablo
where nisan_tablo.urun_isim=mart_tablo.urun_isim);

    
/*  SORU3: Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve   bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
select urun_isim, musteri_isim
from nisan as nisan_tablo
where not exists
(select urun_isim
from mart as mart_tablo
where nisan_tablo.urun_isim = mart_tablo.urun_isim);



/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL, BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadığını kontrol ederler.  
    
    COALESCE (Birleştirmek) ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

CREATE TABLE insanlar 
(
	ssn CHAR(9), -- Social Security Number
	isim VARCHAR(50), 
	adres VARCHAR(50) 
);

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');
                
select * from insanlar;

-- isim i null olanlari sorgula
select * from insanlar where isim is null;
        

-- isim null olmayanlar
select * from insanlar where isim is not null;

        
-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar set isim = 'NO NAME' where isim is null;
select * from insanlar;


-- soruyu çözmeden önce tabloyu eski haline döndürün
update insanlar set isim = null where isim= 'NO NAME';

/* 
SORU4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayalım.
            çoklu değişimde ve  WHERE isim IS NULL or adres is null....; 
            gibi ifade yazmamak için. coalesce=birleşmek
*/

update insanlar
set isim = coalesce(isim, 'Henuz isim girilmedi'),
	adres = coalesce(adres, 'Henuz adres girilmedi'),
    ssn = coalesce(ssn, 'No SSN');

select * from insanlar;


  




/*================================ ORDER BY  ===================================
   ORDER BY cümleciği bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
	ORDER BY sutun_adi ASC (ASCENDING)   -- ARTAN, DEFAULT
	ORDER BY sutun_adi DESC (DESCENDING)  -- AZALAN
==============================================================================*/       

CREATE TABLE kisiler 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50), 
soyisim VARCHAR(50), 
maas int,
adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');

INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

select * from kisiler;
    
-- SORU1: kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
select * from kisiler order by adres;
select * from kisiler order by adres asc;
select * from kisiler order by adres desc;
-- asc ye gerek yok. default olarak yapyor zaten
 
-- SORU2: kisiler tablosunu maaşı büyükten küçüğe göre sırala.
select * from kisiler order by maas desc;


-- SORU3: ismi Mine olanları, maas a göre AZALAN sırada sorgulayınız.
select * from kisiler where isim = 'Mine' order by maas desc;


-- SORU4: soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
select * from kisiler where soyisim='bulut'order by maas;
select * from kisiler where soyisim='bulut'order by maas desc;


-- ***************************** LİMİT **********************************
select * from kisiler;

-- listeden ilk 10 veriyi getir
select * from kisiler limit 10;

-- 10. veriden sonraki 2 veriyi al (11 ve 12)
select * from kisiler limit 10, 2;
-- 10 -> 10 dan sonraki al. 10 dahil değil. 2 - > 2 tane değeri getir.
-- yani 11. ve 12. değer

select * from kisiler where id >10 limit 2;


--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyen sorguyu yazınız.
select * from kisiler order by maas desc limit 3;

/* Oracle SQL Çözümü
select * from kisiler order by maas desc
fetch next 3 rows only;
*/


-- MAAŞ'a göre sıralamada 4. 5.  6. kişilerin bilgilerini listeleyen sorguyu yazınız.
select * from kisiler order by maas desc limit 3,3;
-- ilk, 3 rakami: 4. değeri al diyor.
-- ikinci 3 rakamda: 3 tane değeri getir. yani 4. 5. ve 6. kişiler.


/* Oracle SQL Çözümü
select * from kisiler order by maas desc
OFFSET 3 ROWS			--> ilk 3 kaydı atladık
FETCH NEXT 3 ROWS ONLY;	--> sonraki 3 kisiyi getir
*/