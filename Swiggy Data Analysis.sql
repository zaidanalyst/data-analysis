#Swiggy Data Analysis by Zaid Khan#

use  swiggy; #database
select * from swiggy; #Table name


#Q1.HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(*)as restaurants 
from swiggy where rating>4.5;

#Q2.WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city,count(distinct restaurant_name) as No_of_restaurants 
from swiggy group by city 
order by No_of_restaurants desc limit 1; 
 
#Q3.HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select distinct restaurant_name 
from swiggy where restaurant_name  
like '%pizza%';

#Q4.WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select distinct cuisine,count(*) as cuisine_count 
from swiggy group by cuisine
order by cuisine_count desc limit 1;

#Q5.WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select city,avg(rating) 
from swiggy group by city;

#WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name,menu_category ,max(price) as Max_price 
from swiggy where menu_category='recommended'
group by restaurant_name,menu_category;

#FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE
select restaurant_name,avg(cost_per_person) as avg_expense 
from swiggy where cuisine <> 'Indian' 
group by restaurant_name 
order by cost_per_person desc 
limit 5;

#FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name,cost_per_person from swiggy 
where cost_per_person > 
(select avg(cost_per_person) from swiggy);

#RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select  distinct s.restaurant_name,s.city,w.city 
from swiggy s join swiggy w 
on s.restaurant_name=w.restaurant_name 
where s.restaurant_name=w.restaurant_name and s.city <> w.city;

#WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name,menu_category,
count(item) as no_of_items from swiggy
where menu_category='Main Course' 
group by restaurant_name,menu_category
order by no_of_items desc limit 1;

#LIST THE NAMES OF RESTAURANTS THAT ARE ONLY VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name, veg_or_nonveg from swiggy  
where veg_or_nonveg= 'veg' 
order by restaurant_name asc;

#WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select distinct restaurant_name,avg(price) as avg_price 
from swiggy group by restaurant_name 
order by avg_price limit 1 ;

#WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?

select * from swiggy;











