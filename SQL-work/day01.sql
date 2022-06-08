use work;
create table student(
id varchar(4),
st_name varchar(30),
age int
);

insert into student values('1001','Ali Can','25');
insert into student values('1002','Ayse Can','30');
insert into student values('1003','Fikret Arslan','37');

select * from student;

insert into student values('1005','Leyla Arslan','36'); 
drop table student;