create database ${hiveconf:param2}stock;
use ${hiveconf:param2}stock;
create table stock_prices
(
    price_date date,
    open float,
    high float,
    low float,
    close float,
    volume bigint,
    adj_close float
)
row format delimited
fields terminated by ','
tblproperties ("skip.header.line.count"="1");
load data inpath '/stocks/${hiveconf:param2}_daily.csv' into table stock_prices;
select * from stock_prices limit 20;
