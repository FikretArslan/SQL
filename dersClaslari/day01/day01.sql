use batch60_61;
-- birden fazla database varsa "use" komutu ile kullanacağımız 
database'i seçiyoruz
-- "--" ile açıklama yazabiliyoruz

/*
Javadaki gibi açıklama yazabiliriz
*/

create table student
-- student table olusturduk
(id varchar(4), st_name varchar(30), age int);
-- başlıların değişken tiplerini tanımladık

-- VERİ GİRİŞİ
insert into student values('1001', 'Ali Can', '25');
insert into student values('1002', 'Veli Can', '35');
insert into student values('1003', 'Ayşe Can', '45');
insert into student values('1004', 'Derya Can', '55');

select * from student;

-- PARÇALI VERİ GİRİŞİ
insert into student (st_name,age) values('Murat Can', '35');

drop table student;
-- student tablosunu siler