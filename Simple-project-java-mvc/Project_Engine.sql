USE [master]
GO
/****** Object:  Database [Project_SE1264]    Script Date: 3/18/2018 10:16:19 PM ******/
CREATE DATABASE [Project_SE1264]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_SE1264', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Project_SE1264.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project_SE1264_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Project_SE1264_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project_SE1264] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_SE1264].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_SE1264] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_SE1264] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_SE1264] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_SE1264] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_SE1264] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_SE1264] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project_SE1264] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_SE1264] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_SE1264] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_SE1264] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_SE1264] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_SE1264] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_SE1264] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_SE1264] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_SE1264] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_SE1264] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_SE1264] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_SE1264] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_SE1264] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_SE1264] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_SE1264] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_SE1264] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_SE1264] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_SE1264] SET  MULTI_USER 
GO
ALTER DATABASE [Project_SE1264] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_SE1264] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_SE1264] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_SE1264] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Project_SE1264] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Project_SE1264]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 3/18/2018 10:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[custID] [varchar](10) NOT NULL,
	[password] [varchar](30) NULL,
	[custName] [varchar](15) NULL,
	[lastName] [varchar](15) NULL,
	[middleName] [varchar](15) NULL,
	[address] [varchar](250) NULL,
	[phone] [varchar](11) NULL,
	[custLevel] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_book]    Script Date: 3/18/2018 10:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_book](
	[bookID] [varchar](10) NOT NULL,
	[title] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tbl_book] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 3/18/2018 10:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_order](
	[orderID] [varchar](10) NOT NULL,
	[orderDate] [datetime] NULL,
	[custID] [varchar](10) NULL,
	[total] [float] NULL,
	[isDeliver] [bit] NULL,
	[Reason] [varchar](250) NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_orderDetail]    Script Date: 3/18/2018 10:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_orderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productID] [varchar](10) NULL,
	[quantity] [int] NULL,
	[unitPrice] [float] NULL,
	[total] [float] NULL,
	[orderID] [varchar](10) NULL,
 CONSTRAINT [PK_tbl_orderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'Anh', N'123', N'Anh', N'Nguyen', N'Van', N'321', N'123456790', 2)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'Linh', N'123', N'Link', N'Ka', N'Be', N'123a', N'0213121221', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'Long', N'123', N'Long', N'Nguyen ', N'Bil', N'3411asd', N'1113241321', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'My', N'123', N'My', N'Nguyen ', N'Van', N'11aa', N'1234341223', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'Nhan', N'123', N'Nhan', N'Nguyen', N'Trung', N'32/21a', N'123456789', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'Nhanas', N'12312', N'sdasd', N'qiwej', N'123123', N'aslkas', N'019223', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'Sam', N'123', N'Sam', N'Nguyen ', N'Sam', N'sdasd', N'3892389234', 2)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'A2', CAST(N'2017-12-31 00:00:00.000' AS DateTime), N'Anh', 242.15, 0, N'SomeThing Broken')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'A3', CAST(N'2015-09-11 00:00:00.000' AS DateTime), N'Long', 431.123, 0, N'No Reason')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'N1', CAST(N'2017-07-13 00:00:00.000' AS DateTime), N'Nhan', 350.5, 0, N'Bad Weather')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'N12', CAST(N'2016-09-01 00:00:00.000' AS DateTime), N'My', 932.11, 1, N'Dangerous')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'N5', CAST(N'2014-11-01 00:00:00.000' AS DateTime), N'Sam', 220, 1, N'Emercency')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'R22', CAST(N'2013-04-14 00:00:00.000' AS DateTime), N'Sam', 43.1, 0, N'Bad Weather')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'S11', CAST(N'2012-02-14 00:00:00.000' AS DateTime), N'Long', 115.2, 1, N'Quit')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [isDeliver], [Reason]) VALUES (N'U2', CAST(N'2014-08-22 00:00:00.000' AS DateTime), N'My', 23.13, 1, N'Good Weather')
SET IDENTITY_INSERT [dbo].[tbl_orderDetail] ON 

INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (1, N'BKTT', 100, 20, 20000, N'A3')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (5, N'S12', 200, 100, 20000, N'N5')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (7, N'SS24', 1000, 21.5, 21500, N'U2')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (8, N'S10', 52, 1.5, 21.41, N'R22')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (9, N'O99', 21, 2, 42, N'R22')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (12, N'KQ2', 94, 22.14, 300.12, N'A2')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (13, N'S12', 300, 11.21, 333.11, N'N12')
SET IDENTITY_INSERT [dbo].[tbl_orderDetail] OFF
ALTER TABLE [dbo].[tbl_book]  WITH CHECK ADD  CONSTRAINT [FK_tbl_book_tbl_orderDetail] FOREIGN KEY([quantity])
REFERENCES [dbo].[tbl_orderDetail] ([id])
GO
ALTER TABLE [dbo].[tbl_book] CHECK CONSTRAINT [FK_tbl_book_tbl_orderDetail]
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_customer] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_customer]
GO
ALTER TABLE [dbo].[tbl_orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderDetail_tbl_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tbl_order] ([orderID])
GO
ALTER TABLE [dbo].[tbl_orderDetail] CHECK CONSTRAINT [FK_tbl_orderDetail_tbl_order]
GO
USE [master]
GO
ALTER DATABASE [Project_SE1264] SET  READ_WRITE 
GO
