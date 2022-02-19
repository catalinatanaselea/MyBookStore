--Update row
update tablename
set columnname = null
where columnname = 16;

--Delete row
delete from tablename
where columnname is null;

--Change data type
ALTER TABLE tablename
alter column columnname smallint null;

--Add primary key
alter table tablename add primary key (columnname);

--Add foreign key
alter table tablename add foreign key(columnname) references tablename1(columnname1)