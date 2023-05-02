/* 테이블 만들기 */
/*테이블명	newbook			
순번	칼럼명	타입	주키여부	설명
1	bookid	number	Y	도서번호
2	bookname	varchar2(20)		도서이름
3	publisher	varchar2(20)		출판사
4	price	number		가격
*/
/* create table 테이블명 (속성명 타입 제약조건,)*/
/* 숫자 number, 문자 char혹은 varchar2, 날자 date */
create table newbook(
bookid number primary key,
bookname varchar(20), /* varchar로 선언하면 varchar2로 변경됨 */
publisher varchar2(20),
price number
);

create table newbook1(
bookid number,
bookname varchar(20), /* varchar로 선언하면 varchar2로 변경됨 */
publisher varchar2(20),
price number,
primary key (bookid)
);

create table newbook2(
bookid number,
bookname varchar(20), /* varchar로 선언하면 varchar2로 변경됨 */
publisher varchar2(20),
price number,
primary key (bookid, bookname)
);

/* bookname은 null값을 가질 수 없고(not null), publisher는 같은 값이 있으면 안된다.(unique)
 * price에 값이 입력되지 않은 경우 기본값 10000을 저장, 또는 가격은 최소 1,000원 이상으로 한다.
 * */
create table newbook3(
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price > 1000),
primary key (bookname,publisher)
);

/* ORA-02290: check constraint (MADANG.SYS_C007011) violated
(0 rows affected)*/
insert into newbook3(bookname, publisher, price) values('축구의 역사','다음미디어',1500);
insert into newbook3(bookname, publisher) values('축구의 역사','다음미디어2');
select * from newbook3;
commit
/* 
ORA-00001: unique constraint (MADANG.SYS_C007013) violated */
insert into newbook3(bookname, publisher) values('나도 축구한다','다음미디어3');
/* ORA-01400: cannot insert NULL into ("MADANG"."NEWBOOK3"."BOOKNAME")
(0 rows affected)
 */
insert into newbook3(bookname, publisher,price) values('축구 아무나','다음미디어4',5000);
/* 
ORA-01400: cannot insert NULL into ("MADANG"."NEWBOOK3"."PUBLISHER")  unique제약조건은 not null도 체크*/
insert into newbook3(bookname, price) values('축구 아무나2',5000);


/* 3-5. 질의 3-35   다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오
 	 custid(고객번호) 	- NUMBER, 기본키
	 name(이름) 	– VARCHAR2(40)
	 address(주소) 	– VARCHAR2(40)
	 phone(전화번호) 	– VARCHAR2(30)
 */
create table newcustomer(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(30)
);

/*질의 3-36   다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오.
 orderid(주문번호) - NUMBER, 기본키
 custid(고객번호) - NUMBER, NOT NULL 제약조건, 외래키(NewCustomer.custid, 연쇄삭제)
 bookid(도서번호) - NUMBER, NOT NULL 제약조건
 saleprice(판매가격) - NUMBER 
 orderdate(판매일자) - DATE
 */
create table neworders(
orderid NUMBER primary key,/* 주 키 not null + unique */
 custid  NUMBER  NOT NULL,
 bookid  NUMBER NOT NULL,
 saleprice  NUMBER, 
 orderdate DATE default sysdate,/* 현재시점의 날짜가 기본 값 */
 foreign key(custid) references newcustomer(custid) on delete cascade/* 연쇄삭제 */
);
/* bulk 입력 기존테이블의 select결과를 테이블에 삽입 insert into 테이블 select  * from 기존 테이블 */
insert into newcustomer select * from customer;
commit;
select * from newcustomer;
select * from neworders;
/* ORA-02291: integrity constraint (MADANG.SYS_C007018) violated - parent key not found
(0 rows affected) */
insert into neworders(orderid, custid, bookid,saleprice) values (1, 5, 1, 5000);
insert into neworders(orderid, custid, bookid,saleprice) values (2, 4, 3, 5000);

delete from newcustomer where custid=1;
select * from newcustomer;
delete from newcustomer where custid=4;
select * from newcustomer;
select * from neworders;
delete from newcustomer where custid=5;
select * from neworders;

/* */
create table neworders2(
orderid NUMBER primary key,/* 주 키 not null + unique */
 custid  NUMBER  NOT NULL,
 bookid  NUMBER NOT NULL,
 saleprice  NUMBER, 
 orderdate DATE default sysdate,/* 현재시점의 날짜가 기본 값 */
 foreign key(custid) references newcustomer(custid) on delete set null/* 연쇄삭제 */
);

insert into newcustomer select * from customer where custid in (1,4,5);
commit
select * from newcustomer;

insert into neworders2(orderid, custid, bookid,saleprice) values (1, 5, 1, 5000);
insert into neworders2(orderid, custid, bookid,saleprice) values (2, 4, 3, 5000);

select * from neworders2;
delete from newcustomer where custid=4;
/* 

ORA-01407: cannot update ("MADANG"."NEWORDERS2"."CUSTID") to NULL
(0 rows affected) */

select * from newcustomer;
alter table neworders2 modify custid  NUMBER null;

select * from neworders2;



create table newcustomer9(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(30)
);

create table neworders9(
orderid NUMBER primary key,/* 주 키 not null + unique */
 custid  NUMBER  NOT NULL,
 bookid  NUMBER NOT NULL,
 saleprice  NUMBER, 
 orderdate DATE default sysdate,/* 현재시점의 날짜가 기본 값 */
 foreign key(custid) references newcustomer9(custid) on delete set null/* 연쇄삭제 */
);

insert into newcustomer9 select * from customer;
select * from newcustomer9;

insert into neworders9 select * from orders where custid in (select custid from newcustomer9);

select * from neworders9;
/* 

ORA-02449: unique/primary keys in table referenced by foreign keys
(0 rows affected)
 */
drop table  newcustomer9;

truncate table neworders9;

commit;











