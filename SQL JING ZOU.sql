show databases;
use retailer1 ; 
show tables;
describe itemsAttributes; 
describe survItemSales;
describe randItemSales;
describe storeItemSales;
describe hshldDemograph;

select Brand from itemsAttributes; 
select Sales from survItemSales;
select Flavor1 from itemsAttributes;
select * from storeItemSales;
select * from itemsAttributes join storeItemSales on (Item.Num); 

##Q1##
select sum(sales) from storeItemSales join itemsAttributes on storeItemSales.`Item.Num`=itemsAttributes.`Item.Num` 
where class='Greek'; #23248899.49
select Flavor1, sum(sales), sum(sales)/23248899.49 as percentage_of_sales from storeItemSales join itemsAttributes on storeItemSales.`Item.Num`=itemsAttributes.`Item.Num` 
where class='Greek' and (Flavor1='Blueberry' or Flavor1='Honey' or Flavor1='Peach' or Flavor1 = 'Plain' 
or Flavor1 = 'Strawberry' or Flavor1='Vanilla'); #16343936.51  # 0.702998

select Flavor1, sum(sales), sum(sales)/23248899.49 as percentage1_of_sales from storeItemSales join itemsAttributes on storeItemSales.`Item.Num`=itemsAttributes.`Item.Num` 
where class='Greek' and (Flavor1='Blueberry' or Flavor1='Honey' or Flavor1='Peach' or Flavor1 = 'Plain' 
or Flavor1 = 'Strawberry' or Flavor1='Vanilla') group by Flavor1
order by percentage1_of_sales desc;

##Q2###
select sum(sales) from storeItemSales join itemsAttributes on storeItemSales.`Item.Num`=itemsAttributes.`Item.Num` where Class = 'REGULAR'; #68303678.66
select Flavor1, sum(sales), sum(sales)/68303678.66 as percentage2_of_sales from storeItemSales join itemsAttributes on storeItemSales.`Item.Num`=itemsAttributes.`Item.Num`
group by Flavor1
order by percentage2_of_sales desc;


