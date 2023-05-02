/* 집합-set*/
/*3-32. 도서를 주문하지 않은 고개의 이름
 * A - B */
/* A={'박지성','김연아','장미란','추신수', '박세리' } */
select name
  from customer
  
  minus

  /* B={'박지성','김연아','장미란','추신수'} */
select name
  from customer
 where custid in (select distinct custid from orders);
 
/* 합집합 */ 
/* A={'박지성','김연아','장미란','추신수', '박세리' } */
select name
  from customer
  
  union

  /* B={'박지성','김연아','장미란','추신수'} */
select name
  from customer
 where custid in (select distinct custid from orders);

 
 /* 교집합 */ 
/* A={'박지성','김연아','장미란','추신수', '박세리' } */
select name
  from customer
  
  intersect

  /* B={'박지성','김연아','장미란','추신수'} */
select name
  from customer
 where custid in (select distinct custid from orders);
 
 
/* A집합과 B집합 + 교집합포함  */ 
/* A={'박지성','김연아','장미란','추신수', '박세리' } */
select name
  from customer
  
  union all /* 중복 데이타 */

  /* B={'박지성','김연아','장미란','추신수'} */
select name
  from customer
 where custid in (select distinct custid from orders)
 order by name;
 
 /*주의 사항 */
/* ORA-01790: expression must have same datatype as corresponding expression  */ 
select name from customer
union
select custid from customer;
/* 집합연산자를 사용시는 같은 순서의 칼럼타입이 같아야 함. */
select name from customer
union
select ''||custid from customer;
 

/* 3-33. 주문이 있는 고객의 이름과 주소를 보이시오. */
/* 부속질의(sub-query)의 어떤행이 조건에 만족하며 참. */
/* 구매이력있는 고객들 */
select name, address
  from customer cs
 where exists (select * from orders od where cs.custid = od.custid)
 ;
/* 구매이력이 없는 고객들 */
 select name, address
  from customer cs
 where not exists (select * from orders od where cs.custid = od.custid)
 ;
 
 

 /* sql에서 메세지 출력 select 메세지 from 테이블명 */
 select 1+2 from dual;
 select 5/4, 5*4, 5-4 from dual;
 select '오늘 날짜',sysdate from dual;
 
 select bookid,bookname, price from book;
 select bookid,saleprice from orders;
 select b.bookid id, saleprice "판매가격", price "단가", price-saleprice "차액" 
   from book b, orders o
  where b.bookid = o.bookid 
 ; 


/*확인문제.*/
/* (5) 박지성이 구매한 도서의 출판사 수 */
select count(distinct publisher)
  from book
 where bookid in (select bookid 
		            from orders 
		           where custid = (select custid 
		                             from customer where name='박지성'));
/*(6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
select o.bookid as "아이디", bookname as "도서 명", saleprice "판매가", price 정가, price - saleprice "차액"
  from orders o, book b 
 where o.custid = (select custid 
                   from customer where name='박지성')
   and o.bookid = b.bookid 
/*(7) 박지성이 구매하지 않은 도서의 이름*/
select bookname 
  from book b1
 where not exists (select bookname 
         from customer c, orders o
        where c.custid = o.custid
          and o.bookid = b1.bookid
          and c.name like '박지성%')
;

select bookname from book b1
minus
select bookname from customer c, orders o, book b
 where c.custid = o.custid and o.bookid = b.bookid
  and c.name like '박지성%'
  ;
  
  
select bookname, count(*)
 from 
(select a.bookname bookname
from 
		(select bookname 
		  from book b1
		 where not exists (select bookname 
		         from customer c, orders o
		        where c.custid = o.custid
		          and o.bookid = b1.bookid
		          and c.name like '박지성%')
		) a 

union all

select b.bookname  bookname
		 from 
		(select bookname from book b1
		minus
		select bookname from customer c, orders o, book b
		 where c.custid = o.custid and o.bookid = b.bookid
		  and c.name like '박지성%'
		)b
)
  
group by bookname
;






 
 
 
 