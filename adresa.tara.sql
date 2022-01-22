drop table if exists adresa.tara;
go
create table adresa.tara
	(id bit primary key not null,
	 tara varchar(15) not null);
go
insert into adresa.tara(tara) 
	values ('Romania');
