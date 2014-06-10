Create table people (
	people_id varchar(20),
	password varchar(20),
	name varchar(20),
	gender char(1),
	social_num varchar(20),
	phone varchar(20),
	smoking char(1),
	mileage int default 0,
 Primary Key (people_id)) ;
 
 create table continent (
 	cont_id int not null auto_increment,
 	cont_name varchar(20),
 Primary Key(cont_id) );
 
 create table nation (
 	nation_id int NOT NULL AUTO_INCREMENT,
 	name varchar(20),
 	cont_id int NOT NULL,
 Primary Key(nation_id)); 
 
  create table staff (
 	staff_id int NOT NULL AUTO_INCREMENT,
 	name varchar(20),
 	phone varchar(20),
 	career int,
 	Age int,
 	gender char(1),
 Primary Key(staff_id)); 
 
  create table city(
 	city_id int NOT NULL AUTO_INCREMENT,
 	name varchar(20),
 	cont_id int NOT NULL,
 Primary Key(city_id)); 

 
  create table reservation (
 	reserve_id int NOT NULL AUTO_INCREMENT,
 	reserve_data varchar(20),
 	people_num int,
 	people_id int NOT NULL,
 	product_id int NOT NULL,
 Primary Key(reserve_id)); 
 
  create table passport(
 	passport_id int NOT NULL AUTO_INCREMENT,
 	name varchar(20),
 	eng_name varchar(20),
 	birth date,
 	exdate date,
 	reserve_id int NOT NULL,
 Primary Key(passport_id)); 
 
   create table product (
 	product_id int NOT NULL AUTO_INCREMENT,
 	name varchar(20),
 	cost int,
 	staff_id int NOT NULL,
 	city_id int NOT NULL,
 	cont_id int NOT NULL,
 	schedule_id int NOT NULL,
 	
 Primary Key(product_id));
 
   create table schedule (
 	schedule_id int NOT NULL AUTO_INCREMENT,
 	departure_id int NOT NULL,
 	arrival_id int NOT NULL,
 	daparture_date date ,
 	departure_time time,
 	arrival_date date,
 	arrival_time time,
 Primary Key(schedule_id)); 


 
create table RPS (
	product_id int,
	schedule_id int
);
 

Create table airplane (
	air_id int NOT NULL AUTO_INCREMENT,
	name varchar(20) NOT NULL,
	seat_num int NOT NULL,
	airline_id int NOT NULL,
 Primary Key (air_id)) ;
 
 Create table airline (
	airline_id int NOT NULL AUTO_INCREMENT,
	name varchar(20) NOT NULL,
 Primary Key (airline_id)) ;
 
  Create table product_schedule (
	ps_id int NOT NULL AUTO_INCREMENT,
	product_id int,
	name varchar(20),
	picture blob,
	contents blob,
	day int,
 Primary Key (ps_id)) ;
 
 alter table product_schedule
 modify column name varchar(50);

 Create table airport (
	airport_id Int NOT NULL AUTO_INCREMENT,
	airport_name Varchar(30),
	city_id int NOT NULL,
 Primary Key (airport_id)) ;
 
 
Alter table reservation add Foreign Key (people_id) references people (people_id) on delete  restrict on update  restrict;

Alter table reservation add Foreign Key (product_id) references product (product_id) on delete  restrict on update  restrict;


Alter table nation add Foreign Key (cont_id) references continent (cont_id) on delete  restrict on update  restrict;

Alter table city add Foreign Key (nation_id) references nation (nation_id) on delete  restrict on update  restrict;
Alter table passport add Foreign Key (reserve_id) references reservation (reserve_id) on delete  restrict on update  restrict;
Alter table product add Foreign Key (staff_id) references staff (staff_id) on delete  restrict on update  restrict;
Alter table product add Foreign Key (city_id) references city (city_id) on delete  restrict on update  restrict;
Alter table product add Foreign Key (schedule_id) references schedule (schedule_id) on delete  restrict on update  restrict;
Alter table schedule add Foreign Key (departure_id) references airport (airport_id) on delete  restrict on update  restrict;
Alter table schedule add Foreign Key (arrival_id) references airport (airport_id) on delete  restrict on update  restrict;
Alter table schedule add Foreign Key (air_id) references airplane (air_id) on delete  restrict on update  restrict;
Alter table airplane add Foreign Key (airline_id) references airline (airline_id) on delete  restrict on update  restrict;
Alter table product_schedule add Foreign Key (product_id) references product (product_id) on delete  restrict on update  restrict;
Alter table airport add Foreign Key (city_id) references city (city_id) on delete  restrict on update  restrict;
Alter table schedule add Foreign Key (product_id) references product (product_id) on delete  restrict on update  restrict;
Alter table reservation add Foreign Key (passport_id) references passport (passport_id) on delete  restrict on update  restrict;
Alter table reservation add Foreign Key (people_id) references people (people_id) on delete  restrict on update  restrict;

