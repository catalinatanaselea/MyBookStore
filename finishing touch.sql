--update row
update carti.carti3
set id_subcateg = null
where id_carte = 16;

--delete row
delete from carti.carti3
where id_carte is null;

--change data type
ALTER TABLE carti.carti_autor
alter column id_autor smallint null;

--add primary key
alter table carti.carti_autor add primary key (id_carti_autor);

--add foreign key
alter table carti.carti_autor add foreign key(id_autor) references carti.autor(id_autor)

--identify wrong id_author
select id_autor from carti.carti_autor
WHERE id_autor NOT IN
(SELECT id_autor from carti.autor)

--drop foreign key
--1.
alter table comanda.comanda
drop column id

--2.
ALTER TABLE comanda.comanda 
DROP CONSTRAINT PK__comanda__3213E83F403F552B