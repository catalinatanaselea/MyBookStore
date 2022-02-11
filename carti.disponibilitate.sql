use PersonalDB;
go
drop table if exists carti.disponibilitate;
go
create table carti.disponibilitate
		(id tinyint identity(1,1) primary key not null,
		 disponibilitate varchar(15) not null);
go
insert into carti.disponibilitate(disponibilitate)
		values ('Livrare 24h'),
			   ('In stoc'),
			   ('Stoc limitat'),
			   ('La comanda'),
			   ('Precomanda');