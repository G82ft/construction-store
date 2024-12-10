USE [ConstructionStore]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10.12.2024 13:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Images]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Images](
    [ID] [int] NOT NULL,
    [Path] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Products](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](max) NOT NULL,
    [Type] [int] NOT NULL,
    [Provider] [int] NOT NULL,
    [Image] [int] NOT NULL,
    [Price] [decimal](18, 2) NOT NULL,
    [EachPackAmount] [int] NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[ProductTypes](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Providers]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Providers](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    [Type] [int] NOT NULL,
    [Country] [int] NOT NULL,
    CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[ProviderTypes]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[ProviderTypes](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_ProviderType] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Roles](
    [ID] [int] NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.12.2024 13:12:53 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Users](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Login] [nchar](64) NOT NULL,
    [Password] [nvarchar](50) NOT NULL,
    [FirstName] [nvarchar](50) NOT NULL,
    [LastName] [nvarchar](50) NOT NULL,
    [Patronymic] [nvarchar](50) NOT NULL,
    [Phone] [nchar](10) NOT NULL,
    [Role] [int] NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    SET IDENTITY_INSERT [dbo].[Countries] ON
    GO
    INSERT [dbo].[Countries] ([ID], [Name]) VALUES (1, N'Россия')
    GO
    INSERT [dbo].[Countries] ([ID], [Name]) VALUES (2, N'Япония')
    GO
    INSERT [dbo].[Countries] ([ID], [Name]) VALUES (3, N'Китай')
    GO
    INSERT [dbo].[Countries] ([ID], [Name]) VALUES (4, N'Латвия')
    GO
    SET IDENTITY_INSERT [dbo].[Countries] OFF
    GO
    INSERT [dbo].[Images] ([ID], [Path]) VALUES (1, N'/default.png')
    GO
    SET IDENTITY_INSERT [dbo].[Products] ON
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (1, N'Продукт', 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), 1)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (2, N'Дрель ударная Ресанта ДУ-15/850 850 Вт (75/8/3)
', 2, 2, 1, CAST(4090.00 AS Decimal(18, 2)), 1)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (4, N'Брус сухой строганый 90х90х6000 мм сорт АВ хвойные породы клееный
', 3, 3, 1, CAST(3899.00 AS Decimal(18, 2)), 1)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (5, N'Шуруповерт аккумуляторный ударный Makita CXT TD110DZ 10,8В Li-Ion без АКБ и ЗУ
', 2, 4, 1, CAST(4958.00 AS Decimal(18, 2)), 1)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (6, N'Брусок сухой строганый 20х30х3000 мм сорт АВ хвойные породы
', 4, 3, 1, CAST(1499.99 AS Decimal(18, 2)), 12)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (7, N'Изолента КМ ПВХ синяя 19 мм 20 м односторонняя
', 5, 5, 1, CAST(129.90 AS Decimal(18, 2)), 1)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (8, N'Изолента КМ ПВХ 5 цветов 15 мм 10 м', 5, 5, 1, CAST(149.99 AS Decimal(18, 2)), 5)
    GO
    INSERT [dbo].[Products] ([ID], [Name], [Type], [Provider], [Image], [Price], [EachPackAmount]) VALUES (9, N'Изолента КМ ПВХ черная 15 мм 20 м односторонняя', 5, 5, 1, CAST(59.90 AS Decimal(18, 2)), 2)
    GO
    SET IDENTITY_INSERT [dbo].[Products] OFF
    GO
    SET IDENTITY_INSERT [dbo].[ProductTypes] ON
    GO
    INSERT [dbo].[ProductTypes] ([ID], [Name]) VALUES (1, N'Тип')
    GO
    INSERT [dbo].[ProductTypes] ([ID], [Name]) VALUES (2, N'Электроинструмент')
    GO
    INSERT [dbo].[ProductTypes] ([ID], [Name]) VALUES (3, N'Брус')
    GO
    INSERT [dbo].[ProductTypes] ([ID], [Name]) VALUES (4, N'Брусок')
    GO
    INSERT [dbo].[ProductTypes] ([ID], [Name]) VALUES (5, N'Изолента')
    GO
    SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Providers] ON
    GO
    INSERT [dbo].[Providers] ([ID], [Name], [Type], [Country]) VALUES (1, N'Производитель', 1, 1)
    GO
    INSERT [dbo].[Providers] ([ID], [Name], [Type], [Country]) VALUES (2, N'Ресанта', 4, 4)
    GO
    INSERT [dbo].[Providers] ([ID], [Name], [Type], [Country]) VALUES (3, N'Лесопильня', 3, 1)
    GO
    INSERT [dbo].[Providers] ([ID], [Name], [Type], [Country]) VALUES (4, N'Makita', 4, 2)
    GO
    INSERT [dbo].[Providers] ([ID], [Name], [Type], [Country]) VALUES (5, N'КМ', 2, 3)
    GO
    SET IDENTITY_INSERT [dbo].[Providers] OFF
    GO
    SET IDENTITY_INSERT [dbo].[ProviderTypes] ON
    GO
    INSERT [dbo].[ProviderTypes] ([ID], [Name]) VALUES (1, N' ')
    GO
    INSERT [dbo].[ProviderTypes] ([ID], [Name]) VALUES (2, N'ОАО')
    GO
    INSERT [dbo].[ProviderTypes] ([ID], [Name]) VALUES (3, N'ООО')
    GO
    INSERT [dbo].[ProviderTypes] ([ID], [Name]) VALUES (4, N'ЗАО')
    GO
    SET IDENTITY_INSERT [dbo].[ProviderTypes] OFF
    GO
    INSERT [dbo].[Roles] ([ID], [Name]) VALUES (1, N'Пользователь')
    GO
    INSERT [dbo].[Roles] ([ID], [Name]) VALUES (2, N'Менеджер')
    GO
    INSERT [dbo].[Roles] ([ID], [Name]) VALUES (3, N'Администратор')
    GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Images] FOREIGN KEY([Image])
    REFERENCES [dbo].[Images] ([ID])
    GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Images]
    GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([Type])
    REFERENCES [dbo].[ProductTypes] ([ID])
    GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
    GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Providers] FOREIGN KEY([Provider])
    REFERENCES [dbo].[Providers] ([ID])
    GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Providers]
    GO
ALTER TABLE [dbo].[Providers]  WITH CHECK ADD  CONSTRAINT [FK_Providers_Countries] FOREIGN KEY([Country])
    REFERENCES [dbo].[Countries] ([ID])
    GO
ALTER TABLE [dbo].[Providers] CHECK CONSTRAINT [FK_Providers_Countries]
    GO
ALTER TABLE [dbo].[Providers]  WITH CHECK ADD  CONSTRAINT [FK_Providers_ProviderType] FOREIGN KEY([Type])
    REFERENCES [dbo].[ProviderTypes] ([ID])
    GO
ALTER TABLE [dbo].[Providers] CHECK CONSTRAINT [FK_Providers_ProviderType]
    GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role])
    REFERENCES [dbo].[Roles] ([ID])
    GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
    GO
