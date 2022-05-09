create table T(ID int primary key auto_increment, c int);

insert into T(c) values (1), (2),(3);

update T set c=c+1 where ID=2;