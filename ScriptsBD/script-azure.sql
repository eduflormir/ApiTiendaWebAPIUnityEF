/****** Object:  Table [dbo].[Almacen]    Script Date: 25/11/2015 9:57:18 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Almacen_Producto]    Script Date: 25/11/2015 9:57:18 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/11/2015 9:57:18 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 25/11/2015 9:57:18 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/11/2015 9:57:18 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Producto_Etiqueta]    Script Date: 25/11/2015 9:57:18 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

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
