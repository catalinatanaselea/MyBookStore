--update row
update tablename
set columnname = null
where columnname = 16;

--delete row
delete from tablename
where columnname is null;

--change data type
ALTER TABLE tablename
alter column columnname smallint null;

--add primary key
alter table tablename add primary key (columnname);

--add foreign key
alter table tablename add foreign key(columnname) references tablename1(columnname1)

--identify wrong id_author
select id_autor from carti.carti_autor
WHERE id_autor NOT IN
(SELECT id_autor from carti.autor)

--drop foreign key
--1.
alter table tablename
drop column columnname

--2.
ALTER TABLE tablename 
DROP CONSTRAINT PK__comanda__3213E83F403F552B