show user;
-- USER이(가) "SYS"입니다.

create user jspbegin_user identified by cclass;

grant connect, resource, create view, unlimited tablespace to jspbegin_user;

show user;
-- USER이(가) "JSPBEGIN_USER"입니다.

create table tbl_person_interest
(seq            number
,name           varchar2(20)
,school         varchar2(20)
,color          varchar2(20)
,food           varchar2(80)
,registerday    date default sysdate
,constraint PK_tbl_person_interest primary key(seq)
);

create sequence person_seq 
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

select *
from tbl_person_interest
order by seq;

drop table tbl_person_interest;
drop sequence person_seq;

String sql = "update tbl_person_interest \n"+
"set name = ?,\n"+
"    school = ?,\n"+
"    color = ?,\n"+
"    food = ?\n"+
"where seq = ?";
