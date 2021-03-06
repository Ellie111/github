USE [master]
GO
/****** Object:  Database [bookmanage]    Script Date: 03/13/2019 16:17:30 ******/
CREATE DATABASE [bookmanage] ON  PRIMARY 
( NAME = N'bookmanage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\bookmanage.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bookmanage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\bookmanage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bookmanage] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookmanage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookmanage] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [bookmanage] SET ANSI_NULLS OFF
GO
ALTER DATABASE [bookmanage] SET ANSI_PADDING OFF
GO
ALTER DATABASE [bookmanage] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [bookmanage] SET ARITHABORT OFF
GO
ALTER DATABASE [bookmanage] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [bookmanage] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [bookmanage] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [bookmanage] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [bookmanage] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [bookmanage] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [bookmanage] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [bookmanage] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [bookmanage] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [bookmanage] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [bookmanage] SET  DISABLE_BROKER
GO
ALTER DATABASE [bookmanage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [bookmanage] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [bookmanage] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [bookmanage] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [bookmanage] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [bookmanage] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [bookmanage] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [bookmanage] SET  READ_WRITE
GO
ALTER DATABASE [bookmanage] SET RECOVERY FULL
GO
ALTER DATABASE [bookmanage] SET  MULTI_USER
GO
ALTER DATABASE [bookmanage] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [bookmanage] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'bookmanage', N'ON'
GO
USE [bookmanage]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/13/2019 16:17:31 ******/
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
/****** Object:  Table [dbo].[books]    Script Date: 03/13/2019 16:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[writer] [nchar](100) NULL,
	[cbs] [nchar](100) NULL,
	[cbsj] [nchar](100) NULL,
	[price] [nchar](100) NULL,
	[nr] [nchar](100) NULL,
	[pic] [nchar](100) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[books] ON
INSERT [dbo].[books] ([id], [title], [writer], [cbs], [cbsj], [price], [nr], [pic]) VALUES (8, N'web白猫                                                                                               ', N'1522728011                                                                                          ', N'互联网web防守                                                                                            ', N'2019-2-2                                                                                            ', N'李凯                                                                                                  ', N'专注于网络安全，为互联网保驾护航                                                                                    ', N'xstd.jpg                                                                                            ')
INSERT [dbo].[books] ([id], [title], [writer], [cbs], [cbsj], [price], [nr], [pic]) VALUES (9, N'网络黑鹰                                                                                                ', N'133932133                                                                                           ', N'服务器攻击于防守                                                                                            ', N'2018-8-21                                                                                           ', N'张强                                                                                                  ', N'专注于服务器攻击于防守                                                                                         ', N'xstd2.jpg                                                                                           ')
INSERT [dbo].[books] ([id], [title], [writer], [cbs], [cbsj], [price], [nr], [pic]) VALUES (10, N'黑客大师                                                                                                ', N'133932133                                                                                           ', N'百度优化                                                                                                ', N'2018-8-30                                                                                           ', N'王天林                                                                                                 ', N'专注于百度优化                                                                                             ', N'aqtd.jpg                                                                                            ')
SET IDENTITY_INSERT [dbo].[books] OFF
/****** Object:  Table [dbo].[aqwj]    Script Date: 03/13/2019 16:17:31 ******/
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
SET IDENTITY_INSERT [dbo].[aqwj] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 03/13/2019 16:17:31 ******/
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
/****** Object:  Table [dbo].[ad]    Script Date: 03/13/2019 16:17:31 ******/
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
