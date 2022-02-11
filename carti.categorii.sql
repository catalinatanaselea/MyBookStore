use PersonalDB;
go
drop table if exists carti.categorii;
go
create table carti.categorii(
		id smallint identity(1,1) primary key not null,
		categorie varchar(50) not null);
go
insert into carti.categorii(categorie) 
	values 	('Culinare'),
			('Arta, arhitectura'),
			('Bibliografii, memorii, jurnale'),
			('Lingvistiva, dictionare'),
			('Poezie, teatru'),
			('Fictiune'),
			('Istorie'),
			('Religie'),
			('Filosofie'),
			('Psihologie'),
			('Stiinte sociale'),
			('Marketing si comunicare'),
			('Bussiness si economie'),
			('Drept'),
			('Medicina'),
			('Stiinte exacte, matematici'),
			('Natura si mediu'),
			('Tehnica si tehnologie'),
			('Computere si internet'),
			('Sanatate, dezvoltare personala'),
			('Lifestyle, sport, timp liber');
go
select * from carti.categorii;
go
