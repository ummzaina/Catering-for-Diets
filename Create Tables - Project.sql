
-- Create Clients table
CREATE TABLE Client (
  Client_Id SERIAL PRIMARY KEY,
  Client_Type_Id INTEGER REFERENCES ClientType(Client_Type_Id),
  Client_Fname VARCHAR(100) NOT NULL,
  Client_Lname VARCHAR(100) NOT NULL,
  Client_Maritalstatus VARCHAR(20),
  Client_ContactNo_1 VARCHAR(20),
  Client_ContactNo_2 VARCHAR(20),
  Client_Email VARCHAR(100), 
  Client_Dateofbirth DATE,
  Client_Spousefnamelname VARCHAR(50),
  Client_Corp_Name VARCHAR(100)
	);

-- Create reference table for Client Type Lookup
CREATE TABLE ClientType (
  Client_Type_Id SERIAL PRIMARY KEY,
  Client_Type_Desc VARCHAR(100) NOT NULL
);
		
-- Create ClientAddress table showing instances of clients to address mapping with start and end dates
CREATE TABLE ClientAddress (
Client_Address_Id SERIAL PRIMARY KEY,
Client_Address_Client_Id INTEGER REFERENCES Client(Client_Id),
Client_Address_Address_Id INTEGER REFERENCES Address(Address_Id),
Client_Address_StartDate DATE NOT NULL,
Client_Address_EndDate DATE NOT NULL	
);
		
-- Create Address table which is all addresses
CREATE TABLE Address (
Address_Id SERIAL PRIMARY KEY,
Address_Type_Id INTEGER REFERENCES AddressType(Address_Type_Id),
Address_Line1 VARCHAR(100) NOT NULL,
Address_Line2 VARCHAR(100),
Address_PostalCode VARCHAR(10) NOT NULL,
Address_Province VARCHAR(5) NOT NULL,
Address_Notes VARCHAR(200)
);

-- Create reference table for Address Type Lookup
CREATE TABLE AddressType (
  Address_Type_Id SERIAL PRIMARY KEY,
  Address_Type_Desc VARCHAR(100)NOT NULL
);

-- Create Plan table to keep track of plan details and renewal behaviour
CREATE TABLE Plan (
  Plan_Id SERIAL PRIMARY KEY,
  Plan_Client_Id  INTEGER NOT NULL REFERENCES Client(Client_Id),
  Plan_Restriction_Id INTEGER NOT NULL REFERENCES PlanRestriction(Plan_Restriction_Id),
  Plan_Diet_Type_Id INTEGER NOT NULL REFERENCES PlanDietType(Plan_Diet_Type_Id),
  Plan_Status VARCHAR(50) NOT NULL,
  Plan_Freq VARCHAR(50) NOT NULL,
  Plan_Startdate DATE NOT NULL,
  Plan_Enddate DATE CHECK (Plan_Enddate >= Plan_Startdate) NOT NULL,
  Plan_Auto_Renew BIT NOT NULL,
  Plan_Price DECIMAL(10, 2) CHECK (Plan_Price >= 0) NOT NULL,
  Plan_Discount_Amt DECIMAL(10, 2),
  Plan_Discount_Per DECIMAL(10, 2),
  Plan_Delivery_Mode VARCHAR(50) NOT NULL
);

-- Create reference table for Plan Type Lookup
CREATE TABLE PlanDietType (
  Plan_Diet_Type_Id SERIAL PRIMARY KEY,
  Plan_Diet_Type_Desc VARCHAR(100)NOT NULL
);
	
-- Create reference table for Plan Restriction Lookup
CREATE TABLE PlanRestriction (
  Plan_Restriction_Id SERIAL PRIMARY KEY,
  Plan_Restriction_Desc VARCHAR(100)NOT NULL
);	

	
--Create Meal table that constiutes a specific meal for a plan
CREATE TABLE Meal (
  Meal_id SERIAL PRIMARY KEY,
  Meal_Plan_Id  INTEGER NOT NULL REFERENCES Plan(Plan_Id),
  Meal_Schedule_Id INTEGER NOT NULL REFERENCES MealSchedule(Meal_Schedule_Id),
  Meal_Menu_Item_Id INTEGER NOT NULL REFERENCES MenuItem(Menu_Item_Id),
  Meal_Menu_Item_Qty INTEGER NOT NULL
  );

-- Create Meal Schedule table to map the meal to a delivery schedule and maintain history with status
CREATE TABLE MealSchedule (
  Meal_Schedule_Id SERIAL PRIMARY KEY,
  Meal_Schedule_Delivery_Id INTEGER NOT NULL REFERENCES Delivery(Delivery_Id),
  Meal_Schedule_Status VARCHAR(50) NOT NULL,
  Meal_Schedule_PrepDate DATE,
  Meal_Schedule_Outdate DATE
  );

--Create Delivery table for all deliveries
CREATE TABLE Delivery (
  Delivery_Id SERIAL PRIMARY KEY,
  Delivery_Address_Id INTEGER REFERENCES Address(Address_Id),
  Delivery_PlanDate DATE,
  Delivery_DeliverDate DATE,
  Delivery_Status VARCHAR(50) NOT NULL 
);

	
--Create MenuItem table that constiutes a component of a specific meal
CREATE TABLE MenuItem (
  Menu_Item_Id SERIAL PRIMARY KEY,
  Menu_Item_Plan_Id INTEGER NOT NULL REFERENCES Plan(Plan_Id),
  Menu_Item_Desc VARCHAR(100) NOT NULL 
);

	