Alter table RPS add Foreign Key (product_id) references product (product_id) on delete  restrict on update  restrict;
Alter table RPS add Foreign Key (schedule_id) references schedule(schedule_id) on delete  restrict on update  restrict;

Alter table schedule add column air_id int;

insert into continent values (null,'������');
insert into continent values (null,'����'),
(null,'�������'),
(null,'����'),
(null,'�ƽþ�');

insert into nation values (null,'�ʸ���',1),
(null,'�ε��׽þ�',1),
(null,'�±�',1),
(null,'ȣ��',3),
(null,'��������',3),
(null,'����',2),
(null,'���þ�',2),
(null,'ü��',2),
(null,'������',2),
(null,'������',2),
(null,'�����',4),
(null,'�ν���������',4),
(null,'����',4),
(null,'�������ý���',4),
(null,'�߱�',5),
(null,'�Ϻ�',5);
insert into nation values (null,'�ѱ�',5);

insert into city values (null,'����',1),
(null,'����ī��',1),
(null,'�߸�',2),
(null,'����',3),
(null,'Ǫ��',3),
(null,'�õ��',4),
(null,'����',16),
(null,'����ī',16),
(null,'�����ī',16),
(null,'������',16);

insert into city values (null,'���ֵ�',17);
insert into city values (null,'����',17);
insert into city values (null,'��õ',17);

INSERT INTO airline VALUES (null, '�����װ�')
, (null, '�����װ�')
, (null, '�ƽþƳ�')
, (null, 'Ƽ�����װ�');

insert into airline values (null, 'ZEST AIR');
insert into airline values (null, '�����۽����װ�');

INSERT INTO airplane VALUES (null, 'A-707', 200, 1)
, (null, 'A380', 150, 1)
, (null, 'A350', 150, 1)
, (null, 'B-717', 200, 1)
, (null, 'BMD10', 150, 1)
, (null, 'MB82', 200, 1)
, (null, 'MB83', 200, 1)
, (null, 'A34-500', 200, 2)
, (null, 'A34-600', 200, 2)
, (null, 'B737-800', 150, 2)
, (null, 'B757', 100, 2)
, (null, 'A320-100', 200, 3)
, (null, 'A321-100', 200, 3)
, (null, 'A330-2', 150, 3)
, (null, 'B777', 200, 3)
, (null, 'B777-300', 200, 3)
, (null, 'B900', 200, 3)
, (null, 'B737-800', 200, 3)
, (null, 'Q300', 150, 3)
, (null, 'A330-300', 200, 4)
, (null, 'Q400', 100, 4)
, (null, 'CJ100', 100, 4);


INSERT INTO airplane VALUES (null, 'Z20039',200,5);
INSERT INTO airplane VALUES (null, 'Z20039',200,6);

INSERT INTO airport VALUES  (null, '��õ����', 13)
, (null, '������������', 12)
, (null, '���ֱ�������', 11) 
, (null, '�����̱�������', 8)
, (null, '�õ�ϰ���', 6)
, (null, '�����ī��������',9);

insert into airport values (null, '�򸮺�����',1);


ALTER TABLE product
DROP COLUMN cont_id;


ALTER TABLE nation
CHANGE COLUMN nation_name name varchar(10);
ALTER TABLE city
CHANGE COLUMN city_name name varchar(10);

