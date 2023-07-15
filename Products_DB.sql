create database computer
go
use computer
go
PRINT N'Recreating the objects for the database'
--Drop all FKs in the database
declare @table_name sysname, @constraint_name sysname
declare i cursor static for
select c.table_name, a.constraint_name
from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a join INFORMATION_SCHEMA.KEY_COLUMN_USAGE b
on a.unique_constraint_name=b.constraint_name join INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
on a.constraint_name=c.constraint_name
WHERE upper(c.table_name) in (upper('Laptop'),'PC',upper('Product'),upper('Printer'))
open i
fetch next from i into @table_name,@constraint_name
while @@fetch_status=0
begin
    exec('ALTER TABLE '+@table_name+' DROP CONSTRAINT '+@constraint_name)
    fetch next from i into @table_name,@constraint_name
end
close i
deallocate i
GO
--Drop all tables
declare @object_name sysname, @sql varchar(8000)
declare i cursor static for
SELECT table_name from INFORMATION_SCHEMA.TABLES
where upper(table_name) in (upper('Laptop'),'PC',upper('Product'),upper('Printer'))
 
open i
fetch next from i into @object_name
while @@fetch_status=0
begin
    set @sql='DROP TABLE [dbo].['+@object_name+']'
    exec(@sql)
    fetch next from i into @object_name
end
close i
deallocate i
GO
 
