CREATE TABLE retail.Dim_Date (
	Date Date PRIMARY KEY, 
	Year int NOT NULL, 
	Month_Sort int NOT NULL, 
	Month varchar(10) NOT NULL, 
	Day int NOT NULL,
	Day_Of_Week varchar(10) NOT NULL, 
	Quarter_Sort int NOT NULL, 
	Quarter varchar(10) NOT NULL
);

CREATE TABLE retail.Dim_Time (
	Time Time PRIMARY KEY, 
	Hour int NOT NULL, 
	Minute int NOT NULL, 
	AM_PM varchar(2) NOT NULL, 
	Second int NOT NULL
);

CREATE TABLE retail.Dim_Product (
	Product_Id bigint PRIMARY KEY, 
	Product_Code varchar(50) NOT NULL, 
	Product_Name varchar(100) NOT NULL, 
	Product_Category varchar(100)
);

create table retail.Dim_Region (
	Region_Id bigint primary key, 
	Region_Name varchar(100) not null, 
	Longitude float, 
	Latitude float
);

create table retail.Dim_Store (
	Store_Id bigint primary key, 
	Store_Name varchar(100) not null, 
	Region_Id bigint not null, 
	foreign key (Region_Id) references retail.Dim_Region(Region_Id)
);

CREATE TABLE retail.Dim_Customer (
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

create table retail.Fact_Inventory_Level (
	Inventory_Id bigint primary key, 
	Product_Id bigint not null, 
	Store_Id bigint not null, 
	Inventory_Date Date not null, 
	Relocation_Point smallint, 
	foreign key (Product_Id) references retail.Dim_Product(Product_Id), 
	foreign key (Store_Id) references retail.Dim_Store(Store_Id), 
	foreign key (Inventory_Date) references retail.Dim_Date(Date)
);

CREATE TABLE retail.Fact_Transaction (
	Transaction_Id bigint NOT NULL, 
	Transaction_Date Date NOT NULL, 
	Transaction_Time Time NOT NULL, 
	Customer_Id bigint NOT NULL,
	Store_Id bigint not null,
	Product_Id bigint NOT NULL, 
	Quantity_Sold numeric(10,2) NOT NULL, 
	Base_Price numeric (10,2) NOT NULL, 
	Discount numeric (10,2) DEFAULT 0,
	Discounted_Price numeric(10,2) NOT NULL, 
	Total_Amount numeric(10,2) NOT NULL, 
	Currency varchar(10) NOT NULL, 
	foreign key (Transaction_Date) REFERENCES retail.Dim_Date(Date), 
	foreign key (Transaction_Time) REFERENCES retail.Dim_Time(Time), 
	foreign key (Customer_Id) REFERENCES retail.Dim_Customer(Customer_Id), 
	foreign key (Product_Id) REFERENCES retail.Dim_Product(Product_Id), 
	foreign key (Store_Id) REFERENCES retail.Dim_Store(Store_Id)
);



