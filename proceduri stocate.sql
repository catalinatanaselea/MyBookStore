-- procedura stocata ce afiseaza cartile comandate sub pretul mediu al cartilor
create procedure usp_AvgOrderPrice
as
begin
	select distinct cc.titlu_carte, c.pret
	from comanda.comanda c
	join carti.carti cc
		on cc.id = c.id_carte
	where c.pret <
				(select avg(pret)
				from carti.carti)
	order by pret desc
end

execute usp_AvgOrderPrice

--procedura stocata pentru a afla nr de comanzi ale clientilor
create procedure usp_NoCustOrders
	(@a smallint)
as
begin
	select comcl.id_client as Client, count(distinct numar_comanda) as NumarComenzi
	from comanda.comanda com
	join comanda.comanda_client comcl
		on com.id = comcl.id_comanda
	where @a = comcl.id_client
	group by comcl.id_client
	order by NumarComenzi desc
end

execute usp_NoCustOrders 72

--procedura stocata pentru a afla cele mai vandute carti(cant)
create procedure usp_BooksQtyOrderd
as
begin
	select c.titlu_carte as Titlu, sum(cant_carti) as NumarComandat
	from carti.carti c
	join comanda.comanda com
		on c.id = com.id_carte
	group by c.titlu_carte
	order by NumarComandat desc
end

execute usp_BooksQtyOrderd

--procedura stocata pentru a afla cele mai vandute carti(de cate ori a fost comandata)
create procedure usp_BooksTimesOrdered
as
begin
	select c.titlu_carte as Titlu, count(*) as NumarComandat
	from carti.carti c
	join comanda.comanda com
		on c.id = com.id_carte
	group by c.titlu_carte
	order by NumarComandat desc
end

execute usp_BooksTimesOrdered

--procedura stocata pentru a afla cei mai vanduti autori
create procedure usp_BestSellingAuthors
as
begin
	select ca.prenume_autor, ca.nume_autor, count(*) as NumarComenzi
	from carti.autor ca
	join carti.carti_autor cca
		on ca.id = cca.id_autor
	join comanda.comanda c
		on cca.id_carte = c.id_carte
	group by ca.prenume_autor, ca.nume_autor
	order by NumarComenzi desc
end

execute usp_BestSellingAuthors