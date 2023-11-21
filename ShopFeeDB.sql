USE [master]
GO
/****** Object:  Database [ShopFee] ******/
CREATE DATABASE [ShopFee]
GO
ALTER DATABASE [ShopFee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopFee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopFee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopFee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopFee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopFee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopFee] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopFee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopFee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopFee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopFee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopFee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopFee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopFee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopFee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopFee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopFee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopFee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopFee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopFee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopFee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopFee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopFee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopFee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopFee] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopFee] SET  MULTI_USER 
GO
ALTER DATABASE [ShopFee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopFee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopFee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopFee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopFee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopFee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopFee', N'ON'
GO
ALTER DATABASE [ShopFee] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopFee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [ShopFee]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Banner_ID] [int] IDENTITY(1,1) NOT NULL,
	[Banner_Name] [varchar](max) NOT NULL,
	[Banner_Image] [varchar](max) NOT NULL,
	[Banner_Link] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Banner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Brand_ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand_Name] [nvarchar](255) NOT NULL,
	[Brand_Image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Brand_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](255) NOT NULL,
	[Category_Image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Category_ID] [int] NOT NULL,
	[Discount] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laptops]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptops](
	[Laptop_ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand_ID] [int] NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Processor_Type_ID] [int] NOT NULL,
	[Processor_Type_Name] [nvarchar](100) NULL,
	[Graphics_Card] [nvarchar](100) NULL,
	[RAM] [int] NULL,
	[Storage] [nvarchar](100) NULL,
	[Screen_Size] [decimal](4, 2) NULL,
	[Screen_Resolution] [nvarchar](50) NULL,
	[Screen_Frequency] [int] NULL,
	[Operating_System] [nvarchar](50) NULL,
	[Price] [decimal](10, 2) NULL,
	[Stock_Quantity] [int] NULL,
	[Laptop_Image1] [nvarchar](max) NULL,
	[Laptop_Image2] [nvarchar](max) NULL,
	[Laptop_Image3] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Laptop_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Items]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Items](
	[Order_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Laptop_ID] [int] NOT NULL,
	[Model] [varchar](max) NULL,
	[Brand] [varchar](255) NULL,
	[Laptop_Image1] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [decimal](10, 2) NULL,
	[Price_Per_Item] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Order_Date] [datetime] NULL,
	[Payment_Method] [nvarchar](100) NOT NULL,
	[Ship_Fee] [decimal](10, 2) NULL,
	[Total_Price] [decimal](10, 2) NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processor_Types]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processor_Types](
	[Processor_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Processor_Type_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Processor_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Review_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Date_Posted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Review_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_Cart]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_Cart](
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/14/2023 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone_Number] [nvarchar](15) NULL,
	[Role_ID] [int] NULL,
	[Avatar_Image] [nvarchar](max) NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 
