-- 1. Procedura stocata ce afiseaza cartile comandate sub pretul mediu al cartilor
DROP PROCEDURE IF EXISTS usp_AvgOrderPrice;
GO
CREATE PROCEDURE usp_AvgOrderPrice
AS
BEGIN
BEGIN TRY
BEGIN TRAN 
	SELECT DISTINCT cc.titlu, c.pret
	FROM comanda.comanda AS c
	JOIN carti.carti AS cc
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

--2. Procedura stocata pentru a afla numarul de comenzi plasate de catre un client
DROP PROCEDURE IF EXISTS usp_NoCustOrders;
GO
CREATE PROCEDURE usp_NoCustOrders
	(@a smallint)
AS
begin
BEGIN TRY
BEGIN TRAN 
	SELECT comcl.id_client AS Client, COUNT(DISTINCT numar_comanda) AS NumarComenzi
	FROM comanda.comanda AS com
	JOIN comanda.comanda_client AS comcl
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

--3. Procedura stocata pentru a genera cele mai vandute carti (cantitati)
DROP PROCEDURE IF EXISTS usp_BestSellingBooksQty;
GO
CREATE PROCEDURE usp_BestSellingBooksQty
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT c.titlu AS Titlu, SUM(cant_carti) AS CantComandata
	FROM carti.carti AS c
	JOIN comanda.comanda AS com
		ON c.id = com.id_carte
	GROUP BY c.titlu
	ORDER BY CantComandata DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_BestSellingBooksQty;

--4. Procedura stocata pentru a genera cele mai vandute carti(comenzi individuale)
DROP PROCEDURE IF EXISTS usp_MostOrderedBooks;
GO
CREATE PROCEDURE usp_MostOrderedBooks
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT c.titlu AS Titlu, COUNT(*) AS NumarComenzi
	FROM carti.carti AS c
	JOIN comanda.comanda AS com
		ON c.id = com.id_carte
	GROUP BY c.titlu
	ORDER BY NumarComenzi DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_MostOrderedBooks;

--5. Procedura stocata pentru a genera cele mai vandute carti (cifra generata)
DROP PROCEDURE IF EXISTS usp_BestSellingBooksCA ;
GO
CREATE PROCEDURE usp_BestSellingBooksCA
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT c.titlu AS Titlu, SUM(com.pret) AS CifraGenerata
	FROM carti.carti AS c
	JOIN comanda.comanda AS com
		ON c.id = com.id_carte
	GROUP BY c.titlu
	ORDER BY CifraGenerata DESC;
COMMIT TRAN
END TRY
BEGIN CATCH 
	PRINT ('An error has occured!');
END CATCH
END;
GO
EXECUTE usp_BestSellingBooksCA;

--6. Procedura stocata pentru a afla cei mai vanduti autori
DROP PROCEDURE IF EXISTS usp_BestSellingAuthors;
GO
CREATE PROCEDURE usp_BestSellingAuthors
AS
BEGIN
BEGIN TRY
BEGIN TRAN
	SELECT ISNULL(ca.prenume,'') + ' ' + ISNULL(ca.nume,'') as Autor, COUNT(*) AS NumarComenzi
	FROM carti.autor AS ca
	JOIN carti.carti_autor AS cca
		ON ca.id = cca.id_autor
	JOIN comanda.comanda AS c
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

--7. Procedura stocata pentru a introduce un client nou (cu validari)
DROP PROCEDURE IF EXISTS usp_UplNewCust_NewAddress_NewLoc;
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
AS
BEGIN
BEGIN TRY
	IF EXISTS (SELECT * FROM adresa.localitate WHERE id = @id_loc) 
	BEGIN
		PRINT 'Aceasta localitate exista deja in baza de date!';
		RETURN -1;
	END
	IF EXISTS (SELECT * FROM clienti.adresa WHERE id = @id_adr) 
	BEGIN
		PRINT 'Aceasta adresa exista deja in baza de date!';
		RETURN -1;
	END
	ELSE IF EXISTS (SELECT * FROM clienti.clienti WHERE id = @id_client) 
	BEGIN
		PRINT 'Aceast client exista deja in baza de date!';
		RETURN -1;
	END
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
	@id_loc = 190,
	@localitate = 'Urecheni',
	@id_adr = 150, 
	@strada = 'Zborului', 
	@nr_strada = 7, 
	@id_localitate = 8, 
	@id_judet = 10, 
	@id_tara = 1, 
	@cod_postal = 30775,
	@id_client = 10, 
	@prenume = 'Valentina', 
	@nume= 'Plavet', 
	@email= 'sundayfunday@yahoo.com', 
	@telefon= '726981102', 
	@data_de_nastere = '1992-12-18', 
	@id_adresa = 150;

--8. Procedura stocata pentru a introduce un client nou, cu adresa stocata deja in baza de date
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
AS
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

--9. Procedura stocata pentru a introduce un client nou, cu adresa noua, localitate existenta
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
AS
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