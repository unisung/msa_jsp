CREATE TABLE board (
       num int not null auto_increment,
       id varchar(30) not null,
       name varchar(30) not null,
       subject varchar(100) not null,
       content varchar(1000) not null,
       regist_day varchar(50),
       hit int,
       ip varchar(30),
       primary key(num)
)default charset=utf8;

select * from board;
desc board;
drop table board;
