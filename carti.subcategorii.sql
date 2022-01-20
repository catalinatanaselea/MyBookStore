use PersonalDB;
go
drop table if exists carti.subcategorii;
go
create table carti.subcategorii(
		id_subcateg tinyint identity(1,1) primary key not null, 
		id_categ smallint foreign key references carti.categorii(id_categ) not null,
		nume_subcateg varchar(50) not null)
go
insert into carti.subcategorii(id_categ, nume_subcateg)
		values	(2, 'Teoria artei'),
				(2, 'Istoria artei'),
				(2, 'Pictura, grafica, alte forme artistice'),
				(2, 'Fotografie'),
				(2, 'Arta comerciala si industiala'),
				(2, 'Design interior'),
				(2, 'Arhitectura'),
				(4, 'Dictionare'),
				(4, 'Gramatica'),
				(4, 'Istoria limbajului'),
				(4, 'Lingvistica'),
				(5, 'Poezie'),
				(5, 'Piese de teatru, scenarii'),
				(5, 'Eseistica'),
				(5, 'Antologii'),
				(5, 'Istorie si critica'),
				(6, 'Clasici'),
				(6, 'Moderni, contemporani'),
				(6, 'Crime, mister'),
				(6, 'Thriller, horror'),
				(6, 'Young adult'), 
				(6, 'Aventura'),
				(6, 'SF'),
				(6, 'Fantasy'),
				(6, 'Fictiune erotica'),
				(6, 'Fictiune mitologica si istorica'),
				(6, 'Romance'),
				(6, 'Saga'),
				(6, 'Proza scurta');