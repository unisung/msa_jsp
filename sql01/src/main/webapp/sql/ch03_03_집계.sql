/* 집계 함수 */
/* 3-15. 고객이 주문한 도서의 총 판매액 */
select sum(saleprice)
  from orders;

  /* 칼럼 별칭 칼럼명 as "별칭" */
select sum(saleprice) as 총매출
  from orders;
/* 별칭명에 공백이 있을때는 ""로 묶기 */  
select sum(saleprice) as "총 매출"
  from orders;
/* as 생략가능 */  
select sum(saleprice) "총 매출"
  from orders;  

 /* 3-16. 2번고객의 주문 도서의 총 판매액 */
select sum(saleprice) as "김연아의 구매액"
  from orders
 where custid =2;
 
/* 3-17. 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가 */ 
select sum(saleprice) total, avg(saleprice) avgprice, 
       min(saleprice) minimum, max(saleprice) maximum
  from orders;
  
/* 3-17-2. 도서 출판사의 갯수 검색 */
select count(distinct publisher) from book;  

/* 3-17-3. 도서테이블에 신규 도서 등록 */
select * from book;
select max(bookid) + 1 from book;
insert into book values((select max(bookid) + 1 from book),'축구는 지겨워','굿스포트',20000);  
commit  
select * from book;

/* 3-18. 고객별 주문한 도서의 총 수량과 판매액 */
select custid, count(*)  도서수량, sum(saleprice) 총액
  from orders
 group by custid
 order by custid
 ;
 
/* 3-20. 가격이 8000원 이상인 도서 구매 고객 중 두권이상 구매한 고객의 총 수량 */
select custid, count(*) as 도서수량
  from orders
 where saleprice >=8000  /* 1*/
 group by custid         /* 2*/
 having count(*) >=2     /* 3*/
 order by custid         /* 4*/
 ;
 
 
 
 
 
 
 
 

