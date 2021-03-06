USE [master]
GO
/****** Object:  Database [ProductManagement]    Script Date: 1/19/2021 9:20:50 PM ******/
CREATE DATABASE [ProductManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProductManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProductManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProductManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProductManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProductManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProductManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProductManagement]
GO
/****** Object:  Table [dbo].[TblCategories]    Script Date: 1/19/2021 9:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblCategories](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_TblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblProducts]    Script Date: 1/19/2021 9:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblProducts](
	[productID] [varchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[unit] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[catagoryID] [varchar](10) NULL,
 CONSTRAINT [PK_TblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblUsers]    Script Date: 1/19/2021 9:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblUsers](
	[userID] [varchar](10) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[status] [bit] NULL CONSTRAINT [DF_TblUsers_status]  DEFAULT ((0)),
 CONSTRAINT [PK_TblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TblCategories] ([categoryID], [categoryName], [description]) VALUES (N'IB01', N'Banh', N'Cac loai banh')
INSERT [dbo].[TblCategories] ([categoryID], [categoryName], [description]) VALUES (N'IB02', N'Kem', N'Cac loai kem')
INSERT [dbo].[TblCategories] ([categoryID], [categoryName], [description]) VALUES (N'IB03', N'Tra', N'Cac loai tra')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [catagoryID]) VALUES (N'PD01', N'Tra sua dau tam', N'ly', 55000, 16, N'IB03')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [catagoryID]) VALUES (N'PD02', N'Banh nhan dau do', N'banh', 25000, 20, N'IB01')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [catagoryID]) VALUES (N'PD03', N'Kem khoai mon', N'cay', 22000, 30, N'IB02')
INSERT [dbo].[TblUsers] ([userID], [fullname], [password], [status]) VALUES (N'Se62782', N'Bao Long', N'Baolong98', 1)
INSERT [dbo].[TblUsers] ([userID], [fullname], [password], [status]) VALUES (N'SE6292', N'Dong Bao Long', N'baolong98', 1)
ALTER TABLE [dbo].[TblProducts]  WITH CHECK ADD  CONSTRAINT [FK_TblProducts_TblCategories] FOREIGN KEY([catagoryID])
REFERENCES [dbo].[TblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[TblProducts] CHECK CONSTRAINT [FK_TblProducts_TblCategories]
GO
USE [master]
GO
ALTER DATABASE [ProductManagement] SET  READ_WRITE 
GO
