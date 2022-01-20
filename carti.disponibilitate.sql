use PersonalDB;
go
drop table if exists carti.disponibilitate;
go
create table carti.disponibilitate
		(id_dispo tinyint identity(1,1) primary key not null,
		 tip_dispo varchar(15) not null);
go
insert into carti.disponibilitate
		values ('Livrare 24h'),
			   ('In stoc'),
			   ('Stoc limitat'),
			   ('La comanda'),
			   ('Precomanda');