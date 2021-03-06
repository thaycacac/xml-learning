USE [master]
GO

IF EXISTS(SELECT* FROM sys.databases where name='SHARPSHOP')
DROP DATABASE [SHARPSHOP]
CREATE DATABASE [SHARPSHOP]

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
EXEC sys.sp_db_vardecimal_storage_format N'SHARPSHOP', N'ON'
GO
ALTER DATABASE [SHARPSHOP] SET QUERY_STORE = OFF
GO
USE [SHARPSHOP]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/2/2020 9:45:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/2/2020 9:45:35 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/2/2020 9:45:35 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 4/2/2020 9:45:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[quantityInStock] [int] NOT NULL,
	[price] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[category] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[sale] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [fullname], [phone], [address], [email], [username], [password]) VALUES (1, N'Phan Văn Đức', N'0982323243', N'49 Hàng Bè, Hàng Bạc, Hoàn Kiếm, Hà Nội', N'duc@gmail.com', N'ducpv', N'123456')
INSERT [dbo].[Customer] ([id], [fullname], [phone], [address], [email], [username], [password]) VALUES (2, N'Phạm Ngọc Hòa', N'0968038714', N'35 Lương Ngọc Quyến, Hàng Buồm, Hoàn Kiếm, Hà Nội', N'hoa@gmail.com', N'thaycacac', N'123456')
INSERT [dbo].[Customer] ([id], [fullname], [phone], [address], [email], [username], [password]) VALUES (3, N'Đỗ Quang Hiệp', N'0983123423', N'4B Kim Đồng, Giáp Bát, Hoàng Mai, Hà Nội', N'hiep@gmail.com', N'hiepdq', N'123456')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (1, CAST(N'2020-01-11' AS Date), N'shiping', N'Tặng kèm kẹp sách', 1, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (2, CAST(N'2020-01-20' AS Date), N'done', N'', 2, CAST(N'2020-01-23' AS Date))
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (3, CAST(N'2020-02-11' AS Date), N'cancel', N'Khách hàng không nhận đồ', 3, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (4, CAST(N'2020-03-20' AS Date), N'shiping', N'Cho khách hàng kiểm tra hàng', 1, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (5, CAST(N'2020-03-20' AS Date), N'done', N'Cho khách kiểm tra hàng', 2, CAST(N'2020-03-25' AS Date))
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (6, CAST(N'2020-03-12' AS Date), N'cancel', N'Khách không ưng ý sản phẩm', 2, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (7, CAST(N'2020-03-22' AS Date), N'shipping', N'Tặng kèm kẹp sách', 2, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [status], [comment], [customerId], [shipDate]) VALUES (14, CAST(N'2020-01-26' AS Date), N'Shipping', N'Độc lập tự do hạnh phúc', 1, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (1, 1, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (2, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (3, 5, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (5, 1, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (5, 5, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (5, 6, 3)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (6, 1, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (6, 10, 5)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (6, 8, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (7, 6, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (7, 7, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (7, 5, 3)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (7, 3, 2)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 1, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 1, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderDetail] ([orderId], [productId], [quantity]) VALUES (14, 3, 1)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (1, N'Yêu Trên Từng Ngón Tay', 200, 75000, N'Yêu trên từng ngón tay là tập truyện ngắn thứ ba của Trần Trà My - cô gái Quảng Trị 24 tuổi bị khuyết tật. Đây là tập sách tiếp nối sau tuyển tập truyện ngắn Giấc mơ đôi chân thiên thần ra mắt vào tháng 7-2009 và Chúng ta là mùa xuân tháng 7-2010.

Yêu trên từng ngón tay là tập sách gồm 11 truyện ngắn viết về tình yêu, hôn nhân của những người trẻ 8X được viết trong hai năm. Trà My đã tái hiện những câu chuyện tình yêu có thật xung quanh cuộc sống của cô bằng những mẩu truyện ngắn đơn giản, chân thực và gần gũi.

Cơ duyên để Trà My viết tập truyện ngắn này là khi cô chứng kiến một câu chuyện tình yêu của hai người bạn chỉ có yêu nhau bằng ngón tay. Họ yêu nhau được ba năm và trong ba năm đó cô gái đã làm việc cật lực để giúp người yêu hoàn thành giấc mơ mở công ty phần mềm. Nhưng khi công ty của chàng trai được biết đến là lúc cô gái ngã quỵ vì căn bệnh ung thư giai đoạn cuối. Mỗi ngày họ đến bên nhau, không nói với nhau một lời nào, chỉ đan xen các ngón tay vào nhau để cảm nhận tình yêu bằng ngón tay.

11 truyện ngắn trong tập sách Yêu trên từng ngón tay là những câu chuyện mà cô chứng kiến trong các chuyến đi từ thiện, trong những lần đi ra ngoài, cô lắng nghe những câu chuyện của cô hàng xóm gần nhà…

Truyện Cô giáo Thương là câu chuyện về tình người và sống vị tha của một cô giáo. Cô giáo Thương đã hi sinh bằng mọi giá để bảo vệ 12 đứa trẻ lang thang cơ nhỡ. Trong chuyến đi từ thiện, Trà My đã chứng kiến và thấy rung động về tình người nên cô đã viết câu chuyện này.', N'Ngôn Tình', N'https://i.imgur.com/w8tIh07.jpg', 1)
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (3, N'Điều Bí Mật', 234, 105000, N'Cuốn sách Điều Bí Mật được xuất bản tại Nhật tháng 3/2017, đã bán được hơn 300.000 bản. Hiện cuốn tiểu thuyết này đang được chuyển thể thành truyện tranh, tập 1 đã được xuất bản vào tháng 4/2019.
Chúng ta không nhớ những kỉ niệm mà nhớ chính mình trong đó. Một phiên bản tươi đẹp, nhiều mộng mơ và luôn giả vờ là mình đã lớn…
Điều bí mật như một cuốn nhật kí ghi lại những suy tư có phần ngây ngô của nhóm năm bạn học sinh cấp Ba – Kyou, Mikki, Para, Jika và Eru. Trong không khí căng thẳng của những kì thi nối tiếp nhau và tâm trạng buồn vui lẫn lộn khi sắp phải tạm biệt tuổi học trò, những cô cậu thiếu niên ấy vẫn tận hưởng trọn vẹn từng khoảnh khắc. Họ bận rộn với những hoạt động ngoại khóa và chí chóe với nhau suốt ngày, không phải vì họ ưa phá rối mà biết rằng chỉ còn mấy tháng nữa thôi là mỗi người một phương.
Mỗi chương sách là một mảnh kí ức của năm nhân vật xoay quanh những sự kiện bé xíu nhưng đời học sinh ai ai cũng từng trải qua – thích thầm và giận hờn vu vơ. Câu chuyện bắt đầu bằng những lời tâm sự của Kyou – chàng trai nhút nhát không dám bày tỏ với cô bạn mà mình quý mến bấy lâu. Chính điều đó đã kéo theo bao rắc rối to nhỏ trong nhóm bạn. Lật từng trang sách, độc giả nhiều khi phải bật cười vì mấy cô cậu ấy sao mà giống mình ngày xưa đến thế. Dù bao nhiêu lớp người đã đi qua thì tuổi học trò vẫn mãi là quãng thời gian vô tư hồn nhiên nhất. Khi chúng ta còn trẻ dại, chúng ta luôn tự phức tạp hóa mọi chuyện trong cuộc sống thường ngày để rồi không tránh khỏi những trận cãi vã, xô xát không đáng có. Sau này nhìn lại, có lẽ sẽ nhiều sự nuối tiếc hơn là cáu kỉnh giận dỗi bởi vì không còn chúng ta của ngày xưa nữa rồi. Cô bạn Para trong cuốn tiểu thuyết này cũng thấu hiểu điều đó nên đã bày tỏ quyết tâm khép lại năm học cuối cấp bằng một vở kịch thật hoành tráng. Ban đầu, mọi người không mấy hào hứng, chỉ làm theo Para vì không có ý tưởng nào khác nhưng dần dà ai cũng bị lôi cuốn vào cuộc vui chung. Giây phút đứng trong cánh màn trước khi lên sân khấu, tất cả đều cảm thấy những nỗ lực mình đã bỏ ra hoàn toàn xứng đáng. Họ trân trọng vở kịch này vì nó chứa đựng những kỉ niệm cuối cùng, và vì thế mà đẹp nhất, trong đời học sinh của họ. Câu chuyện mở ra bằng những băn khoăn và kết lại bởi niềm tin mãnh liệt vào tương lai – tác giả không viết tiếp về kì thi đại học cam go hay chân dung của nhóm bạn khi đã ra trường hẳn là vì mong muốn lưu giữ khoảnh khắc rực rỡ nhất ấy.
Gấp lại Điều bí mật, mỗi độc giả sẽ mỉm cười vì “siêu năng lực” mà cả năm nhân vật nghĩ rằng chỉ mình sở hữu thật ra chẳng đáng kể so với con đường phía trước, chỉ là họ đang sống với niềm tin nhiệt thành của tuổi trẻ mà thôi. Dẫu vậy, đó lại là dư âm đậm nét nhất trong chúng ta – nỗi nhớ dịu dàng và trong sáng về tuổi mười tám đầy những âu lo tưởng chừng to tát, không lấn át được hoài bão dấn thân có phần nông nổi của những cô cậu thanh thiếu niên thuở ấy.', N'Ngôn Tình', N'https://i.imgur.com/JgFYeh3.jpg', 1)
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (5, N'Nếu Như Yêu', 123, 82600, N'Nếu như yêu giống như một lát cắt ngang qua cuộc đời hiện thực, biểu hiện đầy đủ những sắc thái của yêu thương. Vì yêu nên hy sinh, vì yêu nên khoan dung, vì yêu nên tha thứ, vì yêu nên mạnh mẽ, vì yêu nên điên cuồng… Nếu như yêu là một câu chuyện xúc động, đầy tính nhân văn và tình người về quá trình đi tìm nguồn gốc xuất thân của hai cô gái, xoay quanh họ là những mối quan hệ gia đình, bạn bè, công việc có mâu thuẫn, có hiểu lầm, có xung đột, giận hờn, nhưng trên hết lòng bao dung, tình yêu thương, nhân ái giữa con người với con người luôn tràn đầy. Nếu như yêu hãy biết hi sinh, cảm thông, chia sẻ và yêu thương lẫn nhau, đừng để lại những niềm hối tiếc…', N'Ngôn Tình', N'https://i.imgur.com/HyBI8yX.jpg', 0)
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (6, N'Of Fire And Stars', 32, 23600, N'Một ảo mộng đầu tay trong không khí và lãng mạn hoàn hảo cho người hâm mộ Lời nguyền của Ash và The Winner.

Được hứa hôn từ khi còn nhỏ với hoàng tử Mynaria, Công chúa Dennaleia luôn biết tương lai của mình sẽ ra sao. Cuộc hôn nhân của cô sẽ gắn kết liên minh giữa Mynaria và quê hương của cô, bảo vệ người dân của cô khỏi các vương quốc thù địch khác.

Nhưng Denna có một bí mật. Cô sở hữu một Ám ảnh để bắn một món quà nguy hiểm cho nữ hoàng tương lai của một vùng đất nơi ma thuật bị cấm.

Bây giờ Denna phải học cách của vương quốc mới của mình trong khi cố gắng che giấu ma thuật đang phát triển của mình. Để làm cho vấn đề tồi tệ hơn, cô phải học cưỡi những con ngựa đáng gờm của Mynaria trước khi đăng quang và giáo viên của cô là người đe dọa cô nhất, Công chúa Amaranthine gai góc và độc đáo, em gái của cô đã hứa hôn.

Khi một vụ ám sát gây sốc khiến vương quốc quay cuồng, Mare và Denna miễn cưỡng hợp lực để tìm kiếm thủ phạm. Khi hai người làm việc cùng nhau, họ phát hiện ra có nhiều thứ với nhau hơn họ nghĩ - và chẳng mấy chốc tình bạn của họ đang đe dọa sẽ nảy nở thành một thứ gì đó nhiều hơn.

Nhưng với việc sản xuất xung đột nguy hiểm khiến liên minh trở nên quan trọng hơn bao giờ hết, hành động theo cảm xúc của họ có thể gây chết người. Buộc phải lựa chọn giữa nhiệm vụ và trái tim của họ, Mare và Denna phải tìm cách cứu vương quốc của họ - và nhau.', N'Tiểu Thuyết', N'https://i.imgur.com/ievcrqY.jpg', 1)
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (7, N'Cướp Anh Từ Tay Định Mệnh', 314, 72000, N'Cướp anh từ tay định mệnh là chuỗi dài những yêu và hận, tha thứ và trân trọng, vứt bỏ và giành lại.

Tin tôi đi, rồi bạn sẽ tìm thấy tuổi trẻ và tình yêu của mình nơi đó…

Trong câu chuyện này, có muôn dạng của tình yêu. Một mối tình say sưa, đầy mê đắm và nồng nàn. Những quan tâm ân cần như gió, rụt rè như cỏ, đứng từ xa vun vén yêu thương. Hay là sự ngộ nhận về tình yêu, giam hãm và bóp nghẹt một trái tim quỵ lụy yếu đuối. Đôi lúc là những toan tính nhỏ nhen con trẻ, lừa dối tim mình, buộc chặt một trái tim đang lạc lối tìm đường yêu…

Trong câu chuyện này, hận thù xếp dày từng lớp, quyện vào nhau, ám ảnh những con người đang sống. Quá khứ đã lùi xa, chẳng vô tình cũng không cố ý, nhưng cứ trăn trở và thao thức hiện tại. Yêu thương không đủ, thù hận không đành, càng muốn tha thứ, sao càng thấy khó khăn.

Cướp anh từ tay định mệnh nhẹ nhàng như vị tình yêu, đắng chát như mùi thù hận và bất ngờ với những bí mật khơi sâu. Cuối cùng nhận ra, chẳng ai có thể vô cảm khi đã sinh ra để làm người, trái tim dẫu méo mó sứt sẹo vì những nỗi đời nghiệt ngã thì vẫn cứ ẩn che những hẫng hụt, những chới với, những hờn giận và cả những yêu thương.

Nếu bạn ưa lãng mạn nhưng chán sự nhàm tai, cũ mòn, quen thuộc thì Cướp anh từ tay định mệnh là món quà vừa vặn nhất để dành tặng bản thân khi mùa lạnh đang về.

Tin tôi đi, rồi bạn sẽ tìm thấy tuổi trẻ và tình yêu của mình nơi đó…', N'Ngôn Tình', N'https://i.imgur.com/Evu2v0S.jpg', 0)
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (8, N'One And Only Ivan', 56, 96000, N'Người chiến thắng huy chương Newbery 2013 Lấy cảm hứng từ một câu chuyện có thật, đây là câu chuyện được viết rất hay về cách một con khỉ đột hùng mạnh giành được tự do. Một sự pha trộn chiến thắng của sự hài hước và sâu sắc sẽ thu hút người hâm mộ của Michael Morpurgo. Ivan là một con khỉ đột dễ tính, người đã dành cả đời để biểu diễn cho đám đông tại trung tâm mua sắm Lối ra 8. Anh hiếm khi bỏ lỡ cuộc sống trong rừng rậm. Trên thực tế, anh hầu như không nghĩ về nó. Nhưng mọi thứ thay đổi khi một chú voi con tên Ruby đến và Ivan nhận ra mình phải tìm một cuộc sống mới cho cả hai. Từ quan điểm của Ivan, đây là một cuốn tiểu thuyết nổi bật với thông điệp thích hợp dành cho độc giả của 9+.', N'Ngôn Tình', N'https://i.imgur.com/rWiFwe6.jpg', 1)
INSERT [dbo].[Product] ([id], [name], [quantityInStock], [price], [description], [category], [image], [sale]) VALUES (10, N'The Calico Jungle', 74, 125000, N'Một người mẹ cho cậu con trai của mình một chiếc chăn làm bằng tay, nhưng nó không chỉ là một chiếc chăn. Đó là cả một thế giới nơi những con vật tưởng tượng chạy, trốn, bơi và vui đùa trong một khu rừng nhiệt đới. Cậu bé bước vào phong cảnh hoang dã này và đi qua nó. Anh ta theo dõi những con chim calico đang mổ hoa quả, nhìn thấy những con voi calico đang tắm cho nhau, phát hiện ra những con ngựa đốm, sư tử sọc và cá calico tỏa sáng như những viên ngọc quý. Khi anh ta đến gần phía xa của chăn, những con vật anh gặp phải đang cuộn tròn trong giấc ngủ. Cậu bé cũng buồn ngủ. Mắt anh nhắm lại và anh mơ thấy mình đang đi qua khu rừng nhiệt đới, dưới những tán cây, nơi có tất cả những loài động vật kỳ lạ và tuyệt vời. Cuốn sách tuyệt vời này của họa sĩ và họa sĩ minh họa nổi tiếng Dahlov Ipcar sẽ khơi dậy trí tưởng tượng của mọi đứa trẻ, truyền cảm hứng cho chúng đặt câu hỏi về những gì là thật và mời chúng khám phá một thế giới đầy màu sắc và khả năng.', N'Tiểu Thuyết', N'https://i.imgur.com/KZ9S6cf.jpg', 0)
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