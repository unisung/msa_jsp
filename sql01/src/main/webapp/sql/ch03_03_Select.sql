/* 모든 도서의 판매가격 추출 */
select bookname, price
  from BOOK
 ;
 select price, bookname
  from BOOK
 ; 
 /* 모든 도서의 도서번호, 도서이름, 출판사, 가격 */
 select bookid,BOOKNAME, PUBLISHER, PRICE
  FROM BOOK;

/* wildcard 문자 * - 모든 칼럼 */  
select *
  from book;

 /* 도서테이블의 모든 출판사 검색 */
  /*중복된 데이타 추출 */
select all publisher
 from book;
/* 중복제거 distinct */
select distinct publisher
  from book;
  
/* 가격이 20000원 미만인 도서 */  
select *
  from book
 where price < 20000;
 
/* 가격이 10000원 이상 20000원 이하인 도서 검색 */ 
select *
  from book
 where price >=10000 and price <=20000;
 
/* between A and B */
select *
  from book
 where price between 10000 and 20000;
 
select * from orders; 
 
 /* 구매이력에서 구매일자가 2020년 7월3일부터 7월 7일사이의 이력검색 */
select *
  from orders
 where orderdate >='2020-07-03' and orderdate <='2020-07-07';
 
select *
  from orders
 where orderdate  between '2020-07-03' and '2020-07-07';
 
 
/*3-6. 출판사가 '굿스포츠' 혹은 '대한미디어' 인 도서 출력 */  
select *
  from BOOK
 where publisher = '굿스포츠' or publisher ='대한미디어';

 /* in 을 대체 */
select *
  from book
 where publisher in ('굿스포츠','대한미디어');
 
/*3-6-2. 출판사가 '굿스포츠' 혹은 '대한미디어' 가 아닌 도서 출력 */  
select *
  from book
 where publisher <> '굿스포츠' and publisher <> '대한미디어';
 /* not in 을 대체 */
select *
  from book
 where publisher not in ('굿스포츠','대한미디어');
 
/*패턴 조회 */
/*3-7. '축구의 역사'를 출간한 출판사 검색 */
select bookname, publisher
  from book
 where bookname like '축구의 역사';
 
/* 3-8. 도서 이름 중에 '축구'가 포함된 출판사를 검색 */ 
select bookname, publisher
  from book
 where bookname like '%축구%';/* %는 길이가 0 ~ 무한대 */

 /* _는 길이가 무조건 1인 단어를 의미 */
select bookname, publisher
  from book
 where bookname like '_구%';/* _는 길이가 무조건 1 */ 
 
select bookname, publisher
  from book
 where bookname like '축구____';
 
 /* 3-10, 축구에 관한 도서 중 가격이 20000원 이상인 도서 검색 */
select *
  from book
 where bookname like '%축구%' and price >=20000;
/*3-11. 출판사가 '굿스포츠' 혹은 '대한 미디어'인 도서 */
 select *
   from book
  where publisher ='굿스포츠' or publisher ='대한미디어';
 
/* 검색결과 정렬 숫자, 영대문자, 소문자, 한글 순 */
select *
  from book
 order by bookname;/* 정렬 기준 bookname */
 
/* 두가지 이상 정렬 조건 */ 
/* 가격의 오름차순, 가격이 동일하면 도서명을 오름차순으로 정렬 */
 select *
 from book
 order by price asc, bookname asc;/* 첫번째기준, 두번째기준,.... */
 
 
/* 두가지 이상 정렬 조건 */ 
/* 가격의 오름차순, 가격이 동일하면 도서명을 내림차순으로 정렬 */ 
select *
 from book
 order by price asc, bookname desc;/* 첫번째기준, 두번째기준,.... */
 

 
 
 
 
 
 
 
  