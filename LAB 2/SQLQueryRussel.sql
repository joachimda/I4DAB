USE [Russel]
GO
/****** Object:  Table [dbo].[CAR]    Script Date: 03-02-2015 12:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR](
	[REGNO] [nvarchar](50) NOT NULL,
	[MAKE] [nvarchar](50) NULL,
	[COLOUR] [nvarchar](25) NULL,
	[PRICE] [money] NULL,
	[OWNER] [nvarchar](50) NULL,
 CONSTRAINT [PK_CAR] PRIMARY KEY CLUSTERED 
(
	[REGNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DRIVER]    Script Date: 03-02-2015 12:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVER](
	[NAME] [nvarchar](50) NOT NULL,
	[DOB] [date] NULL,
 CONSTRAINT [PK_DRIVER] PRIMARY KEY CLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CAR] ([REGNO], [MAKE], [COLOUR], [PRICE], [OWNER]) VALUES (N'A155 BDE', N'MERCEDES', N'BLUE', 22000.0000, N'Bob Smith')
GO
INSERT [dbo].[CAR] ([REGNO], [MAKE], [COLOUR], [PRICE], [OWNER]) VALUES (N'F611 AAA', N'FORD', N'RED', 12000.0000, N'Jim Smith')
GO
INSERT [dbo].[CAR] ([REGNO], [MAKE], [COLOUR], [PRICE], [OWNER]) VALUES (N'J111 BBB', N'SKODA', N'BLUE', 11000.0000, N'Jim Smith')
GO
INSERT [dbo].[CAR] ([REGNO], [MAKE], [COLOUR], [PRICE], [OWNER]) VALUES (N'K555 GHT', N'FIAT', N'GREEN', 6000.0000, NULL)
GO
INSERT [dbo].[CAR] ([REGNO], [MAKE], [COLOUR], [PRICE], [OWNER]) VALUES (N'SC04 BFE', N'SMART', N'BLUE', 13000.0000, N'Bob Jones')
GO
INSERT [dbo].[DRIVER] ([NAME], [DOB]) VALUES (N'Bob Jones', CAST(N'1986-12-03' AS Date))
GO
INSERT [dbo].[DRIVER] ([NAME], [DOB]) VALUES (N'Bob Smith', CAST(N'1981-03-23' AS Date))
GO
INSERT [dbo].[DRIVER] ([NAME], [DOB]) VALUES (N'Jan Brown', CAST(N'1998-11-11' AS Date))
GO
INSERT [dbo].[DRIVER] ([NAME], [DOB]) VALUES (N'Jim Smit', CAST(N'1980-01-11' AS Date))
GO
INSERT [dbo].[DRIVER] ([NAME], [DOB]) VALUES (N'Jim Smith', CAST(N'1980-01-11' AS Date))
GO
ALTER TABLE [dbo].[CAR]  WITH CHECK ADD  CONSTRAINT [FK_CAR_DRIVER] FOREIGN KEY([OWNER])
REFERENCES [dbo].[DRIVER] ([NAME])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CAR] CHECK CONSTRAINT [FK_CAR_DRIVER]
GO