INSERT INTO schedule VALUES (�����ٹ�ȣ, ������ȣ, ��߰���, ��������, ��߳�¥, ��߽ð�, ������¥, �����ð� 
INSERT INTO schedule VALUES (null, 1, 4,  '2012-12-30', '12:30', '2012-12-30', '13:45',1);
INSERT INTO schedule VALUES (null, 1, 4,  '2013-01-04', '15:05', '2013-01-04', '16:35',1);
INSERT INTO schedule VALUES (null, 3, 4,  '2013-01-05', '15:05', '2013-01-05', '16:35',2,2);
INSERT INTO schedule VALUES (null, 3, 4,  '2013-01-22', '09:00', '2013-01-26', '15:07',2,2);
INSERT INTO schedule VALUES (null, 1, 4,  '2013-01-12', '12:30', '2013-01-12', '13:45',1,2);
INSERT INTO schedule VALUES (null, 1, 4,  '2012-01-30', '12:30', '2012-02-02', '13:45',1);

INSERT INTO schedule VALUES (null, 1, 4,  '2013-01-07', '12:30', '2013-01-10', '13:45',3),
(null, 1, 4,  '2013-01-12', '16:30', '2013-01-15', '11:00',3),
(null, 1, 4,  '2013-01-12', '10:25', '2013-01-15', '12:05',3),
(null, 1, 4,  '2013-01-29', '07:45', '2013-02-01', '19:23',3);


alter table product modify column name varchar(100);
INSERT INTO staff VALUES  (null, '������','0102223333',10,22,'f');

INSERT INTO staff VALUES  (null, '��ҿ�','0102223333',10,22,'f');


INSERT INTO product VALUES (��ǰ��ȣ,��ǰ�̸�, ����, ������ȣ, ����, �������ȣ
INSERT INTO product VALUES (null,'����ī�ǿ��� 3��[�Ը����]�ܰ��߰�(���)&�Ƹ�����õ�� ',699000, 1,8,1);
INSERT INTO product VALUES (null,'[��ǥin��ĭ]����ī 3��[�����Ϳ�õ]�߰�(���)& ����ü�� ',949000, 1,8,'2.jpg');

INSERT INTO product_schedule VALUES (1,1,'Ÿ���ڳ���',null,'�� �Ϻ� 3���õ �� �ϳ�, �Ƹ��� ��õ���� �̵� [�� 40�� �ҿ�]',1);
INSERT INTO product_schedule VALUES (2,1,'���躸��',null,'�� ���躸�� [�� 25�� �ҿ�]
 : ���ڼ����� ���� �ΰ����ο��� ���躸���� �����ô� ���� ī��Ű���� �� ���� ���� ���� ����� ����ī �ִ��� ���ڰŸ��� �����Ͽ����ϴ�.',2);
INSERT INTO product_schedule VALUES (3,1,'�����',null,'���� �� 15M, ���� 380���� �ݵ��ºһ��� ����ڳ����� ���ο� ����� �ִ� �����ִ��� �����ǹ��� �پ��� ��(��)�� ��ñ�� ������ �Ϻ����� �ұ��� ������ ã�� �� �� �ִ� ���Դϴ�. �Ƹ��ٿ� ������ �پ��� �翬�� ������ �ִ� �� ������ �ѷ����鼭 ������ ��å�� ��ܺ�����!
 ',3);
 
 INSERT INTO product_schedule VALUES (null,2,'�Ϻ��� 3�뼺 ����ī��','2-1.jpg','�� ����ī��[õ��������] [�� 1�ð� �ҿ�]',1);
  INSERT INTO product_schedule VALUES (null,2,'�����߽���','2-2.jpg','�� õ���� �ֹ� ����ī�� �����߽��� ����[�� 1�ð� �ҿ�]',2);
   INSERT INTO product_schedule VALUES (null,2,'�Ľù� �̳�������','2-3.jpg','�� ���� �����̷� �Ƹ��ٿ��� ���� �Ľù� �̳������� ����',3);
INSERT INTO product_schedule VALUES (null,2,'�ƶ�þ߸�','2-4.jpg','�� ����� ��å�� �Բ��ϴ� �ƶ�þ߸�(չߣ)�� �̵�[�� 30�� �ҿ�]',4);

 
 
 //�����
 
CREATE VIEW list AS SELECT product_id, product.name AS name, product_schedule.picture AS picture, cost,city_id
 FROM product NATURAL JOIN product_schedule;
 
 
 alter table schedule
 change column daparture_date departure_date Date;
 
