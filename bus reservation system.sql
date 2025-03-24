 -- create Database
create database busreservation;
show databases;
use busreservation;
show tables;
-- create table buses
use busreservation;
create table bus(
Bus_id int primary key,
Bus_number varchar(50) Not NULL,
Bus_type VARCHAR(100),
Driver_name varchar(50));
 insert into bus(bus_id,bus_number,bus_type,driver_name)
values (1,"KA-01-1234","volvob7r","kannan"),
(2,"TN-65-1032","scania","raja"),
(3,"TN-03-4576","Mercedes-benz","kumar"),
(4,"KA-03-1234","v0lvob9r","maari"),
(5,"TN-65-7854","scania","james"),
(6,"TN-58-1345","Mercedes-benz","richart"),
(7,"KA-06-6789","volvo","murgan"),
(8,"TN-65-5678","scania","palani"),
(9,"TN-65-9876","mercedes-benz23","senthil"),
(10,"KA-23-6785","volvo23","muthuramu"),
(11,"TN-65-7399","mercedes-benz34","kali"),
(12,"KA-67-3456","volvo09","praveen"),
(13,"TN-65-3427","redbus","ram"),
(14,"TN-48-2345","makamytrip","surya"),
(15,"KA-56-1098","irctc","vijay"),
(16,"TN-24-6745","tnstc","vikaram"),
(17,"TN-65-7834","scania","david"),
(18,"TN-65-4539","Mercedes-benz56","kavin"),
(19,"TN-65-9843","volvo98","mithun"),
(20,"TN-65-7632","scania","mukilan");
-- create table passengers
use busreservation;
create table passenger(
passenger_id int primary key,
name varchar(100) NOT NULL,
email varchar(200) UNIQUE,
phone varchar(50),
address varchar(50));
alter table passenger
modify column phone int;
insert into passenger(passenger_id,name,email,phone,address)
values(1,"abi","abi@gmail.com",1245896434,"123main street_ramanathapuram");
insert into passenger(passenger_id,name,email,phone,address)
values(2,"ishwarya","ishu@gmail.com",1232464231,"456main street _thiruvadanai"),
(3,"kavya","kavya@gmail.com",1203412201,"789baby street_chennai"),
(4,"karthika","karthi@gmail.com",1312142312,"321maple street_devokottai"),
(5,"baranya","barani@gmail.com",1241000321,"234main street_thondi"),
(6,"mounika","mouni@gmail.com",1231032032,"123elm street_karaikudi"),
(7,"kavitha","kavi@gmail.com",1254320021,"387main street_puthukottai"),
(8,"jeevitha","jeevitha@gmail.com",1421501202,"23main street_ramnagar"),
(9,"priya","priya@gmail.com",1325123420,"56main street_sivagangai"),
(10,"geetha","geetha@gmail.com",1315123200,"24main street_madurai");
-- create table routes
use busreservation;
create table route(
route_id int Primary key,
source varchar(100) NOT NULL,
Destination varchar(100),
departure_time Datetime,
arrival_time Datetime);
alter table route
rename column sourse to source;
alter table route
rename column deoarture_time to departure_time;
insert into route(route_id,source,destination,departure_time,arrival_time)
values(1,"ramanathapuram","thanjavur","2024-04-10,20:06:45","2024-04-10,10:05:15"),
(2,"thondi","thiruvadanai","2024-03-14,12:00:13","2024-03-15,02:10:30"),
(3,"karaikudi","pudukottai","2024-05-26,03:00:40","2024-05-26,12:00:00"),
(4,"chennai","kerala","2024-06-07,03:00:00","2024-06-07,12:00:00"),
(5,"trichy","madurai","2024-06-13,07:00:00","2024-06-13,10:00:00"),
(6,"sivagangai","vilupuram","2024-08-19,02:00:20","2024-08-19,07:00:00"),
(7,"tambaram","vellore","2024-08-20,09:00:30","2024-08-21,05:30:15"),
(8,"madurai","salem","2024-09-10,05:00:00","2024-09-10,08:0:00"),
(9,"chennai","pudukottai","2024-10-05,08:00:00","2024-10-06,05:00:00"),
(10,"madurai","karaikal","2024-11-10,03:00:00","2024-11-10,09:00:00");
-- create table reservations
use busreservation;
create table reservation(
reservation_id int primary key,
bus_id int,
reservation_date datetime,
seat_number int);
alter table reservation
add column passenger_id int;
alter table reservation
add constraint passenger foreign key (passenger_id)
references passenger(passanger_id);
alter table reservation
add constraint bus foreign key (bus_id)
references bus (bus_id);
alter table passenger
add column passenger_id int not null;
insert into reservation(reservation_id,bus_id,reservation_date,seat_number)
values(1,1,"2024-01-05,12:01:05",2),
(2,2,"2023-01-06,08:15:02",4),
(3,3,"2023-04-09,12:08:05",6),
(4,4,"2023-07-05,09:04:15",8),
(5,5,"2023-12-25,07:08:12",9),
(6,6,"2023-06-21,05:03:05",7),
(7,7,"2022-09-10,01:10:05",10),
(8,8,"2021-10-07,06:00:30",12),
(9,9,"2024-10-03,05:10:00",13),
(10,10,"2021-05-10,12:00:00",15);
insert into reservation(passenger_id)
values (1);
insert into reservation(passenger_id)
values (2);
-- create table payments
use busreservation;
create table payment(
payment_id int primary key,
amount decimal(10,2),
payment_date datetime,
payment_status varchar(50) DEFAULT 'pending',
reservation_id int);
alter table payment
add constraint reservation foreign key (reservation_id)
 references reservation(reservation_id);
 alter table payment
 modify column payment_date date;
