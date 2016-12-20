USE melfers
GO

--Question 1
SELECT *
FROM dbo.Book INNER JOIN dbo.BookCopies
ON Book.BookID = BookCopies.BookID
INNER JOIN dbo.LibraryBranch AS LB
ON LB.BranchID = BookCopies.BranchID
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'

--Question 2

SELECT *
FROM dbo.Book INNER JOIN dbo.BookCopies
ON Book.BookID = BookCopies.BookID
INNER JOIN dbo.LibraryBranch AS LB
ON LB.BranchID = BookCopies.BranchID
WHERE Title = 'The Lost Tribe'

--Question 3

SELECT Bor.Name, BL.DateOut
FROM dbo.Borrower AS Bor LEFT OUTER JOIN dbo.BookLoans AS BL
ON Bor.CardNo = BL.CardNo
WHERE BL.DateOut IS NULL

--Question 4

SELECT Bk.Title, BL.DueDate, Bor.Name, LB.BranchName, Bor.bor_Address
FROM dbo.BookLoans AS BL INNER JOIN dbo.LibraryBranch AS LB
ON BL.BranchID = LB.BranchID
INNER JOIN dbo.Borrower AS Bor
ON BL.CardNo = Bor.CardNo
INNER JOIN dbo.Book AS Bk
ON BL.BookID = Bk.BookID
WHERE LB.BranchName = 'Sharpstown' AND BL.DueDate = '2016-09-02'

--Question 5

SELECT COUNT (LB.BranchName) AS BooksPerBranch
FROM dbo.LibraryBranch AS LB INNER JOIN dbo.BookLoans as BL
ON LB.BranchID = BL.BranchID
GROUP BY LB.BranchName

--Question 6

SELECT COUNT (Bor.CardNo) AS NumberLoaned, Bor.Name, Bor_Address
FROM dbo.Borrower AS Bor INNER JOIN dbo.BookLoans AS BL
ON Bor.CardNo = BL.CardNo
GROUP BY Bor.Name, Bor_Address
HAVING COUNT (Bor.CardNo) > 5


SELECT Bor.Name, Bor_Address
COUNT (DISTINCT(BL.CardNo)) AS NumberLoaned, Book.Title, BookLoans.BranchID
FROM dbo.BookLoans
FROM dbo.Borrower AS Bor INNER JOIN dbo.BookLoans AS BL
ON Bor.CardNo = BL.CardNo
GROUP BY Name

--Question 7

SELECT AuthorName, Title, BranchName, Copies
FROM dbo.BookAuthors AS BA INNER JOIN dbo.Book
ON BA.BookID = Book.BookID
INNER JOIN dbo.BookCopies AS BC
ON Book.BookID = BC.BookID
INNER JOIN dbo.LibraryBranch AS LB
ON BC.BranchID = LB.BranchID
Where AuthorName = 'Stephen King' AND BranchName = 'Central'

--Procedure

CREATE PROC GetTitlesByLocation @BranchName VARCHAR(50)
AS
SELECT Title, BranchName
FROM dbo.Book AS B INNER JOIN dbo.BookCopies as BC
ON B.BookID = BC.BookID
INNER JOIN dbo.LibraryBranch AS LB
ON BC.BranchID = LB.BranchID
WHERE BranchName = @BranchName 

EXEC GetTitlesByLocation 'Central'