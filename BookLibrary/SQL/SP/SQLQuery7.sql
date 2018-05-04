USE [BookLibrary]
GO
/****** Object:  StoredProcedure [dbo].[usp_NewBook]    Script Date: 5/1/2018 9:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.usp_NewBook @Title varchar(50),
@Author varchar(100),
@BookType nchar(10),
@numberOfPages int,
@publishDate date,
@Catagory varchar(10),
@Plot text,
@Summary text,
@Rating int,
@bookCover image
AS
BEGIN
  DECLARE @callNum int;
  DECLARE @Upper int;
  DECLARE @Lower int;
  DECLARE @Exist bit;

  ---- This will create a random number between 1 and 999
  SET @Lower = 1 ---- The lowest random number
  SET @Upper = 999 ---- The highest random number
  DECLARE @intFlag int

  WHILE (@Exist = 0)
   BEGIN
    SET @callNum = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower), 0)
    IF NOT EXISTS (SELECT TOP 1* FROM Books WHERE callNum = @callNum)
      SET @Exist = 1;
   END

   ---- Insert into book table
	INSERT INTO Books(callNum,Title,Author,BookType,numberOfPages,publishDate,Catagory)
	VALUES  (@callNum,@Title,@Author,@BookType,@numberOfPages,@publishDate,@Catagory)

	IF(@Plot IS NOT NULL OR @Summary IS NOT NULL)
		BEGIN
		 INSERT INTO BookPlot(callNum,Plot,Summary,Rating)
		 VALUES  (@callNum,@Plot,@Summary,@Rating)
		END

	IF(@bookCover IS NOT NULL)
		BEGIN
		 INSERT INTO BookImg(callNum,bookCover)
		 VALUES  (@callNum,@bookCover)
		END

END

