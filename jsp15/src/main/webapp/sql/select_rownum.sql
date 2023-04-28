select * from users;

insert into users 
select max(userid)||1, max(username)||1, max(userpassword)||1,
       max(userage)+1, max(useremail)
from users;

commit

/* pseudo 칼럼 */
select rownum, userid 
  from users
 where rownum <= 5;
 
 
select rownum, userid 
  from users
 where rownum > 10
   and rownum < 20;
   
//1.
select rownum, rn, userid
  from
(select rownum rn, userid 
  from users
 where rownum <= 20)
 where rn > 10;/* sub쿼리에서 만든 가상 칼럼을 이용하여 추출 */
 

 //2.
select rownum, rn, userid
  from
(select rownum rn, userid 
  from users)
where rn between 10 and 20;


select rownum, a.*
  from 
(select rownum rn, userid, userage 
  from users
 where userage >=10 and userage <20
 ) a
 where rn > 2 and rn < 7; 

 
 
 
 
 
 

 
 