USE [master]
GO
/****** Object:  Database [ecmanage]    Script Date: 04/25/2019 16:34:14 ******/
CREATE DATABASE [ecmanage] ON  PRIMARY 
( NAME = N'ecmanage', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ecmanage.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ecmanage_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ecmanage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ecmanage] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecmanage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecmanage] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ecmanage] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ecmanage] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ecmanage] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ecmanage] SET ARITHABORT OFF
GO
ALTER DATABASE [ecmanage] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ecmanage] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ecmanage] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ecmanage] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ecmanage] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ecmanage] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ecmanage] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ecmanage] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ecmanage] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ecmanage] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ecmanage] SET  DISABLE_BROKER
GO
ALTER DATABASE [ecmanage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ecmanage] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ecmanage] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ecmanage] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ecmanage] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ecmanage] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ecmanage] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ecmanage] SET  READ_WRITE
GO
ALTER DATABASE [ecmanage] SET RECOVERY FULL
GO
ALTER DATABASE [ecmanage] SET  MULTI_USER
GO
ALTER DATABASE [ecmanage] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ecmanage] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecmanage', N'ON'
GO
USE [ecmanage]
GO
/****** Object:  Table [dbo].[users]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uname] [nchar](100) NULL,
	[pwd] [nchar](100) NULL,
	[email] [nchar](100) NULL,
	[role] [nchar](100) NULL,
	[account] [int] NULL,
	[pic] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [role], [account], [pic], [nr]) VALUES (1, N'张三                                                                                                 ', N'111111                                                                                              ', N'123213@qq.com                                                                                       ', N'学生                                                                                                 ', 103, NULL, NULL)
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [role], [account], [pic], [nr]) VALUES (2, N'张凯                                                                                                 ', N'222222                                                                                              ', N'123213@qq.com                                                                                       ', NULL, 200, NULL, NULL)
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [role], [account], [pic], [nr]) VALUES (4, N'admin                                                                                               ', N'admin                                                                                               ', N'123123@qq.com                                                                                       ', N'管理                                                                                                 ', 500, NULL, NULL)
INSERT [dbo].[users] ([id], [uname], [pwd], [email], [role], [account], [pic], [nr]) VALUES (5, N'李青                                                                                                 ', N'111111                                                                                              ', N'123213@qq.com                                                                                       ', N'老师                                                                                                 ', 100, N'mr3.jpg                                                                                             ', N'专注于老年人心理健康研究                                                                                      ')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[teacher]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uname] [nchar](100) NULL,
	[pwd] [nchar](100) NULL,
	[pic] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
	[lanmu] [nchar](100) NULL,
 CONSTRAINT [PK_aqwj] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[teacher] ON
INSERT [dbo].[teacher] ([id], [uname], [pwd], [pic], [nr], [lanmu]) VALUES (11, N'王强                                                                                                 ', N'111111                                                                                              ', N'wqjs.jpg                                                                                            ', N'主要负责老年人心理健康方向的研究                                                                                   ', N'教学师资                                                                                               ')
SET IDENTITY_INSERT [dbo].[teacher] OFF
/****** Object:  Table [dbo].[pinglun]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pinglun](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tid] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[title] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
 CONSTRAINT [PK_pinglun] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[pinglun] ON
INSERT [dbo].[pinglun] ([id], [tid], [uname], [title], [nr]) VALUES (1, N'1                                                                                                   ', N'张三                                                                                                 ', N'教师心理健康                                                                                             ', N'很好很不错                                                                                              ')
INSERT [dbo].[pinglun] ([id], [tid], [uname], [title], [nr]) VALUES (2, N'14                                                                                                  ', N'张三                                                                                                 ', N'老年广场舞                                                                                              ', N'很好，很值得学习                                                                                           ')
SET IDENTITY_INSERT [dbo].[pinglun] OFF
/****** Object:  Table [dbo].[dingdan]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dingdan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[price] [int] NULL,
	[pic] [nchar](100) NULL,
 CONSTRAINT [PK_dingdan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[dingdan] ON
INSERT [dbo].[dingdan] ([id], [title], [uname], [price], [pic]) VALUES (14, N'老年广场舞                                                                                              ', N'张三                                                                                                 ', 100, N'gcwjs.jpg                                                                                           ')
SET IDENTITY_INSERT [dbo].[dingdan] OFF
/****** Object:  Table [dbo].[course]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[teacher] [nchar](100) NULL,
	[price] [nchar](100) NULL,
	[pic] [nchar](100) NULL,
	[mvideo] [nchar](100) NULL,
	[video] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
 CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[course] ON
INSERT [dbo].[course] ([id], [title], [teacher], [price], [pic], [mvideo], [video], [nr]) VALUES (2, N'老年广场舞                                                                                              ', N'李青                                                                                                 ', N'100                                                                                                 ', N'gcwjs.jpg                                                                                           ', N'video1.mp4                                                                                          ', N'video2.mp4                                                                                          ', N'广场舞在公共场所由群众自发组织，参与者多为中老年人，其中又以大妈居多。广场舞是人民群众创造的舞蹈。                                                  ')
INSERT [dbo].[course] ([id], [title], [teacher], [price], [pic], [mvideo], [video], [nr]) VALUES (3, N'老年人厨艺教程                                                                                            ', N'李青                                                                                                 ', N'200                                                                                                 ', N'lncy1.jpg                                                                                           ', N'video1.mp4                                                                                          ', N'video2.mp4                                                                                          ', N'厨艺即厨房的艺术，厨师的艺术，做饭的艺术，享受生活的艺术。传统流传下来的食调艺术是厨房必不可少的，也是厨艺的灵魂之所在。厨艺也指做饭的水平。                             ')
INSERT [dbo].[course] ([id], [title], [teacher], [price], [pic], [mvideo], [video], [nr]) VALUES (4, N'老年人插画教程                                                                                            ', N'李青                                                                                                 ', N'100                                                                                                 ', N'chjc1.jpg                                                                                           ', N'video1.mp4                                                                                          ', N'video2.mp4                                                                                          ', N'插画在中国被人们俗称为插图。今天通行于国外市场的商业插画包括出版物配图、卡通吉祥物、影视海报、游戏人物设定及游戏内置的美术场景设计                                  ')
SET IDENTITY_INSERT [dbo].[course] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[aname] [nchar](100) NULL,
	[apwd] [nchar](100) NULL,
	[email] [nchar](100) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON
INSERT [dbo].[admin] ([id], [aname], [apwd], [email]) VALUES (1, N'admin                                                                                               ', N'admin                                                                                               ', N'23123@qq.com                                                                                        ')
SET IDENTITY_INSERT [dbo].[admin] OFF
/****** Object:  Table [dbo].[ad]    Script Date: 04/25/2019 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ad](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
	[lanmu] [nchar](100) NULL,
 CONSTRAINT [PK_ad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ad] ON
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (7, N'网络安全大赛                                                                                             ', N'王老师                                                                                                ', N'学校将要于月号举报网络安全大赛，同学们要积极参加                                                                        ', N'赛事                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (8, N'服务器维护                                                                                              ', N'阿里巴巴                                                                                               ', N'招聘服务器维护一名，工资万到万，要求能够熟练使用cmd                                                                      ', N'招聘                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (9, N'关于清明放假通知                                                                                           ', N'管理                                                                                                 ', N'关于清明节放假的通知，清明节本学院将要于月日和月日进行放假                                                                  ', N'新闻                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (10, N'网络安全补考通知                                                                                           ', N'管理                                                                                                 ', N'网络安全上学期没过的同学将将要于月日在教，教室，上午点到点进行补考                                                        ', N'新闻                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (11, N'学院补课通知                                                                                             ', N'管理                                                                                                 ', N'为了迎接六级考试，本周日学校大礼堂会进行英语补课，同学们请积极参加                                                                  ', N'新闻                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (12, N'web防守大赛                                                                                            ', N'王老师                                                                                                ', N'学院将要于月日举办WEB防守大赛，希望同学们能够积极参加                                                                    ', N'赛事                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (13, N'网络团队攻守大赛                                                                                           ', N'王老师                                                                                                ', N'本市网络安全办公室组织本市的各个学校进行网络团队攻守大赛，同学们可以积极组队参加                                                           ', N'赛事                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (14, N'java程序员                                                                                            ', N'百度科技                                                                                               ', N'招聘java程序员，要求熟悉Java的各种框架，能够进行独立开发，工资k                                                              ', N'招聘                                                                                                 ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (15, N'PHP程序员                                                                                             ', N'新浪科技                                                                                               ', N'招聘php程序员，要求会php的各种框架，能够进行独立开发，工资k                                                                 ', N'招聘                                                                                                 ')
SET IDENTITY_INSERT [dbo].[ad] OFF
/****** Object:  Default [DF_users_role]    Script Date: 04/25/2019 16:34:15 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_role]  DEFAULT (N'学生') FOR [role]
GO
/****** Object:  Default [DF_users_account]    Script Date: 04/25/2019 16:34:15 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_account]  DEFAULT ((100)) FOR [account]
GO