GO
INSERT [dbo].[Banner] ([Banner_ID], [Banner_Name], [Banner_Image], [Banner_Link]) VALUES (1, N'banner1', N'Banner2.jpg', N'#')
GO
INSERT [dbo].[Banner] ([Banner_ID], [Banner_Name], [Banner_Image], [Banner_Link]) VALUES (2, N'banner2', N'Banner3.png', N'#')
GO
INSERT [dbo].[Banner] ([Banner_ID], [Banner_Name], [Banner_Image], [Banner_Link]) VALUES (3, N'banner3', N'Banner4.jpg', N'#')
GO
INSERT [dbo].[Banner] ([Banner_ID], [Banner_Name], [Banner_Image], [Banner_Link]) VALUES (4, N'banner4', N'Banner5.jpg', N'#')
GO
INSERT [dbo].[Banner] ([Banner_ID], [Banner_Name], [Banner_Image], [Banner_Link]) VALUES (5, N'banner5', N'Banner6.jpg', N'#')
GO
INSERT [dbo].[Banner] ([Banner_ID], [Banner_Name], [Banner_Image], [Banner_Link]) VALUES (6, N'banner6', N'Go Yoon Jung.jpg', N'#')
GO
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (1, N'Acer', N'Acer.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (2, N'Apple', N'Apple.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (3, N'HP', N'HP.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (4, N'Asus', N'Asus.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (5, N'MSI', N'MSI.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (6, N'LG', N'LG.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (7, N'DELL', N'Dell.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (8, N'Lenovo', N'Lenovo.png')
GO
INSERT [dbo].[Brands] ([Brand_ID], [Brand_Name], [Brand_Image]) VALUES (9, N'Microsoft', N'Microsoft.png')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Image]) VALUES (1, N'Graphics, Architecture', N'cat-1.jpg')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Image]) VALUES (2, N'General, Office', N'cat-2.jpg')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Image]) VALUES (3, N'Business', N'cat-3.jpg')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Image]) VALUES (4, N'Gaming', N'cat-4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Discount] ([Category_ID], [Discount]) VALUES (1, CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[Discount] ([Category_ID], [Discount]) VALUES (2, CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Discount] ([Category_ID], [Discount]) VALUES (3, CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Discount] ([Category_ID], [Discount]) VALUES (4, CAST(0.10 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Laptops] ON 
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (1, 1, N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)', 1, 3, N'Intel® Core i3-1215U', N'Intel® UHD Graphics', 8, N'256GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(9699000.00 AS Decimal(10, 2)), 10, N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_1.jpg', N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_2.jpg', N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_3.jpg', N'Một trong những chiếc laptop giá rẻ dành cho học sinh sinh viên và nhân viên không thể không nhắc đến là Acer Aspire 3 A315. Thiết kế nhỏ gọn, hoàn thiện từng chi tiết, cấu hình mạnh đáp ứng các yêu cầu học tập và làm việc mỗi ngày. Hứa hẹn sẽ là sản phẩm laptop văn phòng giá tốt dành cho nhiều người.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (2, 1, N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)', 2, 1, N'AMD Ryzen 5 7520U', N'AMD Radeon™ 610M', 8, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'FHD(1920 x 1080) IPS LED', 60, N'Window', CAST(12299000.00 AS Decimal(10, 2)), 10, N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_1.png', N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_2.png', N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_3.png', N'Một trong những chiếc laptop giá rẻ dành cho học sinh sinh viên và nhân viên không thể không nhắc đến là Acer Aspire 3 A314. Thiết kế nhỏ gọn, hoàn thiện từng chi tiết, cấu hình mạnh đáp ứng các yêu cầu học tập và làm việc mỗi ngày. Hứa hẹn sẽ là sản phẩm laptop văn phòng giá tốt dành cho nhiều người.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (3, 1, N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)', 3, 4, N'Intel® Core i5-1240P', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'QHD (2560 x 1440)', 60, N'Window', CAST(18799000.00 AS Decimal(10, 2)), 10, N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_1.png', N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_2.png', N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_3.png', N'Một trong những chiếc laptop giá rẻ dành cho học sinh sinh viên và nhân viên không thể không nhắc đến là Acer Swift. Thiết kế nhỏ gọn, hoàn thiện từng chi tiết, cấu hình mạnh đáp ứng các yêu cầu học tập và làm việc mỗi ngày. Hứa hẹn sẽ là sản phẩm laptop văn phòng giá tốt dành cho nhiều người.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (4, 1, N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)', 4, 4, N'Intel® Core i5 11400H', N'NVIDIA® GTX1650 4G', 8, N'512GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(18299000.00 AS Decimal(10, 2)), 10, N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_1.png', N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_2.png', N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_3.png', N'Acer Nitro 5 mang đến vẻ hầm hố, mạnh mẽ thông qua ngôn ngữ thiết kế của mình. Thiết kế bên ngoài cũng nổi bật hơn, với các mảng màu đỏ trên các vây ở mặt sau của máy tính xách tay. Sự thay đổi này thay thế cho bản lề màu đỏ, hoạt động êm ái hơn so với năm ngoái. Toàn bộ thân máy được làm bằng nhựa với tone màu đen - đỏ ấn tượng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (5, 2, N'LAPTOP APPLE MACBOOK AIR (Z1600005A) (2022)', 1, 2, N'Apple M2', N'Onboard', 16, N'512GB SSD', CAST(13.60 AS Decimal(4, 2)), N'Retina IPS', 120, N'Mac OS', CAST(18999000.00 AS Decimal(10, 2)), 10, N'LAPTOP APPLE MACBOOK AIR (Z1600005A)_1.png', N'LAPTOP APPLE MACBOOK AIR (Z1600005A)_2.png', N'LAPTOP APPLE MACBOOK AIR (Z1600005A)_3.png', N'Macbook Air sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu sang trọng. Thiết kế laptop mỏng nhẹ thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (6, 2, N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA) (MIDNIGHT) (2023)', 2, 2, N'Apple M2', N'Onboard', 8, N'256GB SSD', CAST(15.30 AS Decimal(4, 2)), N'Retina IPS', 120, N'Mac OS', CAST(32499000.00 AS Decimal(10, 2)), 10, N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_1.png', N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_2.png', N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_3.png', N'Macbook Air sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu sang trọng. Thiết kế laptop mỏng nhẹ thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (7, 2, N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)', 3, 2, N'Apple M2', N'Onboard', 16, N'256GB SSD', CAST(13.30 AS Decimal(4, 2)), N'Retina IPS', 120, N'Mac OS', CAST(35699000.00 AS Decimal(10, 2)), 10, N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_1.png', N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_2.png', N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_3.png', N'Macbook Air sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu sang trọng. Thiết kế laptop mỏng nhẹ thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (8, 3, N'LAPTOP HP PROBOOK 440 G10 (873A9PA)', 1, 4, N'Intel® Core i5-1335U', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(21299000.00 AS Decimal(10, 2)), 10, N'LAPTOP HP PROBOOK 440 G10 (873A9PA)_1.jpg', N'LAPTOP HP PROBOOK 440 G10 (873A9PA)_2.jpg', N'LAPTOP HP PROBOOK 440 G10 (873A9PA)_3.jpg', N'Laptop có kiểu dáng bắt mắt với thân máy siêu mỏng, hoàn thiện từ vỏ nhôm nguyên khối sang trọng. Phiên bản màu bạc thời trang, logo HP nổi bật bóng bẩy cùng viền màn hình mỏng hai cạnh thể hiện sự hiện đại và thời thượng. Tuy mỏng nhẹ nhưng chiếc máy này bền bỉ với khả năng chống sốc và chống va đập tối ưu, sử dụng được trong thời gian lâu dài.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (9, 3, N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)', 2, 4, N'Intel® Core i5-1335U', N'Intel® Iris Xe Graphics', 8, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(18799000.00 AS Decimal(10, 2)), 10, N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_1.jpg', N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_2.jpg', N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_3.jpg', N'Laptop HP Envy sở hữu một thiết kế trẻ trung, năng động chắc chắn sẽ mang đến cho bạn sự tự tin nhất khi cầm trên tay. Đây là chiếc laptop kết hợp hoàn hảo của một chiếc laptop văn phòng với thời trang hiện đại.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (10, 3, N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)', 3, 4, N'Intel® Core i5-1235U', N'Intel® Iris Xe Graphics', 8, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(19299000.00 AS Decimal(10, 2)), 10, N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_1.jpg', N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_2.jpg', N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_3.jpg', N'Laptop có kiểu dáng bắt mắt với thân máy siêu mỏng, hoàn thiện từ vỏ nhôm nguyên khối sang trọng. Phiên bản màu bạc thời trang, logo HP nổi bật bóng bẩy cùng viền màn hình mỏng hai cạnh thể hiện sự hiện đại và thời thượng. Tuy mỏng nhẹ nhưng chiếc máy này bền bỉ với khả năng chống sốc và chống va đập tối ưu, sử dụng được trong thời gian lâu dài.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (11, 3, N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)', 4, 5, N'Intel® Core i7-12700H', N'NVIDIA® GeForce RTX™ 3050 TI 4GB GDDR6', 8, N'512GB SSD', CAST(16.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(29349000.00 AS Decimal(10, 2)), 10, N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_1.png', N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_2.png', N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_3.png', N'Laptop HP gaming VICTUS 16 d0291TX sở hữu vẻ ngoài cực kỳ đặc biệt. Có thể nói, VICTUS 16 mang ngôn ngữ thiết kế hoàn toàn mới với hình chữ "V" phản kim loại đồng bộ hợp thời trang. Khoác lên mình màu đen giúp toát lên vẻ tinh tế, thanh lịch nhưng không kém phần mạnh mẽ cho người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (12, 4, N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W', 1, 4, N'Intel® Core i5-1335U', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(15799000.00 AS Decimal(10, 2)), 10, N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_1.jpg', N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_2.jpg', N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_3.jpg', N'Laptop ASUS VivoBook M513UA L1240T sở hữu thiết kế của một chiếc laptop doanh nhân sang trọng, lịch lãm. Những điều ấy đến từ cấu tạo vỏ máy từ kim loại cao cấp nguyên khối cho sự chắc chắn cao, bảo vệ hoàn hảo linh kiện quý giá bên trong.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (13, 4, N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W', 2, 4, N'Intel® Core i5-13500H', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'2.8K', 60, N'Window', CAST(17799000.00 AS Decimal(10, 2)), 10, N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_1.png', N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_2.png', N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_3.png', N'Asus Vivobook 14X OLED sở hữu một màu bạc đẹp mắt với thiết kế vuông vắn đầy tinh tế. Bản lề được thiết kế tự tạo một góc nghiêng vừa phải khi mở nắp máy tính lên. Mặt nắp laptop Asus đặt khéo léo phần logo đặc trưng của dòng Asus Vivobook tạo một nét đẹp sang trọng trên sản phẩm nhà Asus.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (14, 4, N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W', 3, 1, N'AMD Ryzen 5 7520U', N'AMD Radeon Graphics', 16, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(13849000.00 AS Decimal(10, 2)), 10, N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_1.png', N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_2.png', N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_3.png', N'Asus Vivobook sở hữu một màu đẹp mắt với thiết kế vuông vắn đầy tinh tế. Bản lề được thiết kế tự tạo một góc nghiêng vừa phải khi mở nắp máy tính lên. Mặt nắp laptop Asus đặt khéo léo phần logo đặc trưng của dòng Asus Vivobook tạo một nét đẹp sang trọng trên sản phẩm nhà Asus.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (15, 4, N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W', 4, 4, N'Intel® Core i5 12500H', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, N'512GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(20299000.00 AS Decimal(10, 2)), 10, N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_1.jpg', N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_2.jpg', N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_3.jpg', N'Sở hữu ngôn ngữ thiết kế hiện đại với tông màu xám đen mạnh mẽ, cuốn hút, ASUS TUF là sự trung hòa hoàn hảo giữa sự hầm hố, bụ bẫm vốn có của dòng laptop gaming với sự trẻ trung, thanh lịch phù hợp với newbie cũng như những game thủ chuyên nghiệp.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (16, 5, N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)', 1, 5, N'Intel® Core i7-1360P', N'Intel® Iris Xe Graphics', 16, N'1TB SSD', CAST(13.30 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(31849000.00 AS Decimal(10, 2)), 10, N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_1.png', N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_2.png', N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_3.png', N'MSI Prestige được đầu tư thiết kế nhằm tối ưu trải nghiệm và phục vụ nhu cầu di chuyển mỗi ngày của người dùng. Trọng lượng chỉ khoảng 1.49kg thuận lợi trong việc bỏ vào balo và mang đi cứ lúc nào. Kiểu dáng sang trọng với tông màu xám thời thượng kết hợp từng đường nét chau chuốt tỉ mỉ tạo ra một nét đẹp đầy phong cách. Bắt kịp xu hướng và thị hiếu của các bạn trẻ ngày nay.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (17, 5, N'LAPTOP MSI MODERN 15 (B12MO-628VN)', 2, 4, N'Intel® Core i5-1235U', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(14299000.00 AS Decimal(10, 2)), 10, N'LAPTOP MSI MODERN 15 (B12MO-628VN)_1.jpg', N'LAPTOP MSI MODERN 15 (B12MO-628VN)_2.jpg', N'LAPTOP MSI MODERN 15 (B12MO-628VN)_3.jpg', N'MSI Modern 15 sở hữu thiết kế mỏng nhẹ vô cùng sang trọng và đẳng cấp cùng những chi tiết được gia công tinh xảo. Điểm nổi bật trên dòng sản phẩm MSI Modern 15 có lẽ là đến từ chất liệu vỏ máy tính được làm với chất liệu cao cấp cùng trọng lượng chỉ 1.75 kg để người dùng có thể cất gọn trong balo để mang đi bất kỳ đâu.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (18, 5, N'LAPTOP MSI MODERN 14 (C13M-611VN)', 3, 4, N'Intel® Core i5-1335U', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(16899000.00 AS Decimal(10, 2)), 10, N'LAPTOP MSI MODERN 14 (C13M-611VN)_1.jpg', N'LAPTOP MSI MODERN 14 (C13M-611VN)_2.jpg', N'LAPTOP MSI MODERN 14 (C13M-611VN)_3.jpg', N'MSI Modern 14 là dòng laptop cho sinh viên được nhiều bạn lựa chọn trong việc đồng hành trong mọi công việc và học tập. Và mẫu máy được ra mắt với thiết kế di động cao cùng bộ cấu hình mạnh mẽ đáp ứng nhiều tác vụ hằng ngày.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (19, 5, N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)', 4, 5, N'Intel® Core i7-13620H', N'NVIDIA® GeForce RTX™ 4060 8GB', 16, N'1TB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(33849000.00 AS Decimal(10, 2)), 10, N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_1.png', N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_2.png', N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_3.png', N'MSI Katana 15 B13VFK 676VN thể hiện sức mạnh của mình với những trang bị cao cấp hiện nay. Với CPU Intel Gen 13 mới nhất cùng model i7-13620H mang lại những đường kiếm nhanh như chớp, giúp bạn xử lý gọn gàng từng tác vụ một.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (20, 6, N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5', 1, 4, N'Intel® Core i5-1340P', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(16.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(40999000.00 AS Decimal(10, 2)), 10, N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_1.png', N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_2.png', N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_3.png', N'Laptop LG Gram Style khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (21, 6, N'LAPTOP LG GRAM 17Z90R-G.AH78A5', 3, 5, N'Intel® Core i7-1360P', N'Intel® Iris Xe Graphics', 16, N'1TB SSD', CAST(17.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(48149000.00 AS Decimal(10, 2)), 10, N'LAPTOP LG GRAM 17Z90R-G.AH78A5_1.png', N'LAPTOP LG GRAM 17Z90R-G.AH78A5_2.png', N'LAPTOP LG GRAM 17Z90R-G.AH78A5_3.png', N'Laptop LG Gram khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (22, 7, N'LAPTOP DELL VOSTRO 5620 (VWXVW)', 1, 4, N'Intel® Core i5-1240P', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(16.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(24599000.00 AS Decimal(10, 2)), 10, N'LAPTOP DELL VOSTRO 5620 (VWXVW)_1.png', N'LAPTOP DELL VOSTRO 5620 (VWXVW)_2.png', N'LAPTOP DELL VOSTRO 5620 (VWXVW)_3.png', N'Laptop Dell Vostro mang đến hiệu suất làm việc cao, xử lý mọi tác vụ nhanh chóng trong thiết kế gọn nhẹ đầy thanh lịch. Đây là một trong những sản phẩm laptop văn phòng phổ thông thu hút được nhiều sự quan tâm của khách hàng nhất.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (23, 7, N'LAPTOP DELL LATITUDE 3520 (71004153)', 2, 4, N'Intel® Core i5-1135G7', N'Intel® Iris Xe Graphics', 8, N'256GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(15399000.00 AS Decimal(10, 2)), 10, N'LAPTOP DELL LATITUDE 3520 (71004153)_1.jpg', N'LAPTOP DELL LATITUDE 3520 (71004153)_2.jpg', N'LAPTOP DELL LATITUDE 3520 (71004153)_3.jpg', N'Máy sử dụng tone màu đen cổ điển làm chủ đạo với logo Dell màu trắng đặt tại vị trí trung tâm mặt trên của máy. Đây là thiết kế khá phù hợp với gần như mọi lứa tuổi khách hàng, phù hợp với mọi bối cảnh.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (24, 7, N'LAPTOP DELL INSPIRON 3520', 3, 4, N'Intel® Core i5-1135G7', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(13499000.00 AS Decimal(10, 2)), 10, N'LAPTOP DELL INSPIRON 3520_1.jpg', N'LAPTOP DELL INSPIRON 3520_2.jpg', N'LAPTOP DELL INSPIRON 3520_3.jpg', N'Laptop Dell Inspiron được hãng sản xuất vô cùng đơn giản nhưng lại vô cùng bền bỉ. Với những người đã sở hữu cho mình những con laptop từ Dell chắc hẳn không quá xa lạ về độ bền mà nó mang lại. Vỏ máy bao phủ bởi một lớp màu đen đơn giản nhưng không hề đơn điệu với phần logo Dell in chìm chính giữa bề mặt máy.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (25, 7, N'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)', 4, 5, N'Intel® Core i7-13620HX', N'NVIDIA® GeForce RTX™ 4050 6GB GDDR6', 16, N'512GB SSD', CAST(15.60 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(38849000.00 AS Decimal(10, 2)), 10, N'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)_1.png', N'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)_2.png', N'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)_3.png', N'Dòng laptop Dell này được trang bị cấu hình mạnh mẽ giúp cho các game thủ chiến game mượt mà. Đó là sức mạnh đến từ CPU Intel Core i7-13650HX đi cùng là card đồ họa RTX 4060. Bộ vi xử lý đảm bảo tốc độ xử lý các tác vụ, RTX 4060 thì đem lại đồ họa đỉnh cao trên những tựa game AAA, tất cả hướng đến trải nghiệm chơi game tuyệt vời nhất cho người dùng.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (26, 8, N'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7 (82SN003HVN)', 1, 1, N'AMD Ryzen 5 6600HS', N'NVIDIA® GeForce RTX™ 3050 Ti 4GB GDDR6', 16, N'512GB SSD', CAST(16.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(22299000.00 AS Decimal(10, 2)), 10, N'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7_1.jpg', N'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7_2.jpg', N'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7_3.jpg', N'Laptop văn phòng, phân khúc sản phẩm cực kì “nóng” với lượng người dùng và nhu cầu sử dụng cao đến từ học sinh - sinh viên hay dân văn phòng chính hiệu. Không còn độc quyền với những “ông hoàng”, nay chúng ta cùng đón chào một tân binh đến từ Lenovo với series Ideapad Slim 5 của mình.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (27, 8, N'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)', 2, 4, N'Intel® Core i5-1335U', N'Integrated Intel® Iris XE Graphics', 8, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(20299000.00 AS Decimal(10, 2)), 10, N'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)_1.jpg', N'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)_2.jpg', N'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)_3.jpg', N'Lenovo ThinkPad nổi bật với vẻ ngoài lịch lãm, độ hoàn thiện tốt và một thương hiệu đã quá nổi tiếng đối với dân văn phòng. Hướng đến đối tượng là những người cần một mẫu laptop cơ động nhưng cũng đủ chắc chắn để mang lại trải nghiệm tốt khi làm việc ở mọi nơi', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (28, 8, N'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)', 3, 1, N'AMD Ryzen 5 7530U', N'Integrated AMD Radeon™ Graphics', 8, N'512GB SSD', CAST(14.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 60, N'Window', CAST(15299000.00 AS Decimal(10, 2)), 10, N'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)_1.jpg', N'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)_2.jpg', N'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)_3.jpg', N'Laptop văn phòng, phân khúc sản phẩm cực kì “nóng” với lượng người dùng và nhu cầu sử dụng cao đến từ học sinh - sinh viên hay dân văn phòng chính hiệu. Không còn độc quyền với những “ông hoàng”, nay chúng ta cùng đón chào một tân binh đến từ Lenovo với series Ideapad Slim 5 của mình.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (29, 8, N'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)', 4, 5, N'Intel® Core i7-12700H', N'NVIDIA® GeForce RTX™ 3060 6GB GDDR6', 16, N'512GB SSD', CAST(16.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(37349000.00 AS Decimal(10, 2)), 10, N'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)_1.jpg', N'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)_2.jpg', N'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)_3.jpg', N'Lenovo Legion 5 là một trong những dòng sản phẩm laptop gaming với hiệu năng vượt trội, kiểu dáng thời thượng cùng những công nghệ cải tiến mới trong thiết kế. Hứa hẹn mang đến một sản phẩm vượt ngoài mong đợi của nhiều người về dòng Lenovo Legion này.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (30, 9, N'SURFACE LAPTOP 5 (RBG-00026)', 3, 5, N'Intel® Core i7-13255U', N'Intel® Iris Xe Graphics', 16, N'512GB SSD', CAST(13.30 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(47349000.00 AS Decimal(10, 2)), 10, N'SURFACE LAPTOP 5 (RBG-00026)_1.png', N'SURFACE LAPTOP 5 (RBG-00026)_2.png', N'SURFACE LAPTOP 5 (RBG-00026)_3.png', N'Thiết kế đơn giản phần mặt lưng cùng bốn góc bo tròn, kết hợp với logo Microsoft tông màu xám bạc (hoặc đen) mang lại cảm giác sang trọng, tinh tế cho Surface Laptop 5.', 1)
GO
INSERT [dbo].[Laptops] ([Laptop_ID], [Brand_ID], [Model], [Category_ID], [Processor_Type_ID], [Processor_Type_Name], [Graphics_Card], [RAM], [Storage], [Screen_Size], [Screen_Resolution], [Screen_Frequency], [Operating_System], [Price], [Stock_Quantity], [Laptop_Image1], [Laptop_Image2], [Laptop_Image3], [Description], [Status]) VALUES (31, 9, N'MICROSOFT SURFACE SURFACE PRO 9', 2, 4, N'Intel® Core i5-1235U', N'Intel® Iris Xe Graphics', 8, N'256GB SSD', CAST(13.00 AS Decimal(4, 2)), N'Full HD 1920 x 1080', 120, N'Window', CAST(27299000.00 AS Decimal(10, 2)), 10, N'MICROSOFT SURFACE SURFACE PRO 9_1.png', N'MICROSOFT SURFACE SURFACE PRO 9_2.png', N'MICROSOFT SURFACE SURFACE PRO 9_3.png', N'Sở hữu thiết kế vô cùng sang trọng với chất liệu từ nhôm nguyên khối, mang đến cảm giác chắc chắn nhưng vẫn vô cùng mỏng nhẹ với trọng lượng chỉ 1,29kg - 1,54kg giúp người dùng dễ dàng mang theo bên mình mọi lúc,mọi nơi.', 1)
GO
SET IDENTITY_INSERT [dbo].[Laptops] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Items] ON 
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (1, 1, 1, N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)', N'Acer', N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_1.jpg', 1, CAST(0.20 AS Decimal(10, 2)), CAST(9699000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (2, 2, 5, N'LAPTOP APPLE MACBOOK AIR (Z1600005A) (2022)', N'Apple', N'LAPTOP APPLE MACBOOK AIR (Z1600005A)_1.png', 1, CAST(0.20 AS Decimal(10, 2)), CAST(18999000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (3, 3, 2, N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)', N'Acer', N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_1.png', 1, CAST(0.40 AS Decimal(10, 2)), CAST(12299000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (4, 4, 6, N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA) (MIDNIGHT) (2023)', N'Apple', N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_1.png', 1, CAST(0.40 AS Decimal(10, 2)), CAST(32499000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (5, 5, 3, N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)', N'Acer', N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_1.png', 1, CAST(0.30 AS Decimal(10, 2)), CAST(18799000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (6, 6, 4, N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)', N'Acer', N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_1.png', 1, CAST(0.10 AS Decimal(10, 2)), CAST(18299000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (7, 7, 8, N'LAPTOP HP PROBOOK 440 G10 (873A9PA)', N'HP', N'LAPTOP HP PROBOOK 440 G10 (873A9PA)_1.jpg', 1, CAST(0.20 AS Decimal(10, 2)), CAST(21299000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (8, 8, 7, N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)', N'Apple', N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_1.png', 1, CAST(0.30 AS Decimal(10, 2)), CAST(35699000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (9, 9, 9, N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)', N'HP', N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_1.jpg', 1, CAST(0.40 AS Decimal(10, 2)), CAST(18799000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (10, 10, 10, N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)', N'HP', N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_1.jpg', 1, CAST(0.30 AS Decimal(10, 2)), CAST(19299000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (11, 11, 11, N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)', N'HP', N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_1.png', 1, CAST(0.10 AS Decimal(10, 2)), CAST(29349000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (12, 12, 12, N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W', N'Asus', N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_1.jpg', 1, CAST(0.20 AS Decimal(10, 2)), CAST(15799000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (13, 13, 13, N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W', N'Asus', N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_1.png', 1, CAST(0.40 AS Decimal(10, 2)), CAST(17799000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (14, 14, 14, N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W', N'Asus', N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_1.png', 1, CAST(0.30 AS Decimal(10, 2)), CAST(13849000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (15, 15, 15, N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W', N'Asus', N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_1.jpg', 1, CAST(0.10 AS Decimal(10, 2)), CAST(20299000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (16, 16, 16, N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)', N'MSI', N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_1.png', 1, CAST(0.20 AS Decimal(10, 2)), CAST(31849000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (17, 17, 20, N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5', N'LG', N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_1.png', 1, CAST(0.20 AS Decimal(10, 2)), CAST(40999000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (18, 18, 17, N'LAPTOP MSI MODERN 15 (B12MO-628VN)', N'MSI', N'LAPTOP MSI MODERN 15 (B12MO-628VN)_1.jpg', 1, CAST(0.40 AS Decimal(10, 2)), CAST(14299000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (19, 19, 18, N'LAPTOP MSI MODERN 14 (C13M-611VN)', N'MSI', N'LAPTOP MSI MODERN 14 (C13M-611VN)_1.jpg', 1, CAST(0.30 AS Decimal(10, 2)), CAST(16899000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (20, 20, 21, N'LAPTOP LG GRAM 17Z90R-G.AH78A5', N'LG', N'LAPTOP LG GRAM 17Z90R-G.AH78A5_1.png', 1, CAST(0.30 AS Decimal(10, 2)), CAST(48149000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Items] ([Order_Item_ID], [Order_ID], [Laptop_ID], [Model], [Brand], [Laptop_Image1], [Quantity], [Discount], [Price_Per_Item]) VALUES (21, 21, 19, N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)', N'MSI', N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_1.png', 1, CAST(0.10 AS Decimal(10, 2)), CAST(33849000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Order_Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (1, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(7759200.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (2, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(15199200.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (3, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(7379400.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (4, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(19499400.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (5, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(13159300.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (6, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(16469100.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (7, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(17039200.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (8, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(24989300.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (9, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(11279400.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (10, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(13509300.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (11, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(26414100.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (12, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(12639200.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (13, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(10679400.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (14, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-09-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(9694300.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (15, 4, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(18269100.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (16, 3, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'In store', CAST(0.00 AS Decimal(10, 2)), CAST(25479200.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Thành phố Hà Nội', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (17, 3, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'In store', CAST(0.00 AS Decimal(10, 2)), CAST(32799200.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Thành phố Hà Nội', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (18, 3, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'In store', CAST(0.00 AS Decimal(10, 2)), CAST(8579400.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Thành phố Hà Nội', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (19, 3, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'In store', CAST(0.00 AS Decimal(10, 2)), CAST(11829300.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Thành phố Hà Nội', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (20, 3, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'Cast', CAST(20000.00 AS Decimal(10, 2)), CAST(33704300.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Tỉnh Hải Dương', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Name], [Phone_Number], [Order_Date], [Payment_Method], [Ship_Fee], [Total_Price], [Status], [Address], [Note]) VALUES (21, 3, N'Nguyen Xuan Phi', N'0812497838', CAST(N'2023-10-15T00:00:00.000' AS DateTime), N'In store', CAST(0.00 AS Decimal(10, 2)), CAST(30464100.00 AS Decimal(10, 2)), N'Successful delivery', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tp.Hai Duong, Thành phố Hà Nội', N'')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Processor_Types] ON 
GO
INSERT [dbo].[Processor_Types] ([Processor_Type_ID], [Processor_Type_Name]) VALUES (1, N'AMD Ryzen 5')
GO
INSERT [dbo].[Processor_Types] ([Processor_Type_ID], [Processor_Type_Name]) VALUES (2, N'Apple M2')
GO
INSERT [dbo].[Processor_Types] ([Processor_Type_ID], [Processor_Type_Name]) VALUES (3, N'Intel Core i3')
GO
INSERT [dbo].[Processor_Types] ([Processor_Type_ID], [Processor_Type_Name]) VALUES (4, N'Intel Core i5')
GO
INSERT [dbo].[Processor_Types] ([Processor_Type_ID], [Processor_Type_Name]) VALUES (5, N'Intel Core i7')
GO
SET IDENTITY_INSERT [dbo].[Processor_Types] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (2, N'Marketing')
GO
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (3, N'Sale')
GO
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (4, N'Customer')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([User_ID], [Username], [Password], [Email], [Name], [Phone_Number], [Role_ID], [Avatar_Image], [Status]) VALUES (1, N'Admin', N'123', N'adminshopfee@gmail.com', N'At Van Min', NULL, 1, N'Go Youn Jung.jpg', 1)
GO
INSERT [dbo].[Users] ([User_ID], [Username], [Password], [Email], [Name], [Phone_Number], [Role_ID], [Avatar_Image], [Status]) VALUES (2, N'Marketing', N'123', N'marketingshopfee@gmail.com', N'Ma Ket Tinh', NULL, 2, N'default-avatar.jpg', 1)
GO
INSERT [dbo].[Users] ([User_ID], [Username], [Password], [Email], [Name], [Phone_Number], [Role_ID], [Avatar_Image], [Status]) VALUES (3, N'Sale', N'123', N'saleshopfee@gmail.com', N'Nguyen Van Seu', NULL, 3, N'default-avatar.jpg', 1)
GO
INSERT [dbo].[Users] ([User_ID], [Username], [Password], [Email], [Name], [Phone_Number], [Role_ID], [Avatar_Image], [Status]) VALUES (4, N'Customer', N'123', N'xuanphi2003@gmail.com', N'Cut Tom Mo', NULL, 4, N'default-avatar.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Order_Date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Laptops]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([Brand_ID])
GO
ALTER TABLE [dbo].[Laptops]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Laptops]  WITH CHECK ADD FOREIGN KEY([Processor_Type_ID])
REFERENCES [dbo].[Processor_Types] ([Processor_Type_ID])
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD FOREIGN KEY([Laptop_ID])
REFERENCES [dbo].[Laptops] ([Laptop_ID])
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([Order_ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Laptops] ([Laptop_ID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Shopping_Cart]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Laptops] ([Laptop_ID])
GO
ALTER TABLE [dbo].[Shopping_Cart]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([Role_ID])
GO
USE [master]
GO
ALTER DATABASE [ShopFee] SET  READ_WRITE 
GO
