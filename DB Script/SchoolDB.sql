USE [dbbtCARSAp1]
GO
/****** Object:  StoredProcedure [dbo].[SD_CourseGrade_GetStudentGrades]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_CourseGrade_GetStudentGrades]
            @StudentID int
            AS
            SELECT EnrollmentID, Grade FROM dbo.SD_CourseGrade
            WHERE StudentID = @StudentID



GO
/****** Object:  StoredProcedure [dbo].[SD_OfficeAssignment_DeleteOfficeAssignment]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_OfficeAssignment_DeleteOfficeAssignment]
		@InstructorID int
		AS
		DELETE FROM SD_OfficeAssignment
		WHERE InstructorID=@InstructorID;



GO
/****** Object:  StoredProcedure [dbo].[SD_OfficeAssignment_InsertOfficeAssignment]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_OfficeAssignment_InsertOfficeAssignment]
		@InstructorID int,
		@Location nvarchar(50)
		AS
		INSERT INTO dbo.SD_OfficeAssignment (InstructorID, Location)
		VALUES (@InstructorID, @Location);
		IF @@ROWCOUNT > 0
		BEGIN
			SELECT [Timestamp] FROM SD_OfficeAssignment 
				WHERE InstructorID=@InstructorID;
		END



GO
/****** Object:  StoredProcedure [dbo].[SD_OfficeAssignment_UpdateOfficeAssignment]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_OfficeAssignment_UpdateOfficeAssignment]
		@InstructorID int,
		@Location nvarchar(50),
		@OrigTimestamp timestamp
		AS
		UPDATE SD_OfficeAssignment SET Location=@Location 
		WHERE InstructorID=@InstructorID AND [Timestamp]=@OrigTimestamp;
		IF @@ROWCOUNT > 0
		BEGIN
			SELECT [Timestamp] FROM SD_OfficeAssignment 
				WHERE InstructorID=@InstructorID;
		END



GO
/****** Object:  StoredProcedure [dbo].[SD_Person_DeletePerson]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_Person_DeletePerson]
		@PersonID int
		AS
		DELETE FROM SD_Person WHERE PersonID = @PersonID;



GO
/****** Object:  StoredProcedure [dbo].[SD_Person_InsertPerson]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_Person_InsertPerson]
		@LastName nvarchar(50),
		@FirstName nvarchar(50),
		@HireDate datetime,
		@EnrollmentDate datetime
		AS
		INSERT INTO dbo.SD_Person (LastName, 
					FirstName, 
					HireDate, 
					EnrollmentDate)
		VALUES (@LastName, 
			@FirstName, 
			@HireDate, 
			@EnrollmentDate);
		SELECT SCOPE_IDENTITY() as NewPersonID;



GO
/****** Object:  StoredProcedure [dbo].[SD_Person_UpdatePerson]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SD_Person_UpdatePerson]
		@PersonID int,
		@LastName nvarchar(50),
		@FirstName nvarchar(50),
		@HireDate datetime,
		@EnrollmentDate datetime
		AS
		UPDATE SD_Person SET LastName=@LastName, 
				FirstName=@FirstName,
				HireDate=@HireDate,
				EnrollmentDate=@EnrollmentDate
		WHERE PersonID=@PersonID;



GO
/****** Object:  Table [dbo].[SD_Course]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_Course](
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Credits] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_School.Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_CourseGrade]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_CourseGrade](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Grade] [decimal](3, 2) NULL,
 CONSTRAINT [PK_CourseGrade] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_CourseInstructor]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_CourseInstructor](
	[CourseID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_Department]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_Department](
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Budget] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Administrator] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_OfficeAssignment]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_OfficeAssignment](
	[InstructorID] [int] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_OfficeAssignment] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_OnlineCourse]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_OnlineCourse](
	[CourseID] [int] NOT NULL,
	[URL] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_OnlineCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_OnsiteCourse]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_OnsiteCourse](
	[CourseID] [int] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Days] [nvarchar](50) NOT NULL,
	[Time] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_OnsiteCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_Person]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[HireDate] [datetime] NULL,
	[EnrollmentDate] [datetime] NULL,
 CONSTRAINT [PK_School.Student] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_Student]    Script Date: 9/18/2016 8:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_Student](
	[PersonID] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_SD_Student] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1045, N'Calculus', 4, 7)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1050, N'Chemistry', 4, 1)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1061, N'Physics', 4, 1)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2021, N'Composition', 3, 2)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2030, N'Poetry', 2, 2)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2042, N'Literature', 4, 2)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (3141, N'Trigonometry', 4, 7)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4022, N'Microeconomics', 3, 4)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4041, N'Macroeconomics', 3, 4)
INSERT [dbo].[SD_Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4061, N'Quantitative', 2, 4)
SET IDENTITY_INSERT [dbo].[SD_CourseGrade] ON 

INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (1, 2021, 2, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (2, 2030, 2, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (3, 2021, 3, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (4, 2030, 3, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (5, 2021, 6, CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (6, 2042, 6, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (7, 2021, 7, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (8, 2042, 7, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (9, 2021, 8, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (10, 2042, 8, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (11, 4041, 9, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (12, 4041, 10, NULL)
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (13, 4041, 11, CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (14, 4041, 12, NULL)
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (15, 4061, 12, NULL)
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (16, 4022, 14, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (17, 4022, 13, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (18, 4061, 13, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (19, 4041, 14, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (20, 4022, 15, CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (21, 4022, 16, CAST(2.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (22, 4022, 17, NULL)
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (23, 4022, 19, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (24, 4061, 20, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (25, 4061, 21, CAST(2.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (26, 4022, 22, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (27, 4041, 22, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (28, 4061, 22, CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (29, 4022, 23, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (30, 1045, 23, CAST(1.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (31, 1061, 24, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (32, 1061, 25, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (33, 1050, 26, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (34, 1061, 26, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (35, 1061, 27, CAST(3.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (36, 1045, 28, CAST(2.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (37, 1050, 28, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (38, 1061, 29, CAST(4.00 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (39, 1050, 30, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[SD_CourseGrade] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (40, 1061, 30, CAST(4.00 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[SD_CourseGrade] OFF
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (1045, 5)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (1050, 1)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (1061, 31)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (2021, 27)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (2030, 4)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (2042, 25)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (4022, 18)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (4041, 32)
INSERT [dbo].[SD_CourseInstructor] ([CourseID], [PersonID]) VALUES (4061, 34)
INSERT [dbo].[SD_Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (1, N'Engineering', 350000.0000, CAST(0x0000999C00000000 AS DateTime), 2)
INSERT [dbo].[SD_Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (2, N'English', 120000.0000, CAST(0x0000999C00000000 AS DateTime), 6)
INSERT [dbo].[SD_Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (4, N'Economics', 200000.0000, CAST(0x0000999C00000000 AS DateTime), 4)
INSERT [dbo].[SD_Department] ([DepartmentID], [Name], [Budget], [StartDate], [Administrator]) VALUES (7, N'Mathematics', 250000.0000, CAST(0x0000999C00000000 AS DateTime), 3)
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (1, N'17 Smith')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (4, N'29 Adams')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (5, N'37 Williams')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (18, N'143 Smith')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (25, N'57 Adams')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (27, N'271 Williams')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (31, N'131 Smith')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (32, N'203 Williams')
INSERT [dbo].[SD_OfficeAssignment] ([InstructorID], [Location]) VALUES (34, N'213 Smith')
INSERT [dbo].[SD_OnlineCourse] ([CourseID], [URL]) VALUES (2021, N'http://www.fineartschool.net/Composition')
INSERT [dbo].[SD_OnlineCourse] ([CourseID], [URL]) VALUES (2030, N'http://www.fineartschool.net/Poetry')
INSERT [dbo].[SD_OnlineCourse] ([CourseID], [URL]) VALUES (3141, N'http://www.fineartschool.net/Trigonometry')
INSERT [dbo].[SD_OnlineCourse] ([CourseID], [URL]) VALUES (4041, N'http://www.fineartschool.net/Macroeconomics')
INSERT [dbo].[SD_OnsiteCourse] ([CourseID], [Location], [Days], [Time]) VALUES (1045, N'121 Smith', N'MWHF', CAST(0x000003A2 AS SmallDateTime))
INSERT [dbo].[SD_OnsiteCourse] ([CourseID], [Location], [Days], [Time]) VALUES (1050, N'123 Smith', N'MTWH', CAST(0x000002B2 AS SmallDateTime))
INSERT [dbo].[SD_OnsiteCourse] ([CourseID], [Location], [Days], [Time]) VALUES (1061, N'234 Smith', N'TWHF', CAST(0x0000031B AS SmallDateTime))
INSERT [dbo].[SD_OnsiteCourse] ([CourseID], [Location], [Days], [Time]) VALUES (2042, N'225 Adams', N'MTWH', CAST(0x00000294 AS SmallDateTime))
INSERT [dbo].[SD_OnsiteCourse] ([CourseID], [Location], [Days], [Time]) VALUES (4022, N'23 Williams', N'MWF', CAST(0x0000021C AS SmallDateTime))
INSERT [dbo].[SD_OnsiteCourse] ([CourseID], [Location], [Days], [Time]) VALUES (4061, N'22 Williams', N'TH', CAST(0x000002A3 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SD_Person] ON 

INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (1, N'Abercrombie', N'Kim', CAST(0x000087CF00000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (2, N'Barzdukas', N'Gytis', NULL, CAST(0x000096C200000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (3, N'Justice', N'Peggy', NULL, CAST(0x0000910D00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (4, N'Fakhouri', N'Fadi', CAST(0x0000926000000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (5, N'Harui', N'Roger', CAST(0x00008C8700000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (6, N'Li', N'Yan', NULL, CAST(0x0000927A00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (7, N'Norman', N'Laura', NULL, CAST(0x000093E700000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (8, N'Olivotto', N'Nino', NULL, CAST(0x000096C200000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (9, N'Tang', N'Wayne', NULL, CAST(0x000096C200000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (10, N'Alonso', N'Meredith', NULL, CAST(0x0000927A00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (11, N'Lopez', N'Sophia', NULL, CAST(0x0000955500000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (12, N'Browning', N'Meredith', NULL, CAST(0x00008FA000000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (13, N'Anand', N'Arturo', NULL, CAST(0x000093E700000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (14, N'Walker', N'Alexandra', NULL, CAST(0x00008FA000000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (15, N'Powell', N'Carson', NULL, CAST(0x0000955500000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (16, N'Jai', N'Damien', NULL, CAST(0x0000910D00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (17, N'Carlson', N'Robyn', NULL, CAST(0x000096C200000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (18, N'Zheng', N'Roger', CAST(0x0000948B00000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (19, N'Bryant', N'Carson', NULL, CAST(0x0000910D00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (20, N'Suarez', N'Robyn', NULL, CAST(0x0000955500000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (21, N'Holt', N'Roger', NULL, CAST(0x0000955500000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (22, N'Alexander', N'Carson', NULL, CAST(0x000096C200000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (23, N'Morgan', N'Isaiah', NULL, CAST(0x0000910D00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (24, N'Martin', N'Randall', NULL, CAST(0x000096C200000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (25, N'Kapoor', N'Candace', CAST(0x0000902800000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (26, N'Rogers', N'Cody', NULL, CAST(0x0000927A00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (27, N'Serrano', N'Stacy', CAST(0x00008DD600000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (28, N'White', N'Anthony', NULL, CAST(0x0000910D00000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (29, N'Griffin', N'Rachel', NULL, CAST(0x0000955500000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (30, N'Shan', N'Alicia', NULL, CAST(0x000093E700000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (31, N'Stewart', N'Jasmine', CAST(0x00008B8100000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (32, N'Xu', N'Kristen', CAST(0x000090E500000000 AS DateTime), NULL)
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (33, N'Gao', N'Erica', NULL, CAST(0x0000931100000000 AS DateTime))
INSERT [dbo].[SD_Person] ([PersonID], [LastName], [FirstName], [HireDate], [EnrollmentDate]) VALUES (34, N'Van Houten', N'Roger', CAST(0x0000900100000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SD_Person] OFF
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (2, 3)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (3, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (6, 3)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (7, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (8, 1)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (9, 2)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (10, 3)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (11, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (12, 1)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (13, 2)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (14, 3)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (15, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (16, 1)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (17, 2)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (19, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (20, 1)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (21, 2)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (22, 3)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (23, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (24, 1)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (25, 2)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (26, 3)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (27, 4)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (28, 1)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (29, 2)
INSERT [dbo].[SD_Student] ([PersonID], [Year]) VALUES (30, 3)
ALTER TABLE [dbo].[SD_Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[SD_Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[SD_Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[SD_CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[SD_Course] ([CourseID])
GO
ALTER TABLE [dbo].[SD_CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_Course]
GO
ALTER TABLE [dbo].[SD_CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[SD_Person] ([PersonID])
GO
ALTER TABLE [dbo].[SD_CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_Student]
GO
ALTER TABLE [dbo].[SD_CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[SD_Course] ([CourseID])
GO
ALTER TABLE [dbo].[SD_CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Course]
GO
ALTER TABLE [dbo].[SD_CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[SD_Person] ([PersonID])
GO
ALTER TABLE [dbo].[SD_CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Person]
GO
ALTER TABLE [dbo].[SD_OfficeAssignment]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAssignment_Person] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[SD_Person] ([PersonID])
GO
ALTER TABLE [dbo].[SD_OfficeAssignment] CHECK CONSTRAINT [FK_OfficeAssignment_Person]
GO
ALTER TABLE [dbo].[SD_OnlineCourse]  WITH CHECK ADD  CONSTRAINT [FK_OnlineCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[SD_Course] ([CourseID])
GO
ALTER TABLE [dbo].[SD_OnlineCourse] CHECK CONSTRAINT [FK_OnlineCourse_Course]
GO
ALTER TABLE [dbo].[SD_OnsiteCourse]  WITH CHECK ADD  CONSTRAINT [FK_OnsiteCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[SD_Course] ([CourseID])
GO
ALTER TABLE [dbo].[SD_OnsiteCourse] CHECK CONSTRAINT [FK_OnsiteCourse_Course]
GO
ALTER TABLE [dbo].[SD_Student]  WITH CHECK ADD  CONSTRAINT [FK_SD_Student_SD_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[SD_Person] ([PersonID])
GO
ALTER TABLE [dbo].[SD_Student] CHECK CONSTRAINT [FK_SD_Student_SD_Person]
GO
