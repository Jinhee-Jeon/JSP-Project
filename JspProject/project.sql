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

insert into continent values (null,'동남아');
insert into continent values (null,'유럽'),
(null,'남태평양'),
(null,'미주'),
(null,'아시아');

insert into nation values (null,'필리핀',1),
(null,'인도네시아',1),
(null,'태국',1),
(null,'호주',3),
(null,'뉴질랜드',3),
(null,'영국',2),
(null,'러시아',2),
(null,'체코',2),
(null,'프랑스',2),
(null,'스위스',2),
(null,'벤쿠버',4),
(null,'로스앤젤레스',4),
(null,'뉴욕',4),
(null,'센프란시스코',4),
(null,'중국',5),
(null,'일본',5);
insert into nation values (null,'한국',5);

insert into city values (null,'세부',1),
(null,'보라카이',1),
(null,'발리',2),
(null,'방콕',3),
(null,'푸켓',3),
(null,'시드니',4),
(null,'도쿄',16),
(null,'오사카',16),
(null,'후쿠오카',16),
(null,'삿포로',16);

insert into city values (null,'제주도',17);
insert into city values (null,'김포',17);
insert into city values (null,'인천',17);

INSERT INTO airline VALUES (null, '대한항공')
, (null, '제주항공')
, (null, '아시아나')
, (null, '티웨이항공');

insert into airline values (null, 'ZEST AIR');
insert into airline values (null, '세부퍼시픽항공');

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

INSERT INTO airport VALUES  (null, '인천공항', 13)
, (null, '김포국제공항', 12)
, (null, '제주국제공항', 11) 
, (null, '간사이국제공항', 8)
, (null, '시드니공항', 6)
, (null, '후쿠오카국제공항',9);

insert into airport values (null, '깔리보공항',1);


ALTER TABLE product
DROP COLUMN cont_id;


ALTER TABLE nation
CHANGE COLUMN nation_name name varchar(10);
ALTER TABLE city
CHANGE COLUMN city_name name varchar(10);

INSERT INTO schedule VALUES (스케줄번호, 비행기번호, 출발공항, 도착공항, 출발날짜, 출발시간, 도착날짜, 도착시간 
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
INSERT INTO staff VALUES  (null, '김진희','0102223333',10,22,'f');

INSERT INTO staff VALUES  (null, '고소영','0102223333',10,22,'f');


INSERT INTO product VALUES (상품번호,상품이름, 가격, 직원번호, 도시, 스케쥴번호
INSERT INTO product VALUES (null,'오사카의오후 3일[입맛대로]●고베야경(夜景)&아리마온천♨ ',699000, 1,8,1);
INSERT INTO product VALUES (null,'[쉼표in료칸]오사카 3일[웰빙♨온천]야경(夜景)& 교토체험 ',949000, 1,8,'2.jpg');

INSERT INTO product_schedule VALUES (1,1,'타이코노유',null,'☞ 일본 3대온천 중 하나, 아리마 온천으로 이동 [약 40분 소요]',1);
INSERT INTO product_schedule VALUES (2,1,'도톰보리',null,'♣ 도톰보리 [약 25분 소요]
 : 물자수송을 위한 인공수로였던 도톰보리는 에도시대 이후 카부키극장 및 술집 등이 들어서며 현재는 오사카 최대의 먹자거리로 발전하였습니다.',2);
INSERT INTO product_schedule VALUES (3,1,'동대사',null,'높이 약 15M, 무게 380톤의 금동좌불상인 비로자나불이 내부에 모셔져 있는 세계최대의 목조건물로 다양한 신(神)을 모시기로 유명한 일본에서 불교의 흔적을 찾아 볼 수 있는 곳입니다. 아름다운 정원과 다양한 사연을 가지고 있는 절 주위를 둘러보면서 가벼운 산책을 즐겨보세요!
 ',3);
 
 INSERT INTO product_schedule VALUES (null,2,'일본의 3대성 오사카성','2-1.jpg','♣ 오사카성[천수각포함] [약 1시간 소요]',1);
  INSERT INTO product_schedule VALUES (null,2,'도구야스지','2-2.jpg','♣ 천하의 주방 오사카의 도구야스지 관광[약 1시간 소요]',2);
   INSERT INTO product_schedule VALUES (null,2,'후시미 이나리진자','2-3.jpg','♣ 붉은 도리이로 아름다움을 더한 후시미 이나리진자 관광',3);
INSERT INTO product_schedule VALUES (null,2,'아라시야마','2-4.jpg','☞ 편안한 산책이 함께하는 아라시야마(嵐山)로 이동[약 30분 소요]',4);

 
 
 //뷰생성
 
CREATE VIEW list AS SELECT product_id, product.name AS name, product_schedule.picture AS picture, cost,city_id
 FROM product NATURAL JOIN product_schedule;
 
 
 alter table schedule
 change column daparture_date departure_date Date;
 
