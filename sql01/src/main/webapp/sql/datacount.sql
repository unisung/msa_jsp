/* 테이블에 입력된 행(튜플,레코드)의 수 확인 count(*) */
select count(*) from BOOK
union all
select count(*) from CUSTOMER
union all
select count(*) from IMPORTED_BOOK
union all
select count(*) from orders;

