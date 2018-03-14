-- Assignment 2 PetSmart DB - Pat Carney, Eddie Lehr, and Sarah Zazyczny

CREATE DATABASE PetSmartDb;
GO

USE PetSmartDb;
GO

--CREATE TABLES
-- Create Product table
CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  ListPrice bigint NOT NULL,
  ProductSubcategoryID bigint FOREIGN KEY REFERENCES ProductSubcategory(ProductSubcategoryID),
  PetCategoryID bigint FOREIGN KEY REFERENCES PetCategory(PetCategoryID));
  ALTER TABLE Product
ALTER COLUMN ListPrice money;

-- Create Product Category table
CREATE TABLE ProductCategory(
  ProductCategoryID bigint NOT NULL PRIMARY KEY,
  Name varchar (50) NOT NULL);

-- Create Product Subcategory table
CREATE TABLE ProductSubcategory(
  ProductSubcategoryID bigint NOT NULL PRIMARY KEY,
  Name varchar (50) NOT NULL,
  ProductCategoryID bigint FOREIGN KEY REFERENCES ProductCategory(ProductCategoryID));

-- Create Pet Category table
CREATE TABLE PetCategory(
  PetCategoryID bigint NOT NULL PRIMARY KEY,
  Name varchar (50) NOT NULL);

-- Create Customer table
CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  TerritoryID bigint FOREIGN KEY REFERENCES Territory(TerritoryID));
  ALTER TABLE Customer ADD ContactID bigint FOREIGN KEY REFERENCES Contact(ContactID);

-- Create Sales Order table
CREATE TABLE SalesOrder(
  SalesOrderID bigint NOT NULL PRIMARY KEY,
  OrderQty bigint NOT NULL,
  ProductID bigint FOREIGN KEY REFERENCES Product(ProductID),
  SalesEmployeesID bigint FOREIGN KEY REFERENCES SalesEmployees(SalesEmployeesID),
  CustomerID bigint FOREIGN KEY REFERENCES Customer(CustomerID));

-- Create Sales Territory table
CREATE TABLE Territory(
  TerritoryID bigint NOT NULL PRIMARY KEY,
  Name varchar (50) NOT NULL);

-- Create Sales Employees table
CREATE TABLE SalesEmployees(
  SalesEmployeesID bigint NOT NULL PRIMARY KEY,
  ContactID bigint FOREIGN KEY REFERENCES Contact(ContactID),
  TerritoryID bigint FOREIGN KEY REFERENCES Territory(TerritoryID));

-- Create Contact table
CREATE TABLE Contact(
	ContactID bigint NOT NULL PRIMARY KEY,
	FirstName varchar (50) NOT NULL,
	LastName varchar (50) NOT NULL);


--INSERT DATA INTO TABLES

--Populate Product table
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (1, 'BLUE Adult Dog Food - Chicken & Brown Rice', 27.99, 1, 1);
		UPDATE Product
		SET ListPrice = 27.99
		WHERE ProductID = 1;
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (2, 'Authority Adult Dog Food - Chicken & Rice', 34.99, 1, 1);
		UPDATE Product
		SET ListPrice = 34.99
		WHERE ProductID = 2;
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (3, '9Lives Adult Cat Food - Chicken, Beef & Salmon', 9.14, 1, 2);
		UPDATE Product
		SET ListPrice = 9.14
		WHERE ProductID = 3;
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (4, 'Purina Pro Plan Savor Adult Cat Food', 0.89, 2, 2);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (5, 'Purina Pro Plan SAVOR Adult Cat Food', 8.39, 1, 2);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (6, 'Tetra TretraMin Tropical Flakes', 3.06, 4, 3);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (7, 'Roudybush Mini Pellets Bird Food', 9.27, 3, 6);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (8, 'KONG AirDog Tennis Ball', 5.50, 5, 1);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (9, 'Grreat Choice Spike Ball', 4.99, 5, 1);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (10, 'Super Pet Run-About Sm Ball', 4.99, 5, 5);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (11, 'Super Pet Run-About Sm Ball', 4.99, 5, 5);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (12, 'Puppies R Us Long Body Flattie Dog', 6.99, 6, 1);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (13, 'KONG Squirrel Catnip Toy', 4.14, 6, 2);
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (14, 'ThunderLeash Dog Leash', 25.09, 10, 1);
		UPDATE Product
		SET ProductSubcategoryID = 9
		WHERE ProductID = 14;
insert into Product (ProductID, Name, ListPrice, ProductSubcategoryID, PetCategoryID) values (15, 'flexi New Comfort Retractable Leash', 38.35, 10, 1);
		UPDATE Product
		SET ProductSubcategoryID = 9
		WHERE ProductID = 15;

