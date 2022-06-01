use batch60_61;

CREATE TABLE calisanlar
(
    id CHAR(5),
    name VARCHAR(50),
    maas int,
    CONSTRAINT calisanlar_id_pk PRIMARY KEY(id)
);

INSERT INTO calisanlar VALUES(10001, 'Ali Can', 12000);
INSERT INTO calisanlar VALUES(10002, 'Veli Han', 2000);
INSERT INTO calisanlar VALUES(10003, 'Mary Star', 7000);
INSERT INTO calisanlar VALUES(10004, 'Angie Ocean', 8500);

select * from calisanlar;

-- 1) En yüksek maas
-- 1 YOL
select max(maas) from calisanlar;

-- 2 YOL
select * from calisanlar order by maas desc limit 1;


-- 2) En düşük maaş
select * from calisanlar order by maas limit 1;

select min(maas) from calisanlar;


-- 3) En yüksek 2. maaş
select max(maas) from calisanlar where maas < (select max(maas) from calisanlar);

select maas from calisanlar order by maas desc limit 1,1;

-- 4) En düşük 2. maaş
select min(maas) from calisanlar where maas > (select min(maas) from calisanlar);

select maas from calisanlar order by maas limit 1,1;

-- 5) En yüksek 3. maaş
select * from calisanlar order by maas desc limit 2,1;
-- limit 2,1 -> sralan verideki 3. değeri getirir.

-- 6) En düşük 3. maaş
select * from calisanlar order by maas limit 2,1;

select * from calisanlar
where maas = (select max(maas) from calisanlar where maas < (select max(maas) from calisanlar));


