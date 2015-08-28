

create table person(
  id integer primary key,
  first_name varchar(50),
  last_name varchar(50),
  age integer,
  heightInctms integer,
  roll_no integer
  );
  drop table person;
  
  CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INTEGER
   
);

CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    breed VARCHAR(50),
    age INTEGER,
    dead INTEGER
);

CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);


create table car(
  id integer primary key,
  model varchar(50),
  make varchar(50),
  year integer
  );
  
create table person_car(
  person_id integer,
  car_id integer
  );
  
INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, 'Dave', 'Wolfe', 25);

INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, 'Fluffy', 'Unicorn', 1000, 0);

INSERT INTO pet VALUES (1, 'Gigantor', 'Robot', 1, 1);

select * from person;
select * from pet;

insert into person values(2,'Nisha','Jeffrey',35);
insert into pet values(3,'Lucky','Labrador',12,1);
insert into person_pet values(0,0);
insert into person_pet values(2,3);
insert into person_pet values(0,1);
select* from person_pet;
insert into person_pet values (2,0);
select * from person_pet;
update person_pet
set OWN_STATUS=1;
update person_pet
set OWN_STATUS=0
where PERSON_ID=0 and pet_id=0;
select * from person_pet;
insert into person values(3,'Cheryl','Jeffrey',15);
insert into person values(4,'Steven','Jeffrey',10);

insert into person_pet values (3,3,1);
insert into person_pet values (4,3,1);

select * from pet
where AGE>10;

select * from person 
where AGE<35;

select * from person
where AGE>35;

select * from person
where FIRST_NAME='Dave' AND AGE>30;

select name,breed,age from pet
where age<15 or name='Fluffy';

SELECT pet.id, pet.name, pet.age, pet.dead
    FROM pet, person_pet, person
    WHERE
    pet.id = person_pet.pet_id AND
    person_pet.person_id = person.id AND
    person.id = 2;

update pet
set dead=0
where name='Lucky';
/* make sure there's dead pets */
SELECT name, age FROM pet WHERE dead = 1;

/* aww poor robot */
DELETE FROM pet WHERE dead = 1;

/* make sure the robot is gone */
SELECT * FROM pet;

/* let's resurrect the robot */
INSERT INTO pet VALUES (1, 'Gigantor', 'Robot',1, 0);

/* the robot LIVES! */
SELECT * FROM pet;

delete from pet where name ='Lucky';
select * from pet;

insert into pet values(3,'Lucky','Labrador',12,0);
select * from pet;
drop table customer;
drop table transaction;

