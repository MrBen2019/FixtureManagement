USE [FixtureManagement]
GO
/****** Object:  User [Fixture]    Script Date: 2020/4/5 星期日 17:29:58 ******/
CREATE USER [Fixture] FOR LOGIN [Fixture] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Fixture]
GO
/****** Object:  Table [dbo].[FixtureDefinition]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureDefinition](
	[ID] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[FamilyID] [int] NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[partNo] [nvarchar](100) NOT NULL,
	[UPL] [int] NOT NULL,
	[UsedFor] [nvarchar](50) NOT NULL,
	[PMPeriod] [int] NOT NULL,
	[Owner] [nvarchar](20) NOT NULL,
	[RecOn] [smalldatetime] NOT NULL,
	[RecBy] [nchar](20) NOT NULL,
	[EditOn] [smalldatetime] NOT NULL,
	[EditBy] [nchar](20) NOT NULL,
	[WorkCellID] [int] NOT NULL,
 CONSTRAINT [PK_FixtureDefinition] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixtureEntity]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureEntity](
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[BillNo] [nvarchar](20) NOT NULL,
	[RegDate] [smalldatetime] NOT NULL,
	[UsedCount] [int] NOT NULL,
	[Location] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixtureEntity] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixtureFamily]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureFamily](
	[FamilyID] [int] NOT NULL,
	[FamilyName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixtureFamily] PRIMARY KEY CLUSTERED 
(
	[FamilyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixtureInRecord]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureInRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[RetDate] [datetime] NOT NULL,
	[RetByName] [nvarchar](20) NOT NULL,
	[OperationByName] [nvarchar](20) NOT NULL,
	[ProdLineID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixtureOutRecord]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureOutRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[UsedDate] [datetime] NOT NULL,
	[UsedByName] [nvarchar](20) NOT NULL,
	[OperationByName] [nvarchar](20) NOT NULL,
	[ProdLineID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixturePurchaseApp]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixturePurchaseApp](
	[AppBy] [nvarchar](20) NOT NULL,
	[AppByName] [nvarchar](20) NOT NULL,
	[FamilyID] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[BillNo] [nvarchar](20) NOT NULL,
	[RegDate] [smalldatetime] NOT NULL,
	[Pic] [nvarchar](20) NULL,
	[State] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixturePurchaseApp] PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixtureRepairRecord]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureRepairRecord](
	[RepBy] [nvarchar](20) NOT NULL,
	[RepByName] [nvarchar](20) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[faultDes] [nvarchar](100) NOT NULL,
	[faultPic] [nvarchar](20) NOT NULL,
	[DealBy] [nvarchar](20) NOT NULL,
	[DealByName] [nvarchar](20) NOT NULL,
	[DealRes] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixtureScrapRecord]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureScrapRecord](
	[ScrapBy] [nvarchar](20) NOT NULL,
	[ScrapByName] [nvarchar](20) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[UsedCount] [int] NOT NULL,
	[ScrapReason] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionLine]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionLine](
	[ProdLineID] [int] NOT NULL,
	[ProdLineName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ProductionLine] PRIMARY KEY CLUSTERED 
(
	[ProdLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[WorkCellID] [int] NOT NULL,
 CONSTRAINT [PK_TestUser] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Name] [nvarchar](50) NOT NULL,
	[WorlCellID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkCell]    Script Date: 2020/4/5 星期日 17:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCell](
	[WorkCellID] [int] NOT NULL,
	[WorkCellName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_WorkCell] PRIMARY KEY CLUSTERED 
(
	[WorkCellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1093, N'EF0789', N'MOD 3XM2 陶瓷组装夹具     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 2, N'陶瓷组装', 30, N'1284663', CAST(N'2019-07-04T16:12:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:12:00' AS SmallDateTime), N'1215072             ', 8)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1123, N'EF0798', N'MOD 刷锡膏夹具           ', 79, N'FU', N'PNA90320/1 PNA90320/2 PNA90322/1', 2, N'MOD 刷锡膏', 30, N'1230936', CAST(N'2019-07-18T15:59:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-18T15:59:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1102, N'EF2184', N'MOD 3XM2 防旋转夹具      ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 2, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-07-12T08:04:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-12T08:04:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1094, N'EF2185', N'MOD 防旋转夹具           ', 79, N'FU', N'PNA90320/1 PNA90320/2 PNA90322/1', 2, N'波导防旋转', 30, N'1230936', CAST(N'2019-07-04T16:13:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:13:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1101, N'EF2186', N'MOD 3XM2 保护夹具       ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'保护', 30, N'1230936', CAST(N'2019-07-12T08:03:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-12T08:03:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1095, N'EF2187', N'MOD 盖板螺丝夹具          ', 79, N'FU', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'AIB盖板螺丝', 30, N'1230936', CAST(N'2019-07-04T16:14:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:14:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1096, N'EF2188', N'MOD 底座夹具            ', 79, N'FU', N'PNA90320/1 PNA90320/2 PNA90322/1', 2, N'MOD 底座', 30, N'1230936', CAST(N'2019-07-04T16:15:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:15:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1091, N'EF2189', N'MOD 3XM2 调谐夹具       ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 3, N'打调谐盖板', 30, N'1230936', CAST(N'2019-07-04T16:09:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:09:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1098, N'EF2190', N'MOD 盖板螺丝夹具          ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 3, N'MOD 打盖板螺丝', 30, N'1230936', CAST(N'2019-07-04T16:17:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:17:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1092, N'EF2191', N'MOD 3XM2 陶瓷安装夹具     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'陶瓷安装', 30, N'1230936', CAST(N'2019-07-04T16:11:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:11:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1103, N'EF2192', N'MOD 3XM2 最终组装夹具     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 最终组装', 30, N'1230936', CAST(N'2019-07-12T08:05:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-12T08:05:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1097, N'EF2203', N'MOD 波导防旋转夹具         ', 79, N'FU', N'PNA90320/1 PNA90320/2 PNA90322/1', 2, N'MOD 波导防旋转', 30, N'1230936', CAST(N'2019-07-04T16:15:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-04T16:15:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1110, N'EF2207', N'MOD 3XM2 交叉耦合防旋转夹具  ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 交叉耦合防旋转', 30, N'1230936', CAST(N'2019-07-16T15:16:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-16T15:16:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1109, N'EF2208', N'MOD 3XM2 耦合防旋转夹具1   ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 RX耦合防旋转', 30, N'1230936', CAST(N'2019-07-16T15:15:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-16T15:15:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1111, N'EF2209', N'MOD 3XM2 RX耦合防旋转夹具2 ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 RX耦合防旋转', 30, N'1230936', CAST(N'2019-07-16T15:18:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-16T15:18:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1124, N'EF2210', N'MOD 盖板螺丝夹具          ', 79, N'FU', N'PNA90320/1 PNA90320/2 PNA90322/1', 3, N'MOD 盖板螺丝', 30, N'1230936', CAST(N'2019-07-18T16:00:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-07-18T16:00:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1176, N'EF2234', N'MOD 3XM2 防旋转夹具1     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:03:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:23:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1177, N'EF2235', N'MOD 3XM2 防旋转夹具2     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:04:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:23:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1178, N'EF2236', N'MOD 3XM2 防旋转夹具1     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:05:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:24:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1179, N'EF2237', N'MOD 3XM2 防旋转夹具2     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:06:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:24:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1180, N'EF2238', N'MOD 3XM2 防旋转夹具1     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:07:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:24:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1181, N'EF2239', N'MOD 3XM2 防旋转夹具2     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:07:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:25:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1182, N'EF2240', N'MOD 3XM2 防旋转夹具1     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:08:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-01T08:25:00' AS SmallDateTime), N'1215072             ', 7)
INSERT [dbo].[FixtureDefinition] ([ID], [Code], [Name], [FamilyID], [Model], [partNo], [UPL], [UsedFor], [PMPeriod], [Owner], [RecOn], [RecBy], [EditOn], [EditBy], [WorkCellID]) VALUES (1183, N'EF2241', N'MOD 3XM2 防旋转夹具2     ', 79, N'MOD 3XM2', N'PNA90320/1 PNA90320/2 PNA90322/1', 1, N'MOD 3XM2 防旋转', 30, N'1230936', CAST(N'2019-10-31T10:09:00' AS SmallDateTime), N'1215072             ', CAST(N'2019-11-07T10:01:00' AS SmallDateTime), N'1284663             ', 7)
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF0789', 1, N'BO19070500000002', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 8, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF0789', 2, N'BO19070500000001', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 32, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF0798', 1, N'BO19072900000018', CAST(N'2019-07-29T08:54:00' AS SmallDateTime), 0, N'7-A1')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF0798', 2, N'BO19090900000002', CAST(N'2019-09-11T08:45:00' AS SmallDateTime), 5, N'7-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2184', 1, N'BO19071200000004', CAST(N'2019-07-12T09:03:00' AS SmallDateTime), 2, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2184', 2, N'BO19071200000003', CAST(N'2019-07-12T09:03:00' AS SmallDateTime), 1, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2185', 1, N'BO19070600000006', CAST(N'2019-07-09T15:48:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2185', 2, N'BO19070900000003', CAST(N'2019-07-10T08:50:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2186', 1, N'BO19071200000002', CAST(N'2019-07-12T09:03:00' AS SmallDateTime), 0, N'16-A1-1')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2187', 1, N'BO19070500000003', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 0, N'16-A1-2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2188', 1, N'BO19070500000005', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 0, N'8-A2-2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2188', 2, N'BO19070500000004', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 23, N'8-A2-1')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2189', 1, N'BO19070600000007', CAST(N'2019-07-09T15:48:00' AS SmallDateTime), 0, N'8-B2-1')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2189', 2, N'BO19082700000002', CAST(N'2019-08-27T09:24:00' AS SmallDateTime), 0, N'8-C2-1')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2189', 3, N'BO19082700000001', CAST(N'2019-08-27T09:24:00' AS SmallDateTime), 0, N'8-B2-2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2190', 1, N'BO19070500000006', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 0, N'16-A1-5')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2190', 2, N'BO19070600000005', CAST(N'2019-07-09T15:48:00' AS SmallDateTime), 45, N'16-A1-4')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2190', 3, N'BO19070600000004', CAST(N'2019-07-09T15:48:00' AS SmallDateTime), 0, N'16-A1-3')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2191', 1, N'BO19070500000007', CAST(N'2019-07-05T16:42:00' AS SmallDateTime), 0, N'8-C2-2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2192', 1, N'BO19071200000005', CAST(N'2019-07-12T09:03:00' AS SmallDateTime), 0, N'8-A2-3')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2203', 3, N'BO19080900000001', CAST(N'2019-08-09T16:32:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2203', 4, N'BO19080900000002', CAST(N'2019-08-09T16:33:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2207', 1, N'BO19071600000002', CAST(N'2019-07-16T16:09:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2208', 1, N'BO19071600000003', CAST(N'2019-07-16T16:09:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2209', 1, N'BO19071600000004', CAST(N'2019-07-16T16:09:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2210', 1, N'BO19072900000030', CAST(N'2019-07-29T08:53:00' AS SmallDateTime), 0, N'8-C1-4')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2210', 2, N'BO19080200000015', CAST(N'2019-08-07T08:35:00' AS SmallDateTime), 0, N'8-C1-6')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2210', 3, N'BO19080200000014', CAST(N'2019-08-07T08:35:00' AS SmallDateTime), 0, N'8-C1-5')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2234', 1, N'BO19103100000001', CAST(N'2019-10-31T12:42:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2235', 1, N'BO19103100000002', CAST(N'2019-10-31T12:42:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2236', 1, N'BO19103100000003', CAST(N'2019-10-31T12:42:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2237', 1, N'BO19103100000004', CAST(N'2019-10-31T12:42:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2238', 1, N'BO19103100000005', CAST(N'2019-10-31T12:42:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2239', 1, N'BO19103100000006', CAST(N'2019-10-31T12:42:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2240', 1, N'BO19103100000007', CAST(N'2019-10-31T12:41:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureEntity] ([Code], [SeqID], [BillNo], [RegDate], [UsedCount], [Location]) VALUES (N'EF2241', 1, N'BO19103100000008', CAST(N'2019-10-31T12:41:00' AS SmallDateTime), 0, N'16-A2')
INSERT [dbo].[FixtureFamily] ([FamilyID], [FamilyName]) VALUES (79, N'JABIL FU')
SET IDENTITY_INSERT [dbo].[FixtureOutRecord] ON 

INSERT [dbo].[FixtureOutRecord] ([ID], [Code], [SeqID], [UsedDate], [UsedByName], [OperationByName], [ProdLineID]) VALUES (2, N'EF0789', 1, CAST(N'2020-12-12T12:12:12.000' AS DateTime), N'22', N'22', 10)
INSERT [dbo].[FixtureOutRecord] ([ID], [Code], [SeqID], [UsedDate], [UsedByName], [OperationByName], [ProdLineID]) VALUES (4, N'EF0789', 1, CAST(N'2020-12-13T22:12:13.000' AS DateTime), N'20', N'20', 13)
INSERT [dbo].[FixtureOutRecord] ([ID], [Code], [SeqID], [UsedDate], [UsedByName], [OperationByName], [ProdLineID]) VALUES (5, N'EF0798', 1, CAST(N'2020-12-12T21:23:23.000' AS DateTime), N'22', N'22', 14)
SET IDENTITY_INSERT [dbo].[FixtureOutRecord] OFF
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (9, N'BLKA10-L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (10, N'BLKA13_L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (11, N'BLKA14_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (12, N'BLKA15-L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (13, N'BLKA15_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (14, N'BLKA15_L3')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (15, N'BLKA15_L4')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (16, N'BLKA16_2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (17, N'BLKA16_L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (18, N'BLKA18_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (19, N'BLKC01_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (20, N'BLKC01_L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (21, N'BLKC03_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (22, N'BLKC05_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (23, N'BLKC06_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (24, N'BLKC06_L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (25, N'BLKC07_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (26, N'BLKC07_L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (27, N'BLKC21_L1')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (28, N'BLKC21_L2')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (29, N'BLKC21_L3')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (30, N'BLKA09')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (31, N'MSUP')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (32, N'SAU')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (33, N'SCU')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (34, N'Super   line')
INSERT [dbo].[ProductionLine] ([ProdLineID], [ProdLineName]) VALUES (35, N'SXU 0501')
INSERT [dbo].[User] ([Code], [Name], [Password], [WorkCellID]) VALUES (N'1000001', N'test', N'1000001', 7)
INSERT [dbo].[User] ([Code], [Name], [Password], [WorkCellID]) VALUES (N'1215072', N'Xianghai Zhang', N'1215072', 8)
INSERT [dbo].[User] ([Code], [Name], [Password], [WorkCellID]) VALUES (N'1230936', N'Lei Qian', N'1230936  ', 7)
INSERT [dbo].[User] ([Code], [Name], [Password], [WorkCellID]) VALUES (N'1284663', N'Abin Liu', N'1284663', 7)
INSERT [dbo].[WorkCell] ([WorkCellID], [WorkCellName]) VALUES (7, N'JW05')
INSERT [dbo].[WorkCell] ([WorkCellID], [WorkCellName]) VALUES (8, N'JW06')
ALTER TABLE [dbo].[FixtureEntity] ADD  CONSTRAINT [DF_FixtureEntity_UsedCount]  DEFAULT ((0)) FOR [UsedCount]
GO
ALTER TABLE [dbo].[FixtureDefinition]  WITH CHECK ADD  CONSTRAINT [FK_FixtureDefinition_FixtureFamily] FOREIGN KEY([FamilyID])
REFERENCES [dbo].[FixtureFamily] ([FamilyID])
GO
ALTER TABLE [dbo].[FixtureDefinition] CHECK CONSTRAINT [FK_FixtureDefinition_FixtureFamily]
GO
ALTER TABLE [dbo].[FixtureDefinition]  WITH CHECK ADD  CONSTRAINT [FK_FixtureDefinition_WorkCell] FOREIGN KEY([WorkCellID])
REFERENCES [dbo].[WorkCell] ([WorkCellID])
GO
ALTER TABLE [dbo].[FixtureDefinition] CHECK CONSTRAINT [FK_FixtureDefinition_WorkCell]
GO
ALTER TABLE [dbo].[FixtureEntity]  WITH CHECK ADD  CONSTRAINT [FK_FixtureEntity_FixtureDefinition] FOREIGN KEY([Code])
REFERENCES [dbo].[FixtureDefinition] ([Code])
GO
ALTER TABLE [dbo].[FixtureEntity] CHECK CONSTRAINT [FK_FixtureEntity_FixtureDefinition]
GO
ALTER TABLE [dbo].[FixtureInRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureInRecord_FixtureEntity] FOREIGN KEY([Code], [SeqID])
REFERENCES [dbo].[FixtureEntity] ([Code], [SeqID])
GO
ALTER TABLE [dbo].[FixtureInRecord] CHECK CONSTRAINT [FK_FixtureInRecord_FixtureEntity]
GO
ALTER TABLE [dbo].[FixtureInRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureInRecord_ProductionLine] FOREIGN KEY([ProdLineID])
REFERENCES [dbo].[ProductionLine] ([ProdLineID])
GO
ALTER TABLE [dbo].[FixtureInRecord] CHECK CONSTRAINT [FK_FixtureInRecord_ProductionLine]
GO
ALTER TABLE [dbo].[FixtureOutRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureOutRecord_FixtureEntity] FOREIGN KEY([Code], [SeqID])
REFERENCES [dbo].[FixtureEntity] ([Code], [SeqID])
GO
ALTER TABLE [dbo].[FixtureOutRecord] CHECK CONSTRAINT [FK_FixtureOutRecord_FixtureEntity]
GO
ALTER TABLE [dbo].[FixtureOutRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureOutRecord_ProductionLine] FOREIGN KEY([ProdLineID])
REFERENCES [dbo].[ProductionLine] ([ProdLineID])
GO
ALTER TABLE [dbo].[FixtureOutRecord] CHECK CONSTRAINT [FK_FixtureOutRecord_ProductionLine]
GO
ALTER TABLE [dbo].[FixturePurchaseApp]  WITH CHECK ADD  CONSTRAINT [FK_FixturePurchaseApp_FixtureEntity] FOREIGN KEY([Code], [SeqID])
REFERENCES [dbo].[FixtureEntity] ([Code], [SeqID])
GO
ALTER TABLE [dbo].[FixturePurchaseApp] CHECK CONSTRAINT [FK_FixturePurchaseApp_FixtureEntity]
GO
ALTER TABLE [dbo].[FixturePurchaseApp]  WITH CHECK ADD  CONSTRAINT [FK_FixturePurchaseApp_FixtureFamily] FOREIGN KEY([FamilyID])
REFERENCES [dbo].[FixtureFamily] ([FamilyID])
GO
ALTER TABLE [dbo].[FixturePurchaseApp] CHECK CONSTRAINT [FK_FixturePurchaseApp_FixtureFamily]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_WorkCell] FOREIGN KEY([WorkCellID])
REFERENCES [dbo].[WorkCell] ([WorkCellID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_WorkCell]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_WorkCell] FOREIGN KEY([WorlCellID])
REFERENCES [dbo].[WorkCell] ([WorkCellID])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_WorkCell]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具所属大类 id  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具模组 多个' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Model'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具料号 多个' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'partNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具在产线上需配备数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'UPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具用途' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'UsedFor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具保养点检查周期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'PMPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'RecOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人 代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'RecBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'EditOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'EditBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具所属工作部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'WorkCellID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'与夹具定义表关联' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区分同一夹具定义下的多个夹具实体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单据号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'BillNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'UsedCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放库位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具大类代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureFamily', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureFamily', @level2type=N'COLUMN',@level2name=N'FamilyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'归还人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureInRecord', @level2type=N'COLUMN',@level2name=N'RetByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'UsedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'UsedByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'OperationByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产线代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'ProdLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人 代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'AppBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'AppByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具类别代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'BillNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购入库日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pic 存放的 服务器url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'Pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchaseApp', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报修人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'RepBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报修人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'RepByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'故障描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'faultDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'故障照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'faultPic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'DealBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'DealByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureRepairRecord', @level2type=N'COLUMN',@level2name=N'DealRes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报废人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureScrapRecord', @level2type=N'COLUMN',@level2name=N'ScrapBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报废人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureScrapRecord', @level2type=N'COLUMN',@level2name=N'ScrapByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureScrapRecord', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureScrapRecord', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureScrapRecord', @level2type=N'COLUMN',@level2name=N'UsedCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报废原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureScrapRecord', @level2type=N'COLUMN',@level2name=N'ScrapReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产线ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductionLine', @level2type=N'COLUMN',@level2name=N'ProdLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产线名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductionLine', @level2type=N'COLUMN',@level2name=N'ProdLineName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户代码（员工号)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
