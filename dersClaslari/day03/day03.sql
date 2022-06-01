/* ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, 'pattern[] ', 'c' ] )
           
/* ========================================================================== */

use batch60_61;

CREATE TABLE kelimeler
(
id int UNIQUE,
kelime VARCHAR(50) NOT NULL,
harf_sayisi int
);
   
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   
select * from kelimeler;
   
-- SORU16: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat ederek listeleyiniz
-- VEYA işlemi için | karakteri kullanılır.
select * from kelimeler where regexp_like(kelime, 'at|ot', 'c');
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'at|ot', 'c');

-- SORU17: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
select * from kelimeler where regexp_like(kelime, 'at|ot', 'i');
select * from kelimeler where regexp_like(kelime, 'at|ot');
-- 'i' kullanmamza gerek yok. Default olarak geliyor zaten


-- SORU18: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
-- Başlangıcı göstermek için ^ karakteri kullanılır.
select * from kelimeler where regexp_like(kelime, '^ho|hi');
select * from kelimeler where regexp_like(kelime, '^ho|^hi');


-- SORU18: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat etmeksizin listeleyeniz.
-- Bitişi göstermek için $ karakteri kullanılır.
select * from kelimeler where regexp_like(kelime, 't$|m');
select * from kelimeler where regexp_like(kelime, 't$|m$');

   
-- SORU19: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like(kelime, 'h[a-zA-Z0-9]t');
select * from kelimeler where regexp_like(kelime, 'h[a-z:A-Z:0-9]t', 'c');
select * from kelimeler where regexp_like(kelime, 'h[a-z,A-Z,0-9]t', 'c');

-- SORU19A: h ile başlayıp t ile biten 4 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like (kelime, 'h[a-z,A-Z,0-9][a-z,A-Z,0-9]t', 'c');


-- SORU20: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select * from kelimeler where regexp_like(kelime, 'h[a|i]t');
select * from kelimeler where regexp_like(kelime, 'h[ai]t');


-- SORU21: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, 'i|e|m');
select * from kelimeler where regexp_like(kelime, '[mie]');


-- SORU22: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, '^a|^s');
select * from kelimeler where regexp_like(kelime, '^[as]');


-- SORU23: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime,'[o][o]');
select * from kelimeler where regexp_like(kelime,'[o]{2}');


-- SORU24: içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime,'[o][o][o][o]');
select * from kelimeler where regexp_like(kelime,'[o]{4}');


-- SORU25: ilk harfi s veya b , 3. harfi l olan ve 5 harfli olan kelimelerin küçük harfe dikkat ederek listeleyiniz.
select * from kelimeler where regexp_like(kelime, '[sb][a-z]l[a-z][a-z]', 'c');