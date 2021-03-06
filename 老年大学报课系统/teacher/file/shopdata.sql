USE [master]
GO
/****** Object:  Database [shopdata]    Script Date: 03/11/2019 11:42:15 ******/
CREATE DATABASE [shopdata] ON  PRIMARY 
( NAME = N'shopdata', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\shopdata.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shopdata_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\shopdata_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shopdata] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shopdata].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shopdata] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [shopdata] SET ANSI_NULLS OFF
GO
ALTER DATABASE [shopdata] SET ANSI_PADDING OFF
GO
ALTER DATABASE [shopdata] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [shopdata] SET ARITHABORT OFF
GO
ALTER DATABASE [shopdata] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [shopdata] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [shopdata] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [shopdata] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [shopdata] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [shopdata] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [shopdata] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [shopdata] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [shopdata] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [shopdata] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [shopdata] SET  DISABLE_BROKER
GO
ALTER DATABASE [shopdata] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [shopdata] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [shopdata] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [shopdata] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [shopdata] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [shopdata] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [shopdata] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [shopdata] SET  READ_WRITE
GO
ALTER DATABASE [shopdata] SET RECOVERY FULL
GO
ALTER DATABASE [shopdata] SET  MULTI_USER
GO
ALTER DATABASE [shopdata] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [shopdata] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'shopdata', N'ON'
GO
USE [shopdata]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nchar](100) NULL,
	[pwd] [nchar](100) NULL,
	[email] [nchar](100) NULL,
	[tel] [nchar](100) NULL,
	[address] [nchar](100) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [tel], [address]) VALUES (3, N'李四                                                                                                  ', N'123456                                                                                              ', N'123456@qq.com                                                                                       ', NULL, NULL)
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [tel], [address]) VALUES (8, N'王明                                                                                                  ', N'111111                                                                                              ', N'1231231@qq.com                                                                                      ', NULL, NULL)
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [tel], [address]) VALUES (9, N'朝阳                                                                                                  ', N'111111                                                                                              ', N'1231231@qq.com                                                                                      ', NULL, NULL)
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [tel], [address]) VALUES (10, N'黎明                                                                                                  ', N'111111                                                                                              ', N'12312321@qq.com                                                                                     ', N'15227280199                                                                                         ', N'河北保定                                                                                                ')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[product]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[pic] [nchar](100) NULL,
	[price] [nchar](100) NULL,
	[nr] [nvarchar](max) NULL,
	[dish] [nchar](100) NULL,
	[cook] [nchar](100) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[product] ON
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (13, N'红烧肉                                                                                                 ', N'ms1.jpg                                                                                             ', N'29                                                                                                  ', N'五花肉最好用一层肥一层瘦的，做出来的红烧肉最漂亮好吃。
五花肉要翻炒出油，表面微黄再烧制，这样五花肉的口感不油腻。', N'鲁菜                                                                                                  ', N'黎明                                                                                                  ')
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (14, N'酱烧茄子                                                                                                ', N'ms2.jpg                                                                                             ', N'30                                                                                                  ', N'煎茄子的时候一定要煎软，把大部分煎出去，要么水气太大，味道不好，建议在煎茄子之前先在微波炉烤一下，再在锅里煎的时候就好煎多了。', N'粤菜                                                                                                  ', N'张强                                                                                                  ')
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (15, N'辣炒花蛤                                                                                                ', N'ms3.jpg                                                                                             ', N'15                                                                                                  ', N'1、加盐是花蛤吐沙用，烹炒过程无需加盐，生抽和辣椒酱里都含盐份。
2、炒花蛤很多菜谱提到要先用水焯一下。个人认为这样会让花蛤损失鲜度，肉质会缩小，口感不如直接炒鲜嫩。如果怕腥吃不惯就焯水。', N'浙菜                                                                                                  ', N'张浙                                                                                                  ')
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (16, N'板栗红烧肉                                                                                               ', N'ms4.jpg                                                                                             ', N'30                                                                                                  ', N'在没有加入任何佐料时将肉炒至断生，这样去除腥味，口感还不油。', N'苏菜                                                                                                  ', N'杨青                                                                                                  ')
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (17, N'酱排骨                                                                                                 ', N'ms5.jpg                                                                                             ', N'30                                                                                                  ', N'排骨最好选小排；腌制时已加盐，并且黄豆酱也含有盐分，最后调味要根据自家口味来定；一定要加热水，因为凉水汤、热水肉；也可以用高压锅煮，那时间只用二十分钟就可以', N'东北菜                                                                                                 ', N'祖新                                                                                                  ')
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (18, N'蜜汁鸡翅                                                                                                ', N'ms6.jpg                                                                                             ', N'25                                                                                                  ', N'鸡翅本身味道就很鲜美，放入柠檬与蜂蜜酸酸甜甜更是好吃，一点不腻，腌制时间要长一些会更入味，时间允许放冰箱腌制一宿最好！', N'闽菜                                                                                                  ', N'王鑫                                                                                                  ')
INSERT [dbo].[product] ([id], [title], [pic], [price], [nr], [dish], [cook]) VALUES (19, N'鱼香肉丝                                                                                                ', N'yxrs.jpg                                                                                            ', N'29                                                                                                  ', N'很好吃的鱼香肉丝', N'川菜                                                                                                  ', N'黎明                                                                                                  ')
SET IDENTITY_INSERT [dbo].[product] OFF
/****** Object:  Table [dbo].[pinglun1]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pinglun1](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pid] [bigint] NULL,
	[title] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
	[cook] [nchar](100) NULL,
	[state] [nchar](100) NULL,
 CONSTRAINT [PK_pinglun1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[pinglun1] ON
INSERT [dbo].[pinglun1] ([id], [pid], [title], [uname], [nr], [cook], [state]) VALUES (2, 14, N'酱烧茄子                                                                                                ', N'黎明                                                                                                  ', N'厨师的手艺不错，菜很好吃                                                                                        ', N'张强                                                                                                  ', N'已审核                                                                                                 ')
INSERT [dbo].[pinglun1] ([id], [pid], [title], [uname], [nr], [cook], [state]) VALUES (3, 16, N'板栗红烧肉                                                                                               ', N'黎明                                                                                                  ', N'很不错，很好吃                                                                                             ', N'杨青                                                                                                  ', N'已审核                                                                                                 ')
SET IDENTITY_INSERT [dbo].[pinglun1] OFF
/****** Object:  Table [dbo].[news]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[news] ON
INSERT [dbo].[news] ([id], [title], [uname], [nr]) VALUES (11, N'私人订制晚餐                                                                                              ', N'管理                                                                                                  ', N'纯属您的私人晚餐，法国大厨亲手定做，赶紧下单吧                                                                             ')
INSERT [dbo].[news] ([id], [title], [uname], [nr]) VALUES (12, N'私厨定做须知                                                                                              ', N'管理                                                                                                  ', N'关于私厨定做须知，在下订单之前需要确认是自己喜欢的，我们的厨师开始做之后就没法退单的                                                          ')
INSERT [dbo].[news] ([id], [title], [uname], [nr]) VALUES (13, N'雨天出餐通知                                                                                              ', N'管理                                                                                                  ', N'最近雨雪天气比较多，厨师在出餐的时候可能比较慢，需要您能耐心等待                                                                    ')
SET IDENTITY_INSERT [dbo].[news] OFF
/****** Object:  Table [dbo].[mb]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bzr] [nchar](100) NULL,
	[csd] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
 CONSTRAINT [PK_mb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mb] ON
INSERT [dbo].[mb] ([id], [bzr], [csd], [uname]) VALUES (1, N'张三                                                                                                  ', N'河北邯郸                                                                                                ', N'王明                                                                                                  ')
SET IDENTITY_INSERT [dbo].[mb] OFF
/****** Object:  Table [dbo].[dingdan]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dingdan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[pic] [nchar](100) NULL,
	[price] [nchar](100) NULL,
	[state] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
	[paystyle] [nchar](10) NULL,
	[pid] [bigint] NULL,
	[cook] [nchar](100) NULL,
	[cstate] [nchar](100) NULL,
 CONSTRAINT [PK_dingdan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[dingdan] ON
INSERT [dbo].[dingdan] ([id], [title], [uname], [pic], [price], [state], [nr], [paystyle], [pid], [cook], [cstate]) VALUES (2, N'酱烧茄子                                                                                                ', N'黎明                                                                                                  ', N'ms2.jpg                                                                                             ', N'30                                                                                                  ', N'已付款                                                                                                 ', N'保定市第五大街211号                                                                                         ', N'货到付款      ', 14, N'张强                                                                                                  ', N'完成                                                                                                  ')
INSERT [dbo].[dingdan] ([id], [title], [uname], [pic], [price], [state], [nr], [paystyle], [pid], [cook], [cstate]) VALUES (4, N'板栗红烧肉                                                                                               ', N'黎明                                                                                                  ', N'ms4.jpg                                                                                             ', N'30                                                                                                  ', N'已付款                                                                                                 ', N'北京市海淀区中关村大街112号                                                                                     ', N'货到付款      ', 16, N'杨青                                                                                                  ', N'完成                                                                                                  ')
SET IDENTITY_INSERT [dbo].[dingdan] OFF
/****** Object:  Table [dbo].[cooker]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cooker](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[cname] [nchar](100) NULL,
	[pwd] [nchar](100) NULL,
	[tel] [nchar](100) NULL,
	[dengji] [nchar](100) NULL,
	[dish] [nchar](100) NULL,
 CONSTRAINT [PK_cooker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cooker] ON
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (1, N'黎明                                                                                                  ', N'111111                                                                                              ', N'152227280912                                                                                        ', N'一级                                                                                                  ', N'鲁菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (2, N'张强                                                                                                  ', N'111111                                                                                              ', N'1762312312                                                                                          ', N'二级                                                                                                  ', N'粤菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (3, N'李萍                                                                                                  ', N'222222                                                                                              ', N'18123213                                                                                            ', N'特级                                                                                                  ', N'豫菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (4, N'张海                                                                                                  ', N'111111                                                                                              ', N'15228209321                                                                                         ', N'一级                                                                                                  ', N'川菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (5, N'张浙                                                                                                  ', N'111111                                                                                              ', N'176123213                                                                                           ', N'一级                                                                                                  ', N'浙菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (6, N'杨青                                                                                                  ', N'111111                                                                                              ', N'15227213321                                                                                         ', N'一级                                                                                                  ', N'苏菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (7, N'王鑫                                                                                                  ', N'111111                                                                                              ', N'15228209321                                                                                         ', N'一级                                                                                                  ', N'闽菜                                                                                                  ')
INSERT [dbo].[cooker] ([id], [cname], [pwd], [tel], [dengji], [dish]) VALUES (8, N'祖新                                                                                                  ', N'111111                                                                                              ', N'1522823                                                                                             ', N'二级                                                                                                  ', N'东北菜                                                                                                 ')
SET IDENTITY_INSERT [dbo].[cooker] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 03/11/2019 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aname] [nchar](100) NULL,
	[apwd] [nchar](100) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON
INSERT [dbo].[admin] ([id], [aname], [apwd]) VALUES (1, N'admin                                                                                               ', N'admin                                                                                               ')
SET IDENTITY_INSERT [dbo].[admin] OFF
/****** Object:  Default [DF_pinglun1_state]    Script Date: 03/11/2019 11:42:16 ******/
ALTER TABLE [dbo].[pinglun1] ADD  CONSTRAINT [DF_pinglun1_state]  DEFAULT (N'未审核') FOR [state]
GO
/****** Object:  Default [DF_dingdan_state]    Script Date: 03/11/2019 11:42:16 ******/
ALTER TABLE [dbo].[dingdan] ADD  CONSTRAINT [DF_dingdan_state]  DEFAULT (N'待付款') FOR [state]
GO
/****** Object:  Default [DF_dingdan_cstate]    Script Date: 03/11/2019 11:42:16 ******/
ALTER TABLE [dbo].[dingdan] ADD  CONSTRAINT [DF_dingdan_cstate]  DEFAULT (N'未开始') FOR [cstate]
GO
