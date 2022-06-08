create schema day03;
use day03;

create table kelimeler(
id int unique,
kelime varchar(50) not null,
harf_sayisi int
);
insert into kelimeler values(1001,'hot',3);
insert into kelimeler values(1021,'h3t',3);
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
-- 16
select * from kelimeler where regexp_like(kelime,'at|ot','c');
-- 17
select * from kelimeler where regexp_like(kelime,'at|ot');
-- 18
select * from kelimeler where regexp_like(kelime,'^ho|hi');
-- 18
select * from kelimeler where regexp_like(kelime,'t$|m$');
-- 19
select * from kelimeler where regexp_like(kelime,'^h[a-z,A-Z]t');
select * from kelimeler where regexp_like(kelime,'h[a-z:A-Z:0-9]t');
-- 20
select * from kelimeler where regexp_like(kelime,'^h[a|i]t');
-- 21
select * from kelimeler where regexp_like(kelime,'9|3');
select * from kelimeler where regexp_like(kelime,'[eim]');
select * from kelimeler where regexp_like(kelime,'e|i|m');
-- 22
select * from kelimeler where regexp_like(kelime,'^[a|s]');
select * from kelimeler where regexp_like(kelime,'^a|^s');

-- 23
select * from kelimeler where regexp_like(kelime,'oo');
select * from kelimeler where regexp_like(kelime,'[o][o]');

-- 24
select * from kelimeler where regexp_like(kelime,'oooo');
select * from kelimeler where regexp_like(kelime,'[o]{4}');
select * from kelimeler where regexp_like(kelime,'[o][o][o][o]');

-- 25
select * from kelimeler where regexp_like(kelime,'^[sb][a-z]l[a-z][a-z]');

















