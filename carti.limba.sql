use PersonalDB;
go
drop table if exists carti.limba;
go
create table carti.limba
		(id tinyint identity(1,1) primary key not null,
		limba varchar(10) not null);
go
insert into carti.limba (limba)
		values	('Romana'),
				('Engleza'),
				('Franceza'),
				('Spaniola'),
				('Germana'),
				('Maghiara'),
				('Ítaliana');
