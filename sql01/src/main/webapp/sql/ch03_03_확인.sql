/* 3-1. */
/* 1) */
select bookname from book where bookid=1;

select bookname from book where price >=20000;

select sum(saleprice) from orders where custid =1;
select count(*) from orders where custid =1;

/* 2. */
select count(*) from book;
select count(distinct publisher) from book;
select name, address from customer; 
select orderid from orders where orderdate between '2020-07-04' and '2020-07-07';
select orderid from orders where orderdate not between '2020-07-04' and '2020-07-07';
select name, address from customer where name like '김%';
select name, address from customer where name like '김%아';