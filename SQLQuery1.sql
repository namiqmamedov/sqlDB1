Create Database expDB

use expDB

Create Table Brands
(
	Id int identity primary key,
	Name nvarchar(100)
)

Create Table Notebooks
(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Price money,
	BrandId int references Brands(Id)
)



Create Table Phones
(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Price money,
	BrandId int references Brands(Id)
)


INSERT INTO Brands
VALUES
('Apple'),
('Hp'),
('Samsung'),
('Xiaomi'),
('Huawei'),
('Asus'),
('Dell')


INSERT INTO Notebooks
VALUES
('250 G5', 943, 2),
('250 G6', 1158, 2),
('250 G7', 1251, 2),
('Air', 2363, 1),
('Pro 13', 2975, 1),
('Pro 15', 3439, 1),
('ROG', 2928, 6),
('ROG PRO', 3968, 6),
('VIVOBOOK 15', 1536, 6),
('VIVOBOOK 14', 1325, 6),
('Mate X', 1600, 5),
('Mate X PRO', 1900, 5),
('Mate XL PRO', 1864, 5),
('Mate XXL PRO', 1253, 5),
('Mi Notebook Air', 1753, 4),
('Mi Notebook Pro', 2153, 4),
('Lustrous Grey', 4681, 4),
('Galaxy Book', 1874, 3),
('Galaxy Book PRO', 3274, 3),
('Galaxy Book AIR', 2574, 3),
('Galaxy Book AIR PRO', 3367, 3)


INSERT INTO Phones
VALUES
('13', 2463, 1),
('13 Pro', 3075, 1),
('13 Pro Max', 3339, 1),
('Mate Pad', 1600, 5),
('Mate Xs', 1900, 5),
('Nova 9 SE', 1864, 5),
('P50E', 1853, 5),	
('Poco 5', 1753, 4),
('Poco 4', 2153, 4),
('Poco 6', 4681, 4),
('A11', 275, 3),
('A21', 285, 3),
('A31', 374, 3),
('A41', 467, 3),
('A51', 567, 3),
('A61', 667, 3),
('A71', 767, 3),
('A81', 867, 3),
('A91', 967, 3)



Select (Phones.Name+ ' ' +Brands.Name )  as 'Brand Name'  from Phones,Brands  

Select * from Notebooks where Notebooks.Name like 'M%'

Select * from Notebooks where Notebooks.Price Between 2000 and 3000 or Notebooks.Price > 5000

Select * from Phones where Phones.Price Between 1000 and 1500 or Phones.Price > 1500

Select Brands.Name,Count(*)
From Brands
Join Notebooks on Notebooks.BrandId = Brands.Id Group By Brands.Name

Select Brands.Name,Count(*)
From Brands
Join Phones on Phones.BrandId = Brands.Id Group By Brands.Name

Select Name,BrandId
from Phones
UNION
Select Name,BrandId
from Notebooks

Select * from Phones
UNION ALL 
Select * from Notebooks

Select Phones.Name,Phones.Price as 'BrandName' from Phones
UNION ALL 
Select Notebooks.Name,Notebooks.Price as 'BrandName' from Notebooks 

Select Distinct (Brands.Name) as 'Brand Name' from Phones,Brands  


-- task 2 

Create Database Library

use Library

Create Table Books
(
	Id int identity primary key,
	Name nvarchar(100),
	PageCount int
)

Alter Table Books Add AuthorsId int references Authors(Id)

Alter Table Books Add PageCount nvarchar(100) 

Alter Table Books Add CHECK(Name > 2) 

Alter Table Books Add CHECK(PageCount > 2) 

Insert Into Books(Name,PageCount)
Values
('TEST1',20),
('TEST2',30),
('TEST3',40)

Insert Into Authors
Values
('Copper','Horse'),
('Copper','Horse'),
('Copper','Horse'),
('Copper','Horse')

Create Table Authors
(
	Id int identity primary key,
	Name nvarchar(100),
	SurName nvarchar(100)
)


CREATE VIEW Test AS
SELECT Name, PageCount
FROM Books



