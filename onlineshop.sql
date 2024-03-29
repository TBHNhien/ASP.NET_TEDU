--USE [OnlineShop_Text]
--GO
--/****** Object:  Table [dbo].[Account]    Script Date: 22/01/2024 10:00:40 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Account](
--	[UserName] [varchar](20) NOT NULL,
--	[Password] [varchar](50) NULL,
--PRIMARY KEY CLUSTERED 
--(
--	[UserName] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--INSERT [dbo].[Account] ([UserName], [Password]) VALUES (N'admin@gmail.com', N'123')
--GO
--/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 22/01/2024 10:00:40 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE proc [dbo].[Sp_Account_Login] @UserName VARCHAR(20), @Password VARCHAR(50)
--AS 
--	BEGIN
--	Declare @count int 
--	Declare @res bit
--	select @count = count(*) from Account where UserName = @UserName and Password = @Password 
--	if @count > 0
--		set @res = 1
--	else
--		set @res = 0

--	select @res
--	END
--GO

--CREATE TABLE Category 
--(
--    ID INT IDENTITY(1,1) PRIMARY KEY,
--    Name NVARCHAR(50),
--    Alias VARCHAR(50),
--    ParentID INT,
--    CreatedDate DATETIME DEFAULT GETDATE(),
--    [Order] INT DEFAULT 0,
--    Status BIT DEFAULT 1
--);
--GO

--CREATE TABLE Product 
--(
--	ID INT PRIMARY KEY,
--	Name NVARCHAR(50) ,
--	Alias VARCHAR(50) ,
--	CategoryID INT    ,
--	Images NVARCHAR(250),
--	CreatedDate DATETIME DEFAULT GETDATE(),
--	Price decimal(18,0) ,
--	Detail NTEXT ,
--	Status bit ,
--	FOREIGN KEY (CategoryID) REFERENCES Category(ID)
--)
--GO

--CREATE PROC Sp_Category_ListAll
--AS
--	SELECT * FROM  Category where Status = 1
--	ORDER BY [Order] asc


CREATE PROC Sp_Category_Insert
	@Name NVARCHAR(50) ,
	@Alias NVARCHAR(50) ,
	@ParentID INT ,
	@Order INT ,
	@Status bit
AS 
	BEGIN
		INSERT INTO Category(Name , Alias , ParentID , CreatedDate , [Order] , Status)
		VALUES (@Name , @Alias , @ParentID , GETDATE() , @Order , @Status)
	END
GO






