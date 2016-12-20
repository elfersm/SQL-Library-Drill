USE melfers
GO

CREATE TABLE Book
(
BookID INT PRIMARY KEY NOT NULL,
Title varchar(100) NOT NULL,
PublisherName varchar(50) NULL
)

CREATE TABLE BookAuthors
(
BookID INT NOT NULL,
AuthorName varchar(100)
)

CREATE TABLE Publisher
(
PublisherName varchar(100) PRIMARY KEY NOT NULL,
pub_Address varchar(100),
Phone varchar(20)
)

CREATE TABLE BookCopies
(
BookID INT NOT NULL,
BranchID INT NOT NULL,
Copies INT
)

CREATE TABLE BookLoans
(
BookID INT NOT NULL,
BranchID INT,
CardNo INT NOT NULL,
DateOut INT,
DueDate INT
)

CREATE TABLE LibraryBranch
(
BranchID INT PRIMARY KEY NOT NULL,
BranchName varchar(50),
branch_Address varchar(100)
)

CREATE TABLE Borrower
(
CardNo INT PRIMARY KEY NOT NULL,
Name varchar(50),
bor_Address varchar(100),
Phone varchar(20)
)