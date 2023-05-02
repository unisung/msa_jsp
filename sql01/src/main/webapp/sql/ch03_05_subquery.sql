/* 조인 - 두개 이상의 테이블을 엮어서 추출 하는 방식 */
/* 3-21. 고객과 고객의 주문에 관한 데이터를 모두 보이시오. */
select *
  from customer, orders
 where customer.custid = orders.custid;
 
/* 3-22. 고객과 고객의 주문에 관한 데이타 고객번호 순으로 정렬 */
 select *
   from customer, orders
  where customer.custid = orders.custid
  order by orders.custid;
 
/* 3-23. 고객의 이름과 고객이 주문한 도서의 판매가격 검색 */
select name, saleprice
  from customer, orders
 where customer.custid = orders.custid
 ;
select name, saleprice
  from customer, orders
 where customer.custid = orders.custid
 order by customer.custid
 ;
 
/* 3-25. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오. */
select book.bookname,customer.name 
  from orders,book,customer
 where ORDERS.CUSTID = CUSTOMER.custid
   and ORDERS.BOOKID = BOOK.BOOKID
;   
 
/* 3-26. 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름 구하시오. */
select customer.name, book.bookname
  from customer, orders,book
 where ORDERS.CUSTID = CUSTOMER.custid
   and ORDERS.BOOKID = BOOK.BOOKID
   and saleprice >=20000
   
/* outer 조인 */   
/* 3-27. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시요. */
 select customer.name, saleprice
  from customer, orders
 where ORDERS.CUSTID(+) = CUSTOMER.custid/* 고객테이블 데이타 모두 나옴, = 조건에 맞지않으면 null로 표시 */
 ;
/* ANSI 표준 조인 */ 
select customer.name, saleprice
  from customer left outer join orders on customer.custid=orders.custid
 ; 
   
select * from customer   

/* SUB 쿼리 */
/*3-28. 가장 비싼 도서의 이름 */
select max(price) from book; 
select bookname from book where price = 35000;
/* 두번의 쿼리실행을 하나로 합쳐서 실행 */
select bookname from book
 where price =(select max(price) from book);
 
/* 3-29. 도서를 구매한 적이 잇는 고객의 이름 */ 
select distinct custid from orders;
select name from customer where custid in (1,2,4,3);
/* 두번의 쿼리실행을 하나로 합쳐서 실행 */
select name from customer where custid in (select distinct custid from orders);

/* 3-30. 대한 미디어에서 출판한 도서를 구매한 고객의 이름 검색 */
select * from book where publisher ='대한미디어'; /* 3, 4*/
select * from orders where bookid in (3,4); /* 1*/
select name from customer where custid =1;

select name 
  from customer 
 where custid =(select custid 
                  from orders 
                 where bookid in (select bookid 
                                    from book 
                                   where publisher ='대한미디어'));
                                   
/* 3-31. 상관 부속 질의 -
 * 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오. */
select b1.bookname, b1.price
  from book b1 /* 테이블명 별칭 */
 where b1.price > (select avg(b2.price) 
                     from book  b2
                    where b1.publisher = b2.publisher);
                                   
   
   
select * 
  from orders o, customer c, book b
 where o.custid = c.custid
   and o.bookid = b.bookid
  ;
   
  
  
   
 