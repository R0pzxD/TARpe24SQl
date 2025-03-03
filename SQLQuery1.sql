--loome db
create database TARpe24SQL

--db valimine
use TARpe24SQL

--db kustutamine

--tabeli loomine
create table Gender
(
ID int not null primary key,
Gender nvarchar(10) not null
)

--andmete sisestamine
insert into Gender (ID, Gender)
values (2,'Male')
insert into Gender (ID, Gender)
values (1, 'Female')
insert into Gender (ID, Gender)
values (3,'Unknow')


