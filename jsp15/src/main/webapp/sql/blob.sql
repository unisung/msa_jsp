drop table boards;
create table boards(
bno number primary key,
btitle varchar2(50),
bcontent varchar2(4000),
bwriter varchar2(50),
bdate date default sysdate,
bfilename varchar2(100),
bfiledata blob /* binary large object */
);

select bno, btitle,bfilename,bfiledata from boards;