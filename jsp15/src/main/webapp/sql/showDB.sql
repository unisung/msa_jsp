show databases;

/* 데이타 타입 (int - number, varchar - varchar2)
 * auto_increment(mysql), x(oracle)- sequence(오라클) */
/* DDL - create table 테이블명(칼럼 데이타 타입,,,,); */
drop table member;
drop table student;

create table member(
id int not null auto_increment,
name varchar(100) not null,
passwd varchar(50) not null,
primary key (id)
)engine=innodb default charset=utf8;

/* 테이블에 칼럼 추가하기(변경) - alter table 테이블명 add 칼럼명 타입 */
alter table member add phone varchar(100);

/* 테이블에서 칼럼 삭제하기 (변경) - alter table 테이블명 drop column 칼럼명 */
alter table member drop column phone;
/* 칼럼의 길이 변경 change column 기존명 바꿀명 타입 */
alter table member change column passwd password varchar(60);

/* 테이블명 변경하기  rename table 기존 to 변경 */
rename table member to student;