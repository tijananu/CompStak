CREATE TABLE dwh.Dim_Product (
	Product_Id bigint PRIMARY KEY, 
	Product_Code varchar(50) NOT NULL, 
	Product_Name varchar(100) NOT NULL, 
	Product_Category varchar(100), 
	Product_Colour varchar(100),
	Product_Size varchar(2), 
	Product_Collection varchar(100)
);

CREATE TABLE dwh.Dim_Status (
	Status_Id int PRIMARY KEY, 
	Status_Name varchar(100) NOT NULL
);

CREATE TABLE dwh.Dim_Promotion (
	Promotion_Id bigint PRIMARY KEY, 
	Promotion_Name varchar(100) NOT NULL
);

CREATE TABLE dwh.Dim_Customer (
	Customer_Id bigint PRIMARY KEY, 
	First_Name varchar(100) NOT NULL, 
	Last_Name varchar(100) NOT NULL, 
	Email varchar(100) NOT NULL, 
	Telephone varchar(20), 
	Postal_Code varchar(10), 
	State varchar(100), 
	City varchar(100), 
	Adress varchar(100),
	Customer_Type varchar(50)
);

CREATE TABLE dwh.Dim_Date (
	Date Date PRIMARY KEY, 
	Year int NOT NULL, 
	Month_Sort int NOT NULL, 
	Month varchar(10) NOT NULL, 
	Day int not null,
	Day_Of_Week varchar(10) NOT NULL, 
	Quarter_Sort int NOT NULL, 
	Quarter varchar(10) NOT NULL
);

CREATE TABLE dwh.Dim_Time (
	Time Time PRIMARY KEY, 
	Hour int NOT NULL, 
	Minute int NOT NULL, 
	AM_PM varchar(2) NOT NULL, 
	Second int NOT NULL
);

CREATE TABLE dwh.Fact_Transaction (
	Transaction_Id bigint NOT NULL, 
	Date Date NOT NULL, 
	Time Time NOT NULL, 
	Customer_Id bigint NOT NULL, 
	Product_Id bigint NOT NULL, 
	Quantity_Sold numeric(10,2) NOT NULL, 
	Base_Price numeric (10,2) NOT NULL, 
	Promotion_Id bigint NOT NULL, 
	Discount numeric (10,2) DEFAULT 0,
	Discounted_Price numeric(10,2) NOT NULL, 
	Total_Amount numeric(10,2) NOT NULL, 
	Currency varchar(10) NOT NULL, 
	Status_Id int NOT NULL, 
	foreign key (Date) REFERENCES dwh.Dim_Date(Date), 
	foreign key (Time) REFERENCES dwh.Dim_Time(Time), 
	foreign key (Customer_Id) REFERENCES dwh.Dim_Customer(Customer_Id), 
	foreign key (Product_Id) REFERENCES dwh.Dim_Product(Product_Id), 
	foreign key (Promotion_Id) REFERENCES dwh.Dim_Promotion(Promotion_Id), 
	foreign key (Status_Id) REFERENCES dwh.Dim_Status(Status_Id)
);
