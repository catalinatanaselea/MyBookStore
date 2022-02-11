use PersonalDB;
go
drop table if exists carti.editura;
go
create table carti.editura
		(id smallint identity(1,1) primary key not null,
		 editura varchar(50) not null);
go