USE [master]
GO
/****** Object:  Database [Tienda25]    Script Date: 25/11/2015 9:58:29 ******/
CREATE DATABASE [Tienda25]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tienda25', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tienda25.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tienda25_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tienda25_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tienda25] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tienda25].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tienda25] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tienda25] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tienda25] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tienda25] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tienda25] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tienda25] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tienda25] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda25] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tienda25] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda25] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tienda25] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tienda25] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tienda25] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tienda25] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tienda25] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tienda25] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tienda25] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tienda25] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tienda25] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tienda25] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tienda25] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tienda25] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tienda25] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tienda25] SET RECOVERY FULL 
GO
ALTER DATABASE [Tienda25] SET  MULTI_USER 
GO
ALTER DATABASE [Tienda25] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tienda25] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tienda25] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tienda25] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tienda25', N'ON'
GO
USE [Tienda25]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 25/11/2015 9:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[idAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [nvarchar](250) NOT NULL,
	[codigoPostal] [int] NOT NULL,
 CONSTRAINT [PK_Almacen] PRIMARY KEY CLUSTERED 
(
	[idAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Almacen_Producto]    Script Date: 25/11/2015 9:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen_Producto](
	[idAlmacen] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[existencias] [int] NOT NULL,
 CONSTRAINT [PK_Almacen_Producto] PRIMARY KEY CLUSTERED 
(
	[idAlmacen] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/11/2015 9:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 25/11/2015 9:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[idEtiqueta] [int] IDENTITY(1,1) NOT NULL,
	[texto] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[idEtiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/11/2015 9:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[fabricante] [nvarchar](250) NOT NULL,
	[descripcionCorta] [nvarchar](150) NOT NULL,
	[precioCoste] [decimal](18, 0) NOT NULL,
	[precioVenta] [decimal](18, 0) NOT NULL,
	[idCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto_Etiqueta]    Script Date: 25/11/2015 9:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Etiqueta](
	[idProducto] [int] NOT NULL,
	[idEtiqueta] [int] NOT NULL,
 CONSTRAINT [PK_Producto_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idEtiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([idCategoria], [nombre]) VALUES (1, N'Informatica')
INSERT [dbo].[Categoria] ([idCategoria], [nombre]) VALUES (2, N'Telefonia')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Etiqueta] ON 

INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (1, N'iOs')
INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (2, N'Android')
INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (3, N'5 pulgadas')
INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (4, N'Portatil')
INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (5, N'Smartphone')
INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (6, N'Win10')
INSERT [dbo].[Etiqueta] ([idEtiqueta], [texto]) VALUES (7, N'MacOs')
SET IDENTITY_INSERT [dbo].[Etiqueta] OFF
ALTER TABLE [dbo].[Almacen_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Producto_Almacen] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[Almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[Almacen_Producto] CHECK CONSTRAINT [FK_Almacen_Producto_Almacen]
GO
ALTER TABLE [dbo].[Almacen_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Producto_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Almacen_Producto] CHECK CONSTRAINT [FK_Almacen_Producto_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Producto_Etiqueta]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Etiqueta_Etiqueta] FOREIGN KEY([idEtiqueta])
REFERENCES [dbo].[Etiqueta] ([idEtiqueta])
GO
ALTER TABLE [dbo].[Producto_Etiqueta] CHECK CONSTRAINT [FK_Producto_Etiqueta_Etiqueta]
GO
ALTER TABLE [dbo].[Producto_Etiqueta]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Etiqueta_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Producto_Etiqueta] CHECK CONSTRAINT [FK_Producto_Etiqueta_Producto]
GO
USE [master]
GO
ALTER DATABASE [Tienda25] SET  READ_WRITE 
GO