Insert  into payment(payment_id,amount,payment_date,payment_status,reservation_id)
 values(1,500.00,"2023-3-9,02:00:00","pending",1),
 (2,100.00,"2021-7-6,12:00:00","paid",2),
 (3,400.00,"2023-5-4,05:02:00","paid",3),
 (4,300.00,"2020-6-5,12:00:00","paid",4),
 (5,700.00,"2023-9-4,03:00:00","pending",5),
 (6,500.00,"2021-9-,05:00:00","pending",6),
 (7,600.00,"2020-3-6,09:00:00","paid",7),
 (8,800.00,"2022-5-3,08:00:00","paid",8),
 (9,400.00,"2023-6-2,06:00:00","pending",9),
 (10,900.00,"2024-6-4,07:00:00","paid",10);
-- create table reservations
use busreservation;
create table reservation(
reservation_id int primary key,
bus_id int,
reservation_date datetime,
seat_number int);
alter table reservation
add column passenger_id int;
alter table reservation
add constraint passenger foreign key (passenger_id)
references passenger(passenger_id);

create view avilable_buses AS 
select b.bus_id,b.bus_number,b.bus_type,b.driver_name
from bus b
LEFT JOIN reservation r ON b.bus_id=r.bus_id
WHERE r.bus_id IS NULL;
select*from avilable_buses;

create view payment_details AS
select P.payment_id,P.amount,P.payment_date,P.payment_status,P.reservation_id
from payment P
inner join reservation r ON p.reservation_id =r. reservation_id 
order by p.amount ASC;
select*from payment_details;

create view passengerdetails AS
select r.reservation_id,r.bus_id,r.passenger_id,r.seat_number
from reservation r
inner join passenger p ON r.passenger_id=p.passenger_id
order by passenger_id desc;
select*from passengerdetails;

delimiter //
create procedure avaliable_reservation(IN reserve_data datetime)
begin
select seat_number from reservation
where reservation_date =reserve_data;
end //
delimiter ;
call avaliable_reservation("2023-01-06 08:15:02");

delimiter //
create procedure pay_details()
begin
select count(amount) as
total_amount
from payment;
end //
delimiter ;
call pay_details();

delimiter //
create procedure passenger_details()
begin
select name,email from passenger
inner join reservation
on passenger.passenger_id=reservation.passenger_id;
end //
delimiter ;
call passenger_details();

delimiter //
create procedure amount_details()
begin
select amount from payment
order by amount desc;
end //
delimiter ;
call amount_details();

delimiter //
create procedure name_details()
begin
select driver_name from bus
where Driver_name LIKE'k%';
end //
delimiter ;
call name_details();

delimiter //
create procedure avaliable_seat()
begin
select seat_number from reservation
order by seat_number 
limit 5;
end //
delimiter ;
call avaliable_seat();