CREATE TABLE [dbo].[Laptop] (
    [code] [int] NOT NULL ,
    [model] [varchar] (50) NOT NULL ,
    [speed] [smallint] NOT NULL ,
    [ram] [smallint] NOT NULL ,
    [hd] [real] NOT NULL ,
    [price] [money] NULL ,
    [screen] [tinyint] NOT NULL
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[PC] (
    [code] [int] NOT NULL ,
    [model] [varchar] (50) NOT NULL ,
    [speed] [smallint] NOT NULL ,
    [ram] [smallint] NOT NULL ,
    [hd] [real] NOT NULL ,
    [cd] [varchar] (10) NOT NULL ,
    [price] [money] NULL
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Product] (
    [maker] [varchar] (10) NOT NULL ,
    [model] [varchar] (50) NOT NULL ,
    [type] [varchar] (50) NOT NULL
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Printer] (
    [code] [int] NOT NULL ,
    [model] [varchar] (50) NOT NULL ,
    [color] [char] (1) NOT NULL ,
    [type] [varchar] (10) NOT NULL ,
    [price] [money] NULL
) ON [PRIMARY]
GO
 
ALTER TABLE [dbo].[Laptop] WITH NOCHECK ADD
    CONSTRAINT [PK_Laptop] PRIMARY KEY
    (
        [code]
    )  ON [PRIMARY] 
GO
 
ALTER TABLE [dbo].[PC] WITH NOCHECK ADD
    CONSTRAINT [PK_pc] PRIMARY KEY
    (
        [code]
    )  ON [PRIMARY] 
GO
 
ALTER TABLE [dbo].[Product] WITH NOCHECK ADD
    CONSTRAINT [PK_product] PRIMARY KEY
    (
        [model]
    )  ON [PRIMARY] 
GO
 
ALTER TABLE [dbo].[Printer] WITH NOCHECK ADD
    CONSTRAINT [PK_printer] PRIMARY KEY
    (
        [code]
    )  ON [PRIMARY] 
GO
 
ALTER TABLE [dbo].[Laptop] ADD
    CONSTRAINT [FK_Laptop_product] FOREIGN KEY
    (
        [model]
    ) REFERENCES [dbo].[Product] (
        [model]
    )
GO
 
ALTER TABLE [dbo].[PC] ADD
    CONSTRAINT [FK_pc_product] FOREIGN KEY
    (
        [model]
    ) REFERENCES [dbo].[Product] (
        [model]
    )
GO
 
ALTER TABLE [dbo].[Printer] ADD
    CONSTRAINT [FK_printer_product] FOREIGN KEY
    (
        [model]
    ) REFERENCES [dbo].[Product] (
        [model]
    )
GO
----Product------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Product values('B','1121','PC')
insert into Product values('A','1232','PC')
insert into Product values('A','1233','PC')
insert into Product values('E','1260','PC')
insert into Product values('A','1276','Printer')
insert into Product values('D','1288','Printer')
insert into Product values('A','1298','Laptop')
insert into Product values('C','1321','Laptop')
insert into Product values('A','1401','Printer')
insert into Product values('A','1408','Printer')
insert into Product values('D','1433','Printer')
insert into Product values('E','1434','Printer')
insert into Product values('B','1750','Laptop')
insert into Product values('A','1752','Laptop')
insert into Product values('E','2113','PC')
insert into Product values('E','2112','PC')
go
 
                                                                                                                                                                                                                                                                  
----PC------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into PC values(1,'1232',500,64,5,'12x',600)
insert into PC values(2,'1121',750,128,14,'40x',850)
insert into PC values(3,'1233',500,64,5,'12x',600)
insert into PC values(4,'1121',600,128,14,'40x',850)
insert into PC values(5,'1121',600,128,8,'40x',850)
insert into PC values(6,'1233',750,128,20,'50x',950)
insert into PC values(7,'1232',500,32,10,'12x',400)
insert into PC values(8,'1232',450,64,8,'24x',350)
insert into PC values(9,'1232',450,32,10,'24x',350)
insert into PC values(10,'1260',500,32,10,'12x',350)
insert into PC values(11,'1233',900,128,40,'40x',980)
insert into PC values(12,'1233',800,128,20,'50x',970)
 
 
go
 
                                                                                                                                                                                                                                                                  
----Laptop------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Laptop values(1,'1298',350,32,4,700,11)
insert into Laptop values(2,'1321',500,64,8,970,12)
insert into Laptop values(3,'1750',750,128,12,1200,14)
insert into Laptop values(4,'1298',600,64,10,1050,15)
insert into Laptop values(5,'1752',750,128,10,1150,14)
insert into Laptop values(6,'1298',450,64,10,950,12)
 
go
 
                                                                                                                                                                                                                                                                  
----Printer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Printer values(1,'1276','n','Laser',400)
insert into Printer values(2,'1433','y','Jet',270)
insert into Printer values(3,'1434','y','Jet',290)
insert into Printer values(4,'1401','n','Matrix',150)
insert into Printer values(5,'1408','n','Matrix',270)
insert into Printer values(6,'1288','n','Laser',400)
go
 -------------------------------------------------------------------------------
 --lab5
select maker from Product
select model from Printer
select model, speed, price, screen, hd from Laptop where price > 1000
select model, screen from Laptop where screen > 15
select price, model from PC where (price < 300) or (price > 1000) --there are no price
select * from Printer where color = 'y'
select model, type, color from Printer where color = 'y'and type ='Laser'
select model, type, color from Printer where color = 'n'and (type ='Laser' or type = 'Matrix')
select hd, speed, price from PC where (hd > 1 and speed > 200 and price < 500)
select * from Laptop where screen between 12 and 17
--lab6
select model, price, color from Printer where color = 'y' 
select model,  min(price) as "min_price" from Printer where color = 'y' group by model



--Select tbl.* From Printer tbl Inner Join (  Select model,MIN(price) MinPrice From Printer Group By model )tbl1 On tbl1.model=tbl.model Where tbl1.MinPrice=tbl.price and color = 'y'
-- absolute minimum bid price
SELECT MIN(Price)
FROM Printer
 
-- minimum bid price for each bidder
SELECT MIN(Price), Model
FROM Printer
GROUP BY Model
 
--1--
SELECT price, model
FROM (SELECT price, model, 
ROW_NUMBER() OVER(ORDER BY price asc) AS r_n
    FROM Printer
	WHERE color='y') q
WHERE r_n = 1 
--2--
select ram,price from Laptop 
where ram > 32 order by price asc
--3--
select model, screen from Laptop where screen > 10;
select count(model) model from Laptop where screen > 10
--4--
SELECT Product.maker, PC.model, PC.price FROM PC INNER JOIN Product ON Product.model = PC.model 
where price = (select min(price) from PC)
GROUP BY Product.maker, PC.model, PC.price 
--5--
select avg(PC.price) as pc_avg_price, avg(Printer.price) printer_avg_price, avg(Laptop.Price) laptop_avg_price
from PC, Printer, Laptop
--6--
select distinct(Product.maker), Printer.type  
from Product join Printer on Printer.model = Product.model 
where Printer.type = 'Matrix' 
--7--
select distinct(Product.maker)  
from Product join Printer on Printer.model = Product.model 
where Printer.type = 'Laser' and Printer.color = 'y' 
--8--
select distinct(Laptop.model)  
from Product join Laptop on Laptop.model = Product.model 
where Product.maker = 'A' 
--9--
select distinct Laptop.model, Product.maker, Laptop.price
from Product join Laptop on Laptop.model = Product.model 
where Laptop.price < 1000
group by Laptop.model, Product.maker, Laptop.price
--having count (distinct maker) = 1
order by Product.maker, Laptop.price
--10--
select Product.maker, max(Laptop.price)
from Product join Laptop on Laptop.model = Product.model 
 --max(PC.price) as pc_max_price, max(Printer.price) printer_max_price, max(Laptop.Price) laptop_max_price
 group by Product.maker
 
 -------------------
 SELECT *
FROM (SELECT price, product.model, 
ROW_NUMBER() OVER(ORDER BY price desc) AS r_n
    FROM Product join Printer on Product.model=Printer.model) q
WHERE r_n = 1 
--------------------
Select Product.maker, max(price)
From Product Join 
--(Select Max(printer.price) MinPrice, model From Printer group by Printer.model) 
Printer On Printer.model = Product.model
 --Where Printer.MinPrice=tbl.price and color = 'y'
 group by maker
 having count (distinct price) = 2
-----------------------
--спосіб 1, але не універсальний
select pc.model, tb.model, pc.ram, pc.speed
from pc join pc tb 
on pc.ram = tb.ram and pc.speed = tb.speed
where pc.model < tb.model 
order by pc.model
--спосіб 2, універсальний
select distinct pc.model m1, tb.model m2, pc.ram, pc.speed 
from pc cross join pc tb 
where pc.model < tb.model and pc.ram = tb.ram and pc.speed = tb.speed  
order by pc.model
------------------------------111111 
(select hd from(
SELECT hd, COUNT(hd) AS Count 
FROM  PC
GROUP BY hd 
Having COUNT(hd) > 1) a
-----------------22222
select  maker, avg(hd) 
from (laptop join Product on Laptop.model=product.model) 
group by maker 
-------------333333
SELECT maker, count(model) кіл_м_ПК 
FROM  product
where type = 'PC' 
group by maker 
Having COUNT(model) > 1 
-----------4444444
select  maker, max(price) max_price 
from (pc join Product on pc.model=product.model) 
group by maker
-----5 
select speed, avg(price) avg_price 
from pc 
where speed > 600 
group by speed
-----------6666666666
select maker, avg(hd) 
from pc join product on pc.model=product.model 
where (product.type = 'PC' ) and exists (select distinct maker from product where type = 'Printer' ) 
group by maker
----7777
SELECT Product.maker, PC.model, PC.price FROM PC INNER JOIN Product ON Product.model = PC.model 
where price = (select min(price) from PC)
GROUP BY Product.maker, PC.model, PC.price 
------8888
select maker, price 
from Printer join Product on Printer.model=Product.model
where price = (select min(price) from Printer where color = 'y')
-----9999
 
select maker 
from 
	(select top 20 percent speed, ram, model 
	 from pc 
	 where ram = (select min(ram) 
		      from pc)  
	 ) b  join product on b.model = product.model
		   
where (product.type = 'PC' ) and exists (select distinct maker from product where type = 'Printer' ) 
group by maker
-----10
 select distinct t1.maker     
from product as t1
where type = 'PC' 
and not exists (
    select maker 
    from product as t2
    where t1.maker = t2.maker
    and t2.type = 'Laptop')
order by maker
 
