/* 	DML - INSERT / UPDATE / DELETE */
/* 질의 3-44   Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
 */
insert into book(bookid, bookname, publisher, price)
values((select max(bookid)+1 from book), '스포츠 의학', '한솔의학서적',90000);
commit
select * from book;

/*
 * 질의 3-45   Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 
 *  스포츠 의학은  한솔의학서적에서 출간했으며 가격은 미정이다.
 * 
 */
insert into book(bookid,bookname,publisher) values((select max(bookid)+1 from book),'스포츠 의학2','한솔의학서적');
commit;


/* 기존테이블의 데이타로 신규 테이블 생성 
 * create table 테이블명 as select * from 기존테이블명
 */
create table book_tmp as select * from book;
select * from book_tmp;

commit

/* 기존테이블의 데이타로 신규 테이블 생성 
 * create table 테이블명 as select * from 기존테이블명 where 거짓조건
 */
create table book_tmp2 as select * from book where 1<>1;
commit
select * from book_tmp2;

/* 테이블에 대량 입력 insert into 테이블명 select * from 절~~~ */
insert into book_tmp2 select * from book;
commit
select * from book_tmp2;

/** update 데이타 수정 */
/* 질의 3-47   Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오 */
select * from customer;

update customer
   set address ='대한민국 부산' /* set 칼럼명 = 새값 */
 where custid=5;
 
/* 질의 3-48   Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오. */ 
update customer
   set address =(select address from customer where name='김연아')
 where name ='박세리'
 ;

 select * from customer;
rollback




/* 질의 3-49   Customer 테이블에서 고객번호가 5인 고객을 삭제하시오 */
delete customer where custid=4;

select *from orders where custid=5;

delete customer;






