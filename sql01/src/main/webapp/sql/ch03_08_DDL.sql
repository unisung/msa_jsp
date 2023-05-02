/* alter 테이블 */
/* 질의 3-37   NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가하시오 */
alter table newbook add isbn varchar2(13);
/* 질의 3-38   NewBook 테이블의 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오 */
alter table newbook modify isbn number;
/* 질의 3-39   NewBook 테이블의 isbn 속성을 삭제하시오 */
alter table newbook drop column isbn;
/* 질의 3-40   NewBook 테이블의 bookname 속성에 NOT NULL 제약조건을 적용하시오  */
alter table newbook modify bookname not null;
/* 질의 3-41   NewBook 테이블의 bookid 속성을 기본키로 변경하시오 */
alter table newbook add primary key (bookid);


/**/
select * from newcustomer;
select * from neworders;
insert into neworders select * from orders where custid <> 4;
commit
/* ORA-02449: unique/primary keys in table referenced by foreign keys
(0 rows affected) */
drop table newcustomer;

alter table neworders drop constraint sys_c007018;

alter table neworders2 drop constraint sys_c007022;

drop table newcustomer;


