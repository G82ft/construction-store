USE [master]
GO
/****** Object:  Database [ConstructionStore]    Script Date: 09.12.2024 11:11:23 ******/
CREATE DATABASE [ConstructionStore]
    CONTAINMENT = NONE
    ON  PRIMARY
    ( NAME = N'ConstructionStore', FILENAME = N'C:\Users\User\ConstructionStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
    LOG ON
    ( NAME = N'ConstructionStore_log', FILENAME = N'C:\Users\User\ConstructionStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ConstructionStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
    begin
        EXEC [ConstructionStore].[dbo].[sp_fulltext_database] @action = 'enable'
    end
GO
ALTER DATABASE [ConstructionStore] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ConstructionStore] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ConstructionStore] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ConstructionStore] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ConstructionStore] SET ARITHABORT OFF
GO
ALTER DATABASE [ConstructionStore] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ConstructionStore] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ConstructionStore] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ConstructionStore] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ConstructionStore] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ConstructionStore] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ConstructionStore] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ConstructionStore] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ConstructionStore] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ConstructionStore] SET  DISABLE_BROKER
GO
ALTER DATABASE [ConstructionStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ConstructionStore] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ConstructionStore] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ConstructionStore] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ConstructionStore] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ConstructionStore] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ConstructionStore] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ConstructionStore] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ConstructionStore] SET  MULTI_USER
GO
ALTER DATABASE [ConstructionStore] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ConstructionStore] SET DB_CHAINING OFF
GO
ALTER DATABASE [ConstructionStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [ConstructionStore] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [ConstructionStore] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [ConstructionStore] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [ConstructionStore] SET QUERY_STORE = OFF
GO
USE [ConstructionStore]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 09.12.2024 11:11:25 ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 09.12.2024 11:11:25 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 09.12.2024 11:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
                                 [ID] [int] IDENTITY(1,1) NOT NULL,
                                 [Name] [nvarchar](50) NOT NULL,
                                 [Type] [int] NOT NULL,
                                 [Provider] [int] NOT NULL,
                                 [Image] [int] NOT NULL,
                                 [Price] [decimal](18, 2) NOT NULL,
                                 [EachPackAmount] [int] NOT NULL,
                                 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
                                     (
                                      [ID] ASC
                                         )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 09.12.2024 11:11:25 ******/
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
/****** Object:  Table [dbo].[Providers]    Script Date: 09.12.2024 11:11:25 ******/
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
/****** Object:  Table [dbo].[ProviderType]    Script Date: 09.12.2024 11:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderType](
                                     [ID] [int] IDENTITY(1,1) NOT NULL,
                                     [Name] [nvarchar](50) NOT NULL,
                                     CONSTRAINT [PK_ProviderType] PRIMARY KEY CLUSTERED
                                         (
                                          [ID] ASC
                                             )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09.12.2024 11:11:25 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 09.12.2024 11:11:25 ******/
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
    REFERENCES [dbo].[ProviderType] ([ID])
GO
ALTER TABLE [dbo].[Providers] CHECK CONSTRAINT [FK_Providers_ProviderType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role])
    REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [ConstructionStore] SET  READ_WRITE
GO
