USE [master]
GO
/****** Object:  Database [PleasantRustle]    Script Date: 19.05.2024 15:30:53 ******/
CREATE DATABASE [PleasantRustle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PleasantRustle', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PleasantRustle.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PleasantRustle_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PleasantRustle_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PleasantRustle] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PleasantRustle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PleasantRustle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PleasantRustle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PleasantRustle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PleasantRustle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PleasantRustle] SET ARITHABORT OFF 
GO
ALTER DATABASE [PleasantRustle] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PleasantRustle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PleasantRustle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PleasantRustle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PleasantRustle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PleasantRustle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PleasantRustle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PleasantRustle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PleasantRustle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PleasantRustle] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PleasantRustle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PleasantRustle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PleasantRustle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PleasantRustle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PleasantRustle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PleasantRustle] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PleasantRustle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PleasantRustle] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PleasantRustle] SET  MULTI_USER 
GO
ALTER DATABASE [PleasantRustle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PleasantRustle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PleasantRustle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PleasantRustle] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PleasantRustle] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PleasantRustle] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PleasantRustle] SET QUERY_STORE = OFF
GO
USE [PleasantRustle]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 19.05.2024 15:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[AgentType] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Logo] [nvarchar](255) NULL,
	[LegalAddress] [nvarchar](255) NULL,
	[Priority] [int] NULL,
	[Director] [nvarchar](255) NULL,
	[INN] [nvarchar](20) NULL,
	[KPP] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19.05.2024 15:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductType] [nvarchar](255) NULL,
	[SKU] [nvarchar](50) NULL,
	[NumberOfPeople] [int] NULL,
	[WorkshopNumber] [int] NULL,
	[MinimumPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 19.05.2024 15:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[AgentID] [int] NULL,
	[SaleDate] [date] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agents] ON 

INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (1, N'МФО', N'БухФлотФинансСнаб', N'elvira07@sysoeva.org', N'+78001216681', N'\agents\agent_93.png', N'035823, Смоленская область, город Одинцово, проезд Будапештская, 61', 338, N'Ираклий Максимович Титова', N'4591032477', N'290155423')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (2, N'ПАО', N'ЛифтТомскСофтЦентр', N'izolda.vorontov@lytkina.ru', N'+78122671959', N'\agents\agent_116.png', N'280811, Омская область, город Балашиха, пер. Сталина, 15', 76, N'Виноградоваа Вера Александровна', N'3908099185', N'747184361')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (3, N'МФО', N'Транс', N'artem.fadeev@polykov.com', N'+79224679383', N'\agents\agent_66.png', N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', 38, N'Евсеева Болеслав Сергеевич', N'9604275878', N'951258069')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (4, N'ООО', N'СибОмскМорЦентр', N'fedotov.platon@pavlov.ru', N'+78003173579', N'\agents\agent_96.png', N'371407, Рязанская область, город Шатура, пл. Чехова, 48', 68, N'Гавриил Сергеевич Игнатьев', N'3626169571', N'300062579')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (5, N'ПАО', N'ОрионТомскТех', N'faina.tikonova@veselov.com', N'+79228512323', N'\agents\agent_58.png', N'738763, Курская область, город Егорьевск, спуск Чехова, 66', 73, N'Георгий Александрович Лукин', N'9351493429', N'583041591')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (6, N'ЗАО', N'КрепОрионСофтПром', N'viktoriy.belozerova@isaev.net', N'+74959312926', N'нет', N'351666, Ульяновская область, город Луховицы, въезд Косиора, 07', 38, N'Алина Борисовна Потаповаа', N'3776671267', N'642177246')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (7, N'ООО', N'ПивРадиоВектор', N'nazarov.polina@voronova.ru', N'+74954456143', N'\agents\agent_108.png', N'330228, Ивановская область, город Ногинск, ул. Славы, 42', 245, N'Изабелла Борисовна Архиповаа', N'7447864518', N'211697866')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (8, N'МФО', N'БашкирИнфоЭлектро', N'lebedeva.larisa@lavrentev.net', N'+78002325637', N'\agents\agent_97.png', N'584771, Брянская область, город Раменское, наб. Славы, 53', 289, N'Дорофеева Зинаида Борисовна', N'9037040523', N'803529530')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (9, N'ООО', N'Компания CибМоторКазань', N'tamara22@pavlova.com', N'+74957135183', N'\agents\agent_100.png', N'887741, Тульская область, город Пушкино, пр. Чехова, 77', 136, N'Тетерина Георгий Сергеевич', N'6221520857', N'758155852')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (10, N'ООО', N'Компания Газ', N'alina56@zdanov.com', N'+78128239342', N'\agents\agent_59.png', N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', 445, N'Давид Андреевич Фадеев', N'2262431140', N'247369527')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (11, N'МФО', N'СантехБашкир', N'nikodim81@kiseleva.com', N'+78005823919', N'\agents\agent_38.png', N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', 369, N'Виктор Иванович Молчанов', N'4159215346', N'639267493')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (12, N'ПАО', N'ОрионГлав', N'sermakova@sarova.net', N'(35222) 961926', N'\agents\agent_45.png', N'729639, Магаданская область, город Талдом, въезд Будапештская, 98', 482, N'Тимофеева Григорий Андреевич', N'9032455179', N'763045792')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (13, N'ОАО', N'Мобайл', N'dsiryev@dementeva.com', N'+78005114361', N'\agents\agent_46.png', N'606703, Амурская область, город Чехов, пл. Будапештская, 91', 464, N'Екатерина Сергеевна Бобылёва', N'7803888520', N'885703265')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (14, N'ООО', N'Компания ТомскХоз', N'nelli11@gureva.ru', N'+74958937117', N'\agents\agent_54.png', N'861543, Томская область, город Истра, бульвар Славы, 42', 464, N'Лазарева Аркадий Сергеевич', N'8430391035', N'961540858')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (15, N'ПАО', N'ЛенХозРем', N'tdrozdov@ersova.ru', N'+735222734419', N'\agents\agent_78.png', N'946112, Волгоградская область, город Шаховская, пл. Сталина, 98', 3, N'Носов Михаил Андреевич', N'4318970454', N'389962934')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (16, N'ООО', N'Строй', N'wsamsonov@martynov.ru', N'+79222332768', N'\agents\agent_76.png', N'426305, Калининградская область, город Чехов, пл. Ломоносова, 00', 258, N'Люся Владимировна Фёдороваа', N'7687851800', N'470221602')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (17, N'ОАО', N'ЭлектроТранс', N'boleslav.zukova@nikiforova.com', N'+74956882859', N'\agents\agent_30.png', N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', 129, N'Сава Александрович Титова', N'6019144874', N'450629885')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (18, N'ЗАО', N'Флот', N'gerasim.makarov@kornilov.ru', N'+78005384177', N'нет', N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', 473, N'Василий Андреевич Ковалёв', N'1112170258', N'382584255')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (19, N'ЗАО', N'ОмскЛифтРадио', N'kanisimov@nikolaev.ru', N'+74954525894', N'\agents\agent_92.png', N'146093, Белгородская область, город Можайск, пл. Ломоносова, 94', 373, N'Горбунов Назар Сергеевич', N'8325114917', N'356835763')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (20, N'ООО', N'ВостокНефть', N'stanislav.zykov@volkova.net', N'+79225961453', N'\agents\agent_120.png', N'171297, Оренбургская область, город Зарайск, проезд Сталина, 17', 49, N'Данила Александрович Кириллов', N'3532367439', N'788413794')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (21, N'ЗАО', N'СервисХмельМонтаж', N'galina31@melnikov.ru', N'+735222392895', N'\agents\agent_31.png', N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', 124, N'Анжелика Дмитриевна Горбунова', N'3459886235', N'356196105')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (22, N'ПАО', N'АсбоцементЛифтРеч-H', N'vladlena58@seliverstova.ru', N'+74952846937', N'\agents\agent_44.png', N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', 407, N'Кондратьева Таисия Андреевна', N'6567878928', N'560960507')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (23, N'ОАО', N'БухМоторТомск', N'dmitrii05@zukov.ru', N'+78121329375', N'\agents\agent_95.png', N'936264, Ростовская область, город Ногинск, проезд Славы, 52', 65, N'Игорь Львович Щукина', N'5630128011', N'571438707')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (24, N'ЗАО', N'Глав', N'albert57@burova.ru', N'+78125248716', N'отсутствует', N'077760, Ленинградская область, город Сергиев Посад, спуск Славы, 05', 35, N'Герман Иванович Гусева', N'6433380154', N'715096638')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (25, N'ПАО', N'Тяж', N'vladlen06@melnikov.net', N'+78129767715', N'\agents\agent_106.png', N'395435, Мурманская область, город Красногорск, шоссе Косиора, 47', 402, N'Бронислав Владимирович Ефимов', N'3302080044', N'733101773')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (26, N'ОАО', N'ТелекомГор', N'gorskov.larisa@kalinin.com', N'+78007527145', N'\agents\agent_37.png', N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', 255, N'Ксения Андреевна Михайлова', N'3748947224', N'766431901')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (27, N'ОАО', N'ОрионХмельCиб', N'pstepanova@siryev.com', N'+735222852418', N'\agents\agent_105.png', N'266126, Ленинградская область, город Сергиев Посад, шоссе Чехова, 31', 173, N'Воробьёва Родион Максимович', N'9895514594', N'587685742')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (28, N'ОАО', N'РадиоСевер', N'maiy.belov@rogov.ru', N'+74953742179', N'\agents\agent_62.png', N'491360, Московская область, город Одинцово, въезд Ленина, 19', 431, N'Карпов Иосиф Максимович', N'5889206249', N'372789083')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (29, N'ООО', N'CибСервисСевер', N'faina02@muraveva.com', N'+79222487998', N'\agents\agent_74.png', N'711370, Курская область, город Истра, пр. Будапештсткая, 89', 385, N'Чернов Геннадий Алексеевич', N'1719781819', N'742676221')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (30, N'ЗАО', N'СофтРосБух', N'ivanova.antonin@rodionov.ru', N'+79229471199', N'\agents\agent_63.png', N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', 69, N'Белова Полина Владимировна', N'8321561226', N'807803984')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (31, N'ООО', N'Компания СервисТелеМотор', N'veronika.egorov@bespalova.com', N'+735222131563', N'\agents\agent_41.png', N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', 81, N'Фролова Эдуард Борисович', N'3248454160', N'138472695')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (32, N'ОАО', N'КрепФлот', N'danila.birykov@stepanov.ru', N'+78007532768', N'\agents\agent_90.png', N'357783, Рязанская область, город Павловский Посад, наб. Домодедовская, 44', 349, N'Злата Романовна Корнилова', N'2795067090', N'967021779')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (33, N'ОАО', N'ГаражФорсаж', N'lydmila.belyeva@karpov.ru', N'+74952777759', N'\agents\agent_47.png', N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', 335, N'Клавдия Фёдоровна Кудряшова', N'2816939574', N'754741128')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (34, N'МФО', N'ГлавРечФлот', N'emysnikov@kiselev.net', N'+78009334875', N'\agents\agent_85.png', N'116028, Челябинская область, город Балашиха, шоссе Космонавтов, 69', 283, N'Шубина Валерия Евгеньевна', N'5299346323', N'214239563')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (35, N'ЗАО', N'МикроБашкирГор', N'ybragina@odintov.org', N'+735222418198', N'\agents\agent_86.png', N'437208, Астраханская область, город Озёры, спуск Славы, 45', 427, N'Нонна Владимировна Горбунова', N'5774378274', N'352728364')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (36, N'ОАО', N'ХозЮпитер', N'jisakova@nazarova.com', N'+74951786132', N'\agents\agent_53.png', N'038182, Курганская область, город Москва, спуск Космонавтов, 16', 375, N'Максимоваа Вера Фёдоровна', N'6667635058', N'380592865')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (37, N'МКК', N'Дизайн', N'viktoriy73@kalinina.org', N'+79223496796', N'\agents\agent_71.png', N'243999, Орловская область, город Можайск, пер. Домодедовская, 77', 330, N'Мельниковаа Федосья Борисовна', N'79646693050', N'201876935')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (38, N'ОАО', N'ЛифтАлмазТех', N'donat.gerasimov@rogova.ru', N'+74958341297', N'\agents\agent_77.png', N'925700, Нижегородская область, город Зарайск, шоссе Гоголя, 35', 497, N'Воронова Альберт Александрович', N'73950510936', N'240396350')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (39, N'ЗАО', N'Вод', N'savva86@zaiteva.ru', N'+74958113655', N'\agents\agent_68.png', N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', 359, N'Зоя Романовна Селезнёва', N'71296063939', N'447430051')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (40, N'МКК', N'CибГаз', N'inna.sarova@panfilov.ru', N'+78005677981', N'\agents\agent_42.png', N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', 488, N'Вячеслав Романович Третьякова', N'86483417250', N'455013058')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (41, N'ПАО', N'МеталСервисМор', N'xdanilov@titov.ru', N'+78004276143', N'\agents\agent_23.png', N'293265, Иркутская область, город Клин, пр. Славы, 12', 475, N'Коновалова Кирилл Львович', N'71692281784', N'580142825')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (42, N'ПАО', N'МоторБашкирИнфоЭкспедиция', N'egorov.zanna@maslova.ru', N'+735222869461', N'\agents\agent_88.png', N'352034, Сахалинская область, город Домодедово, пр. Балканская, 97', 68, N'Тимофеева Регина Львовна', N'916542240791', N'928029129')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (43, N'ПАО', N'Пив', N'klavdiy50@nazarov.com', N'+78124659796', N'\agents\agent_118.png', N'306012, Ростовская область, город Талдом, пл. Сталина, 01', 198, N'Макар Романович Савельев', N'73936600214', N'873471159')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (44, N'ООО', N'Компания КазМеталКазань', N'mmoiseev@teterin.ru', N'+74956837657', N'\agents\agent_69.png', N'532703, Пензенская область, город Чехов, наб. Чехова, 81', 252, N'Валерий Владимирович Хохлова', N'74598939812', N'303467543')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (45, N'ООО', N'Компания Орион', N'msorokina@andreeva.ru', N'+79229163431', N'\agents\agent_70.png', N'661101, Оренбургская область, город Волоколамск, въезд Чехова, 16', 227, N'Елисееваа Эмилия Андреевна', N'78698706801', N'251899316')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (46, N'ЗАО', N'ИнфоАлмазГлав', N'valentin23@sitnikov.net', N'+79226279625', N'\agents\agent_112.png', N'937201, Самарская область, город Воскресенск, въезд Космонавтов, 10', 133, N'Вишняков Гордей Владимирович', N'78990745795', N'517528851')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (47, N'ОАО', N'ТяжРадиоУралПроф', N'liliy62@grisina.ru', N'+79226359719', N'\agents\agent_27.png', N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', 278, N'София Алексеевна Мухина', N'75688533246', N'401535045')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (48, N'ООО', N'РемМетиз', N'mdavydov@blokin.org', N'+74956985686', N'\agents\agent_111.png', N'837800, Псковская область, город Солнечногорск, ул. Сталина, 67', 296, N'Жанна Евгеньевна Гришинаа', N'72129059967', N'287016575')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (49, N'МФО', N'Гараж', N'antonin51@korolev.com', N'+78002976948', N'не указано', N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', 107, N'Панфилов Константин Максимович', N'72638464552', N'746822723')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (50, N'ООО', N'Компания МикроГлавУралЭкспедиция', N'nonna23@nesterova.ru', N'+74954844265', N'\agents\agent_109.png', N'225511, Новосибирская область, город Можайск, наб. Ладыгина, 82', 387, N'Зайцева Лада Дмитриевна', N'75555957575', N'680301577')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (51, N'ПАО', N'БашкирРечТомск', N'aleksandra77@karpov.com', N'+79224373891', N'\agents\agent_39.png', N'136886, Амурская область, город Видное, въезд Космонавтов, 39', 84, N'Назарова Вера Андреевна', N'77027724917', N'823811460')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (52, N'ПАО', N'Орион', N'donat05@sokolova.com', N'+735222779859', N'\agents\agent_104.png', N'049104, Новгородская область, город Павловский Посад, бульвар Ладыгина, 58', 412, N'Клим Сергеевич Аксёнова', N'77387259022', N'875652541')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (53, N'МКК', N'МетизСтрой', N'kristina.pakomov@burova.ru', N'+735222774644', N'\agents\agent_33.png', N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', 374, N'Ева Борисовна Беспалова', N'74024742936', N'295608432')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (54, N'ЗАО', N'ЦементКрепТех-М', N'yna.evdokimov@gordeeva.ru', N'+78124139132', N'\agents\agent_21.png', N'263764, Свердловская область, город Раменское, пер. Косиора, 28', 189, N'Сергеев Владлен Александрович', N'75359981084', N'680416300')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (55, N'ОАО', N'РемВод', N'komarov.elizaveta@agafonova.ru', N'+78127661188', N'\agents\agent_65.png', N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', 1, N'Медведеваа Ярослава Фёдоровна', N'73986603105', N'811373078')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (56, N'ОАО', N'БашкирМотор', N'kseniy80@rusakov.net', N'+78121767777', N'\agents\agent_117.png', N'073468, Читинская область, город Шаховская, наб. Косиора, 99', 91, N'Денисов Владимир Андреевич', N'76032171116', N'180861585')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (57, N'ООО', N'Компания МоторТелекомЦемент-М', N'larisa44@silin.org', N'+78121318424', N'\agents\agent_57.png', N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', 237, N'Иван Евгеньевич Белоусова', N'77326832482', N'440199498')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (58, N'ОАО', N'ЦементСантехФинансЛизинг', N'anfisa07@semenova.com', N'+79228771228', N'\agents\agent_101.png', N'165429, Курганская область, город Озёры, въезд Балканская, 17', 70, N'Даниил Фёдорович Григорьева', N'76290983121', N'136566390')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (59, N'ООО', N'Компания ВодАлмазIT', N'zakar37@nikolaeva.ru', N'+78005959199', N'\agents\agent_50.png', N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', 31, N'Гуляев Егор Евгеньевич', N'72345297765', N'908449277')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (60, N'ОАО', N'БашкирСтрой', N'bgromov@tretykov.org', N'+735222897497', N'\agents\agent_80.png', N'152450, Брянская область, город Серебряные Пруды, наб. 1905 года, 56', 92, N'Яна Дмитриевна Моисееваа', N'1660486169', N'253830866')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (61, N'ОАО', N'ТелеРечДизайн', N'kazakova.yroslava@silina.net', N'+78127317952', N'\agents\agent_82.png', N'063695, Новгородская область, город Можайск, шоссе Гагарина, 39', 226, N'Виктория Романовна Королёваа', N'6369492130', N'115604622')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (62, N'ОАО', N'ГазГлавПивЛизинг', N'sysoeva.evgenii@kolesnikova.ru', N'+74957443711', N'\agents\agent_91.png', N'899084, Амурская область, город Талдом, спуск Балканская, 34', 52, N'Злата Сергеевна Архипова', N'5309136217', N'170258253')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (63, N'ОАО', N'Софт', N'jterentev@ersov.com', N'+735222153592', N'\agents\agent_61.png', N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', 292, N'Петухова Прохор Фёдорович', N'3889910123', N'952047511')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (64, N'ОАО', N'Инфо', N'arsenii.mikailova@prokorov.com', N'+735222283328', N'\agents\agent_28.png', N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', 304, N'Баранова Виктор Романович', N'6549468639', N'718386757')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (65, N'ОАО', N'ЭлектроШум', N'nataly89@kulakov.ru', N'+735222285934', N'\agents\agent_103.png', N'975616, Вологодская область, город Клин, пер. Косиора, 57', 109, N'Игнатьеваа Флорентина Фёдоровна', N'3124748557', N'525403940')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (66, N'ЗАО', N'РыбВостокCибСнаб', N'filipp93@polykov.ru', N'+78004868447', N'\agents\agent_94.png', N'990758, Челябинская область, город Серпухов, въезд Космонавтов, 57', 496, N'Степанова Фаина Львовна', N'2412503891', N'711642010')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (67, N'ПАО', N'СервисПивВектор', N'wersov@molcanova.com', N'+78125644665', N'\agents\agent_87.png', N'669558, Омская область, город Шаховская, шоссе Гагарина, 55', 267, N'Олег Евгеньевич Журавлёв', N'4098988911', N'952390693')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (68, N'ПАО', N'Бух', N'valentina.bolsakova@aksenova.ru', N'+735222999242', N'\agents\agent_43.png', N'481744, Амурская область, город Щёлково, пл. Сталина, 48', 327, N'Тарасов Болеслав Александрович', N'2320989197', N'359282667')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (69, N'МКК', N'МеталТекстильЛифтТрест', N'muravev.trofim@sazonov.net', N'+78007363673', N'\agents\agent_25.png', N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', 425, N'Одинцов Назар Борисович', N'2971553297', N'821859486')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (70, N'МФО', N'ВостокЛен', N'dmitrii90@zaitev.ru', N'+74959717124', N'\agents\agent_114.png', N'546530, Тульская область, город Видное, наб. Гагарина, 63', 246, N'Лыткинаа Люся Дмитриевна', N'1697025997', N'931878289')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (71, N'ПАО', N'АлмазАсбоцементБухКомплекс', N'akoseleva@dementeva.ru', N'+78127525341', N'\agents\agent_119.png', N'794964, Мурманская область, город Озёры, ул. 1905 года, 56', 39, N'Зыков Никита Александрович', N'8996890877', N'349709983')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (72, N'ПАО', N'ТверьМонтажОмск', N'dteterina@selezneva.ru', N'+735222928752', N'\agents\agent_67.png', N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', 272, N'Матвей Романович Большакова', N'2421347164', N'157370604')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (73, N'МКК', N'ТверьХозМорСбыт', N'marina58@koroleva.com', N'+735222729338', N'\agents\agent_56.png', N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', 207, N'Аким Львович Субботина', N'6681338084', N'460530907')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (74, N'ОАО', N'МорТехТелекомСнаб', N'garri.rybakov@ermakova.com', N'+78003599529', N'\agents\agent_98.png', N'239247, Архангельская область, город Лотошино, бульвар Ломоносова, 28', 149, N'Беспалова Ева Романовна', N'4354676693', N'631235170')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (75, N'ООО', N'Лифт', N'zinaida01@bespalova.ru', N'+78128875997', N'\agents\agent_40.png', N'479565, Курганская область, город Клин, пл. Ленина, 54', 92, N'Вера Евгеньевна Денисоваа', N'6169713039', N'848972934')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (76, N'МКК', N'МясХмельФлот', N'anna48@alekseev.ru', N'+78005481153', N'\agents\agent_72.png', N'252826, Костромская область, город Солнечногорск, проезд Ленина, 75', 372, N'Гавриил Львович Зуева', N'3019787650', N'974897634')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (77, N'ООО', N'Компания МобайлЮпитерМобайл', N'klara.gavrilov@nosova.com', N'+78129413596', N'\agents\agent_75.png', N'697880, Тюменская область, город Егорьевск, проезд Домодедовская, 82', 31, N'Рожкова Аркадий Владимирович', N'3824054933', N'715845254')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (78, N'ООО', N'Компания Инж', N'osilova@muravev.ru', N'+78007656746', N'\agents\agent_99.png', N'475644, Ивановская область, город Луховицы, въезд Будапештсткая, 43', 179, N'Чернова Инесса Сергеевна', N'6730622378', N'201657751')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (79, N'МФО', N'АсбоцементТехАвто', N'matveev.yliy@kiseleva.ru', N'+74956768198', N'\agents\agent_49.png', N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', 247, N'Сидорова Любовь Ивановна', N'7626076463', N'579234124')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (80, N'ООО', N'Cиб', N'anfisa50@krykova.org', N'+78123732764', N'\agents\agent_83.png', N'194134, Омская область, город Волоколамск, пер. Косиора, 79', 174, N'Беспалова Мирослав Владимирович', N'7892739766', N'524021828')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (81, N'МФО', N'СервисТомск', N'mukin.lev@komarov.ru', N'+73526631665', N'\agents\agent_79.png', N'194903, Амурская область, город Ногинск, ул. Бухарестская, 45', 475, N'Егор Сергеевич Филиппов', N'+78538379073', N'+7761935124')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (82, N'ООО', N'ТверьМетизУралСнос', N'rlazareva@novikov.ru', N'+79224972219', N'\agents\agent_48.png', N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', 165, N'Зоя Андреевна Соболева', N'+71076095397', N'+7947828491')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (83, N'ОАО', N'Электро', N'likacev.makar@antonov.ru', N'+78122644175', N'\agents\agent_32.png', N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', 366, N'Шарапова Елена Дмитриевна', N'+77896029866', N'+7876038848')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (84, N'ООО', N'Компания Алмаз', N'akalinina@zaitev.ru', N'+79221678939', N'\agents\agent_60.png', N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', 259, N'Фоминаа Лариса Романовна', N'+76698862694', N'+7662876919')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (85, N'ЗАО', N'ПивЛенТверь', N'dnikitina@antonova.ru', N'+78126531926', N'\agents\agent_110.png', N'783238, Тюменская область, город Серебряные Пруды, проезд 1905 года, 67', 190, N'Костин Савва Романович', N'+79476119404', N'+7365311390')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (86, N'ОАО', N'МетизБухРем', N'koselev.anfisa@selezneva.ru', N'+79228527343', N'нет', N'318328, Кемеровская область, город Павловский Посад, спуск 1905 года, 92', 112, N'Нонна Фёдоровна Федотова', N'+791449531554', N'+7124871353')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (87, N'ОАО', N'ITСтройАлмаз', N'fokin.eduard@samoilov.com', N'+735222463391', N'не указано', N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', 159, N'Алексеева Валериан Андреевич', N'+77689065648', N'+7456612755')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (88, N'МКК', N'МонтажОрионУрал', N'pzaitev@blokin.org', N'+78009162793', N'\agents\agent_35.png', N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', 50, N'Давыдоваа Нина Евгеньевна', N'+71692286718', N'+7181380912')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (89, N'ОАО', N'ВодГор', N'tvetkova.robert@sorokin.com', N'+73522615874', N'\agents\agent_64.png', N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', 72, N'Фаина Фёдоровна Филиппова', N'+74463113470', N'+7899603778')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (90, N'МФО', N'ВостокКазРыб', N'flukin@misin.org', N'+79222639351', N'\agents\agent_51.png', N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', 361, N'Самсонов Родион Романович', N'+77411284960', N'+7176779733')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (91, N'ООО', N'ЛифтРыб', N'maksim86@fokina.ru', N'+79222984548', N'отсутствует', N'076703, Саратовская область, город Одинцово, ул. Косиора, 01', 445, N'Субботин Анатолий Евгеньевич', N'+73997121859', N'+79970823018')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (92, N'ЗАО', N'УралСтройХмель', N'aleksandr95@kolobova.ru', N'+78129869447', N'\agents\agent_52.png', N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', 372, N'Август Борисович Красильникова', N'+78773558039', N'+7402502867')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (93, N'МКК', N'ГаражРосВекторПроф', N'adrian61@guseva.ru', N'+78005956586', N'\agents\agent_81.png', N'828207, Тверская область, город Щёлково, наб. Ленина, 70', 189, N'Абрам Фёдорович Дроздов', N'+71092776106', N'+7164232266')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (94, N'МКК', N'Каз', N'jsafonov@molcanov.com', N'+74958291577', N'\agents\agent_115.png', N'432454, Ленинградская область, город Луховицы, пр. Косиора, 88', 291, N'Святослав Андреевич Моисеева', N'+71036132639', N'+7918316432')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (95, N'ООО', N'КрепМетал', N'nika.kalasnikov@maslova.ru', N'+79225378864', N'не указано', N'103296, Иркутская область, город Солнечногорск, пл. 1905 года, 59', 471, N'Андрей Сергеевич Лобанов', N'+71689100612', N'+7671073273')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (96, N'ООО', N'Компания ЖелДорТверьМонтаж', N'burova.zlata@zueva.ru', N'+74951685394', N'\agents\agent_24.png', N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', 2, N'Нестор Максимович Гуляев', N'+73325722996', N'+7665766347')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (97, N'ЗАО', N'ОрионСофтВодСнос', N'isukanov@sobolev.com', N'+78001875696', N'\agents\agent_36.png', N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', 361, N'Мухина Ян Фёдорович', N'+71522348613', N'+7977738715')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (98, N'ОАО', N'БухМясМоторПром', N'varvara49@savin.ru', N'+735222738181', N'нет', N'677498, Костромская область, город Зарайск, спуск Славы, 59', 158, N'Нина Дмитриевна Черноваа', N'+77377410338', N'+7592041317')
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (99, N'ПАО', N'ГлавБашкирМоторБанк', N'xaksenova@kazakov.ru', N'+74951342772', N'нет', N'258285, Ульяновская область, город Ступино, пл. Ладыгина, 83', 98, N'Стефан Алексеевич Андреев', N'+79101293748', N'+7531950230')
GO
INSERT [dbo].[Agents] ([AgentID], [AgentType], [AgentName], [Email], [Phone], [Logo], [LegalAddress], [Priority], [Director], [INN], [KPP]) VALUES (100, N'ПАО', N'Рем', N'rafail96@sukin.ru', N'+78121116711', N'\agents\agent_55.png', N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', 88, N'Альбина Александровна Романова', N'+79006569852', N'+7152177100')
SET IDENTITY_INSERT [dbo].[Agents] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (1, N'Газета большая 1868', N'Спам', N'27976646', 1, 6, CAST(902.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (2, N'Газета большая 3657', N'Государственная', N'78091245', 4, 11, CAST(930.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (3, N'Газета для художников 4236', N'Художественная', N'48553183', 2, 10, CAST(1550.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (4, N'Газета в самолет 4604', N'Государственная', N'8680636', 2, 11, CAST(753.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (5, N'Газета большая 4944', N'Новостная', N'9353504', 2, 12, CAST(273.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (6, N'Газета на все случаи жизни 1520', N'Художественная', N'45594795', 5, 2, CAST(456.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (7, N'Газета в для бесплатной раздачи 2606', N'Государственная', N'83462242', 5, 11, CAST(774.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (8, N'Газета большая 6862', N'Художественная', N'59167393', 5, 4, CAST(434.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (9, N'Газета для камина 3315', N'Объявления', N'54478746', 3, 10, CAST(1218.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (10, N'Газета для художников 3342', N'Спам', N'22057074', 1, 9, CAST(1810.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (11, N'Газета на все случаи жизни 6648', N'Новостная', N'87295396', 5, 6, CAST(855.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (12, N'Газета с рекламой 6481', N'Объявления', N'24075601', 4, 10, CAST(1082.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (13, N'Газета для камина 2315', N'Популярное', N'50256318', 1, 2, CAST(371.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (14, N'Газета в для бесплатной раздачи 3292', N'Объявления', N'85600070', 2, 9, CAST(1538.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (15, N'Газета в самолет 5630', N'Новостная', N'84369081', 2, 7, CAST(408.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (16, N'Газета с рекламой 2151', N'Новостная', N'7334637', 3, 11, CAST(469.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (17, N'Газета для художников 4151', N'Популярное', N'36541845', 1, 1, CAST(1941.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (18, N'Газета для художников 6785', N'Популярное', N'39091116', 1, 9, CAST(1803.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (19, N'Газета 4345', N'Художественная', N'52923383', 5, 8, CAST(1184.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (20, N'Газета 3090', N'Художественная', N'11600809', 1, 12, CAST(1330.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (21, N'Газета на все случаи жизни 3544', N'Новостная', N'60843368', 3, 11, CAST(859.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (22, N'Газета большая 3643', N'Новостная', N'22067189', 3, 5, CAST(1915.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (23, N'Газета 4180', N'Популярное', N'76654386', 4, 4, CAST(921.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (24, N'Газета 3975', N'Объявления', N'82659311', 1, 10, CAST(1508.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (25, N'Газета с рекламой 3242', N'Спам', N'7149484', 2, 11, CAST(921.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (26, N'Газета для художников 6864', N'Государственная', N'87872929', 3, 8, CAST(171.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (27, N'Газета 1082', N'Новостная', N'77937928', 2, 12, CAST(714.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (28, N'Газета в для бесплатной раздачи 6111', N'Художественная', N'72416523', 1, 9, CAST(309.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (29, N'Газета на все случаи жизни 1714', N'Объявления', N'31665003', 2, 12, CAST(1424.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (30, N'Газета для камина 6285', N'Государственная', N'71281919', 5, 11, CAST(983.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (31, N'Газета на все случаи жизни 6220', N'Художественная', N'18410956', 1, 4, CAST(1698.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (32, N'Газета для художников 4102', N'Объявления', N'63922854', 3, 1, CAST(1579.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (33, N'Газета для художников 4315', N'Художественная', N'42103413', 1, 5, CAST(393.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (34, N'Газета с рекламой 2519', N'Новостная', N'80730863', 3, 8, CAST(540.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (35, N'Газета большая 3238', N'Художественная', N'89835699', 2, 11, CAST(1755.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (36, N'Газета большая 5121', N'Популярное', N'64624694', 5, 4, CAST(756.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (37, N'Газета в самолет 2000', N'Новостная', N'29040461', 4, 11, CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (38, N'Газета 2519', N'Художественная', N'13583259', 3, 8, CAST(1046.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (39, N'Газета с рекламой 5369', N'Новостная', N'1238940', 4, 11, CAST(1272.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (40, N'Газета в для бесплатной раздачи 2698', N'Объявления', N'70753171', 5, 2, CAST(1877.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (41, N'Газета для камина 6472', N'Государственная', N'82969831', 4, 2, CAST(1114.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (42, N'Газета в для бесплатной раздачи 5284', N'Новостная', N'33299792', 2, 12, CAST(1347.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (43, N'Газета в для бесплатной раздачи 1541', N'Художественная', N'14324022', 4, 12, CAST(467.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (44, N'Газета для художников 4719', N'Спам', N'77692803', 4, 2, CAST(1701.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (45, N'Газета на все случаи жизни 3653', N'Новостная', N'53542547', 3, 8, CAST(1378.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (46, N'Газета в для бесплатной раздачи 6264', N'Объявления', N'18281277', 4, 2, CAST(1127.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (47, N'Газета на все случаи жизни 2342', N'Художественная', N'30687057', 3, 12, CAST(1180.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (48, N'Газета для художников 3691', N'Новостная', N'54726555', 4, 3, CAST(557.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (49, N'Газета 3037', N'Объявления', N'26474670', 2, 8, CAST(1653.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [SKU], [NumberOfPeople], [WorkshopNumber], [MinimumPrice]) VALUES (50, N'Газета 5023', N'Объявления', N'1423893', 5, 1, CAST(1389.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSales] ON 

INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (5, 39, 47, CAST(N'2010-05-15' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (12, 45, 69, CAST(N'2016-12-27' AS Date), 18)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (13, 28, 14, CAST(N'2018-01-14' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (14, 31, 83, CAST(N'2016-02-23' AS Date), 8)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (16, 38, 59, CAST(N'2019-05-28' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (17, 45, 59, CAST(N'2019-03-28' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (18, 10, 63, CAST(N'2014-10-07' AS Date), 7)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (19, 6, 96, CAST(N'2011-02-24' AS Date), 13)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (20, 42, 97, CAST(N'2010-07-03' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (21, 19, 55, CAST(N'2010-02-05' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (22, 42, 41, CAST(N'2010-04-11' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (23, 46, 47, CAST(N'2012-07-08' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (24, 30, 82, CAST(N'2011-02-01' AS Date), 12)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (25, 35, 73, CAST(N'2014-08-15' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (26, 33, 57, CAST(N'2015-10-23' AS Date), 14)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (27, 44, 11, CAST(N'2013-02-17' AS Date), 4)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (28, 21, 51, CAST(N'2018-01-20' AS Date), 1)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (29, 19, 40, CAST(N'2013-11-23' AS Date), 8)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (30, 39, 14, CAST(N'2016-06-02' AS Date), 8)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (31, 40, 97, CAST(N'2010-10-17' AS Date), 16)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (32, 21, 13, CAST(N'2018-02-12' AS Date), 17)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (33, 3, 11, CAST(N'2011-11-10' AS Date), 6)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (34, 26, 90, CAST(N'2014-08-24' AS Date), 14)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (35, 50, 45, CAST(N'2010-06-05' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (36, 47, 45, CAST(N'2019-03-12' AS Date), 11)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (37, 8, 69, CAST(N'2011-09-12' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (38, 2, 55, CAST(N'2013-11-22' AS Date), 8)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (39, 49, 83, CAST(N'2014-12-10' AS Date), 6)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (40, 20, 49, CAST(N'2016-10-25' AS Date), 10)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (41, 35, 11, CAST(N'2017-08-27' AS Date), 5)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (42, 11, 64, CAST(N'2018-08-18' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (43, 48, 14, CAST(N'2017-05-12' AS Date), 7)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (44, 12, 40, CAST(N'2012-03-02' AS Date), 15)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (45, 46, 57, CAST(N'2010-12-05' AS Date), 4)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (46, 20, 68, CAST(N'2010-02-03' AS Date), 7)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (47, 42, 53, CAST(N'2016-02-20' AS Date), 10)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (48, 3, 33, CAST(N'2015-07-21' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (49, 22, 49, CAST(N'2012-04-05' AS Date), 11)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (50, 33, 12, CAST(N'2019-10-06' AS Date), 17)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (51, 21, 84, CAST(N'2014-01-18' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (52, 45, 40, CAST(N'2010-12-21' AS Date), 11)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (53, 11, 79, CAST(N'2017-03-08' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (54, 1, 79, CAST(N'2012-09-09' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (55, 36, 47, CAST(N'2013-06-24' AS Date), 1)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (56, 20, 30, CAST(N'2019-05-07' AS Date), 20)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (57, 21, 68, CAST(N'2010-03-18' AS Date), 5)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (58, 7, 57, CAST(N'2018-09-06' AS Date), 8)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (59, 40, 18, CAST(N'2018-03-24' AS Date), 5)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (60, 50, 40, CAST(N'2019-02-18' AS Date), 14)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (61, 14, 45, CAST(N'2015-11-16' AS Date), 10)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (62, 34, 30, CAST(N'2011-01-28' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (63, 26, 53, CAST(N'2019-02-24' AS Date), 1)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (64, 5, 82, CAST(N'2014-04-27' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (65, 33, 84, CAST(N'2014-02-28' AS Date), 18)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (66, 36, 14, CAST(N'2015-10-21' AS Date), 13)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (67, 5, 30, CAST(N'2012-09-26' AS Date), 15)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (68, 13, 68, CAST(N'2010-10-19' AS Date), 4)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (69, 36, 44, CAST(N'2012-03-20' AS Date), 15)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (70, 8, 64, CAST(N'2014-12-11' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (71, 49, 41, CAST(N'2019-12-04' AS Date), 4)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (72, 38, 87, CAST(N'2015-07-01' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (73, 28, 64, CAST(N'2018-12-04' AS Date), 13)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (74, 33, 68, CAST(N'2018-03-22' AS Date), 11)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (75, 22, 49, CAST(N'2019-10-26' AS Date), 12)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (76, 12, 72, CAST(N'2018-06-21' AS Date), 9)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (77, 1, 82, CAST(N'2012-09-10' AS Date), 11)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (78, 20, 44, CAST(N'2016-09-25' AS Date), 20)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (79, 40, 3, CAST(N'2018-08-18' AS Date), 17)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (80, 28, 83, CAST(N'2014-02-19' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (81, 11, 73, CAST(N'2013-03-24' AS Date), 18)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (82, 43, 89, CAST(N'2010-08-24' AS Date), 16)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (83, 14, 33, CAST(N'2019-03-10' AS Date), 13)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (84, 12, 30, CAST(N'2019-01-18' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (85, 31, 73, CAST(N'2010-11-06' AS Date), 1)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (86, 27, 87, CAST(N'2018-01-05' AS Date), 7)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (87, 11, 31, CAST(N'2011-07-18' AS Date), 11)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (88, 28, 49, CAST(N'2019-06-02' AS Date), 12)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (89, 50, 54, CAST(N'2017-09-13' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (90, 34, 51, CAST(N'2013-09-05' AS Date), 20)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (91, 35, 45, CAST(N'2013-08-24' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (92, 6, 3, CAST(N'2015-09-05' AS Date), 15)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (93, 21, 26, CAST(N'2015-08-17' AS Date), 14)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (94, 16, 49, CAST(N'2016-04-26' AS Date), 4)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (95, 7, 12, CAST(N'2010-08-02' AS Date), 2)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (96, 1, 26, CAST(N'2010-06-15' AS Date), 18)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (97, 22, 18, CAST(N'2017-08-17' AS Date), 19)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (98, 39, 84, CAST(N'2019-04-27' AS Date), 3)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (99, 30, 31, CAST(N'2013-12-24' AS Date), 16)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (100, 27, 44, CAST(N'2011-05-15' AS Date), 13)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (101, 30, 36, CAST(N'2010-06-14' AS Date), 4)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (102, 31, 12, CAST(N'2019-09-20' AS Date), 6)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (103, 25, 21, CAST(N'2010-05-01' AS Date), 14)
INSERT [dbo].[ProductSales] ([SaleID], [ProductID], [AgentID], [SaleDate], [Quantity]) VALUES (104, 49, 83, CAST(N'2015-04-08' AS Date), 18)
SET IDENTITY_INSERT [dbo].[ProductSales] OFF
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([AgentID])
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
USE [master]
GO
ALTER DATABASE [Ебать, я проверяю] SET  READ_WRITE 
GO
