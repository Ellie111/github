USE [master]
GO
/****** Object:  Database [bkmanage]    Script Date: 04/19/2019 16:42:13 ******/
CREATE DATABASE [bkmanage] ON  PRIMARY 
( NAME = N'bkmanage', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\bkmanage.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bkmanage_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\bkmanage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bkmanage] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bkmanage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bkmanage] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [bkmanage] SET ANSI_NULLS OFF
GO
ALTER DATABASE [bkmanage] SET ANSI_PADDING OFF
GO
ALTER DATABASE [bkmanage] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [bkmanage] SET ARITHABORT OFF
GO
ALTER DATABASE [bkmanage] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [bkmanage] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [bkmanage] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [bkmanage] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [bkmanage] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [bkmanage] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [bkmanage] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [bkmanage] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [bkmanage] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [bkmanage] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [bkmanage] SET  DISABLE_BROKER
GO
ALTER DATABASE [bkmanage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [bkmanage] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [bkmanage] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [bkmanage] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [bkmanage] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [bkmanage] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [bkmanage] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [bkmanage] SET  READ_WRITE
GO
ALTER DATABASE [bkmanage] SET RECOVERY FULL
GO
ALTER DATABASE [bkmanage] SET  MULTI_USER
GO
ALTER DATABASE [bkmanage] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [bkmanage] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'bkmanage', N'ON'
GO
USE [bkmanage]
GO
/****** Object:  Table [dbo].[users]    Script Date: 04/19/2019 16:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uname] [nchar](100) NULL,
	[pwd] [nchar](100) NULL,
	[email] [nchar](100) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [uname], [pwd], [email]) VALUES (1, N'王鑫                                                                                                  ', N'222222                                                                                              ', N'123213@qq.com                                                                                       ')
INSERT [dbo].[users] ([id], [uname], [pwd], [email]) VALUES (2, N'张凯                                                                                                  ', N'222222                                                                                              ', N'123213@qq.com                                                                                       ')
INSERT [dbo].[users] ([id], [uname], [pwd], [email]) VALUES (3, N'杨青                                                                                                  ', N'111111                                                                                              ', N'123123@qq.com                                                                                       ')
INSERT [dbo].[users] ([id], [uname], [pwd], [email]) VALUES (4, N'杨大                                                                                                  ', N'222222                                                                                              ', N'123123@qq.com                                                                                       ')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[course]    Script Date: 04/19/2019 16:42:14 ******/
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
INSERT [dbo].[course] ([id], [title], [teacher], [price], [pic], [mvideo], [video], [nr]) VALUES (1, N'教师心理健康                                                                                              ', N'张强                                                                                                  ', N'199                                                                                                 ', N'bsy.jpg                                                                                             ', N'video1.mp4                                                                                          ', N'video2.mp4                                                                                          ', N'老年人心理健康视频心理测试                                                                                       ')
SET IDENTITY_INSERT [dbo].[course] OFF
/****** Object:  Table [dbo].[aqwj]    Script Date: 04/19/2019 16:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aqwj](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[uname] [nchar](100) NULL,
	[pic] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
	[lanmu] [nchar](100) NULL,
 CONSTRAINT [PK_aqwj] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[aqwj] ON
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (1, N'网络安全课件                                                                                              ', N'王老师                                                                                                 ', N'shopbj.sql                                                                                          ', N'网络安全课件                                                                                              ', N'资料管理                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (2, N'计算机信息安全                                                                                             ', N'管理                                                                                                  ', N'jsjaq.jpg                                                                                           ', N'计算机信息安全系统                                                                                           ', N'安全课程                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (4, N'华为网络安全认证                                                                                            ', N'华为                                                                                                  ', N'hwrz.jpg                                                                                            ', N'华为网络安全四级认证书 12                                                                                      ', N'专业认证                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (5, N'思科服务器安全证书                                                                                           ', N'思科                                                                                                  ', N'sk.jpg                                                                                              ', N'思科服务器安全证书                                                                                           ', N'专业认证                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (6, N'锐捷监控系统安全证书                                                                                          ', N'锐捷                                                                                                  ', N'rjaq.jpg                                                                                            ', N'锐捷监控系统安全证书                                                                                          ', N'专业认证                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (7, N'服务器安装                                                                                               ', N'王欣然                                                                                                 ', N'shopdata.sql                                                                                        ', N'服务器环境的安装与数据库的搭建                                                                                     ', N'资料管理                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (8, N'TCP/IP协议详解                                                                                          ', N'李强                                                                                                  ', N'ts22.jpg                                                                                            ', N'在世界上各地，各种各样的电脑运行着各自不同的操作系统为大家服务，这些电脑在表达同一种信息的时候所使用的方法是千差万别。                                         ', N'安全课程                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (9, N'云计算安全详解                                                                                             ', N'黎明                                                                                                  ', N'wlq123.jpg                                                                                          ', N'云计算安全或云安全指一系列用于保护云计算数据、应用和相关结构的策略、技术和控制的集合                                                          ', N'安全课程                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (10, N'防火墙技术                                                                                               ', N'张强                                                                                                  ', N'ffqjs3.jpg                                                                                          ', N'防火墙是一种保护计算机网络安全的技术性措施，它通过在网络边界上建立相应的网络通信监控系统来隔离内部和外部网络，以阻挡来自外部的网络入侵                                 ', N'安全课程                                                                                                ')
INSERT [dbo].[aqwj] ([id], [title], [uname], [pic], [nr], [lanmu]) VALUES (11, N'王强                                                                                                  ', N'副教授                                                                                                 ', N'wqjs.jpg                                                                                            ', N'主要负责老年人心理健康方向的研究                                                                                    ', N'教学师资                                                                                                ')
SET IDENTITY_INSERT [dbo].[aqwj] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 04/19/2019 16:42:14 ******/
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
/****** Object:  Table [dbo].[ad]    Script Date: 04/19/2019 16:42:14 ******/
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
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (7, N'网络安全大赛                                                                                              ', N'王老师                                                                                                 ', N'学校将要于3月21号举报网络安全大赛，同学们要积极参加                                                                         ', N'赛事                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (8, N'服务器维护                                                                                               ', N'阿里巴巴                                                                                                ', N'招聘服务器维护一名，工资1万到1万5，要求能够熟练使用cmd                                                                      ', N'招聘                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (9, N'关于清明放假通知                                                                                            ', N'管理                                                                                                  ', N'关于清明节放假的通知，清明节本学院将要于4月4日和4月5日进行放假                                                                   ', N'新闻                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (10, N'网络安全补考通知                                                                                            ', N'管理                                                                                                  ', N'网络安全上学期没过的同学将将要于3月23日在教8，203教室，上午8点到10点进行补考                                                         ', N'新闻                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (11, N'学院补课通知                                                                                              ', N'管理                                                                                                  ', N'为了迎接六级考试，本周日学校大礼堂会进行英语补课，同学们请积极参加                                                                   ', N'新闻                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (12, N'web防守大赛                                                                                             ', N'王老师                                                                                                 ', N'学院将要于3月30日举办WEB防守大赛，希望同学们能够积极参加                                                                     ', N'赛事                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (13, N'网络团队攻守大赛                                                                                            ', N'王老师                                                                                                 ', N'本市网络安全办公室组织本市的各个学校进行网络团队攻守大赛，同学们可以积极组队参加                                                            ', N'赛事                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (14, N'java程序员                                                                                             ', N'百度科技                                                                                                ', N'招聘java程序员，要求熟悉Java的各种框架，能够进行独立开发，工资14k                                                              ', N'招聘                                                                                                  ')
INSERT [dbo].[ad] ([id], [title], [uname], [nr], [lanmu]) VALUES (15, N'PHP程序员                                                                                              ', N'新浪科技                                                                                                ', N'招聘php程序员，要求会php的各种框架，能够进行独立开发，工资10k                                                                 ', N'招聘                                                                                                  ')
SET IDENTITY_INSERT [dbo].[ad] OFF
