create database Resturents;

create table Recipes(
	recipe_id int not null unique,
	recipe_name varchar(30),
	constraint pk_Recipes primary key(recipe_id)
)

--insert value into recipes
insert into Recipes (recipe_id,recipe_name) 
values 
(0,'Tacos'),
(1,'Tomato Soup'),
(2,'Grilled Cheese')

create table Ingredients(
	ingredient_id int not null unique,
	ingredient_name varchar(30),
	ingredient_price float,
	constraint pk_Ingredients primary key(ingredient_id)
)

--value insert into Ingredients
insert into Ingredients
(ingredient_id,ingredient_name,ingredient_price)
values
(0,'Beef',5.00),
(1,'Lettuce',1.00),
(2,'Tomatoes',2.00),
(3,'Taco Shell',2.00),
(4,'Cheese',3.00),
(5,'Milk',1.00),
(6,'Bread',2.00)

create table Recipe_ingredients(
	recipe_id int ,
	ingredient_id int ,
	amount int,
	constraint pk_Recipe_ingredients foreign key(recipe_id) references Recipes(recipe_id),
	foreign key(ingredient_id) references Ingredients(ingredient_id)
)

--value insert into Recipe_ingredients
insert into Recipe_ingredients (recipe_id,ingredient_id,amount)
values
(0,0,1),
(0,1,2),
(0,2,2),
(0,3,3),
(0,4,1),
(1,2,2),
(1,5,1),
(2,4,1),
(2,6,2)

--01.Question: What are the ingredient id for 'Tomato Soup'?
--Answer:
select Ingredients.ingredient_id 
from ( 
	Recipes join Recipe_ingredients
	on Recipes.recipe_id = Recipe_ingredients.recipe_id
) join Ingredients
on Ingredients.ingredient_id = Recipe_ingredients.ingredient_id
where recipe_name = 'Tomato Soup';

--02.Question: Find the ingredient names for the ingredients in 'Tomato Soup'?
--Answer:
select Ingredients.ingredient_name 
from ( 
	Recipes join Recipe_ingredients
	on Recipes.recipe_id = Recipe_ingredients.recipe_id
) join Ingredients
on Ingredients.ingredient_id = Recipe_ingredients.ingredient_id
where recipe_name = 'Tomato Soup';

--03.Question: Find all the recipes that include 'Tomatoes'?
--Answer:
select Recipes.recipe_name
from (
	Recipes join Recipe_ingredients
	on Recipes.recipe_id = Recipe_ingredients.recipe_id
) join Ingredients
on Ingredients.ingredient_id = Recipe_ingredients.ingredient_id
where Ingredients.ingredient_name = 'Tomatoes';

--04.Question: Find the number of ingredients in each recipes?
--Answer:
select Recipes.recipe_name,count(Ingredients.ingredient_id) as Total_ingredients
from (
	Recipes join Recipe_ingredients
	on Recipes.recipe_id = Recipe_ingredients.recipe_id
) join Ingredients
on Ingredients.ingredient_id = Recipe_ingredients.ingredient_id
group by(Recipes.recipe_name)

--05.Question: Find the most expensive ingredients?
--Answer:
select max(ingredient_price) as Most_expensive_ingredients
from Ingredients

--06.Question:Sort the ingredients by how they are in descending order of price?
--Answer:
select *
from Ingredients
order by ingredient_price desc

--07.Question: Find the Most expensive recipe?
--Answer:
select Recipes.recipe_id,max(sum(Ingredients.ingredient_price)) as Most_expensive
from (
	Recipes join Recipe_ingredients
	on Recipes.recipe_id = Recipe_ingredients.recipe_id
) join Ingredients
on Ingredients.ingredient_id = Recipe_ingredients.ingredient_id
group by (Recipes.recipe_id)

--08.Question: Total price for each recipe?
--Answer:
select Recipes.recipe_id,sum(Ingredients.ingredient_price) as price
from (
	Recipes join Recipe_ingredients
	on Recipes.recipe_id = Recipe_ingredients.recipe_id
) join Ingredients
on Ingredients.ingredient_id = Recipe_ingredients.ingredient_id
group by (Recipes.recipe_id)

