create table if not exists member(
id varchar(20) not null,
passwd varchar(30),
name varchar(30),
primary key (id)
);

delete from member where id in ('1','2');
commit
insert into member values('1','홍길동','1234');
insert into member values('2','일지매','1111');
commit

select * from member;