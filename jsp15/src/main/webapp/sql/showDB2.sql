/* DML (data -manipulation - language) */
/* insert into 테이블명 values (값1,값2,...);*/
insert into student values(1,'hong','1234');
select * from student;
insert into student values(1,'홍길동','1234');

insert into student(name,passwd) values('홍길순','1234');
insert into student(name,passwd) values('일지매','1235');
insert into student(name,passwd) values('임꺽정','1236');
insert into student(name,passwd) values('이순신','1237');

commit
select * from student
/* 조회한 결과 3개만 추출 limit 갯수 */
select * from student limit 3;
select * from student where id=2;

select * from student order by id desc limit 3 ;

/* update 테이블 set 칼럼명 = 값 where 조건 */
update student set name='관리자' where name='홍길동';
commit

select * from student; 

/* 삭제 - delete from 테이블명 where 조건 */
delete from student where id=5;
commit
select * from student;

