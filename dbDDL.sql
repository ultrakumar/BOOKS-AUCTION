CREATE TABLE USERS 
(Fname VARCHAR(20) NOT NULL,
Minit CHAR(5),
Lname VARCHAR(20) NOT NULL,
Address VARCHAR(50),
Sex CHAR(5), 
PhoneNo Number(15),
Email VARCHAR(20) NOT NULL,
NormalUserFlag CHAR(5),
AdminFlag CHAR(5),
UserID VARCHAR(20) NOT NULL,
PassWord VARCHAR(20) NOT NULL,
PRIMARY KEY (UserID));

CREATE TABLE DEPARTMENT
(DeptID NUMBER(10) NOT NULL,
Name VARCHAR(25),
PRIMARY KEY (DeptID));




CREATE TABLE BOOKS 
(BookID NUMBER(10) NOT NULL,
BookTitle VARCHAR(20) NOT NULL,
Description VARCHAR(50),
Author VARCHAR(25),
ISBN NUMBER(15) NOT NULL,
Volume NUMBER(10),
Price NUMBER(15) NOT NULL,
DateAdded Date,
BidingEndDate DATE,
DeptID NUMBER(10),
UserID VARCHAR(20),
PRIMARY KEY (BookID),
CONSTRAINT FK_USER_ID FOREIGN KEY(USERID) 
REFERENCES users(USERID));
alter table books
add CONSTRAINT FK_DEPT_ID FOREIGN KEY(DeptID)
REFERENCES DEPARTMENT(DEPTID);



CREATE TABLE BIDDING_DETAILS(
BidingUser VARCHAR(20), 
UserID VARCHAR(20),
BidingDate DATE,
Price NUMBER(10),
BookID NUMBER(10),
PRIMARY KEY (BidingUser));


CREATE TABLE BANKING_DETAILS(
BranchName CHAR(20) NOT NULL,
Name VARCHAR(20) NOT NULL,
Account_No VARCHAR(20) NOT NULL,
UserID VARCHAR(20),
PRIMARY KEY (Account_No),
constraint BANKING_DETAILS_fk_user_id FOREIGN KEY (UserID) REFERENCES USERs(UserID));




CREATE TABLE NOTIFICATION(
NotificationID VARCHAR(20) NOT NULL,
UserID VARCHAR(20),
RECEIVERID VARCHAR(20),
MESSAGE VARCHAR(150),
BookID NUMBER(10),
DatePosted DATE,
PRIMARY KEY (NotificationID),
constraint fk_book FOREIGN KEY (BookID) REFERENCES BOOKS(BookID));




CREATE TABLE FINALBIDDING(
BookID NUMBER(10) NOT NULL,
SellerID VARCHAR(20),
Price NUMBER(15),
ReceiverID VARCHAR(20),
BidPrice NUMBER(15),
DateBidded DATE,
MESSAGE VARCHAR(30),
PRIMARY KEY (BookID), 
constraint fk_bookid FOREIGN KEY (BookID) REFERENCES BOOKS(BookID));


CREATE TABLE PAYMENT(
BookID Number(10) NOT NULL,
PayCheckSentDate DATE,
PayCheckReceivedDate DATE,
BookPostedDate DATE,
UpsTrackingNo varchar(15) NOT NULL,
BookReceivedDate DATE,
PRIMARY KEY (UpsTrackingNo),
constraint fk_book1 FOREIGN KEY (BookID) REFERENCES BOOKS(BookID));






CREATE TABLE RATESERVICE
(BookID NUMBER(10)  NOT NULL,
SellerID VARCHAR(20) NOT NULL,
SellerRating NUMBER(5),
BuyerID VARCHAR(20) NOT NULL, 
BuyerRating NUMBER(5),
PRIMARY KEY (BookID),
constraint fk_book2 FOREIGN KEY(BookID) REFERENCES BOOKS(BookID));




 
 





