-- 1. Procedura stocata ce afiseaza cartile comandate sub pretul mediu al cartilor
DROP PROCEDURE IF EXISTS usp_AvgOrderPrice;
GO
CREATE PROCEDURE usp_AvgOrderPrice
as
BEGIN
BEGIN TRY
BEGIN TRAN 
	SELECT DISTINCT cc.titlu, c.pret
	FROM comanda.comanda c
	JOIN carti.carti cc
		ON cc.id = c.id_carte
	WHERE c.pret < (SELECT AVG(pret)
				    FROM carti.carti)
	ORDER BY pret DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_AvgOrderPrice;

--2. Procedura stocata pentru a afla nr de comanzi ale clientilor
DROP PROCEDURE IF EXISTS usp_NoCustOrders;
GO
CREATE PROCEDURE usp_NoCustOrders
	(@a smallint)
as
begin
BEGIN TRY
BEGIN TRAN 
	SELECT comcl.id_client as Client, COUNT(DISTINCT numar_comanda) as NumarComenzi
	FROM comanda.comanda com
	JOIN comanda.comanda_client comcl
		ON com.id = comcl.id_comanda
	WHERE @a = comcl.id_client
	GROUP BY comcl.id_client
	ORDER BY NumarComenzi DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_NoCustOrders 72;

--3. Procedura stocata pentru a afla cele mai vandute carti(cantitati)
DROP PROCEDURE IF EXISTS usp_BooksQtyOrderd;
GO
CREATE PROCEDURE usp_BooksQtyOrderd
as
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT c.titlu as Titlu, SUM(cant_carti) as NumarComandat
	FROM carti.carti c
	JOIN comanda.comanda com
		ON c.id = com.id_carte
	GROUP BY c.titlu
	ORDER BY NumarComandat DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_BooksQtyOrderd;

--4. Procedura stocata pentru a afla cele mai vandute carti(de cate ori a fost comandata)
DROP PROCEDURE IF EXISTS usp_BooksTimesOrdered;
GO
CREATE PROCEDURE usp_BooksTimesOrdered
as
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT c.titlu as Titlu, COUNT(*) as NumarComandat
	FROM carti.carti c
	JOIN comanda.comanda com
		ON c.id = com.id_carte
	GROUP BY c.titlu
	ORDER BY NumarComandat DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_BooksTimesOrdered;

--5. Procedura stocata pentru a afla cei mai vanduti autori
DROP PROCEDURE IF EXISTS usp_BestSellingAuthors;
GO
CREATE PROCEDURE usp_BestSellingAuthors
as
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT ca.prenume, ca.nume, COUNT(*) as NumarComenzi
	FROM carti.autor ca
	JOIN carti.carti_autor cca
		ON ca.id = cca.id_autor
	JOIN comanda.comanda c
		ON cca.id_carte = c.id_carte
	GROUP BY ca.prenume, ca.nume
	ORDER BY NumarComenzi DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_BestSellingAuthors;

--6. Procedura stocata pentru a introduce un client nou, cu adresa deja in baza de date
DROP PROCEDURE IF EXISTS usp_UplNewCust_OldAddress;
GO
CREATE PROCEDURE usp_UplNewCust_OldAddress 
@id_client smallint,
@prenume varchar(50),
@nume varchar(40),
@email varchar(50),
@telefon char(9),
@data_de_nastere date,
@id_adresa tinyint
as
BEGIN
BEGIN TRY
BEGIN TRAN 
	INSERT INTO clienti.clienti(id, prenume, nume, email, telefon, data_de_nastere, id_adresa)
	VALUES(@id_client, @prenume, @nume, @email, @telefon, @data_de_nastere, @id_adresa);
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO

EXECUTE usp_UplNewCust_OldAddress 
	@id_client = 152, 
	@prenume = 'Constantin', 
	@nume= 'Apostol', 
	@email= 'costiapostol@yahoo.com', 
	@telefon= '746454889', 
	@data_de_nastere = '1990-07-07', 
	@id_adresa = 132;

