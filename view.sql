CREATE VIEW dbo.View_date_clienti
AS
SELECT clienti.clienti.prenume, clienti.clienti.nume, clienti.adresa.strada, clienti.adresa.nr_strada, adresa.localitate.localitate, adresa.judet.judet, adresa.tara.tara, clienti.adresa.cod_postal
FROM clienti.adresa 
INNER JOIN clienti.clienti 
	ON clienti.adresa.id = clienti.clienti.id_adresa 
INNER JOIN adresa.judet 
	ON clienti.adresa.id_judet = adresa.judet.id 
INNER JOIN adresa.localitate 
	ON clienti.adresa.id_localitate = adresa.localitate.id 
INNER JOIN adresa.tara 
	ON clienti.adresa.id_tara = adresa.tara.id
