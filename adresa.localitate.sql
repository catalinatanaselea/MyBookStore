drop table if exists adresa.localitate;
go
create table adresa.localitate
	(id smallint primary key not null,
	 nume_local varchar(50) not null);
go
