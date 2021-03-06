drop table if exists adresa.judet;
go
create table adresa.judet
	(id tinyint identity(1,1) primary key not null,
	 judet varchar(30) not null);
go
insert into adresa.judet(judet) 
	values ('Alba Iulia'),
		   ('Arad'),
		   ('Arges'),
		   ('Bacau'),
		   ('Bihor'),
		   ('Bistrita-Nasaud'),
		   ('Botosani'),
		   ('Brasov'),
		   ('Braila'),
		   ('Bucuresti'),
		   ('Buzau'),
		   ('Caras-Severin'),
		   ('Calarasi'),
		   ('Cluj'),
		   ('Constanta'),
		   ('Covasna'),
		   ('Dambovita'),
		   ('Dolj'),
		   ('Galati'),
		   ('Giurgiu'),
		   ('Gorj'),
		   ('Hargita'),
		   ('Hunedoara'),
		   ('Ialomita'),
		   ('Iasi'),
		   ('Ilfov'),
		   ('Maramures'),
		   ('Mehedinti'),
		   ('Mures'),
		   ('Neamt'),
		   ('Olt'),
		   ('Prahova'),
		   ('Satu Mare'),
		   ('Salaj'),
		   ('Sibiu'),
		   ('Suceava'),
		   ('Teleorman'),
		   ('Timis'),
		   ('Tulcea'),
		   ('Vaslui'),
		   ('Valcea'),
		   ('Vrancea');
go
select * from adresa.judet;