USE [master]
GO
/****** Object:  Database [WardrobeMVC]    Script Date: 8/7/2017 1:07:49 AM ******/
CREATE DATABASE [WardrobeMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WardrobeMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeMVC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WardrobeMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WardrobeMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WardrobeMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WardrobeMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WardrobeMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WardrobeMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WardrobeMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WardrobeMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WardrobeMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WardrobeMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WardrobeMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WardrobeMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WardrobeMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WardrobeMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WardrobeMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WardrobeMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WardrobeMVC] SET  MULTI_USER 
GO
ALTER DATABASE [WardrobeMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WardrobeMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WardrobeMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WardrobeMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WardrobeMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WardrobeMVC]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoryID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryName] [nvarchar](50) NOT NULL,
	[AccessoryPhoto] [nvarchar](50) NOT NULL,
	[AccessoryType] [nvarchar](50) NOT NULL,
	[AccessoryColor] [nvarchar](50) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bottoms]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bottoms](
	[BottomID] [int] IDENTITY(1,1) NOT NULL,
	[BottomName] [nvarchar](50) NOT NULL,
	[BottomPhoto] [nvarchar](250) NOT NULL,
	[BottomType] [nvarchar](50) NOT NULL,
	[BottomColor] [nvarchar](50) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Bottoms] PRIMARY KEY CLUSTERED 
(
	[BottomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occasions]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasions](
	[OccasionID] [int] IDENTITY(1,1) NOT NULL,
	[OccasionName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Occasions] PRIMARY KEY CLUSTERED 
(
	[OccasionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfits]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfits](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[OutfitName] [nvarchar](100) NOT NULL,
	[OutfitDate] [date] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
	[AccessoryID] [int] NULL,
 CONSTRAINT [PK_Outfits] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoes](
	[ShoeID] [int] IDENTITY(1,1) NOT NULL,
	[ShoeName] [nvarchar](50) NOT NULL,
	[ShoePhoto] [nvarchar](250) NOT NULL,
	[ShoeType] [nvarchar](50) NOT NULL,
	[ShoeColor] [nvarchar](50) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tops]    Script Date: 8/7/2017 1:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tops](
	[TopID] [int] IDENTITY(1,1) NOT NULL,
	[TopName] [nvarchar](50) NOT NULL,
	[TopPhoto] [nvarchar](250) NOT NULL,
	[TopType] [nvarchar](50) NOT NULL,
	[TopColor] [nvarchar](50) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_Tops] PRIMARY KEY CLUSTERED 
(
	[TopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessories] ON 

INSERT [dbo].[Accessories] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryType], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (1, N'Sunglasses', N'/content/images/sunglasses.jpg', N'Sunglasses', N'Clear', 6, 1)
INSERT [dbo].[Accessories] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryType], [AccessoryColor], [SeasonID], [OccasionID]) VALUES (2, N'Pink Purse', N'/content/images/pink purse.jpg', N'Bag', N'Pink', 5, 1)
SET IDENTITY_INSERT [dbo].[Accessories] OFF
SET IDENTITY_INSERT [dbo].[Bottoms] ON 

INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomPhoto], [BottomType], [BottomColor], [SeasonID], [OccasionID]) VALUES (1, N'Black Jeans', N'/content/images/black jeans.jpg', N'Jeans', N'Black', 5, 1)
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomPhoto], [BottomType], [BottomColor], [SeasonID], [OccasionID]) VALUES (2, N'Black Slacks', N'/content/images/black pants.jpg', N'Pants', N'Black', 5, 3)
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomPhoto], [BottomType], [BottomColor], [SeasonID], [OccasionID]) VALUES (3, N'Black Leggings', N'/content/images/black running tights.jpg', N'Leggins', N'Black', 5, 4)
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomPhoto], [BottomType], [BottomColor], [SeasonID], [OccasionID]) VALUES (4, N'Black Skirt', N'/content/images/black skirt.jpg', N'Skirt', N'Black', 5, 3)
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomPhoto], [BottomType], [BottomColor], [SeasonID], [OccasionID]) VALUES (5, N'Black Shorts', N'/content/images/black shorts.jpg', N'Shorts', N'Black', 3, 1)
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomPhoto], [BottomType], [BottomColor], [SeasonID], [OccasionID]) VALUES (6, N'Jeans', N'/content/images/jeans.jpg', N'Jeans', N'Blue', 5, 1)
SET IDENTITY_INSERT [dbo].[Bottoms] OFF
SET IDENTITY_INSERT [dbo].[Occasions] ON 

