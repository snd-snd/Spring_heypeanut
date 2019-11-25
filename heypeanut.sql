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
constraint pk_product primary key (pno));

create sequence seq_product;
create sequence seq_orders;
create sequence seq_basket;

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
price number,
amount number,
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
bno number,
title varchar2(100),
content varchar2(500),
writer varchar2(100),
regDate date default sysdate,
pno number,
constraint pk_review primary key (bno),
constraint fk_product_r foreign key (pno) references product (pno) on delete cascade);

create sequence seq_review;

drop table members;
drop table product;
drop table orders;
drop table basket;
drop table attach;

select * from members;
select * from orders,product where orders.pno = product.pno;
select * from basket;
select * from product;
select * from attach;

select orders.pno, pname, amount, total, regDate, status from orders, product
		where orders.pno = product.pno and id = 'kim123' order by ono desc;

commit;