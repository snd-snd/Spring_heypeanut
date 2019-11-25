create table members(
id varchar2(100),
name varchar2(100),
password varchar2(100),
email varchar2(100),
phone varchar2(100),
postcode varchar2(100),
roadAddress varchar2(100),
jibunAddress varchar2(100),
detailAddress varchar2(100),
regDate date default sysdate,
constraint pk_members primary key (id));

create table product(
pno number,
category varchar2(100),
pname varchar2(100),
price number,
score number default 0,
weekCount number default 0,
constraint pk_product primary key (pno));

create sequence seq_product;
create sequence seq_orders;

create table orders(
ono number,
id varchar2(100),
pno number,
amount number,
total number,
regDate date default sysdate,
status number default 0,
constraint pk_orders primary key (ono),
constraint fk_members_o foreign key (id) references members (id) on delete cascade,
constraint fk_product_o foreign key (pno) references product (pno) on delete cascade);

create table basket(
bno number,
id varchar2(100),
pno number,
amount number,
price number,
regDate date default sysdate,
constraint pk_basket primary key (bno),
constraint fk_members_b foreign key (id) references members (id) on delete cascade,
constraint fk_product_b foreign key (pno) references product (pno) on delete cascade);

create table attach(
uploadPath varchar2(200) not null,
uuid varchar2(100) not null,
fileName varchar2(100) not null,
pno number,
constraint fk_product_a foreign key (pno) references product (pno) on delete cascade);

create table review(
rno number,
title varchar2(100),
content varchar2(500),
writer varchar2(100),
regDate date default sysdate,
score number,
pno number,
constraint pk_review primary key (rno),
constraint fk_members_r foreign key (writer) references members (id) on delete cascade,
constraint fk_product_r foreign key (pno) references product (pno) on delete cascade);

create sequence seq_review;

create table qna(
qno number,
title varchar2(100),
content varchar2(2000),
writer varchar2(100),
regDate date default sysdate,
hit number default 0,
constraint pk_qna primary key (qno),
constraint fk_members_q foreign key (writer) references members (id) on delete cascade);

create sequence seq_qna;

drop table members;
drop table product;
drop table orders;
drop table basket;
drop table attach;
drop table review;
drop table qna;

select * from members;
select * from orders;
select * from basket;
select * from product;
select * from attach;
select * from review;
select * from qna;

select * from review, members where review.writer = members.id;

insert into review (rno, title, content, writer, score, pno)
select seq_review.nextVal, title, content, writer, score, pno
from review;

commit;

select pno, category, pname, price from
(select pno, category, pname, price from product order by pno desc)
where rownum <= 4;

alter table product add score number default 0;
alter table product add weekCount number default 0;

insert into qna (qno, title, content, writer)
select seq_qna.nextVal, title, content, writer
from qna;
