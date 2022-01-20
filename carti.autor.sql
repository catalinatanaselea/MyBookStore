use PersonalDB;
go
drop table if exists carti.autor;
go
create table carti.autor
		(id_autor smallint identity(1,1) primary key not null,
		 nume_autor varchar(50) not null)