--Populate Product Subcategory table
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (1, 'Dry Food', 1);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (2, 'Wet Food', 1);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (3, 'Pellets', 1);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (4, 'Flakes', 1);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (5, 'Ball', 2);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (6, 'Plush', 2);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (7, 'Treat Dispensing', 2);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (8, 'Rubber', 2);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (9, 'Leash', 3);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (10, 'Collar', 3);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (11, 'Bed', 3);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (12, 'Biscuit', 4);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (14, 'Bone', 4);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (15, 'Cat Treat', 4);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (16, 'Dental', 4);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (17, 'Litter', 5);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (18, 'Brush', 5);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (19, 'Hair Clipper', 5);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (20, 'Shampoo', 5);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (21, 'Flea Repellant', 6);
insert into ProductSubcategory (ProductSubcategoryID, Name, ProductCategoryID) values (22, 'Tick Repellant', 6);

--Populate Product Category table
insert into ProductCategory (ProductCategoryID, Name) values (1, 'Food');
insert into ProductCategory (ProductCategoryID, Name) values (2, 'Toys');
insert into ProductCategory (ProductCategoryID, Name) values (3, 'Accessories');
insert into ProductCategory (ProductCategoryID, Name) values (4, 'Treats');
insert into ProductCategory (ProductCategoryID, Name) values (5, 'Hygiene');
insert into ProductCategory (ProductCategoryID, Name) values (6, 'Medical');

--Populate Pet Category table
insert into PetCategory (PetCategoryID, Name) values (1, 'Dog');
insert into PetCategory (PetCategoryID, Name) values (2, 'Cat');
insert into PetCategory (PetCategoryID, Name) values (3, 'Fish');
insert into PetCategory (PetCategoryID, Name) values (4, 'Reptile');
insert into PetCategory (PetCategoryID, Name) values (5, 'Small Pet');
insert into PetCategory (PetCategoryID, Name) values (6, 'Bird');
insert into PetCategory (PetCategoryID, Name) values (7, 'Horse');

--Populate Sales Territory table
insert into Territory (TerritoryID, Name) values (1, 'Northeast');
insert into Territory (TerritoryID, Name) values (2, 'Southeast');
insert into Territory (TerritoryID, Name) values (3, 'Central');
insert into Territory (TerritoryID, Name) values (4, 'Southwest');
insert into Territory (TerritoryID, Name) values (5, 'West');
insert into Territory (TerritoryID, Name) values (6, 'Canada');
insert into Territory (TerritoryID, Name) values (7, 'PuertoRico');

