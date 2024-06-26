USE [master]
GO
/****** Object:  Database [SWP391_Project_OnlineShop]    Script Date: 10/03/2023 22:34:20 ******/
CREATE DATABASE [SWP391_Project_OnlineShop]
 CONTAINMENT = NONE

ALTER DATABASE [SWP391_Project_OnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project_OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_Project_OnlineShop', N'ON'
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391_Project_OnlineShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/03/2023 22:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[imageAvt] [varchar](max) NULL,
	[LoginWith] [int] NULL,
	[Status] [bit] NULL,
	[LastDateLogin] [date] NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[roleid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[brief_infor] [nvarchar](max) NULL,
	[updateBy] [int] NULL,
	[status] [bit] NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[cateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedBack_id] [int] IDENTITY(1,1) NOT NULL,
	[rated_star] [float] NULL,
	[feedback] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[status] [bit] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedBack_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[size] [int] NOT NULL,
	[quantity] [int] NULL,
	[totalMoney] [money] NULL,
	[CreateDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[price] [money] NULL,
	[description] [nvarchar](max) NULL,
	[imageUrl] [varchar](max) NULL,
	[quantitySaled] [int] NULL,
	[categoryid] [int] NULL,
	[managerId] [int] NULL,
	[brandId] [int] NULL,
	[isSale] [bit] NULL,
	[Gender] [int] NULL,
	[isAdult] [bit] NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagesUrl] [varchar](max) NULL,
	[pid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[pid] [int] NOT NULL,
	[sizeId] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC,
	[sizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[feedbackId] [int] NULL,
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[reply] [nvarchar](max) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 10/03/2023 22:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sliderTitle] [varchar](50) NULL,
	[imageUrl] [varchar](max) NULL,
	[arrange] [int] NULL,
	[Status] [bit] NULL,
	[updateBy] [int] NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

Create table Product_Sale (
	[ProductID] [int] FOREIGN KEY REFERENCES product(id) PRIMARY KEY NOT NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[salePrice] [money] NULL,
	[discount] [int] null,
	[isFlashSale] [bit] NULL,
	[quantity] [int] NULL,
	[timeFrame] [int] NULL,
	[updateBy] [int] FOREIGN KEY REFERENCES Account(Id),
)
go
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password], [Fullname], [Gender], [Phone], [Address], [imageAvt], [LoginWith], [Status], [LastDateLogin], [CreateDate], [UpdateDate], [roleid]) VALUES (1, N'ruannguyen05@gmail.com', NULL, N'Nguyễn Ruẩn', 1, N'0981604658', N'Hải Đường , Hải Hậu , Nam Định', N'Images/Avatar/27f9492067ce458497fcacd80b93832d-test.png', 2, 1, CAST(N'2023-10-03' AS Date), CAST(N'2023-09-25' AS Date), CAST(N'2023-09-29' AS Date), 1)
INSERT [dbo].[Account] ([Id], [Email], [Password], [Fullname], [Gender], [Phone], [Address], [imageAvt], [LoginWith], [Status], [LastDateLogin], [CreateDate], [UpdateDate], [roleid]) VALUES (2, N'tamnt122@fpt.edu.vn', N'e10adc3949ba59abbe56e057f20f883e', N'Cô tâm', 1, N'1234567890', N'Hà nội', NULL, 1, 1, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1)
INSERT [dbo].[Account] ([Id], [Email], [Password], [Fullname], [Gender], [Phone], [Address], [imageAvt], [LoginWith], [Status], [LastDateLogin], [CreateDate], [UpdateDate], [roleid]) VALUES (3, N'ruannvhe160301@fpt.edu.vn', N'96e79218965eb72c92a549dd5a330112', N'Nguyễn Ruẩn', 1, N'0981604658', N'Hải Đường , Hải Hậu , Nam Định', N'Images/Avatar/84c2143c8e8b4d7dbd96ccee8da5e857-test.png', 1, 1, CAST(N'2023-10-03' AS Date), CAST(N'2023-09-26' AS Date), CAST(N'2023-10-02' AS Date), 1)
INSERT [dbo].[Account] ([Id], [Email], [Password], [Fullname], [Gender], [Phone], [Address], [imageAvt], [LoginWith], [Status], [LastDateLogin], [CreateDate], [UpdateDate], [roleid]) VALUES (4, N'a@fpt.edu.vn', N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2023-09-26' AS Date), CAST(N'2023-09-26' AS Date), CAST(N'2023-09-26' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([id], [Name], [CreateDate], [UpdateDate]) VALUES (1, N'Adidas', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Brands] ([id], [Name], [CreateDate], [UpdateDate]) VALUES (2, N'Converse', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Brands] ([id], [Name], [CreateDate], [UpdateDate]) VALUES (3, N'Nike', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Brands] ([id], [Name], [CreateDate], [UpdateDate]) VALUES (4, N'Vans', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Brands] ([id], [Name], [CreateDate], [UpdateDate]) VALUES (5, N'Timberland', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cateid], [Name], [CreateDate], [UpdateDate]) VALUES (1, N'Giày thể thao', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Categories] ([cateid], [Name], [CreateDate], [UpdateDate]) VALUES (2, N'Giày chạy bộ', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Categories] ([cateid], [Name], [CreateDate], [UpdateDate]) VALUES (3, N'Giày trẻ em', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Categories] ([cateid], [Name], [CreateDate], [UpdateDate]) VALUES (4, N'Giày thời trang', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
INSERT [dbo].[Categories] ([cateid], [Name], [CreateDate], [UpdateDate]) VALUES (5, N'Giày cao gót', CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (3, N'GIÀY ADIDAS DURAMO 10 WIDE NAM', 1490000.0000, N'Giày adidas Duramo 10 bạn có thể sử dụng trong mọi hoạt động hàng ngày từ chạy bộ, tập gym, đi chơi, đi làm đều rất tiện lợi. Đặc biệt với mức giá vô cùng hợp lý, đây là mẫu giày adidas cực HOT trong năm nay.', N'https://myshoes.vn/image/cache/catalog/2023/adidas/ad5/giay-adidas-duramo-10-wide-nam-den-den-01-800x800.jpg', 50, 1, 4, 1, 0, 1, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (4, N'GIÀY ADIDAS X MARIMEKKO SUPERNOVA 2.0 NAM', 2490000.0000, N'Giày Adidas x Marimekko Supernova 2.0 có phần upper được làm từ chất liệu mesh thoáng khí, phần đế giữa kết hợp 2 công nghệ Bounce và Boost trứ danh mang đến cho người sử dụng cảm giác êm ái dễ chịu khó tìm thấy ở sản phẩm thông thường. Bạn có thể sử dụng đôi giày này để đi cả ngày hoặc chạy bộ quãng đường rất dài mà không cảm thấy đau chân hay khó chịu gì cả.', N'https://myshoes.vn/image/cache/catalog/2023/adidas/ad5/giay-adidas-x-marimekko-supernova-2-nam-den-xam-01-800x800.jpg', 50, 1, 4, 1, 0, 1, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (5, N'GIÀY NIKE AIR WINFLO 10 NỮ ', 2490000.0000, N'Giày Nike Air Winflo 10 có nhiều sự cải tiến vượt trội so với mẫu Winflo 9 trước đó cả về kiểu dáng cũng như những công nghệ hỗ trợ đi kèm.Phần upper với chất liệu mesh cao cấp, mềm mại linh hoạt và rất thoáng khí. Phần đế giữa với bộ đệm full-length Air trứ danh giúp tăng cường độ êm và đàn hồi đồng đều trên toàn bộ bề mặt đế giày. Ngoài ra, phần mũi giày được cải tiến vừa vặn ngón chân khi sử dụng.', N'https://myshoes.vn/image/cache/catalog/2023/nike/nk1/giay-nike-air-winflo-10-nu-trang-tim-01-800x800.jpg', 50, 1, 4, 3, 0, 0, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (6, N'GIÀY NIKE REACT ESCAPE RUN 2 NỮ ', 2490000.0000, N'Giày Nike React Escape Run 2 một mẫu giày thể thao có thiết kế thời trang, với bộ đệm vô cùng êm ái tạo cảm giác thật sự dễ chịu khi di chuyển. Một mẫu giày tuyệt vời mà chị em không thể bỏ qua được.', N'https://myshoes.vn/image/cache/catalog/2023/nike/nk08/giay-nike-react-escape-run-2-nu-trang-xanh-01-800x800.jpg', 50, 1, 4, 3, 0, 0, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (7, N'GIÀY NIKE JORDAN NU RETRO 1 LOW NAM', 2790000.0000, N'Giày Nike Jordan Nu Retro 1 Low là một trong những dòng giày sneaker nổi tiếng nhất của thương hiệu Jordan, một mẫu giày mà mỗi khi xuất hiện luôn tạo ra cơn sốt trên toàn cầu, một mẫu giày huyện thoại của biết bao nhiêu thế hệ', N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-01-800x800.jpg', 50, 4, 4, 3, 0, 1, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (8, N'GIÀY NIKE DUNK LOW RETRO PREMIUM NAM', 2890000.0000, N'Giày Nike Dunk Low Retro Premium là dòng giày sneaker huyện thoại cao cấp rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike Dunk Low chắc chắn là đôi giày không thể thiếu với bất cứ ai', N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-01-800x800.jpg', 50, 4, 4, 3, 0, 1, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [imageUrl], [quantitySaled], [categoryid], [managerId], [brandId], [isSale], [Gender], [isAdult], [CreateDate], [UpdateDate], [Status]) VALUES (9, N'GIÀY NIKE DUNK LOW RETRO NAM', 2790000.0000, N'Giày Nike Dunk Low Retro là dòng giày sneaker huyền thoại rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike Dunk Low chắc chắn là đôi giày không thể thiếu với bất cứ ai.', N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-nam-den-trang-01-800x800.jpg', 50, 4, 4, 3, 0, 1, 1, CAST(N'2023-09-28' AS Date), CAST(N'2023-09-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (1, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-01-100x100.jpg', 7)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (2, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-02-100x100.jpg', 7)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (3, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-03-100x100.jpg', 7)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (4, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-04-100x100.jpg', 7)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (5, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-05-100x100.jpg', 7)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (6, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk012/giay-jordan-nu-retro-1-low-nam-trang-vang-06-100x100.jpg', 7)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (7, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-01-100x100.jpg', 8)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (8, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-02-100x100.jpg', 8)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (9, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-03-100x100.jpg', 8)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (10, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-04-100x100.jpg', 8)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (11, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-05-100x100.jpg', 8)
INSERT [dbo].[ProductImages] ([id], [imagesUrl], [pid]) VALUES (12, N'https://myshoes.vn/image/cache/catalog/2023/nike/nk011/giay-nike-dunk-low-retro-premium-nam-xanh-trang-06-100x100.jpg', 8)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 1, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 2, 0)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 3, 1)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 4, 12)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 5, 4)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 6, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 7, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 8, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (3, 9, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 1, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 2, 0)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 3, 1)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 4, 12)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 5, 4)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 6, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 7, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 8, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (4, 9, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 1, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 2, 0)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 3, 1)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 4, 12)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 5, 4)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 6, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 7, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 8, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (5, 9, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 1, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 2, 0)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 3, 1)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 4, 12)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 5, 4)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 6, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 7, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 8, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (6, 9, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 1, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 2, 0)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 3, 1)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 4, 12)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 5, 4)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 6, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 7, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 8, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (7, 9, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 1, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 2, 0)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 3, 1)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 4, 12)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 5, 4)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 6, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 7, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 8, 10)
INSERT [dbo].[ProductSize] ([pid], [sizeId], [quantity]) VALUES (8, 9, 10)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Product Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Marketing Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Id], [size]) VALUES (1, 36)
INSERT [dbo].[Size] ([Id], [size]) VALUES (2, 37)
INSERT [dbo].[Size] ([Id], [size]) VALUES (3, 38)
INSERT [dbo].[Size] ([Id], [size]) VALUES (4, 39)
INSERT [dbo].[Size] ([Id], [size]) VALUES (5, 40)
INSERT [dbo].[Size] ([Id], [size]) VALUES (6, 41)
INSERT [dbo].[Size] ([Id], [size]) VALUES (7, 42)
INSERT [dbo].[Size] ([Id], [size]) VALUES (8, 43)
INSERT [dbo].[Size] ([Id], [size]) VALUES (9, 44)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([updateBy])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([cateid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([managerId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([sizeId])
REFERENCES [dbo].[Size] ([Id])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD FOREIGN KEY([feedbackId])
REFERENCES [dbo].[Feedback] ([feedBack_id])
GO
ALTER TABLE [dbo].[Sliders]  WITH CHECK ADD FOREIGN KEY([updateBy])
REFERENCES [dbo].[Account] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SWP391_Project_OnlineShop] SET  READ_WRITE 
GO
