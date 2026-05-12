USE [Library]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[title] [nvarchar](150) NOT NULL,
	[authors] [nvarchar](150) NULL,
	[publisher] [nvarchar](150) NULL,
	[bookNumber] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CirculatedCopy](
	[copyNumber] [int] NOT NULL,
	[memberNumber] [int] NOT NULL,
	[borrowedDate] [datetime] NOT NULL,
	[dueDate] [datetime] NOT NULL,
	[returnedDate] [datetime] NULL,
	[fineAmount] [money] NULL,
	[circulatedCopyId] [int] IDENTITY(1,1) NOT NULL,
	[numberRenew] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[circulatedCopyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copy](
	[bookNumber] [int] NOT NULL,
	[sequenceNumber] [int] NOT NULL,
	[type] [int] NULL,
	[price] [money] NOT NULL,
	[copyNumber] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[copyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[name] [nvarchar](150) NOT NULL,
	[sex] [bit] NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[telephone] [nvarchar](15) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[memberNumber] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[memberNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[memberNumber] [int] NOT NULL,
	[bookNumber] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([title], [authors], [publisher], [bookNumber]) VALUES (N'Clean Architecture', N'Robert C. Martin', N'Prentice Hall', 1)
GO
INSERT [dbo].[Book] ([title], [authors], [publisher], [bookNumber]) VALUES (N'C# 10 in a Nutshell', N'Joseph Albahari', N'O''Reilly Media', 2)
GO
INSERT [dbo].[Book] ([title], [authors], [publisher], [bookNumber]) VALUES (N'Design Patterns', N'Erich Gamma', N'Addison-Wesley', 3)
GO
INSERT [dbo].[Book] ([title], [authors], [publisher], [bookNumber]) VALUES (N'Head First Object-Oriented Analysis and Design', N'Brett McLaughlin', N'O''Reilly Media', 4)
GO
INSERT [dbo].[Book] ([title], [authors], [publisher], [bookNumber]) VALUES (N'Pro ASP.NET Core 6', N'Adam Freeman', N'Apress', 5)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO

SET IDENTITY_INSERT [dbo].[Member] ON 
GO
INSERT [dbo].[Member] ([name], [sex], [address], [telephone], [email], [memberNumber]) VALUES (N'Tran Phuc Tuan', 1, N'123 Le Loi, Quan 1, HCM', N'0901234567', N'tuantp@student.edu.vn', 1)
GO
INSERT [dbo].[Member] ([name], [sex], [address], [telephone], [email], [memberNumber]) VALUES (N'Nguyen Thi Mai', 0, N'456 Nguyen Hue, Quan 1, HCM', N'0912345678', N'maint@student.edu.vn', 2)
GO
INSERT [dbo].[Member] ([name], [sex], [address], [telephone], [email], [memberNumber]) VALUES (N'Le Hoang Long', 1, N'789 Dien Bien Phu, Binh Thanh, HCM', N'0923456789', N'longlh@student.edu.vn', 3)
GO
INSERT [dbo].[Member] ([name], [sex], [address], [telephone], [email], [memberNumber]) VALUES (N'Pham Bao Yen', 0, N'101 Mai Chi Tho, Thu Duc, HCM', N'0934567890', N'yenpb@student.edu.vn', 4)
GO
SET IDENTITY_INSERT [dbo].[Member] OFF
GO

SET IDENTITY_INSERT [dbo].[Copy] ON 
GO
INSERT [dbo].[Copy] ([bookNumber], [sequenceNumber], [type], [price], [copyNumber]) VALUES (1, 1, 1, 250000.0000, 1)
GO
INSERT [dbo].[Copy] ([bookNumber], [sequenceNumber], [type], [price], [copyNumber]) VALUES (1, 2, 0, 250000.0000, 2)
GO
INSERT [dbo].[Copy] ([bookNumber], [sequenceNumber], [type], [price], [copyNumber]) VALUES (2, 1, 1, 300000.0000, 3)
GO
INSERT [dbo].[Copy] ([bookNumber], [sequenceNumber], [type], [price], [copyNumber]) VALUES (3, 1, 0, 200000.0000, 4)
GO
INSERT [dbo].[Copy] ([bookNumber], [sequenceNumber], [type], [price], [copyNumber]) VALUES (4, 1, 2, 180000.0000, 5)
GO
SET IDENTITY_INSERT [dbo].[Copy] OFF
GO

SET IDENTITY_INSERT [dbo].[CirculatedCopy] ON 
GO
INSERT [dbo].[CirculatedCopy] ([copyNumber], [memberNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount], [circulatedCopyId], [numberRenew]) VALUES (1, 1, CAST(N'2026-04-25T08:30:00.000' AS DateTime), CAST(N'2026-05-09T08:30:00.000' AS DateTime), CAST(N'2026-05-08T10:15:00.000' AS DateTime), 0.0000, 1, 0)
GO
INSERT [dbo].[CirculatedCopy] ([copyNumber], [memberNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount], [circulatedCopyId], [numberRenew]) VALUES (3, 2, CAST(N'2026-05-01T14:20:00.000' AS DateTime), CAST(N'2026-05-15T14:20:00.000' AS DateTime), NULL, NULL, 2, 0)
GO
INSERT [dbo].[CirculatedCopy] ([copyNumber], [memberNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount], [circulatedCopyId], [numberRenew]) VALUES (2, 3, CAST(N'2026-05-05T09:00:00.000' AS DateTime), CAST(N'2026-05-19T09:00:00.000' AS DateTime), NULL, NULL, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[CirculatedCopy] OFF
GO

SET IDENTITY_INSERT [dbo].[Reservation] ON 
GO
INSERT [dbo].[Reservation] ([memberNumber], [bookNumber], [date], [status], [reservationID]) VALUES (4, 3, CAST(N'2026-05-10T11:45:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Reservation] ([memberNumber], [bookNumber], [date], [status], [reservationID]) VALUES (1, 5, CAST(N'2026-05-11T15:30:00.000' AS DateTime), 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO

ALTER TABLE [dbo].[CirculatedCopy]  WITH CHECK ADD FOREIGN KEY([copyNumber])
REFERENCES [dbo].[Copy] ([copyNumber])
GO
ALTER TABLE [dbo].[CirculatedCopy]  WITH CHECK ADD FOREIGN KEY([memberNumber])
REFERENCES [dbo].[Member] ([memberNumber])
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD FOREIGN KEY([bookNumber])
REFERENCES [dbo].[Book] ([bookNumber])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([bookNumber])
REFERENCES [dbo].[Book] ([bookNumber])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([memberNumber])
REFERENCES [dbo].[Member] ([memberNumber])
GO