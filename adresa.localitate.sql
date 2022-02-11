drop table if exists adresa.localitate;
go
create table adresa.localitate
	(id tinyint primary key not null,
	 localitate varchar(30) not null);
go