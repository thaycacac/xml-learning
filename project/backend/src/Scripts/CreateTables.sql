USE [master]
GO
CREATE DATABASE [SHARPSHOP]
GO
ALTER DATABASE [SHARPSHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHARPSHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHARPSHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHARPSHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHARPSHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHARPSHOP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SHARPSHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHARPSHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHARPSHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHARPSHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHARPSHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHARPSHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHARPSHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHARPSHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHARPSHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SHARPSHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHARPSHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHARPSHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHARPSHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHARPSHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHARPSHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHARPSHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHARPSHOP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SHARPSHOP] SET  MULTI_USER 
GO
ALTER DATABASE [SHARPSHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHARPSHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHARPSHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHARPSHOP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SHARPSHOP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SHARPSHOP]
GO
/****** Object:  Table [dbo].[Customer]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[phone] [varchar](13) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[status] [nvarchar](30) NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[customerId] [int] NOT NULL,
	[shipDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[quantityInStock] [int] NOT NULL,
	[price] [money] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[category] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [fullname], [phone], [address], [email], [username], [password]) VALUES (1, N'Phan Van Duc', N'0982323243', N'Ha Noi', N'duc@gmail.com', N'phanduc0908', N'123456')
INSERT [dbo].[Customer] ([id], [fullname], [phone], [address], [email], [username], [password]) VALUES (2, N'Pham Ngoc Hoa', N'0862548394', N'Ninh Binh', N'hoa@gmail.com', N'hoapn', N'123456')
INSERT [dbo].[Customer] ([id], [fullname], [phone], [address], [email], [username], [password]) VALUES (3, N'Do Quang Hiep', N'0983123423', N'Hung Yen', N'hiep@gmail.com', N'hiepdq', N'123456')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (1, CAST(N'2020-01-11' AS Date), N'shiping', N'Đồ dễ vỡ', 1, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (2, CAST(N'2020-01-20' AS Date), N'done', N'', 2, CAST(N'2020-01-23' AS Date))
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (3, CAST(N'2020-02-11' AS Date), N'cancel', N'Khách hàng không nhận đồ', 3, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (1, 1, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (2, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (3, 5, 2)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category]) VALUES (1, N'Ngũ cốc lúa mạch', 200, 12.5000, N'Thơm ngon bổ dưỡng', N'Ngũ cốc')
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category]) VALUES (3, N'Sữa ngô bắp', 234, 5.9000, N'Đầy đủ dinh dưỡng', N'Sữa')
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category]) VALUES (5, N'TV Oled', 123, 34.5000, N'Màn hình full HD', N'TV')
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category]) VALUES (6, N'Tủ lạnh Toshiba', 32, 23.6000, N'Làm mát hiệu quả', N'Tủ lạnh')
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [SHARPSHOP] SET  READ_WRITE 
GO
