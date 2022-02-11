use PersonalDB;
go
drop table if exists carti.autor;
go
create table carti.autor
		(id smallint identity(1,1) primary key not null,
		 prenume varchar(40) not null,
		 nume varchar(40) null);
