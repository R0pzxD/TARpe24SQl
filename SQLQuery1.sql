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

--vaatame tabeli sisu
select * from Gender

--teeme tabeli Person
create table Person
(
Id int not null primary key,
Name nvarchar(30),
Email nvarchar(30),
GenderId int
)

--andmete sisestamine
insert into Person (Id, Name, Email, GenderId)
values (1, 'Superman', 's@s.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (2,'Wonderwoman','w@w.com',1),
(3, 'Batman' ,'b@b.com',2),
(4, 'Aquaman','a@a.com',2),
(5, 'Catwoman' ,'c@c.com',1),
(6, 'Antman', 'ant"ant.com',2),
(7, 'Spiderman','spider@m.com',2),
(9, NULL, NULL,2)
--soovime vaadata Person tabeli andmeid
select * from Person

--v��rv�tme �henduse loomine kahe tabeli vahel
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

--kui sisestad uue rea andmeid ja ei ole sisestanud GenderIdalla v��rtust,
-- siis see automaatselt sisestub sellele reale v��rtuse 3 e nagu meil
-- on unknown
alter table Person
add constraint DF_Persons_GenderId
default 3 for GenderId

--
insert into Person (Id, Name, Email)
values (11, 'KALEVIPOEG', 'k@k.com')

--piirangu kustutamine
alter table person
drop constraint DF_Persons_GenderId

--lisame uue veeru
alter table Person
add Age nvarchar(10)

--lisame nr piirangu vanuse sisestamisel
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 155)

--kustutame rea
delete from Person where Id = 11

select * from Person

--kuidas uuendada andmeid

update Person
set Age = 50
where Id = 4

alter table Person
add City nvarchar(50)

--k�ik , kes elavad Gothami linnas
select * from Person where City = 'Gotham'

--k�ik kes ei ela Gothamis

select * from Person where City  != 'Gotham'
--variant nr 2
select * from Person where City <> 'Gotham'

--N�itab teatud vanusega inimesi
select * from Person where Age = 150 or Age= 35 or Age = 25
select * from Person where Age in (100,35,25)

--n�itab teatud vanusevahemikus olevaid inimesi
select * from Person where Age < 100 and Age >30
select * from Person where Age between 22 and 50

--wildcard ehk n�itab k�ik g-t�hega linnad
select * from Person where City like 'n%'

--k�ik emailid�, kus on @m�rk emailis
select * from Person where Email like '%@%'

--n�itab k�iki , kellel ei ole @ marki

select * from Person where Email not like '%@%'


