/**Esta practica la modifique ya que las siguiente practica donde se insertan datos no
funcionaba en la base anterior por fallos de minusculas y mayusculas.
Ahora si funciona**/
Create Database SendaBeta
GO
USE [SendaBeta]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Estado1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Estado1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Estado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] DROP CONSTRAINT [FK_PasajeroBoleto_Pasajero]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] DROP CONSTRAINT [FK_PasajeroBoleto_Boleto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] DROP CONSTRAINT [FK_ChoferAutobus_Autobus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chofer_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chofer]'))
ALTER TABLE [dbo].[Chofer] DROP CONSTRAINT [FK_Chofer_ChoferAutobus]
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
DROP TABLE [dbo].[Viaje]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
DROP TABLE [dbo].[Venta]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
DROP TABLE [dbo].[Ruta]
GO
/****** Object:  Table [dbo].[PasajeroBoleto]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]') AND type in (N'U'))
DROP TABLE [dbo].[PasajeroBoleto]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
DROP TABLE [dbo].[Pasajero]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
DROP TABLE [dbo].[Estado]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[ChoferAutobus]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]') AND type in (N'U'))
DROP TABLE [dbo].[ChoferAutobus]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chofer]') AND type in (N'U'))
DROP TABLE [dbo].[Chofer]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Caja]') AND type in (N'U'))
DROP TABLE [dbo].[Caja]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
DROP TABLE [dbo].[Boleto]
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autobus]') AND type in (N'U'))
DROP TABLE [dbo].[Autobus]
GO
USE [master]
GO
/****** Object:  Database [SendaBeta]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'SendaBeta')
DROP DATABASE [SendaBeta]
GO
/****** Object:  Database [SendaBeta]    Script Date: 24/10/2018 12:45:18 a. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SendaBeta')
BEGIN
CREATE DATABASE [SendaBeta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SendaBeta', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SendaBeta.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SendaBeta_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SendaBeta_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [SendaBeta] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SendaBeta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SendaBeta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SendaBeta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SendaBeta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SendaBeta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SendaBeta] SET ARITHABORT OFF 
GO
ALTER DATABASE [SendaBeta] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SendaBeta] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SendaBeta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SendaBeta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SendaBeta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SendaBeta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SendaBeta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SendaBeta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SendaBeta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SendaBeta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SendaBeta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SendaBeta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SendaBeta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SendaBeta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SendaBeta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SendaBeta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SendaBeta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SendaBeta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SendaBeta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SendaBeta] SET  MULTI_USER 
GO
ALTER DATABASE [SendaBeta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SendaBeta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SendaBeta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SendaBeta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SendaBeta]
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autobus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Autobus](
	[iIdAutobus] [int] NOT NULL,
	[vMarca] [varchar](50) NOT NULL,
	[iModelo] [int] NOT NULL,
	[tCantPasajero] [tinyint] NOT NULL,
	[vPlacas] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Autobus] PRIMARY KEY CLUSTERED 
(
	[iIdAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Boleto](
	[iIdBoleto] [int] NOT NULL,
	[iIdViaje] [int] NOT NULL,
	[vTipoBoleto] [varchar](50) NOT NULL,
	[vNombrePasajero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[iIdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Caja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Caja](
	[iId_Caja] [int] NOT NULL,
	[iId_Sucursal] [int] NOT NULL,
	[bEstado_Sucursal] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chofer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chofer](
	[iIdChofer] [int] NOT NULL,
	[vNomChofer] [varchar](50) NOT NULL,
	[tEdadChofer] [tinyint] NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Chofer] PRIMARY KEY CLUSTERED 
(
	[iIdChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChoferAutobus]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChoferAutobus](
	[iIdChoferAutobus] [int] NOT NULL,
	[iIdChofer] [int] NOT NULL,
	[iIdAutobus] [int] NOT NULL,
 CONSTRAINT [PK_AutobusChofer] PRIMARY KEY CLUSTERED 
(
	[iIdChoferAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[vNombre_Cliente] [varchar](50) NOT NULL,
	[iEdad_Cliente] [int] NOT NULL,
	[iTelefono_Cliente] [int] NOT NULL,
	[vDomicilio_Cliente] [varchar](50) NOT NULL,
	[vEstado_Cliente] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estado](
	[iIdcuidad] [int] NOT NULL,
	[vNomCiudad] [varchar](50) NOT NULL,
	[iIdEstado] [int] NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[iIdcuidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pasajero](
	[iIdPasajero] [int] NOT NULL,
	[vNombrePasajero] [varchar](50) NOT NULL,
	[tEdadPasajero] [tinyint] NOT NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[iIdPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PasajeroBoleto]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PasajeroBoleto](
	[iIdPasajero] [int] NOT NULL,
	[iIdBoleto] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ruta](
	[iIdRuta] [int] NOT NULL,
	[iIdCdOrigen] [int] NOT NULL,
	[iIdCdDestino] [int] NOT NULL,
	[gDistancia] [geography] NOT NULL,
	[tTiempoEst] [time](7) NOT NULL,
 CONSTRAINT [PK_Ruta] PRIMARY KEY CLUSTERED 
(
	[iIdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[iId_Sucursal] [int] NOT NULL,
	[vNombre_Sucucrsal] [varchar](50) NOT NULL,
	[vDomicilio_Sucursal] [varchar](50) NOT NULL,
	[vCiudad_Sucursal] [varchar](50) NOT NULL,
	[vEstado_Sucursal] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[iId_Venta] [int] NOT NULL,
	[vNombre_Cliente] [varchar](50) NOT NULL,
	[iId_Caja] [int] NOT NULL,
	[dtFecha_Venta] [datetime] NOT NULL,
	[mPrecio_Venta] [money] NOT NULL,
	[iId_Boleto] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 24/10/2018 12:45:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Viaje](
	[iId_Viaje] [int] NOT NULL,
	[vLugarDestino_Viaje] [varchar](50) NOT NULL,
	[vLugarOrigen_Viaje] [varchar](50) NOT NULL,
	[dtSalida_Viaje] [datetime] NOT NULL,
	[iId_Chofer] [int] NOT NULL,
	[iId_Autobus] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chofer_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chofer]'))
ALTER TABLE [dbo].[Chofer]  WITH CHECK ADD  CONSTRAINT [FK_Chofer_ChoferAutobus] FOREIGN KEY([iIdChofer])
REFERENCES [dbo].[ChoferAutobus] ([iIdChoferAutobus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chofer_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chofer]'))
ALTER TABLE [dbo].[Chofer] CHECK CONSTRAINT [FK_Chofer_ChoferAutobus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus]  WITH CHECK ADD  CONSTRAINT [FK_ChoferAutobus_Autobus] FOREIGN KEY([iIdAutobus])
REFERENCES [dbo].[Autobus] ([iIdAutobus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] CHECK CONSTRAINT [FK_ChoferAutobus_Autobus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto]  WITH CHECK ADD  CONSTRAINT [FK_PasajeroBoleto_Boleto] FOREIGN KEY([iIdBoleto])
REFERENCES [dbo].[Boleto] ([iIdBoleto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] CHECK CONSTRAINT [FK_PasajeroBoleto_Boleto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto]  WITH CHECK ADD  CONSTRAINT [FK_PasajeroBoleto_Pasajero] FOREIGN KEY([iIdPasajero])
REFERENCES [dbo].[Pasajero] ([iIdPasajero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] CHECK CONSTRAINT [FK_PasajeroBoleto_Pasajero]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Estado] FOREIGN KEY([iIdCdOrigen])
REFERENCES [dbo].[Estado] ([iIdcuidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Estado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Estado1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Estado1] FOREIGN KEY([iIdCdDestino])
REFERENCES [dbo].[Estado] ([iIdcuidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Estado1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Estado1]
GO
USE [master]
GO
ALTER DATABASE [SendaBeta] SET  READ_WRITE 
GO