create table Customer(
  accc_num integer primary key,
  name varchar(50),
  balance integer
  );
  create table Transaction(
    transaction_id integer primary key,
    trans_type varchar(50),
    trans_date date,
    amount integer,
    acc_num integer
    );
   drop table customer;
   drop table transaction;
   
   
   create table Customer(
   accc_num Number(4,0) primary key,
   fname varchar(30),
   lname varchar(30),  
   balance Number(10,4)
  );
   
   create table Transaction(
    transaction_id Number(4,0) primary key,
    trans_type Number(4,0),
    trans_date date,
    amount Number(10,4),
    acc_num Number(4,0)
    );
    
    create table TransType(
    type_id Number(4,0)primary key,
    trans_type varchar(30)
    );
    
    
    create table EvilCorpCustomer(
    Name varchar(30),
    Start_bal Number(10,4),
    acc_type varchar(30),
    acc_num number(4,0)primary key
    );
   
    
    insert into EvilCorpCustomer values('Barney',1000,'Checking',77);
    insert into EvilCorpCustomer values('Charizard',1200,'Checking',81);
    insert into EvilCorpCustomer values('Super Saiyan',200000,'Checking',18);
    insert into EvilCorpCustomer values('Oscar the Grouch',.93,'Checking',30);
    insert into EvilCorpCustomer values('Nisha',100.77,'Checking',15);
    insert into EvilCorpCustomer values('Jeffrey',1500,'Checking',50);
    insert into EvilCorpCustomer values('Himanshu',5000.55,'Checking',65);
    
   
    
    
    create table EvilCorpTrans(
    trans_id Number(4,0) primary key,
    user_id Number(4,0),
    amount Number(10,4),
    trans_date date
    );
    insert into EvilCorpTrans values(1,30,-34,to_date('08/01/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(2,81,1200,to_date('08/02/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(3,30,-45,to_date('08/02/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(4,18,.12,to_date('08/03/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(5,30,-.05,to_date('08/03/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(6,15,-12,to_date('08/04/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(7,50,233,to_date('08/03/2015','mm/dd/yyyy'));
    insert into EvilCorpTrans values(8,65,-250,to_date('08/03/2015','mm/dd/yyyy'));
    select* from EvilCorpCustomer;
    select * from EvilCorpTrans;
  --Question 1  
    select *
    from evilcorpcustomer,evilcorptrans
    where evilcorptrans.USER_ID=evilcorpcustomer.ACC_NUM and evilcorptrans.USER_ID=30;
   --Question 2
   --the below sql will give the user_id and total amount in transactions for each as TOTAL
   select user_id,sum(amount) as total
   from EVILCORPTRANS
   group by user_id;
  --Now I am nesting the above sub-query into the below query to do a join to give the desired report
   select name,acc_num,start_bal+total as balance
   from EVILCORPCUSTOMER,(
   select user_id,sum(amount) as total
   from EVILCORPTRANS
   group by user_id)
   where acc_num=user_id;
  --using left outer join to display user_id 77 
   select name,acc_num,start_bal+total as balance
   from EVILCORPCUSTOMER left outer join(
   select user_id,sum(amount) as total
   from EVILCORPTRANS
   group by user_id)
   on acc_num=user_id;
    
   drop table EVilCorpCustomer;
   
    create table EvilCorpCustomer(
    acc_num number(4,0)primary key,
    Name varchar(30),
    Start_bal Number(15,4),      
    birthday DATE
    );
    insert into EvilCorpCustomer values(1003,' Carmen Sandiego', 1000 ,to_date('07/04/1990','mm/dd/yyyy'));
     insert into EvilCorpCustomer values(3213,' Wally', 1000 ,to_date('06/03/1999','mm/dd/yyyy'));
      insert into EvilCorpCustomer values(4213,' Roofus', 5 ,to_date('07/10/2007','mm/dd/yyyy'));
       insert into EvilCorpCustomer values(4221,' Gallant', 5 ,to_date('07/11/2007','mm/dd/yyyy'));
        insert into EvilCorpCustomer values(8934,' Min Mei', 100000 ,to_date('01/01/1978','mm/dd/yyyy'));
        insert into EvilCorpCustomer values(1001,' Pikachu', 1 ,to_date('05/26/1997','mm/dd/yyyy'));
         insert into EvilCorpCustomer values(7779,' Littlefoot', -5 ,to_date('01/01/1901','mm/dd/yyyy'));
          insert into EvilCorpCustomer values(8675,' Kora, Legend of ', 200 ,to_date('01/02/2050','mm/dd/yyyy'));
       insert into EvilCorpCustomer values(6660,' Walter White ', 10000000 ,to_date('11/13/1960','mm/dd/yyyy'));
       insert into EvilCorpCustomer values(5555,' Nisha Jeffrey ', 1000 ,to_date('09/09/1980','mm/dd/yyyy'));
       insert into EvilCorpCustomer values(8888,' Yalei Liu ', 10000000 ,to_date('10/08/1993','mm/dd/yyyy'));
     
  create table EvilCorpTrans(
    trans_id Number(4,0) primary key,
    user_id Number(4,0),
    amount Number(10,4),
    trans_type Number(4,0),
    trans_date date,
    trans_processed Number(4,0)
    );
    insert into evilcorptrans values(1,1003, 475.42, 2,to_date(' 08/06/2015','mm/dd/yyyy'),0);
     insert into evilcorptrans values(2,8675, 326.01, 4,to_date(' 08/09/2015','mm/dd/yyyy'),0);
      insert into evilcorptrans values(3,6660, 782.99, 2,to_date(' 08/03/2015','mm/dd/yyyy'),0);
       insert into evilcorptrans values(4,6666, 30.49, 1,to_date(' 08/03/2015','mm/dd/yyyy'),0);
        insert into evilcorptrans values(5,4123, 450.44, 3,to_date(' 08/15/2015','mm/dd/yyyy'),0);
         insert into evilcorptrans values(6,8675, 181.1, 2,to_date(' 08/10/2015','mm/dd/yyyy'),0);
          insert into evilcorptrans values(7,3213, 374.94, 3,to_date(' 08/08/2015','mm/dd/yyyy'),0);           
            insert into evilcorptrans values(8,6660, 803.28, 4,to_date(' 08/06/2015','mm/dd/yyyy'),0);
             insert into evilcorptrans values(9,6660, 327.7, 4,to_date(' 08/13/2015','mm/dd/yyyy'),0);
              insert into evilcorptrans values(10,8934,945.44, 1,to_date(' 08/07/2015','mm/dd/yyyy'),0);
           select * from evilcorpcustomer;
           select * from evilcorptrans join evilcorp_type on  evilcorptrans.TRANS_TYPE=evilcorp_type.TYPE_ID where user_id='6660';
           select * from evilcorptrans join evilcorp_type on evilcorptrans.trans_type=evilcorp_type.type_id where user_id='6660'
           
           create table evilcorp_type(
             type_id Number(4,0),
             descript varchar(10)
             );
             insert into evilcorp_type values(1,'C');
             insert into evilcorp_type values(2,'D');
             insert into evilcorp_type values(3,'DP');
             insert into evilcorp_type values(4,'W');
             insert into evilcorp_type values(5,'CL');
             
    select* from evilcorp_type where type_id=2;
    select * from evilcorpcustomer where acc_num=6789;
    select * from evilcorptrans where user_id=9586;
    update  evilcorpcustomer set start_bal=10000000 where acc_num=6660;
    update evilcorptrans set trans_processed=0 where user_id=6660;
    select * from evilcorpcustomer where acc_num=6660;
CREATE SEQUENCE transaction_seq
 START WITH     50
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;



create table adjectives(
  adj varchar (30)
  
  );
  
  create table nouns(
  noun varchar(30)
  );
  
  create table movie_title(
  title varchar(50),
  descript varchar(100)
  );
  select* from movie_title;
drop table ev_customer;
create table ev_customer(
id number(4,0) primary key,
name varchar (50),
birthday date
);
drop table ev_Accounts;
create table ev_Accounts(
acc_num number(4,0)primary key,
cust_id number(4,0),
acc_type varchar(10),
balance number(15,4)
);
create table ev_Transactions(
trans_id number(4,0) primary key,
acc_num number (4,0),
amount number(15,4),
trans_type number(4,0),
trans_date date,
status number(4,0)
);

CREATE SEQUENCE cust_id_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
insert into Ev_Customer values(cust_id_seq.nextval,' Carmen Sandiego',to_date('07/04/1990','mm/dd/yyyy'));
     insert into Ev_Customer values(cust_id_seq.nextval,' Wally', to_date('06/03/1999','mm/dd/yyyy'));
      insert into Ev_Customer values(cust_id_seq.nextval,' Roofus',to_date('07/10/2007','mm/dd/yyyy'));
       insert into Ev_Customer  values(cust_id_seq.nextval,' Gallant',to_date('07/11/2007','mm/dd/yyyy'));
        insert into Ev_Customer  values(cust_id_seq.nextval,' Min Mei',to_date('01/01/1978','mm/dd/yyyy'));
        insert into Ev_Customer  values(cust_id_seq.nextval,' Pikachu',to_date('05/26/1997','mm/dd/yyyy'));
         insert into Ev_Customer  values(cust_id_seq.nextval,' Littlefoot',to_date('01/01/1901','mm/dd/yyyy'));
          insert into Ev_Customer  values(cust_id_seq.nextval,' Kora, Legend of ',to_date('01/02/2050','mm/dd/yyyy'));
       insert into Ev_Customer  values(cust_id_seq.nextval,' Walter White ',to_date('11/13/1960','mm/dd/yyyy'));
       insert into Ev_Customer  values(cust_id_seq.nextval,' Nisha Jeffrey ',to_date('09/09/1980','mm/dd/yyyy'));
       insert into Ev_Customer  values(cust_id_seq.nextval,' Yalei Liu ',to_date('10/08/1993','mm/dd/yyyy'));
       select * from ev_customer;
       delete from ev_customer where id=79;
       select* from ev_accounts;
              select* from ev_transactions; 
              select  trans_type,trans_date,amount,status from ev_transactions,ev_Accounts where ev_Accounts.acc_num=ev_transactions.acc_num and ev_transactions.acc_num=7890 and status=0;		
      select* from ev_transactions;  
      delete from ev_transactions where trans_id=67;
      update ev_Accounts set balance=85 where acc_num=7890;
       delete from ev_accounts where cust_id=10;   
       create table company(
       fullname varchar(50),
       title varchar(10),
       first varchar(30),
       last varchar(30),
       street varchar(50),
       city varchar(50),
       state varchar(50),
       zip varchar(30),
       email varchar(100),
       position varchar(50),
       company varchar(50)
       );
       drop table company_customer;
       select * from company;
       
     select * from demo_customers;  
     
  create table Gradebook(
     id Number(4,0),
     Assignment varchar(50),
     grade Number(4,0)
     );
     
CREATE SEQUENCE grade_id_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 select * from gradebook;
 select avg(grade) as Avg from gradebook;
 
 create table SGradebook(
 id Number(4,0),
 student_id Number(4,0),
 student_name varchar(50),
 Assignment varchar(50),
type varchar(30),
grade Number(4,0)
);
     
CREATE SEQUENCE sgrade_id_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE student_id_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
insert into sgradebook values(sgrade_id_seq.nextval,student_id_seq.nextval,'Cheryl','DB1','quiz',60);
insert into sgradebook values(sgrade_id_seq.nextval,student_id_seq.nextval,'Cheryl','DB4','quiz',90,'phy');
select* from sgradebook where type='quiz' and student_name='Cheryl';
select * from sgradebook;
delete from sgradebook where student_name='Nisha Jeffrey';
select class,type,avg(grade) as Avg, min(grade) as Min, max(grade) as Max  from sgradebook where student_name='Cheryl' and type='quiz' group by class,type;

alter table sgradebook
add class varchar(50);

create table assign_weights(
assign_type varchar(30),
weight Number(4,2)
);
insert into assign_weights values('quiz',.03);
insert into assign_weights values('project',.05);
insert into assign_weights values('hw',.02);

select * from assign_weights;
select class,type,avg(grade) as Avg from sgradebook where student_name='Cheryl'
group by class,type;

select sum( Avg*assign_weights.weight)as Sum
from assign_weights,(select class,type as T, avg(grade) as Avg from sgradebook  where student_name='Cheryl'
group by class,type)
where assign_weights.ASSIGN_TYPE=T;

select C,sum(Weighted_grade) as Avg_Grade from (select  C,T,Avg*assign_weights.weight as Weighted_Grade
from assign_weights,(select class as C,type as T, avg(grade) as Avg from sgradebook  where student_name='Cheryl'
group by class,type)
where assign_weights.ASSIGN_TYPE=T)
group by C;
drop table customer_bonus;

create table customer_bonus(
fullname varchar(100),
title varchar(10),
fname varchar(100),
lname varchar(100),
street varchar(100),
city varchar(100),
state varchar(100),
zip Number(5,0),
email varchar(100),
position varchar(100),
company varchar(100)
);
select * from customer_bonus;

select state,count(distinct fullname)
from customer_bonus
group by state;

select count(company_name)
from company_bonus;

create table company_bonus(
company_id Number(4,0),
company_name varchar(100));



 insert into company_bonus(company_name)
 select distinct company from CUSTOMER_BONUS;
 select * from company_bonus;
 
update company_bonus set company_id=rownum;

create table cities(
city_id Number(4,0),
city_name varchar(100));

insert into cities(city_name)
 select distinct city from CUSTOMER_BONUS;
 
 update cities set city_id=rownum;

select count(distinct city) from customer_bonus;
create table states(
state_id Number(4,0),
state_name varchar(100));

insert into states(state_name)
 select distinct state from CUSTOMER_BONUS;
 
 update states set state_id=rownum;
 select * from states;
 
alter table customer_bonus add company_id Number(4,0);

 alter table customer_bonus add city_id Number(4,0);
 alter table customer_bonus add state_id Number(4,0);
 
 update customer_bonus c set c.company_id =(select t.company_id from company_bonus t where t.company_name=c.company);
 select * from customer_bonus;
 
  update customer_bonus c set c.city_id =(select t.city_id from cities t where t.city_name=c.city);
   update customer_bonus c set c.state_id =(select t.state_id from states t where t.state_name=c.state);
  alter table  customer_bonus drop column company;
  alter table customer_bonus drop column city;
  alter table customer_bonus drop COLUMN state;
  
select c.fullname,c.title,c.fname,c.lname,c.street,c.zip,c.email,c.position,t.company_name,b.city_name,s.state_name
from customer_bonus c , company_bonus t, cities b, states s
where c.company_id=t.company_id and c.city_id=b.city_id and c.state_id= s.state_id  and upper(c.lname)=upper('Smith');


select fname,lname from customer_bonus c where upper(lname) like upper('Bridge%')  ;
select company_name from company_bonus where  upper(company_name) like upper('%Bridge%');

select c.fullname,c.title,c.fname,c.lname,c.street,c.zip,c.email,c.position,t.company_name,b.city_name,s.state_name
from customer_bonus c , company_bonus t, cities b, states s
where c.company_id=t.company_id and c.city_id=b.city_id and c.state_id= s.state_id  and upper(c.lname) like upper('Bridge%')   ;

select c.fullname,c.title,c.fname,c.lname,c.street,c.zip,c.email,c.position,t.company_name,b.city_name,s.state_name
from customer_bonus c , company_bonus t, cities b, states s
where c.company_id=t.company_id and c.city_id=b.city_id and c.state_id= s.state_id  and upper(t.company_name) like upper('%Bridge%');

select cp.fullname,cp.title,cp.fname,cp.lname,cp.street,cp.zip,cp.email,cp.position,cp.company_name,cp.city_name,cp.state_name
from (select c.fullname,c.title,c.fname,c.lname,c.street,c.zip,c.email,c.position,t.company_name,b.city_name,s.state_name
from customer_bonus c , company_bonus t, cities b, states s
where c.company_id=t.company_id and c.city_id=b.city_id and c.state_id= s.state_id) cp
where upper(cp.lname) like upper('Bridge%')  or upper(cp.company_name) like upper('%Bridge%');

create table restaurant (
  RID number(4,0),
  Rname VARCHAR (50),
  Address VARCHAR (50),
  Description VARCHAR (100)
);

create table rcustomer(
  user_id number(4,0),
  user_name VARCHAR(50),
  email VARCHAR(100),
  zipcode number(5,0)
);

create table review(
  RID number (4,0) NOT NULL,
  user_id number (4,0) NOT NULL,
  review VARCHAR(500),
  rating number (1,0),
  CONSTRAINT review_id PRIMARY KEY (RID, user_id)
);
CREATE SEQUENCE Rid_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
CREATE SEQUENCE Uid_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 insert into restaurant values (rid_seq.nextval, 'Il Pizzico', 'Fredrick Rd', 'Italian Food');
 insert into restaurant values (rid_seq.nextval, 'Coastal Flats', 'Washingtonian Blvd', 'Sea Food');
 insert into restaurant values (rid_seq.nextval, 'Bobs Shanghai', 'Belmar Rd', 'Chinese Food');
 insert into restaurant values (rid_seq.nextval, 'Red Lobster', 'East Brunswick Rd', 'Sea Food');
 insert into restaurant values (rid_seq.nextval, 'Applebees', 'Bedford Place', 'American Food');
 insert into restaurant values (rid_seq.nextval, 'Chipotle', 'Stanford Place', 'Mexican Food');
 insert into restaurant values (rid_seq.nextval, 'Chai Thai', 'Livingston Ave', 'Asian Food');
 insert into restaurant values (rid_seq.nextval, 'Tower of India', 'Ernston Rd', 'Indian Food');
 insert into restaurant values (rid_seq.nextval, 'Cuban Petes', 'Hawaii Ave', 'Carribean Food');
 insert into restaurant values (rid_seq.nextval, 'Bahama Breeze', 'Edison Rd', 'Carribean Food');
 select * from restaurant;
 
 insert into rcustomer values (uid_seq.nextval, 'Vicky', 'vlee93@gmail.com', 07932);
 
 insert into restaurant values (rid_seq.nextval, 'Fridays', '41 New Jersey Rd', 'American Food');
 
 insert into rcustomer values (uid_seq.nextval, 'Nisha', 'nisha@gmail.com', 07751);
 
 insert into rcustomer values (uid_seq.nextval, 'Mena', 'mena@gmail.com', 46213);
 insert into rcustomer values (uid_seq.nextval, 'Neha', 'neha@gmail.com', 08859);
 insert into rcustomer values (uid_seq.nextval, 'Yalei', 'yalei@gmail.com', 07881);
 
 insert into review values (1, 1, 'Very Good', 4);
 insert into review values (1, 2, 'Very Bad', 1);
 insert into review values (2, 1, 'Ok', 2);
 select * from review;
 
 update review set review='Okay' where rid=6 and user_id=2;
 
select r.rid,r.rname,NVL(s.average, 0) as avrg from restaurant r left outer join (select rid,avg(rating)as average
FROM  REVIEW GROUP BY RID ) s on r.rid=s.rid;

select * from restaurant where rid=3;
select r.rid,r.review,r.rating,s.cnt,s.avrg from review r,(select rid,count(review)as cnt,avg(rating) as avrg 
from review 
group by rid) s where r.rid=s.rid and r.rid=5;

select rs.rid,rs.rname,r.review,r.rating,c.user_id, c.user_name,c.email,c.zipcode from restaurant rs,review r ,rcustomer c where rs.rid=r.rid and c.user_id=r.user_id and r.user_id=5;

select * from rcustomer left outer join review on review.USER_ID = rcustomer.USER_ID left join restaurant on review.RID=restaurant.RID where rcustomer.USER_ID=5;
update review set rdate=TO_DATE(sysdate);
select c.user_id, c.user_name,c.email,c.zipcode from rcustomer c left outer join (select rs.rid,rs.rname,r.review,r.rating,r.user_id from restaurant rs,review r where rs.rid=r.rid )s on c.user_id=s.user_id and c.user_id=5;
drop table TwitterPost;
drop table TwitterUser;
create table TwitterPost(
post_id Number(4,0),
user_id Number(4,0),
post varchar(50)
);
create table TwitterUser(
user_id Number(4,0),
name varchar(30),
motto varchar(30),
join_date date
);

CREATE SEQUENCE TPost_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
CREATE SEQUENCE Tuser_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
create or replace trigger tpost_trigger
 before insert on twitterpost
 for each row
 declare 
   trigger_id number;
   begin
   select tpost_seq.nextval
   into trigger_id
   from dual;
   :new.POST_ID :=trigger_id;
   end;
   /
   alter trigger tpost_trigger enable;
   
create or replace trigger tuser_trigger
 before insert on twitteruser
 for each row
 declare 
   trigger_id number;
   begin
   select tuser_seq.nextval
   into trigger_id
   from dual;
   :new.USER_ID :=trigger_id;
   :new.JOIN_DATE:=SYSDATE;
   end;
   /
   alter trigger tuser_trigger enable;
   
   
   
   delete from twitteruser where USER_ID=9;