INSERT [dbo].[Occasions] ([OccasionID], [OccasionName]) VALUES (1, N'Casual')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionName]) VALUES (2, N'Leisure')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionName]) VALUES (3, N'Business')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionName]) VALUES (4, N'Athletic')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionName]) VALUES (5, N'Evening')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionName]) VALUES (6, N'Multi-purpose')
SET IDENTITY_INSERT [dbo].[Occasions] OFF
SET IDENTITY_INSERT [dbo].[Outfits] ON 

INSERT [dbo].[Outfits] ([OutfitID], [OutfitName], [OutfitDate], [SeasonID], [OccasionID], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (1, N'Monday', CAST(N'2017-07-31' AS Date), 3, 1, 4, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[Outfits] OFF
SET IDENTITY_INSERT [dbo].[Seasons] ON 

INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (1, N'Winter')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (2, N'Spring')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (3, N'Summer')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (4, N'Fall')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (5, N'All Seasons')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (6, N'Spring/Summer')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonName]) VALUES (8, N'Fall/Winter')
SET IDENTITY_INSERT [dbo].[Seasons] OFF
SET IDENTITY_INSERT [dbo].[Shoes] ON 

INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeType], [ShoeColor], [SeasonID], [OccasionID]) VALUES (2, N'Black Wedges', N'Content/images/black wedges.jpg', N'Sandals', N'Black', 3, 1)
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeType], [ShoeColor], [SeasonID], [OccasionID]) VALUES (5, N'Black Booties', N'/content/images/black booties.jpg', N'Boots', N'Black', 8, 1)
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeType], [ShoeColor], [SeasonID], [OccasionID]) VALUES (7, N'White Sneakers', N'/Content/images/sneakers.jpg', N'Sneakers', N'White', 5, 1)
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeType], [ShoeColor], [SeasonID], [OccasionID]) VALUES (1002, N'Beige Flats', N'Content/images/beige flats.jpg', N'Flats', N'Beige', 6, 1)
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeType], [ShoeColor], [SeasonID], [OccasionID]) VALUES (1003, N'Black Heels', N'Content/images/black heels.jpg', N'Heels', N'Black', 8, 3)
SET IDENTITY_INSERT [dbo].[Shoes] OFF
SET IDENTITY_INSERT [dbo].[Tops] ON 

INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (1, N'Polka Dot Button Up', N'/Content/images/black and white dotted button up.jpg', N'Button-up', N'Black/White', 5, 1)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (2, N'Flannel Shirt', N'/content/images/black and white flannel.jpg', N'Flannel', N'Black/White', 8, 1)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (3, N'White T-Shirt', N'/content/images/white tee.jpg', N'T-Shirt', N'White', 5, 1)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (4, N'Sleeveless White Blouse', N'/content/images/white sleeveless blouse.jpg', N'Blouse', N'White', 6, 1)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (5, N'White Button Up', N'/content/images/white button up blouse.jpg', N'Blouse', N'White', 5, 3)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (6, N'Black 3/4 Top', N'/content/images/black trumpet-sleeve blouse.jpg', N'Blouse', N'Black', 5, 5)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (7, N'Black Sleeveless Blouse', N'/content/images/black sleeveless blouse.jpg', N'Blouse', N'Black', 5, 3)
INSERT [dbo].[Tops] ([TopID], [TopName], [TopPhoto], [TopType], [TopColor], [SeasonID], [OccasionID]) VALUES (8, N'Black Sweater', N'/content/images/black sweater.jpg', N'Sweater', N'Black', 1, 1)
SET IDENTITY_INSERT [dbo].[Tops] OFF
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Occasions]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Seasons]
GO
ALTER TABLE [dbo].[Bottoms]  WITH CHECK ADD  CONSTRAINT [FK_Bottoms_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[Bottoms] CHECK CONSTRAINT [FK_Bottoms_Occasions]
GO
ALTER TABLE [dbo].[Bottoms]  WITH CHECK ADD  CONSTRAINT [FK_Bottoms_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Bottoms] CHECK CONSTRAINT [FK_Bottoms_Seasons]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessories] ([AccessoryID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Accessories]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Bottoms] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottoms] ([BottomID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Bottoms]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Occasions]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Seasons]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Shoes] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoes] ([ShoeID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Shoes]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Tops] FOREIGN KEY([TopID])
REFERENCES [dbo].[Tops] ([TopID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Tops]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_Occasions]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_Seasons]
GO
ALTER TABLE [dbo].[Tops]  WITH CHECK ADD  CONSTRAINT [FK_Tops_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[Tops] CHECK CONSTRAINT [FK_Tops_Occasions]
GO
ALTER TABLE [dbo].[Tops]  WITH CHECK ADD  CONSTRAINT [FK_Tops_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Tops] CHECK CONSTRAINT [FK_Tops_Seasons]
GO
USE [master]
GO
ALTER DATABASE [WardrobeMVC] SET  READ_WRITE 
GO
