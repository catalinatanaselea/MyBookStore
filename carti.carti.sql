use PersonalDB;
go
drop table if exists carti.carti;
go
create table carti.carti
		(id smallint identity(1,1) primary key not null, 
		 id_categ smallint foreign key references carti.categorii(id) not null, 
		 id_subcateg tinyint foreign key references carti.subcategorii(id) null,
		 nume_carte varchar(50) not null,
		 id_autor smallint foreign key references carti.autor(id) not null,
		 id_editura smallint foreign key references carti.editura(id) not null,
		 an char(4) not null,
		 pret decimal(5, 2) not null,
		 id_dispo tinyint foreign key references carti.disponibilitate(id) not null,
		 id_limba tinyint foreign key references carti.limba(id) not null,
		 id_coperta tinyint foreign key references carti.coperta(id) not null,
		 nrpagini smallint null,
		 ISBN char(13) not null);
