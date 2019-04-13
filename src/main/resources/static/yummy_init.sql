 use yummy;

create table if not exists t_member(
  id int primary key auto_increment ,
  email varchar(20) not null ,
  password varchar(20) not null ,
  phone varchar(20) default null ,
  name varchar(20) default null,
  level int(4) default 1 ,
  validation int(2) default 1
);

create table if not exists t_member_payment(
  id int primary key auto_increment ,
  mem_id int not null ,
  account varchar(20) not null ,
  password varchar(20) not null default '123456' ,
  balance double(8,2) default 500.00,
  foreign key (mem_id) references t_member(id)
);

create table if not exists t_address(
  id int primary key auto_increment ,
  longitude double(4,2) not null default 0,
  latitude double(4,2) not null default 0,
  note varchar(256) null
);

create table if not exists t_member_address(
  id int primary key auto_increment ,
  mem_id int not null ,
  ad_id int not null ,
  foreign key (mem_id) references t_member(id) ,
  foreign key (ad_id) references t_address(id)
);

create table if not exists t_member_discount(
  id int primary key auto_increment ,
  level int not null ,
  min double(6,2) not null ,
  discount double(3,2) not null
);

create table if not exists t_member_consumption(
  id int primary key auto_increment ,
  mem_id int not null ,
  sum double(8,2) not null default 0 ,
  level int not null default 1 ,
  foreign key (mem_id) references t_member(id)
);

## merchant
create table if not exists t_merchant(
  id int primary key auto_increment ,
  cdkey varchar(7) not null ,
  name varchar(20) default null,
  type varchar(20) not null default 'other' ,
  password varchar(20) not null ,
  ad_id int not null default 0,
  vertification int not null default 1 ,
  foreign key (ad_id) references t_address(id)
);

create table if not exists t_merchant_discount(
  id int primary key auto_increment ,
  mer_id int not null ,
  min int not null default 10,
  discount int not null default 0 ,
  foreign key (mer_id) references t_merchant(id)
);
##  merchant_income..... to do........

create table if not exists t_dish(
  id int primary key auto_increment ,
  mer_id int not null ,
  name varchar(20) not null ,
  price double(6,2) not null ,
  supply int not null default 0 ,
  kind varchar(20) not null default 'other' ,
  deadline timestamp ,
  foreign key (mer_id) references t_merchant(id)
);

create table if not exists t_pack(
  id int primary key auto_increment ,
  mer_id int not null ,
  name varchar(20) not null ,
  price double(6,2) not null ,
  deadline timestamp ,
  foreign key (mer_id) references t_merchant(id)
);

create table if not exists t_dish_pack(
  id int primary key auto_increment ,
  pack_id int not null ,
  dish_id int not null ,
  num int not null default 1 ,
  foreign key (pack_id) references t_pack(id) ,
  foreign key (dish_id) references t_dish(id)
);

create table if not exists t_deal(
  id int primary key auto_increment ,
  mem_id int not null ,
  mer_id int not null ,
  ad_id int not null ,
  origin_price double(6,2) not null ,
  mem_discount double(3,2) not null default 1.00 ,
  mer_discount int not null default 0 ,
  final_price double(6,2) not null ,
  profit double(6,2) not null default 0 ,
  actual_benefit double(6,2) not null default 0,
  state int not null default 1 ,
  refund double(6,2) default 0 ,
  limit_time int not null default 30 ,
  setup_time timestamp ,
  foreign key (mem_id) references t_member(id) ,
  foreign key (mer_id) references t_merchant(id),
  foreign key (ad_id) references t_address(id)
);

create table if not exists t_deal_dish(
  id int primary key auto_increment ,
  deal_id int not null ,
  dish_id int not null ,
  num int not null default 1 ,
  foreign key (deal_id) references t_deal(id) ,
  foreign key (dish_id) references t_dish(id)
);

create table if not exists t_deal_pack(
  id int primary key auto_increment ,
  deal_id int not null ,
  pack_id int not null ,
  num int not null default 1 ,
  foreign key (deal_id) references t_deal(id) ,
  foreign key (pack_id) references t_pack(id)
);

create table if not exists t_profit(
  id int primary key auto_increment ,
  ratio double(3,1) not null default 1.0 ,
  effect_date timestamp
);
#
# drop table t_deal_dish;
# drop table t_deal_pack;
# drop table t_deal;
# drop table t_dish_pack;
# drop table t_dish;
# drop table t_pack;
# drop table t_merchant_discount;
# drop table t_member_payment;
# drop table t_member_consumption;
# drop table t_member_address;
# drop table t_address;
# drop table t_merchant;
# drop table t_member;
# drop table t_member_discount;
# drop table t_profit;