--Populate Sales Employees table
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (1, 3, 4);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (2, 8, 5);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (3, 21, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (4, 3, 4);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (5, 6, 5);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (6, 25, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (7, 20, 5);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (8, 1, 3);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (9, 15, 3);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (10, 6, 7);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (11, 3, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (12, 22, 6);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (13, 15, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (14, 23, 5);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (15, 8, 4);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (16, 8, 5);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (17, 1, 3);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (18, 16, 1);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (19, 23, 5);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (20, 8, 7);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (21, 25, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (22, 20, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (23, 1, 2);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (24, 23, 1);
insert into SalesEmployees (SalesEmployeesID, ContactID, TerritoryID) values (25, 15, 7);

--Populate Customer table
insert into Customer (CustomerID, TerritoryID, ContactID) values (1, 7, 41);
insert into Customer (CustomerID, TerritoryID, ContactID) values (2, 3, 40);
insert into Customer (CustomerID, TerritoryID, ContactID) values (3, 3, 34);
insert into Customer (CustomerID, TerritoryID, ContactID) values (4, 4, 44);
insert into Customer (CustomerID, TerritoryID, ContactID) values (5, 3, 99);
insert into Customer (CustomerID, TerritoryID, ContactID) values (6, 4, 77);
insert into Customer (CustomerID, TerritoryID, ContactID) values (7, 3, 79);
insert into Customer (CustomerID, TerritoryID, ContactID) values (8, 6, 98);
insert into Customer (CustomerID, TerritoryID, ContactID) values (9, 2, 29);
insert into Customer (CustomerID, TerritoryID, ContactID) values (10, 7, 85);
insert into Customer (CustomerID, TerritoryID, ContactID) values (11, 4, 60);
insert into Customer (CustomerID, TerritoryID, ContactID) values (12, 1, 78);
insert into Customer (CustomerID, TerritoryID, ContactID) values (13, 4, 88);
insert into Customer (CustomerID, TerritoryID, ContactID) values (14, 6, 48);
insert into Customer (CustomerID, TerritoryID, ContactID) values (15, 3, 93);
insert into Customer (CustomerID, TerritoryID, ContactID) values (16, 7, 77);
insert into Customer (CustomerID, TerritoryID, ContactID) values (17, 4, 51);
insert into Customer (CustomerID, TerritoryID, ContactID) values (18, 4, 42);
insert into Customer (CustomerID, TerritoryID, ContactID) values (19, 4, 68);
insert into Customer (CustomerID, TerritoryID, ContactID) values (20, 1, 60);
insert into Customer (CustomerID, TerritoryID, ContactID) values (21, 4, 68);
insert into Customer (CustomerID, TerritoryID, ContactID) values (22, 7, 45);
insert into Customer (CustomerID, TerritoryID, ContactID) values (23, 4, 68);
insert into Customer (CustomerID, TerritoryID, ContactID) values (24, 3, 81);
insert into Customer (CustomerID, TerritoryID, ContactID) values (25, 1, 77);
insert into Customer (CustomerID, TerritoryID, ContactID) values (26, 6, 95);
insert into Customer (CustomerID, TerritoryID, ContactID) values (27, 7, 60);
insert into Customer (CustomerID, TerritoryID, ContactID) values (28, 3, 32);
insert into Customer (CustomerID, TerritoryID, ContactID) values (29, 5, 39);
insert into Customer (CustomerID, TerritoryID, ContactID) values (30, 5, 93);
insert into Customer (CustomerID, TerritoryID, ContactID) values (31, 4, 63);
insert into Customer (CustomerID, TerritoryID, ContactID) values (32, 6, 67);
insert into Customer (CustomerID, TerritoryID, ContactID) values (33, 2, 78);
insert into Customer (CustomerID, TerritoryID, ContactID) values (34, 7, 58);
insert into Customer (CustomerID, TerritoryID, ContactID) values (35, 7, 77);
insert into Customer (CustomerID, TerritoryID, ContactID) values (36, 3, 44);
insert into Customer (CustomerID, TerritoryID, ContactID) values (37, 1, 93);
insert into Customer (CustomerID, TerritoryID, ContactID) values (38, 7, 69);
insert into Customer (CustomerID, TerritoryID, ContactID) values (39, 1, 82);
insert into Customer (CustomerID, TerritoryID, ContactID) values (40, 5, 93);
insert into Customer (CustomerID, TerritoryID, ContactID) values (41, 6, 72);
insert into Customer (CustomerID, TerritoryID, ContactID) values (42, 2, 41);
insert into Customer (CustomerID, TerritoryID, ContactID) values (43, 7, 81);
insert into Customer (CustomerID, TerritoryID, ContactID) values (44, 7, 69);
insert into Customer (CustomerID, TerritoryID, ContactID) values (45, 1, 28);
insert into Customer (CustomerID, TerritoryID, ContactID) values (46, 2, 29);
insert into Customer (CustomerID, TerritoryID, ContactID) values (47, 7, 26);
insert into Customer (CustomerID, TerritoryID, ContactID) values (48, 5, 83);
insert into Customer (CustomerID, TerritoryID, ContactID) values (49, 4, 59);
insert into Customer (CustomerID, TerritoryID, ContactID) values (50, 1, 33);
insert into Customer (CustomerID, TerritoryID, ContactID) values (51, 7, 82);
insert into Customer (CustomerID, TerritoryID, ContactID) values (52, 7, 65);
insert into Customer (CustomerID, TerritoryID, ContactID) values (53, 1, 57);
insert into Customer (CustomerID, TerritoryID, ContactID) values (54, 2, 58);
insert into Customer (CustomerID, TerritoryID, ContactID) values (55, 3, 39);
insert into Customer (CustomerID, TerritoryID, ContactID) values (56, 6, 96);
insert into Customer (CustomerID, TerritoryID, ContactID) values (57, 3, 58);
insert into Customer (CustomerID, TerritoryID, ContactID) values (58, 1, 44);
insert into Customer (CustomerID, TerritoryID, ContactID) values (59, 2, 35);
insert into Customer (CustomerID, TerritoryID, ContactID) values (60, 2, 63);
insert into Customer (CustomerID, TerritoryID, ContactID) values (61, 5, 92);
insert into Customer (CustomerID, TerritoryID, ContactID) values (62, 3, 42);
insert into Customer (CustomerID, TerritoryID, ContactID) values (63, 3, 49);
insert into Customer (CustomerID, TerritoryID, ContactID) values (64, 7, 76);
insert into Customer (CustomerID, TerritoryID, ContactID) values (65, 3, 87);
insert into Customer (CustomerID, TerritoryID, ContactID) values (66, 5, 60);
insert into Customer (CustomerID, TerritoryID, ContactID) values (67, 1, 28);
insert into Customer (CustomerID, TerritoryID, ContactID) values (68, 2, 28);
insert into Customer (CustomerID, TerritoryID, ContactID) values (69, 6, 41);
insert into Customer (CustomerID, TerritoryID, ContactID) values (70, 7, 80);
insert into Customer (CustomerID, TerritoryID, ContactID) values (71, 2, 76);
insert into Customer (CustomerID, TerritoryID, ContactID) values (72, 1, 38);
insert into Customer (CustomerID, TerritoryID, ContactID) values (73, 7, 67);
insert into Customer (CustomerID, TerritoryID, ContactID) values (74, 2, 49);
insert into Customer (CustomerID, TerritoryID, ContactID) values (75, 7, 36);

--Populate Contact table
insert into Contact (ContactID, FirstName, LastName) values (1, 'Loren', 'Saunt');
insert into Contact (ContactID, FirstName, LastName) values (2, 'Maribel', 'Common');
insert into Contact (ContactID, FirstName, LastName) values (3, 'Clo', 'Clemendet');
insert into Contact (ContactID, FirstName, LastName) values (4, 'Nigel', 'Sympson');
insert into Contact (ContactID, FirstName, LastName) values (5, 'Bibby', 'Prugel');
insert into Contact (ContactID, FirstName, LastName) values (6, 'Lorenza', 'Highman');
insert into Contact (ContactID, FirstName, LastName) values (7, 'Hebert', 'Pavlenko');
insert into Contact (ContactID, FirstName, LastName) values (8, 'Gerek', 'Milstead');
insert into Contact (ContactID, FirstName, LastName) values (9, 'Sigrid', 'Stileman');
insert into Contact (ContactID, FirstName, LastName) values (10, 'Shaun', 'Flann');
insert into Contact (ContactID, FirstName, LastName) values (11, 'Kayle', 'Clogg');
insert into Contact (ContactID, FirstName, LastName) values (12, 'Candide', 'Musselwhite');
insert into Contact (ContactID, FirstName, LastName) values (13, 'Tammara', 'Smeaton');
insert into Contact (ContactID, FirstName, LastName) values (14, 'Robinia', 'Westbrook');
insert into Contact (ContactID, FirstName, LastName) values (15, 'Galvin', 'Walch');
insert into Contact (ContactID, FirstName, LastName) values (16, 'Murial', 'Muggeridge');
insert into Contact (ContactID, FirstName, LastName) values (17, 'Christine', 'Longstaff');
insert into Contact (ContactID, FirstName, LastName) values (18, 'Lilyan', 'Brucker');
insert into Contact (ContactID, FirstName, LastName) values (19, 'Darryl', 'Westmoreland');
insert into Contact (ContactID, FirstName, LastName) values (20, 'Karoline', 'Gimson');
insert into Contact (ContactID, FirstName, LastName) values (21, 'Olga', 'Bracher');
insert into Contact (ContactID, FirstName, LastName) values (22, 'Katheryn', 'Mosconi');
insert into Contact (ContactID, FirstName, LastName) values (23, 'Fayth', 'Cremin');
insert into Contact (ContactID, FirstName, LastName) values (24, 'Lora', 'Ivakhin');
insert into Contact (ContactID, FirstName, LastName) values (25, 'Robinetta', 'Degoe');
insert into Contact (ContactID, FirstName, LastName) values (26, 'Jean', 'Babonau');
insert into Contact (ContactID, FirstName, LastName) values (27, 'Cherilynn', 'Ralph');
insert into Contact (ContactID, FirstName, LastName) values (28, 'Daphna', 'Witcher');
insert into Contact (ContactID, FirstName, LastName) values (29, 'Vannie', 'Cape');
insert into Contact (ContactID, FirstName, LastName) values (30, 'Corbin', 'Whatsize');
insert into Contact (ContactID, FirstName, LastName) values (31, 'Benson', 'Grisenthwaite');
insert into Contact (ContactID, FirstName, LastName) values (32, 'Billy', 'Cuell');
insert into Contact (ContactID, FirstName, LastName) values (33, 'Monah', 'Danell');
insert into Contact (ContactID, FirstName, LastName) values (34, 'Marlowe', 'Havercroft');
insert into Contact (ContactID, FirstName, LastName) values (35, 'Marylynne', 'MacFall');
insert into Contact (ContactID, FirstName, LastName) values (36, 'Grazia', 'Korlat');
insert into Contact (ContactID, FirstName, LastName) values (37, 'Micheil', 'Huby');
insert into Contact (ContactID, FirstName, LastName) values (38, 'Kalina', 'Ciepluch');
insert into Contact (ContactID, FirstName, LastName) values (39, 'Aleece', 'Barclay');
insert into Contact (ContactID, FirstName, LastName) values (40, 'Samuel', 'Dunklee');
insert into Contact (ContactID, FirstName, LastName) values (41, 'Odell', 'Colkett');
insert into Contact (ContactID, FirstName, LastName) values (42, 'Lucinda', 'Eddies');
insert into Contact (ContactID, FirstName, LastName) values (43, 'Kore', 'Ferreiro');
insert into Contact (ContactID, FirstName, LastName) values (44, 'Peyton', 'Barwood');
insert into Contact (ContactID, FirstName, LastName) values (45, 'Livy', 'Duley');
insert into Contact (ContactID, FirstName, LastName) values (46, 'Zilvia', 'Lough');
insert into Contact (ContactID, FirstName, LastName) values (47, 'Darb', 'Dellenbrook');
insert into Contact (ContactID, FirstName, LastName) values (48, 'Gwyn', 'Prandy');
insert into Contact (ContactID, FirstName, LastName) values (49, 'Sid', 'Sapsforde');
insert into Contact (ContactID, FirstName, LastName) values (50, 'Nickie', 'Fullicks');
insert into Contact (ContactID, FirstName, LastName) values (51, 'Peggi', 'Bountiff');
insert into Contact (ContactID, FirstName, LastName) values (52, 'Halsy', 'Davidove');
insert into Contact (ContactID, FirstName, LastName) values (53, 'Kelvin', 'Dallmann');
insert into Contact (ContactID, FirstName, LastName) values (54, 'Erastus', 'Ezele');
insert into Contact (ContactID, FirstName, LastName) values (55, 'Di', 'Enoksson');
insert into Contact (ContactID, FirstName, LastName) values (56, 'Emylee', 'Shelbourne');
insert into Contact (ContactID, FirstName, LastName) values (57, 'Guido', 'Shildrick');
insert into Contact (ContactID, FirstName, LastName) values (58, 'Molly', 'Wagg');
insert into Contact (ContactID, FirstName, LastName) values (59, 'Idelle', 'Augur');
insert into Contact (ContactID, FirstName, LastName) values (60, 'Clint', 'Quilter');
insert into Contact (ContactID, FirstName, LastName) values (61, 'Riki', 'Eyam');
insert into Contact (ContactID, FirstName, LastName) values (62, 'Carter', 'Tabourier');
insert into Contact (ContactID, FirstName, LastName) values (63, 'Kathryne', 'Yea');
insert into Contact (ContactID, FirstName, LastName) values (64, 'Gratiana', 'Alfonsetti');
insert into Contact (ContactID, FirstName, LastName) values (65, 'Kerk', 'Lepoidevin');
insert into Contact (ContactID, FirstName, LastName) values (66, 'Claudine', 'Baudy');
insert into Contact (ContactID, FirstName, LastName) values (67, 'Trixi', 'Pearsall');
insert into Contact (ContactID, FirstName, LastName) values (68, 'Anna-diane', 'Youson');
insert into Contact (ContactID, FirstName, LastName) values (69, 'Goddart', 'Follet');
insert into Contact (ContactID, FirstName, LastName) values (70, 'Henryetta', 'Denyukin');
insert into Contact (ContactID, FirstName, LastName) values (71, 'Laverna', 'Barkly');
insert into Contact (ContactID, FirstName, LastName) values (72, 'Lisbeth', 'Mardle');
insert into Contact (ContactID, FirstName, LastName) values (73, 'Marketa', 'Mattisssen');
insert into Contact (ContactID, FirstName, LastName) values (74, 'Ivor', 'MacTrustram');
insert into Contact (ContactID, FirstName, LastName) values (75, 'Margareta', 'Sivyer');
insert into Contact (ContactID, FirstName, LastName) values (76, 'Gael', 'Casper');
insert into Contact (ContactID, FirstName, LastName) values (77, 'Aggy', 'Formigli');
insert into Contact (ContactID, FirstName, LastName) values (78, 'Floyd', 'Blaske');
insert into Contact (ContactID, FirstName, LastName) values (79, 'Valentine', 'Patrono');
insert into Contact (ContactID, FirstName, LastName) values (80, 'Binky', 'O''Shevlan');
insert into Contact (ContactID, FirstName, LastName) values (81, 'Tailor', 'Jiracek');
insert into Contact (ContactID, FirstName, LastName) values (82, 'Roda', 'Matteoli');
insert into Contact (ContactID, FirstName, LastName) values (83, 'Farrel', 'Wooderson');
insert into Contact (ContactID, FirstName, LastName) values (84, 'Sara', 'Turn');
insert into Contact (ContactID, FirstName, LastName) values (85, 'Johnette', 'Morrel');
insert into Contact (ContactID, FirstName, LastName) values (86, 'Westley', 'Lagde');
insert into Contact (ContactID, FirstName, LastName) values (87, 'Cinda', 'Grady');
insert into Contact (ContactID, FirstName, LastName) values (88, 'Harwell', 'Coots');
insert into Contact (ContactID, FirstName, LastName) values (89, 'Julianna', 'Husher');
insert into Contact (ContactID, FirstName, LastName) values (90, 'Marylynne', 'Bosence');
insert into Contact (ContactID, FirstName, LastName) values (91, 'Amos', 'Keenan');
insert into Contact (ContactID, FirstName, LastName) values (92, 'Orrin', 'Meeron');
insert into Contact (ContactID, FirstName, LastName) values (93, 'Dan', 'Roberds');
insert into Contact (ContactID, FirstName, LastName) values (94, 'Karlis', 'Plaide');
insert into Contact (ContactID, FirstName, LastName) values (95, 'Carter', 'Burfield');
insert into Contact (ContactID, FirstName, LastName) values (96, 'Deny', 'Edelheit');
insert into Contact (ContactID, FirstName, LastName) values (97, 'Debor', 'Sandiland');
insert into Contact (ContactID, FirstName, LastName) values (98, 'Violet', 'Dalman');
insert into Contact (ContactID, FirstName, LastName) values (99, 'Dorie', 'McGuirk');
insert into Contact (ContactID, FirstName, LastName) values (100, 'Benedikt', 'Vaughan-Hughes');

--Populate Sales Orders table
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (1, 20, 9, 8, 3);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (2, 3, 5, 20, 7);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (3, 20, 5, 23, 56);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (4, 13, 2, 10, 43);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (5, 1, 1, 6, 56);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (6, 13, 10, 4, 57);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (7, 14, 8, 11, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (8, 5, 14, 24, 43);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (9, 20, 7, 10, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (10, 5, 1, 18, 66);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (11, 6, 11, 8, 25);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (12, 3, 11, 6, 20);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (13, 8, 7, 4, 36);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (14, 15, 10, 20, 9);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (15, 12, 10, 3, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (16, 8, 8, 3, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (17, 20, 3, 15, 75);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (18, 6, 6, 12, 47);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (19, 18, 6, 8, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (20, 19, 14, 16, 40);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (21, 14, 14, 20, 74);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (22, 8, 7, 17, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (23, 1, 8, 12, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (24, 3, 4, 9, 11);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (25, 3, 11, 3, 64);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (26, 3, 15, 5, 14);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (27, 4, 7, 19, 11);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (28, 7, 9, 19, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (29, 5, 1, 11, 3);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (30, 10, 4, 2, 4);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (31, 1, 12, 7, 51);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (32, 18, 6, 6, 14);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (33, 16, 13, 23, 29);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (34, 9, 15, 7, 55);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (35, 6, 8, 2, 2);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (36, 19, 9, 1, 6);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (37, 4, 12, 2, 40);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (38, 6, 7, 4, 58);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (39, 15, 9, 12, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (40, 16, 8, 15, 70);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (41, 7, 7, 4, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (42, 13, 10, 25, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (43, 8, 13, 6, 20);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (44, 8, 1, 9, 28);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (45, 4, 10, 15, 18);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (46, 9, 15, 25, 62);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (47, 12, 15, 21, 10);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (48, 19, 6, 17, 57);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (49, 13, 3, 1, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (50, 10, 2, 19, 7);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (51, 20, 13, 20, 27);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (52, 11, 11, 3, 49);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (53, 12, 15, 23, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (54, 8, 1, 13, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (55, 13, 6, 19, 38);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (56, 2, 12, 12, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (57, 1, 4, 25, 25);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (58, 19, 15, 6, 23);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (59, 17, 11, 22, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (60, 18, 1, 7, 2);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (61, 8, 3, 20, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (62, 20, 14, 16, 23);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (63, 3, 12, 14, 17);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (64, 19, 14, 1, 42);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (65, 11, 11, 21, 41);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (66, 10, 10, 25, 14);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (67, 4, 11, 5, 59);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (68, 5, 7, 12, 9);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (69, 13, 13, 15, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (70, 2, 14, 25, 60);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (71, 16, 13, 2, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (72, 12, 15, 12, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (73, 1, 7, 25, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (74, 15, 6, 1, 31);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (75, 11, 3, 23, 31);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (76, 9, 6, 19, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (77, 17, 1, 3, 74);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (78, 13, 2, 22, 13);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (79, 3, 3, 21, 38);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (80, 9, 1, 3, 1);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (81, 7, 3, 5, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (82, 18, 6, 23, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (83, 4, 2, 19, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (84, 2, 7, 6, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (85, 17, 10, 17, 61);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (86, 8, 2, 23, 30);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (87, 12, 14, 20, 33);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (88, 1, 4, 21, 34);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (89, 14, 6, 24, 23);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (90, 9, 8, 1, 22);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (91, 5, 3, 14, 61);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (92, 19, 13, 12, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (93, 12, 3, 14, 40);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (94, 12, 8, 10, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (95, 9, 2, 22, 50);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (96, 9, 7, 17, 50);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (97, 10, 13, 4, 20);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (98, 5, 8, 8, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (99, 4, 9, 22, 60);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (100, 11, 14, 6, 2);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (101, 16, 13, 25, 2);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (102, 16, 11, 11, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (103, 11, 6, 23, 48);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (104, 1, 3, 12, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (105, 14, 14, 20, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (106, 4, 11, 7, 42);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (107, 12, 11, 14, 68);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (108, 12, 8, 7, 6);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (109, 6, 12, 18, 8);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (110, 10, 11, 25, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (111, 14, 11, 2, 37);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (112, 7, 1, 12, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (113, 13, 5, 17, 75);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (114, 20, 12, 8, 3);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (115, 4, 4, 11, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (116, 4, 5, 3, 21);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (117, 20, 1, 19, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (118, 1, 15, 6, 6);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (119, 20, 6, 24, 50);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (120, 18, 13, 15, 66);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (121, 15, 3, 4, 54);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (122, 1, 9, 21, 34);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (123, 7, 1, 13, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (124, 20, 6, 17, 49);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (125, 19, 3, 22, 42);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (126, 14, 12, 7, 45);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (127, 16, 15, 7, 42);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (128, 8, 1, 23, 29);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (129, 17, 5, 7, 25);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (130, 12, 12, 6, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (131, 13, 14, 10, 68);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (132, 12, 9, 16, 55);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (133, 6, 14, 18, 58);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (134, 15, 13, 10, 60);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (135, 13, 2, 21, 20);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (136, 6, 10, 7, 26);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (137, 1, 11, 5, 45);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (138, 5, 8, 10, 21);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (139, 3, 4, 9, 36);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (140, 10, 4, 11, 41);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (141, 20, 2, 21, 27);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (142, 10, 6, 19, 48);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (143, 14, 15, 4, 74);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (144, 1, 6, 17, 37);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (145, 19, 7, 25, 35);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (146, 11, 1, 20, 75);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (147, 18, 15, 13, 30);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (148, 8, 6, 5, 19);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (149, 8, 9, 22, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (150, 6, 14, 5, 30);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (151, 16, 4, 20, 6);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (152, 10, 1, 7, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (153, 13, 8, 21, 1);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (154, 7, 2, 15, 15);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (155, 12, 14, 5, 64);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (156, 8, 13, 7, 1);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (157, 1, 11, 11, 58);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (158, 20, 1, 10, 68);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (159, 9, 12, 5, 5);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (160, 11, 5, 25, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (161, 1, 4, 7, 1);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (162, 19, 7, 6, 74);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (163, 7, 13, 24, 11);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (164, 14, 2, 6, 42);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (165, 8, 5, 22, 70);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (166, 8, 9, 18, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (167, 20, 3, 24, 66);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (168, 14, 12, 21, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (169, 6, 5, 4, 14);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (170, 14, 2, 18, 48);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (171, 11, 10, 17, 55);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (172, 16, 3, 23, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (173, 9, 9, 9, 51);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (174, 15, 5, 7, 59);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (175, 7, 7, 25, 9);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (176, 13, 7, 6, 15);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (177, 5, 2, 7, 58);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (178, 1, 9, 17, 64);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (179, 8, 14, 19, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (180, 10, 6, 2, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (181, 1, 5, 2, 21);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (182, 18, 5, 1, 45);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (183, 14, 14, 1, 66);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (184, 19, 6, 17, 35);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (185, 7, 5, 11, 70);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (186, 7, 4, 11, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (187, 10, 8, 18, 59);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (188, 10, 5, 2, 48);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (189, 3, 15, 4, 26);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (190, 2, 13, 21, 6);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (191, 11, 7, 15, 17);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (192, 13, 6, 2, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (193, 11, 7, 14, 64);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (194, 19, 12, 4, 69);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (195, 13, 10, 13, 24);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (196, 19, 7, 7, 24);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (197, 6, 1, 9, 38);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (198, 19, 3, 19, 7);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (199, 14, 12, 7, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (200, 9, 2, 21, 55);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (201, 14, 6, 25, 48);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (202, 2, 4, 12, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (203, 8, 10, 12, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (204, 9, 12, 2, 65);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (205, 1, 6, 19, 50);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (206, 11, 13, 14, 60);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (207, 6, 11, 7, 35);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (208, 7, 10, 7, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (209, 10, 10, 7, 61);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (210, 17, 14, 1, 5);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (211, 4, 1, 12, 74);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (212, 11, 11, 7, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (213, 10, 8, 12, 4);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (214, 11, 3, 25, 33);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (215, 12, 8, 17, 65);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (216, 13, 10, 9, 25);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (217, 8, 13, 25, 17);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (218, 3, 7, 13, 2);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (219, 9, 10, 1, 24);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (220, 6, 2, 12, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (221, 14, 8, 20, 11);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (222, 16, 4, 5, 20);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (223, 16, 1, 10, 10);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (224, 13, 2, 15, 23);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (225, 6, 8, 18, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (226, 20, 6, 25, 2);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (227, 9, 12, 9, 16);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (228, 7, 15, 21, 60);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (229, 17, 14, 12, 44);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (230, 9, 5, 21, 45);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (231, 14, 3, 24, 44);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (232, 1, 1, 15, 44);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (233, 9, 2, 14, 44);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (234, 19, 14, 25, 27);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (235, 18, 8, 22, 8);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (236, 12, 5, 21, 6);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (237, 12, 11, 2, 51);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (238, 1, 2, 19, 58);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (239, 5, 15, 22, 23);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (240, 17, 7, 16, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (241, 6, 10, 2, 15);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (242, 2, 13, 3, 8);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (243, 19, 13, 9, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (244, 15, 10, 5, 30);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (245, 11, 5, 7, 45);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (246, 4, 9, 3, 23);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (247, 6, 1, 5, 67);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (248, 17, 6, 11, 72);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (249, 11, 14, 8, 28);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (250, 6, 1, 4, 52);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (251, 5, 14, 6, 47);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (252, 12, 15, 2, 47);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (253, 10, 10, 8, 57);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (254, 20, 11, 14, 12);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (255, 20, 14, 13, 29);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (256, 12, 2, 9, 36);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (257, 3, 7, 2, 63);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (258, 15, 15, 1, 18);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (259, 18, 11, 10, 18);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (260, 10, 12, 15, 37);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (261, 5, 6, 10, 14);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (262, 15, 2, 12, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (263, 14, 11, 16, 12);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (264, 15, 1, 6, 47);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (265, 7, 6, 13, 36);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (266, 14, 15, 24, 47);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (267, 19, 15, 8, 5);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (268, 20, 3, 9, 62);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (269, 19, 15, 12, 59);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (270, 14, 11, 17, 54);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (271, 6, 14, 25, 7);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (272, 1, 4, 6, 11);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (273, 13, 4, 15, 42);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (274, 6, 2, 4, 48);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (275, 9, 12, 15, 54);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (276, 14, 6, 11, 34);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (277, 9, 14, 20, 70);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (278, 3, 7, 17, 72);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (279, 2, 10, 18, 13);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (280, 19, 9, 15, 30);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (281, 5, 8, 4, 17);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (282, 7, 11, 4, 54);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (283, 4, 10, 5, 33);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (284, 15, 1, 14, 39);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (285, 1, 5, 6, 58);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (286, 9, 5, 10, 66);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (287, 17, 9, 13, 53);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (288, 12, 6, 5, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (289, 6, 5, 18, 8);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (290, 13, 10, 7, 17);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (291, 19, 2, 22, 32);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (292, 14, 5, 16, 20);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (293, 13, 3, 14, 51);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (294, 7, 9, 8, 74);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (295, 19, 3, 17, 70);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (296, 8, 2, 12, 22);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (297, 7, 10, 7, 62);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (298, 3, 7, 11, 22);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (299, 5, 10, 7, 46);
insert into SalesOrder (SalesOrderID, OrderQty, ProductID, SalesEmployeesID, CustomerID) values (300, 17, 6, 18, 26);


--QUERIES
SELECT * FROM Product;
SELECT * FROM ProductCategory;
SELECT * FROM ProductSubcategory;
SELECT * FROM PetCategory;
SELECT * FROM SalesOrder;
SELECT * FROM Customer;
SELECT * FROM Territory;
SELECT * FROM SalesEmployees;
SELECT * FROM Contact;

GO