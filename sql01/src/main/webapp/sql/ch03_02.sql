select bookname,publisher, price
  from book
 where bookname like '%축구%';
 

select count(*) from book where bookname like '%축구%';

/* 가격이 10000원 이상, 20,000원 이하인 도서를 알고 싶다. */
select * 
 from book 
 where price >= 10000 and price <=20000;
 
/* 도서 판매액의 합게를 알고 싶다. -집계함수 sum() */
select sum(saleprice) from orders; 

/* 어느 고객이 얼마나 주문했는지 알고 싶다 .*/
select orderid, orders.custid, name /*원하는 칼럼 추출 -projection*/
  from orders, customer
 where orders.custid = customer.custid/* 조건에 맞는 행 추출 -selection */
 ;
 
 /* 카티션 orders X customer */
 select *
   from orders, customer
 
/* 어느고객이 얼마나 주문했는지 알고 싶다. */   
select custid,sum(saleprice) /* 아래 group by의 기준칼럼 표시가능, sum()*/
  from ORDERS
 group by custid /* 고객 id별 그룹화- group by 그룹기준칼럼 */
 ;
 
 select orders.custid, min(name), sum(saleprice) /* 아래 group by의 기준칼럼 표시가능, sum()*/
  from ORDERS, customer
 where orders.custid = customer.custid
 group by orders.custid /* 고객 id별 그룹화- group by 그룹기준칼럼 */
 order by orders.custid /* 오름차순 */
 ;  
 
  select orders.custid, min(name), sum(saleprice) /* 아래 group by의 기준칼럼 표시가능, sum()*/
  from ORDERS, customer
 where orders.custid = customer.custid
 group by orders.custid /* 고객 id별 그룹화- group by 그룹기준칼럼 */
 order by orders.custid desc /* 오름차순 */
 ;  
     
/* 도서를 주문하지 않은 고객이 있는지 알고 싶다.*/
select *
  from customer
 where  custid not in (select distinct custid from orders);
 
 
   