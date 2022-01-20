use PersonalDB;
drop table if exists carti.coperta;
go
create table carti.coperta
		(id_coperta tinyint identity(1,1) primary key not null, 
		 tip_coperta varchar(15) not null);
go
insert into carti.coperta(tip_coperta)
		values	('Paperback'),
				('Hardcover'),
				('Flexibound');