--7. Procedura stocata pentru a introduce un client nou, cu adresa deja in baza de date, localitate existenta
DROP PROCEDURE IF EXISTS usp_UplNewCust_NewAddress_OldLoc;
GO
CREATE PROCEDURE usp_UplNewCust_NewAddress_OldLoc
@id_adr tinyint,
@strada varchar(50),
@nr_strada smallint,
@id_localitate tinyint, 
@id_judet tinyint,
@id_tara tinyint,
@cod_postal char(6),
@id_client smallint,
@prenume varchar(50),
@nume varchar(40),
@email varchar(50),
@telefon char(9),
@data_de_nastere date,
@id_adresa tinyint
as
BEGIN
BEGIN TRY
BEGIN TRAN 
	INSERT INTO clienti.adresa(id, strada, nr_strada, id_localitate, id_judet, id_tara, cod_postal)
	VALUES(@id_adr, @strada, @nr_strada, @id_localitate, @id_judet, @id_tara, @cod_postal);
	INSERT INTO clienti.clienti(id, prenume, nume, email, telefon, data_de_nastere, id_adresa)
	VALUES(@id_client, @prenume, @nume, @email, @telefon, @data_de_nastere, @id_adresa);
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_UplNewCust_NewAddress_OldLoc 
	@id_adr = 143, 
	@strada = 'Zborului', 
	@nr_strada = 7, 
	@id_localitate = 8, 
	@id_judet = 10, 
	@id_tara = 1, 
	@cod_postal = 30775,
	@id_client = 153, 
	@prenume = 'Valentina', 
	@nume= 'Plavet', 
	@email= 'sundayfunday@yahoo.com', 
	@telefon= '726981102', 
	@data_de_nastere = '1992-12-18', 
	@id_adresa = 143;

--8. Procedura stocata pentru a introduce un client nou, cu adresa deja in baza de date, localitate noua
DROP PROCEDURE IF EXISTS usp_UplNewCust_NewAddress_NewLoc ;
GO
CREATE PROCEDURE usp_UplNewCust_NewAddress_NewLoc
@id_loc tinyint,
@localitate varchar(30),
@id_adr tinyint,
@strada varchar(50),
@nr_strada smallint,
@id_localitate tinyint, 
@id_judet tinyint,
@id_tara tinyint,
@cod_postal char(6),
@id_client smallint,
@prenume varchar(50),
@nume varchar(40),
@email varchar(50),
@telefon char(9),
@data_de_nastere date,
@id_adresa tinyint
as
BEGIN
BEGIN TRY
BEGIN TRAN
	INSERT INTO adresa.localitate(id, localitate)
	VALUES(@id_loc, @localitate);
	INSERT INTO clienti.adresa(id, strada, nr_strada, id_localitate, id_judet, id_tara, cod_postal)
	VALUES(@id_adr, @strada, @nr_strada, @id_localitate, @id_judet, @id_tara, @cod_postal);
	INSERT INTO clienti.clienti(id, prenume, nume, email, telefon, data_de_nastere, id_adresa)
	VALUES(@id_client, @prenume, @nume, @email, @telefon, @data_de_nastere, @id_adresa);
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_UplNewCust_NewAddress_NewLoc
	@id_loc = 45,
	@localitate = 'Urecheni'
	@id_adr = 143, 
	@strada = 'Zborului', 
	@nr_strada = 7, 
	@id_localitate = 8, 
	@id_judet = 10, 
	@id_tara = 1, 
	@cod_postal = 30775,
	@id_client = 153, 
	@prenume = 'Valentina', 
	@nume= 'Plavet', 
	@email= 'sundayfunday@yahoo.com', 
	@telefon= '726981102', 
	@data_de_nastere = '1992-12-18', 
	@id_adresa = 143;