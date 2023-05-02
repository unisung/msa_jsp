/*DDL-데이타 정의어 */
/* 테이블 생성 create table 테이블명(칼럼명 저장할 타입)*/
create table abc(
id number,
name varchar2(10)
);
/* 테이블에 칼럼 추가-테이블 구조 변경 alter table 테이블명 추가 옵션 */
alter table abc add  pwd varchar2(10);

/* 테이블 삭제 drop table 테이블명 */
drop table abc;

/* 테이블은 그대로 두고 데이타 삭제 -DDL명령어 */
truncate table abc;

/** 데이타 조작어 DML */
/* insert into 테이블명(칼럼명1,칼러명2,...) values(값1,값2,...) */
insert into abc(id,name) values (1,'홍길동');
insert into abc(id,name) values (2,'일지매');
/* insert into 테이블명 values(값1, 값2) */
insert into abc values(3,'임꺽정');
insert into abc(name,id) values('임꺽정',4);

select * from abc;

/* 데이타 수정 update table set 칼럼=값 */
update abc set name='이순신' where id = 2;
select * from abc;

/* 데이타 삭제 -DML */
delete from abc;

select * from abc;

/* 데이타 처리어 -DCL(DTL) 트랜잭션 관리
 * commit -> db에 반영
 * rollback -> 이전상태로 되돌리기
 * */
rollback

select * from abc;

commit

update abc set name='김길동' where id=1;
commit

select * from abc;

select * from book;

insert into book values (11,'나도 한다 축구','굿스포츠',25000);
insert into book values (12,'나도 축구 좋아해','굿스포츠',19500);
commit



