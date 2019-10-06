/*
Purchase Request System Database aka "prs" for class with some test data for each table.
OWNER: Christian Bravo
*/

drop database if exists prs;
create database prs;
use prs;


create table User (
	ID 				int				not null auto_increment,
	UserName 		varchar(20) 	not null,
	Password 		varchar(10) 	not null,
	FirstName       varchar(20) 	not null,
    LastName        varchar(20) 	not null,
	PhoneNumber 	varchar(12) 	not null,
    Email 			varchar(75) 	not null,
    IsReviewer 		tinyint 		not null, 
    IsAdmin 		tinyint 		not null,
    
    -- I am following the convention I found online on MySQL and W3 schools, primary key listed below with other constraints vs above.
    PRIMARY KEY (ID),
    CONSTRAINT uname unique (UserName)

);

create table Vendor (
	ID 				int 			not null auto_increment,
	Code 			varchar(10) 	not null,
	Name 			varchar(255) 	not null,
	Address       	varchar(255) 	not null,
    City        	varchar(255) 	not null,
	State 			varchar(2) 		not null,
    Zip 			varchar(5) 		not null,
    PhoneNumber 	varchar(12) 	not null, 
    Email 			varchar(100) 	not null,
    
    PRIMARY KEY (ID),
    CONSTRAINT vcode unique (Code)
    
);


create table Request (
	ID 						int 			not null auto_increment,
	UserID 					int 			not null,
	Description 			varchar(255) 	not null,
	Justification       	varchar(255) 	not null,
    DateNeeded        		varchar(255) 	not null,
	DeliveryMode 			varchar(2) 		not null,
    Status 					varchar(5) 		not null,
    Total 					varchar(12) 	not null, 
    SubmittedDate 			varchar(100) 	not null,
    ReasonForRejection		varchar(100) 	, 
    
   PRIMARY KEY (ID),
   FOREIGN KEY (UserID) REFERENCES User (ID)
    
);

create table Product (

	ID 						int 				not null auto_increment,
	VendorID 				int			 		not null,
	PartNumber 				varchar(50) 		not null,
	Name       				varchar(150) 		not null,
    Price        			decimal(10,2) 		not null,
	Unit 					varchar(255) 		,
    PhotoPath 				varchar(255) 		,
    
    PRIMARY KEY (ID),
    FOREIGN KEY (VendorID) REFERENCES Vendor(ID),
    CONSTRAINT vendor_part unique (VendorID, PartNumber)
    
);

create table LineItem (

	ID 						int 		not null auto_increment,
	RequestID 				int			not null,
	ProductID				int 		not null,
	Quantity       			int 		not null,
        
    PRIMARY KEY (ID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID),
    FOREIGN KEY (RequestID) REFERENCES Request(ID),
    CONSTRAINT req_pdt unique (RequestID, ProductID)
    
);


DROP USER IF EXISTS prs_db_user@localhost;
CREATE USER prs_db_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_db_user@localhost;



-- Test Data for Each table to use later for queries. 

Insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
values 	(1,'godzilla', 'gojira', 'Go','Jira', '859 803 4588', 'zilla@gmail.com', '1','1'),
		(2,'mothra', 'kaiju', 'Mo', 'Thra' ,'513 456 7899', 'mo@yahoo.com', '0','0');

Insert into Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
values 	(1,'SR001', 'Rope Inc', '234 Soapy Blvd', 'Redmond', 'WA', '40345', '859 444 8888', 'SOP@live.com'),
		(2,'BB001', 'BB LLP', '111 Blu Blvd', 'Philadelphia', 'PA', '80134', '859 111 1111', 'BB@yahoo.com');

Insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
values 	(1,1, '222', 'Soap On Rope','9.99', '1 per box', null),
		(2,2, '333', 'Blu Blockers', '19.99','2 per box', 'https://www.amazon.com/Official-BluBlocker-Black-Aviator-Sunglasses/dp/B00DE0MWAY');

Insert into Request (ID, UserID, Description, Justification, DateNeeded, DeliveryMode, Status, Total, SubmittedDate, ReasonForRejection)
values 	(1,1, 'New employee 1', 'new hire', '2019-10-23', 'PU', 'ACPTD', '29.98','2019-10-01', ''),
		(2,2, 'New employee 2', 'new hire', '2019-10-19', 'DO', 'RJCTD', '29.98', '2019-10-05', 'no soap for you');

Insert into LineItem (ID, RequestID, ProductID, Quantity)
values 	(1,1, 1, 1),
		(2,1, 2, 1),
        (3,2, 1, 1),
		(4,2, 2, 1);

       
