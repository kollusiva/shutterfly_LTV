DROP TABLE CUSTOMER;
DROP TABLE SITE_VISIT;
DROP TABLE ORDER_TBL;
DROP TABLE my_temp_table;

CREATE TABLE CUSTOMER
(
type VARCHAR2(50),
verb VARCHAR2(50),
customer_id VARCHAR2(50),
event_time timestamp,
last_name VARCHAR2(50),
adr_city VARCHAR2(50),
adr_state VARCHAR2(2),
CONSTRAINT cust_id_pk PRIMARY KEY (customer_id)
);

   
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f42', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'Smith', 'Middletown', 'CA');
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f43', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'John', 'Smith', 'CA');
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f44', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'User4', 'Plano', 'TX');
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f45', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'User5', 'New York', 'NY');
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f46', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'User6', 'Portland', 'OR');
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f47', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'User7', 'Middletown', 'AK');
insert into CUSTOMER values ('CUSTOMER', 'NEW', '96f55c7d8f49', TO_TIMESTAMP('2018-01-06 12:46:46.384','YYYY-MM-DD hh24:mi:ss.FF'), 'User8', 'Middletown', 'AK');


CREATE TABLE SITE_VISIT
(
type VARCHAR2(50),
verb VARCHAR2(50),
page_id VARCHAR2(50),
event_time timestamp,
customer_id VARCHAR2(50),
tags VARCHAR2(50),
CONSTRAINT page_id_pk PRIMARY KEY (page_id),
CONSTRAINT cust_id_fk FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
);


insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815502f', TO_TIMESTAMP('2018-01-06 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f42', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815503f', TO_TIMESTAMP('2018-01-11 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f42', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815504f', TO_TIMESTAMP('2018-07-03 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f42', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815505f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f42', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815506f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f43', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815507f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f44', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815508f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f45', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815509f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f46', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815510f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f47', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815511f', TO_TIMESTAMP('2018-05-12 12:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f48', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815512f', TO_TIMESTAMP('2015-05-12 10:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f43', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815513f', TO_TIMESTAMP('2018-04-12 00:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f44', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815514f', TO_TIMESTAMP('2018-04-12 00:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f45', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815515f', TO_TIMESTAMP('2018-03-12 00:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f46', 'some value');
insert into SITE_VISIT values('SITE_VISIT', 'NEW', 'ac05e815516f', TO_TIMESTAMP('2018-02-12 00:45:52.041','YYYY-MM-DD hh24:mi:ss.FF'),'96f55c7d8f47', 'some value');


CREATE TABLE ORDER_TBL
(
type VARCHAR2(50),
verb VARCHAR2(50),
order_id VARCHAR2(50),
event_time timestamp,
customer_id VARCHAR2(50),
total_amount float,
CONSTRAINT order_id_pk PRIMARY KEY (order_id),
CONSTRAINT order_id_fk FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
);
 
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a43', TO_TIMESTAMP('2018-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f42', '12.34');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a44', TO_TIMESTAMP('2018-02-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f43', '110.56');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a45', TO_TIMESTAMP('2017-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f44', '190.45');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a46', TO_TIMESTAMP('2016-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f45', '320.35');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a47', TO_TIMESTAMP('2018-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f44', '280.74');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a48', TO_TIMESTAMP('2018-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f46', '72.00');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a49', TO_TIMESTAMP('2018-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f48', '17.23');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a50', TO_TIMESTAMP('2018-02-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f48', '199.34');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a51', TO_TIMESTAMP('2017-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f42', '10.34');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a52', TO_TIMESTAMP('2017-01-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f47', '10.34');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a53', TO_TIMESTAMP('2016-12-06 12:55:55.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f47', '100.34');
insert into ORDER_TBL values('ORDER', 'NEW', '68d84e5d1a54', TO_TIMESTAMP('2016-11-06 10:30:50.555','YYYY-MM-DD hh24:mi:ss.FF'), '96f55c7d8f47', '340.34');


--select * from CUSTOMER;
--select * from SITE_VISIT;
--select * from ORDER_TBL;


CREATE GLOBAL TEMPORARY TABLE my_temp_table
(customer_id varchar(50)
, total_weeks float);


insert into my_temp_table
select 
  customer_id,
  (extract(day from date_diff) *24*60 
        + extract(hour from date_diff)  *60
        + extract( minute from date_diff ) 
        + round(extract( second from date_diff )) / 60) / 60 / 24 / 7  as total_weeks
FROM ( 
      select 
        customer_id, 
        max(event_time) - min(event_time) date_diff  
      from site_visit group by customer_id 
      ) site1
;

select 
a.customer_id
,b.total_sales
,round(a.total_weeks, 4) total_tenure_weeks
,round((b.total_sales / a.total_weeks),4) as ltv
from my_temp_table a
left join 
(
select 
  ord.customer_id,
  sum(ord.TOTAL_AMOUNT) total_sales
from order_tbl ord
left join my_temp_table site
on ord.customer_id = site.customer_id
group by ord.customer_id
) b
on a.CUSTOMER_ID = b.customer_id
order by ltv desc;








