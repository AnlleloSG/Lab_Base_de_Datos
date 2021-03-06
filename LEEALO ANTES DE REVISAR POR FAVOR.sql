/***
Disculpe la molestia, pero las ultimas 3 practicas 
1.-Subconsultas y vistas
2.-Store procedures y funciones
3.-Triggers
que se encuentran en mi Repositorio, las realize sobre la siguiente base de datos 

Gracias de antemano
**/

Create database Senda
GO
USE [Senda]
GO
/****** Object:  Trigger [Trigger_Insertar]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Insertar]'))
DROP TRIGGER [dbo].[Trigger_Insertar]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [CK_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_Ruta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] DROP CONSTRAINT [FK_Viaje_Ruta]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_EstadoViaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] DROP CONSTRAINT [FK_Viaje_EstadoViaje]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] DROP CONSTRAINT [FK_Viaje_ChoferAutobus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_TPago]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_TPago]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Precio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Ciudad1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Ciudad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] DROP CONSTRAINT [FK_PasajeroBoleto_Pasajero]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] DROP CONSTRAINT [FK_PasajeroBoleto_Boleto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_TipoPasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero] DROP CONSTRAINT [FK_Pasajero_TipoPasajero]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_Empleado_Puesto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] DROP CONSTRAINT [FK_ChoferAutobus_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] DROP CONSTRAINT [FK_ChoferAutobus_Autobus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Viaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] DROP CONSTRAINT [FK_Boleto_Viaje]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] DROP CONSTRAINT [FK_Boleto_Precio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Asiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] DROP CONSTRAINT [FK_Boleto_Asiento]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asiento_SituacionA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asiento]'))
ALTER TABLE [dbo].[Asiento] DROP CONSTRAINT [FK_Asiento_SituacionA]
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
DROP TABLE [dbo].[Viaje]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
DROP TABLE [dbo].[Venta]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[TPago]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TPago]') AND type in (N'U'))
DROP TABLE [dbo].[TPago]
GO
/****** Object:  Table [dbo].[TipoPasajero]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPasajero]') AND type in (N'U'))
DROP TABLE [dbo].[TipoPasajero]
GO
/****** Object:  Table [dbo].[SituacionA]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionA]') AND type in (N'U'))
DROP TABLE [dbo].[SituacionA]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
DROP TABLE [dbo].[Ruta]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puesto]') AND type in (N'U'))
DROP TABLE [dbo].[Puesto]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio]') AND type in (N'U'))
DROP TABLE [dbo].[Precio]
GO
/****** Object:  Table [dbo].[PasajeroBoleto]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]') AND type in (N'U'))
DROP TABLE [dbo].[PasajeroBoleto]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
DROP TABLE [dbo].[Pasajero]
GO
/****** Object:  Table [dbo].[EstadoViaje]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoViaje]') AND type in (N'U'))
DROP TABLE [dbo].[EstadoViaje]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
DROP TABLE [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ciudad]') AND type in (N'U'))
DROP TABLE [dbo].[Ciudad]
GO
/****** Object:  Table [dbo].[ChoferAutobus]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]') AND type in (N'U'))
DROP TABLE [dbo].[ChoferAutobus]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
DROP TABLE [dbo].[Boleto]
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autobus]') AND type in (N'U'))
DROP TABLE [dbo].[Autobus]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asiento]') AND type in (N'U'))
DROP TABLE [dbo].[Asiento]
GO
/****** Object:  UserDefinedFunction [dbo].[SituacionViaje]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionViaje]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[SituacionViaje]
GO
USE [master]
GO
/****** Object:  Database [Senda]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Senda')
DROP DATABASE [Senda]
GO
/****** Object:  Database [Senda]    Script Date: 24/10/2018 01:10:39 a. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Senda')
BEGIN
CREATE DATABASE [Senda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Senda', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Senda.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Senda_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Senda_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Senda] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Senda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Senda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Senda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Senda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Senda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Senda] SET ARITHABORT OFF 
GO
ALTER DATABASE [Senda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Senda] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Senda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Senda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Senda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Senda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Senda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Senda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Senda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Senda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Senda] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Senda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Senda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Senda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Senda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Senda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Senda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Senda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Senda] SET RECOVERY FULL 
GO
ALTER DATABASE [Senda] SET  MULTI_USER 
GO
ALTER DATABASE [Senda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Senda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Senda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Senda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Senda]
GO
/****** Object:  UserDefinedFunction [dbo].[SituacionViaje]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionViaje]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[SituacionViaje](@viaje int)
returns varchar(50)
as
begin
	
	declare @sit int;
	declare @resp varchar(50);

	set @sit= (Select v.tEstadoViaje from Viaje as v where v.iIdViaje=@viaje);

	if(@sit=1)
		begin
			 set @resp=''Iniciado'';
		end
	else if(@sit=2)
		begin
			 set @resp=''En Curso'';
		end
	else if(@sit=3)
		begin
			 set @resp=''Acabado'';
		end

	RETURN @resp

end
' 
END

GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Asiento](
	[iIdAsiento] [int] NOT NULL,
	[iIdSituaciónA] [int] NOT NULL,
 CONSTRAINT [PK_Asiento] PRIMARY KEY CLUSTERED 
(
	[iIdAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 24/10/2018 01:10:39 a. m. ******/
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
	[tCantPasajeros] [tinyint] NOT NULL,
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
/****** Object:  Table [dbo].[Boleto]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Boleto](
	[iIdBoleto] [int] NOT NULL,
	[iIdViaje] [int] NOT NULL,
	[iIdAsiento] [tinyint] NOT NULL,
	[iIdPrecio] [int] NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[iIdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ChoferAutobus]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChoferAutobus](
	[iIdChoferAutobus] [int] NOT NULL,
	[iIdAutobus] [int] NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_ChoferAutobus] PRIMARY KEY CLUSTERED 
(
	[iIdChoferAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ciudad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ciudad](
	[iIdCiudad] [int] NOT NULL,
	[vNombreC] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[iIdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[iIdEmpleado] [int] NOT NULL,
	[vNomEmpleado] [varchar](50) NOT NULL,
	[vApePatEm] [varchar](50) NOT NULL,
	[vApeMatEm] [varchar](50) NOT NULL,
	[tEdadEmpleado] [tinyint] NOT NULL,
	[Puesto] [tinyint] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[iIdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoViaje]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoViaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstadoViaje](
	[tIdEstadoViaje] [tinyint] NOT NULL,
	[vEstadoViaje] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoViaje] PRIMARY KEY CLUSTERED 
(
	[tIdEstadoViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pasajero](
	[iIdVenta] [int] NOT NULL,
	[vNombresP] [varchar](50) NOT NULL,
	[vApePatP] [varchar](50) NOT NULL,
	[vApeMatP] [varchar](50) NOT NULL,
	[tEdadP] [tinyint] NOT NULL,
	[iIdTipoP] [tinyint] NOT NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[iIdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PasajeroBoleto]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PasajeroBoleto](
	[iIdPasajeroBoleto] [int] NOT NULL,
	[iIdPasajero] [int] NOT NULL,
	[iIdBoleton] [int] NOT NULL,
 CONSTRAINT [PK_PasajeroBoleto] PRIMARY KEY CLUSTERED 
(
	[iIdPasajeroBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Precio](
	[iIdPrecio] [int] NOT NULL,
	[mCosto] [money] NOT NULL,
 CONSTRAINT [PK_Precio] PRIMARY KEY CLUSTERED 
(
	[iIdPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Puesto](
	[iIdPuesto] [tinyint] NOT NULL,
	[vPuesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[iIdPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ruta](
	[iIdRuta] [int] NOT NULL,
	[iIdOrigen] [int] NOT NULL,
	[iIdDestino] [int] NOT NULL,
	[tTiempoEstimado] [time](4) NOT NULL,
 CONSTRAINT [PK_Ruta] PRIMARY KEY CLUSTERED 
(
	[iIdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SituacionA]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SituacionA](
	[iIdSituacionA] [int] NOT NULL,
	[vSituacionA] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SituacionA] PRIMARY KEY CLUSTERED 
(
	[iIdSituacionA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPasajero]    Script Date: 24/10/2018 01:10:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPasajero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoPasajero](
	[iIdTipoP] [tinyint] NOT NULL,
	[vTipoP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoPasajero] PRIMARY KEY CLUSTERED 
(
	[iIdTipoP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TPago]    Script Date: 24/10/2018 01:10:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TPago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TPago](
	[iIdTPago] [int] NOT NULL,
	[vTipoP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TPago] PRIMARY KEY CLUSTERED 
(
	[iIdTPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/10/2018 01:10:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuarios](
	[iIdUsuario] [int] NOT NULL,
	[vContra] [varchar](50) NOT NULL,
	[iIdEmpelado] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[iIdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 24/10/2018 01:10:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[iIdVenta] [int] NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
	[iIdPasajero] [int] NOT NULL,
	[iIdTPago] [int] NOT NULL,
	[iIdPrecio] [int] NOT NULL,
	[mTotal] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[iIdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 24/10/2018 01:10:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Viaje](
	[iIdViaje] [int] NOT NULL,
	[iIdRuta] [int] NOT NULL,
	[iIdChoferAutobus] [int] NOT NULL,
	[FechaS] [date] NOT NULL,
	[HoraS] [time](4) NOT NULL,
	[tEstadoViaje] [tinyint] NOT NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[iIdViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asiento_SituacionA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asiento]'))
ALTER TABLE [dbo].[Asiento]  WITH CHECK ADD  CONSTRAINT [FK_Asiento_SituacionA] FOREIGN KEY([iIdSituaciónA])
REFERENCES [dbo].[SituacionA] ([iIdSituacionA])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asiento_SituacionA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asiento]'))
ALTER TABLE [dbo].[Asiento] CHECK CONSTRAINT [FK_Asiento_SituacionA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Asiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Asiento] FOREIGN KEY([iIdPrecio])
REFERENCES [dbo].[Asiento] ([iIdAsiento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Asiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Asiento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Precio] FOREIGN KEY([iIdPrecio])
REFERENCES [dbo].[Precio] ([iIdPrecio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Precio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Viaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Viaje] FOREIGN KEY([iIdViaje])
REFERENCES [dbo].[Viaje] ([iIdViaje])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Viaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Viaje]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus]  WITH CHECK ADD  CONSTRAINT [FK_ChoferAutobus_Autobus] FOREIGN KEY([iIdAutobus])
REFERENCES [dbo].[Autobus] ([iIdAutobus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] CHECK CONSTRAINT [FK_ChoferAutobus_Autobus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus]  WITH CHECK ADD  CONSTRAINT [FK_ChoferAutobus_Empleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] CHECK CONSTRAINT [FK_ChoferAutobus_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([Puesto])
REFERENCES [dbo].[Puesto] ([iIdPuesto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_TipoPasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_TipoPasajero] FOREIGN KEY([iIdTipoP])
REFERENCES [dbo].[TipoPasajero] ([iIdTipoP])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_TipoPasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_TipoPasajero]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto]  WITH CHECK ADD  CONSTRAINT [FK_PasajeroBoleto_Boleto] FOREIGN KEY([iIdBoleton])
REFERENCES [dbo].[Boleto] ([iIdBoleto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] CHECK CONSTRAINT [FK_PasajeroBoleto_Boleto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto]  WITH CHECK ADD  CONSTRAINT [FK_PasajeroBoleto_Pasajero] FOREIGN KEY([iIdPasajero])
REFERENCES [dbo].[Pasajero] ([iIdVenta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] CHECK CONSTRAINT [FK_PasajeroBoleto_Pasajero]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Ciudad] FOREIGN KEY([iIdOrigen])
REFERENCES [dbo].[Ciudad] ([iIdCiudad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Ciudad]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Ciudad1] FOREIGN KEY([iIdDestino])
REFERENCES [dbo].[Ciudad] ([iIdCiudad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Ciudad1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empleado] FOREIGN KEY([iIdEmpelado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Empleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Precio] FOREIGN KEY([iIdPrecio])
REFERENCES [dbo].[Precio] ([iIdPrecio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Precio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_TPago]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_TPago] FOREIGN KEY([iIdTPago])
REFERENCES [dbo].[TPago] ([iIdTPago])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_TPago]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_TPago]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_ChoferAutobus] FOREIGN KEY([iIdChoferAutobus])
REFERENCES [dbo].[ChoferAutobus] ([iIdChoferAutobus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_ChoferAutobus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_EstadoViaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_EstadoViaje] FOREIGN KEY([tEstadoViaje])
REFERENCES [dbo].[EstadoViaje] ([tIdEstadoViaje])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_EstadoViaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_EstadoViaje]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_Ruta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Ruta] FOREIGN KEY([iIdRuta])
REFERENCES [dbo].[Ruta] ([iIdRuta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_Ruta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Ruta]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [CK_Empleado] CHECK  (([tEdadEmpleado]>=(18)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [CK_Empleado]
GO
/****** Object:  Trigger [dbo].[Trigger_Insertar]    Script Date: 24/10/2018 01:10:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Insertar]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Trigger_Insertar]
on [dbo].[Ciudad]
after insert
as
begin
	Select * from inserted
	Select * from deleted
end' 
GO
USE [master]
GO
ALTER DATABASE [Senda] SET  READ_WRITE 
GO
