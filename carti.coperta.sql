use PersonalDB;
go
drop table if exists carti.coperta;
go
create table carti.coperta
		(id tinyint identity(1,1) primary key not null, 
		 coperta varchar(15) not null);
go
insert into carti.coperta(coperta)
		values	('Paperback'),
				('Hardcover');
