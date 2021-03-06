USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 7/7/2020 9:45:15 PM ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Municipalidad] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Municipalidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Municipalidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Municipalidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Municipalidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Municipalidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Municipalidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Municipalidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Municipalidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Municipalidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Municipalidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Municipalidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Municipalidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Municipalidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Municipalidad] SET  MULTI_USER 
GO
ALTER DATABASE [Municipalidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Municipalidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Municipalidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Municipalidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Municipalidad] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Municipalidad', N'ON'
GO
ALTER DATABASE [Municipalidad] SET QUERY_STORE = OFF
GO
USE [Municipalidad]
GO
/****** Object:  UserDefinedTableType [dbo].[TablaCambioPropiedades]    Script Date: 7/7/2020 9:45:15 PM ******/
CREATE TYPE [dbo].[TablaCambioPropiedades] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [varchar](20) NOT NULL,
	[NuevoValor] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[TablaPagos]    Script Date: 7/7/2020 9:45:15 PM ******/
CREATE TYPE [dbo].[TablaPagos] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoRecibo] [int] NOT NULL,
	[NumFinca] [varchar](20) NOT NULL,
	[Fecha] [date] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[TablaTransConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
CREATE TYPE [dbo].[TablaTransConsumo] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[LecturaM3] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[NumFinca] [varchar](20) NOT NULL,
	[Fecha] [date] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[BitacoraCambios]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraCambios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDTipoEntidad] [int] NOT NULL,
	[Antes] [varchar](500) NULL,
	[Despues] [varchar](500) NULL,
	[InsertedBy] [varchar](20) NULL,
	[InsertedIn] [varchar](20) NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[IDEntidad] [int] NOT NULL,
 CONSTRAINT [PK_BitacoraCambios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCConsumo](
	[IDCC] [int] NOT NULL,
	[ValorMetrosCubicos] [real] NOT NULL,
	[MontoMinRecibo] [money] NOT NULL,
 CONSTRAINT [PK_CCConsumo] PRIMARY KEY CLUSTERED 
(
	[IDCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCFijo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCFijo](
	[IDCC] [int] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_CCFijo] PRIMARY KEY CLUSTERED 
(
	[IDCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCInteresMoratorio]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCInteresMoratorio](
	[IDCC] [int] NOT NULL,
 CONSTRAINT [PK_CCInteresMoratorio] PRIMARY KEY CLUSTERED 
(
	[IDCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCPorcentaje]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCPorcentaje](
	[IDCC] [int] NOT NULL,
	[ValorPorcentaje] [real] NOT NULL,
 CONSTRAINT [PK_CCPorcentaje] PRIMARY KEY CLUSTERED 
(
	[IDCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCXPropiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[IDCC] [int] NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_CCXPropiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprobantePago]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobantePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MontoTotal] [money] NOT NULL,
	[FechaInsercion] [date] NOT NULL,
 CONSTRAINT [PK_ComprobantePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[TasaInteresMor] [real] NOT NULL,
	[DiasRestantesVigencia] [int] NOT NULL,
	[DiaCorte] [int] NOT NULL,
	[EsFijo] [varchar](2) NOT NULL,
	[EsRecurrente] [varchar](2) NOT NULL,
	[EsImpuesto] [varchar](2) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cortes]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cortes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[IDReconexion] [int] NOT NULL,
 CONSTRAINT [PK_Cortes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [varchar](20) NOT NULL,
	[Valor] [money] NOT NULL,
	[Direccion] [varchar](300) NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
	[ConsumoAcumM3] [int] NOT NULL,
	[UltimoReciboM3] [int] NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadXPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadXPropietario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropietario] [int] NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_PropiedadXPropietario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[NumId] [varchar](20) NOT NULL,
	[TipoId] [int] NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Propietarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietarioJuridico](
	[IDPropietario] [int] NOT NULL,
	[IDTipoIdResponsable] [int] NOT NULL,
	[NumIdResponsable] [varchar](30) NOT NULL,
	[Responsable] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PropiedadJuridica] PRIMARY KEY CLUSTERED 
(
	[IDPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibos]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[IDConceptoCobro] [int] NOT NULL,
	[FechaVence] [date] NULL,
	[Monto] [money] NOT NULL,
	[Estado] [int] NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[IDComprobantePago] [int] NULL,
 CONSTRAINT [PK_Recibos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconecta]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reconecta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[IDReconexion] [int] NOT NULL,
 CONSTRAINT [PK_Reconecta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconexion]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reconexion](
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_Reconexion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEntidad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEntidad](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoEntidad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoID](
	[ID] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTransConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTransConsumo](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoTransConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransacConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransacConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[IDTipoTransConsum] [int] NOT NULL,
	[LecturaConsumoM3] [int] NOT NULL,
	[NuevoAcumM3] [int] NOT NULL,
	[MontoM3] [int] NOT NULL,
	[Razon] [varchar](100) NOT NULL,
	[FechaInsercion] [date] NOT NULL,
 CONSTRAINT [PK_TransacConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Tipo] [varchar](100) NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXPropiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[FechaInsercion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioXPropiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BitacoraCambios]  WITH CHECK ADD  CONSTRAINT [FK_BitacoraCambios_TipoEntidad] FOREIGN KEY([IDTipoEntidad])
REFERENCES [dbo].[TipoEntidad] ([ID])
GO
ALTER TABLE [dbo].[BitacoraCambios] CHECK CONSTRAINT [FK_BitacoraCambios_TipoEntidad]
GO
ALTER TABLE [dbo].[CCConsumo]  WITH CHECK ADD  CONSTRAINT [FK_CCConsumo_ConceptoCobro] FOREIGN KEY([IDCC])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[CCConsumo] CHECK CONSTRAINT [FK_CCConsumo_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCFijo]  WITH CHECK ADD  CONSTRAINT [FK_CCFijo_ConceptoCobro] FOREIGN KEY([IDCC])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[CCFijo] CHECK CONSTRAINT [FK_CCFijo_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCInteresMoratorio]  WITH CHECK ADD  CONSTRAINT [FK_CCInteresMoratorio_ConceptoCobro] FOREIGN KEY([IDCC])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[CCInteresMoratorio] CHECK CONSTRAINT [FK_CCInteresMoratorio_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCPorcentaje]  WITH CHECK ADD  CONSTRAINT [FK_CCPorcentaje_ConceptoCobro] FOREIGN KEY([IDCC])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[CCPorcentaje] CHECK CONSTRAINT [FK_CCPorcentaje_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCXPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_CCXPropiedad_ConceptoCobro] FOREIGN KEY([IDCC])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[CCXPropiedad] CHECK CONSTRAINT [FK_CCXPropiedad_ConceptoCobro]
GO
ALTER TABLE [dbo].[CCXPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_CCXPropiedad_Propiedad] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[CCXPropiedad] CHECK CONSTRAINT [FK_CCXPropiedad_Propiedad]
GO
ALTER TABLE [dbo].[Cortes]  WITH CHECK ADD  CONSTRAINT [FK_Cortes_Propiedad] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Cortes] CHECK CONSTRAINT [FK_Cortes_Propiedad]
GO
ALTER TABLE [dbo].[Cortes]  WITH CHECK ADD  CONSTRAINT [FK_Cortes_Reconexion1] FOREIGN KEY([IDReconexion])
REFERENCES [dbo].[Reconexion] ([ID])
GO
ALTER TABLE [dbo].[Cortes] CHECK CONSTRAINT [FK_Cortes_Reconexion1]
GO
ALTER TABLE [dbo].[PropiedadXPropietario]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXPropietario_Propiedad] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXPropietario] CHECK CONSTRAINT [FK_PropiedadXPropietario_Propiedad]
GO
ALTER TABLE [dbo].[PropiedadXPropietario]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXPropietario_Propietario] FOREIGN KEY([IDPropietario])
REFERENCES [dbo].[Propietario] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXPropietario] CHECK CONSTRAINT [FK_PropiedadXPropietario_Propietario]
GO
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_Propietario_TipoID] FOREIGN KEY([TipoId])
REFERENCES [dbo].[TipoID] ([ID])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_Propietario_TipoID]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadJuridica_Propietario] FOREIGN KEY([IDPropietario])
REFERENCES [dbo].[Propietario] ([ID])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropiedadJuridica_Propietario]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadJuridica_TipoID] FOREIGN KEY([IDTipoIdResponsable])
REFERENCES [dbo].[TipoID] ([ID])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropiedadJuridica_TipoID]
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD  CONSTRAINT [FK_Recibos_ComprobantePago] FOREIGN KEY([IDComprobantePago])
REFERENCES [dbo].[ComprobantePago] ([ID])
GO
ALTER TABLE [dbo].[Recibos] CHECK CONSTRAINT [FK_Recibos_ComprobantePago]
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD  CONSTRAINT [FK_Recibos_ConceptoCobro1] FOREIGN KEY([IDConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[Recibos] CHECK CONSTRAINT [FK_Recibos_ConceptoCobro1]
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD  CONSTRAINT [FK_Recibos_Propiedad1] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Recibos] CHECK CONSTRAINT [FK_Recibos_Propiedad1]
GO
ALTER TABLE [dbo].[Reconecta]  WITH CHECK ADD  CONSTRAINT [FK_Reconecta_Propiedad] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Reconecta] CHECK CONSTRAINT [FK_Reconecta_Propiedad]
GO
ALTER TABLE [dbo].[Reconecta]  WITH CHECK ADD  CONSTRAINT [FK_Reconecta_Reconexion1] FOREIGN KEY([IDReconexion])
REFERENCES [dbo].[Reconexion] ([ID])
GO
ALTER TABLE [dbo].[Reconecta] CHECK CONSTRAINT [FK_Reconecta_Reconexion1]
GO
ALTER TABLE [dbo].[Reconexion]  WITH CHECK ADD  CONSTRAINT [FK_Reconexion_Recibos] FOREIGN KEY([ID])
REFERENCES [dbo].[Recibos] ([ID])
GO
ALTER TABLE [dbo].[Reconexion] CHECK CONSTRAINT [FK_Reconexion_Recibos]
GO
ALTER TABLE [dbo].[TransacConsumo]  WITH CHECK ADD  CONSTRAINT [FK_TransacConsumo_Propiedad] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[TransacConsumo] CHECK CONSTRAINT [FK_TransacConsumo_Propiedad]
GO
ALTER TABLE [dbo].[TransacConsumo]  WITH CHECK ADD  CONSTRAINT [FK_TransacConsumo_TipoTransConsumo1] FOREIGN KEY([IDTipoTransConsum])
REFERENCES [dbo].[TipoTransConsumo] ([ID])
GO
ALTER TABLE [dbo].[TransacConsumo] CHECK CONSTRAINT [FK_TransacConsumo_TipoTransConsumo1]
GO
ALTER TABLE [dbo].[UsuarioXPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXPropiedad_Propiedad] FOREIGN KEY([IDPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[UsuarioXPropiedad] CHECK CONSTRAINT [FK_UsuarioXPropiedad_Propiedad]
GO
ALTER TABLE [dbo].[UsuarioXPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXPropiedad_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[UsuarioXPropiedad] CHECK CONSTRAINT [FK_UsuarioXPropiedad_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[LeerConceptoCobro]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerConceptoCobro]

AS

BEGIN
	BEGIN TRY
		BEGIN TRAN

			--ELIMINAR DATOS BASURA DE LA BASE 
			DELETE FROM [DBO].[CCFijo]
			DELETE FROM [DBO].[CCConsumo]
			DELETE FROM [DBO].[CCPorcentaje]
			DELETE FROM [DBO].[CCInteresMoratorio]
			DELETE FROM [DBO].[ConceptoCobro]

			DECLARE @CC xml
			SELECT @CC = C

			FROM OPENROWSET (BULK 'C:\Users\esala\OneDrive\Escritorio\XML\ConceptodeCobro.xml', SINGLE_BLOB) AS CC(C)
			SELECT @CC
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @CC
			INSERT INTO [dbo].[ConceptoCobro] (
				[ID], [Nombre],[DiaCorte],[DiasRestantesVigencia],
				[EsRecurrente],[EsFijo],[TasaInteresMor],[EsImpuesto],[Monto],[Activo]
			)

			SELECT [id] ,[nombre] ,	[diaCobro] ,[DiasVence] ,[EsRecurrente] ,[EsFijo] ,	[TasaIntMor] ,	[Impuesto] ,[Monto],1
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					[id] int '@id' ,
					[nombre] VARCHAR(1000) '@Nombre',
					[diaCobro] int '@DiaCobro',
					[DiasVence] int '@QDiasVencimiento',
					[EsRecurrente] VARCHAR(2) '@EsRecurrente',
					[EsFijo] VARCHAR(2) '@EsFijo',
					[TasaIntMor] real '@TasaInteresMoratoria',
					[Impuesto] VARCHAR(2) '@EsImpuesto' ,
					[Monto] money '@Monto'
					);



			--INSERTS DE SUBTABLAS DE CC

			--INSERT CCPORCENTAJE 

			INSERT INTO [dbo].[CCPorcentaje] ([IDCC],[ValorPorcentaje])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					[id] int '@id',
					[valor] real '@ValorPorcentaje'
				)
			WHERE [valor] != '';
			

			--INSERT CCFIJO

			INSERT INTO [dbo].[CCFijo] ([IDCC],[Monto])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					[id] int '@id',
					[valor] MONEY '@Monto'
				)
			WHERE [valor] != 0;
			

			--INSERT CCINTERESMORATORIO 

			INSERT INTO [dbo].[CCInteresMoratorio] ([IDCC])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					id int '@id'
				)
			WHERE  id= 11; 
			

			INSERT INTO [dbo].[CCConsumo] ([IDCC],[ValorMetrosCubicos], [MontoMinRecibo])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					[id] int '@id',
					[valorM3] real '@ValorM3',
					[montoMin] MONEY '@MontoMinRecibo'
				)
			WHERE [valorM3] != 0;


		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los tipos',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[LeerOperaciones]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerOperaciones]

AS

BEGIN
	BEGIN TRY
		BEGIN TRAN
		
			DELETE FROM BitacoraCambios
			DELETE FROM Reconecta
			DELETE FROM Cortes
			DELETE FROM Reconexion
			DELETE FROM Recibos
			DELETE FROM ComprobantePago
			DELETE FROM PropiedadXPropietario
			DELETE FROM UsuarioXPropiedad
			DELETE FROM CCXPropiedad
			DELETE FROM PropietarioJuridico
			DELETE FROM TransacConsumo
			DELETE FROM Propiedad
			DELETE FROM Propietario
			DELETE FROM Usuario


			DECLARE @Varios XML
			DECLARE @tablaFechas table (fecha date);
			DECLARE @tablaPropiedad table ([NF] VARCHAR(20),[Val] MONEY,[Dir] VARCHAR(300),[Fech] DATE, [Activo] BIT); 
			DECLARE @tablaReconexiones TablaPagos
			DECLARE @tablaPagosDiario TablaPagos
			DECLARE @tablaTransConsumoDiario TablaTransConsumo
			DECLARE @tablaPropiedesCambioValor TablaCambioPropiedades

			SET NOCOUNT ON 

			DECLARE @fechaMin DATE
			DECLARE @fechaMax DATE

			SELECT @Varios = C	
			

			FROM OPENROWSET (BULK 'C:\Users\esala\OneDrive\Escritorio\XML\Operaciones.xml', SINGLE_BLOB) AS Varios(C)
			
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @Varios

			INSERT INTO @tablaFechas ([fecha])
			SELECT convert(date, fechaInsercion, 121) [fechaInsercion]
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)

			WITH([fechaInsercion] VARCHAR (40) '@fecha');
			----------------------------------------------------------------
			
			----------------------------------------------------
			-------CREACION TABLA FECHAS Y VARIABLES DATE-------
			----------------------------------------------------

			SELECT @fechaMax = MAX(fecha) FROM @tablaFechas 
			SELECT @fechaMin = MIN(fecha) FROM @tablaFechas 
			
			DECLARE @fechaActual date
			SET @fechaActual = @fechaMin;


			--------------------------------------------------------
			-------INSERCION DATOS VARIABLES TABLAS Y MASIVOS-------
			--------------------------------------------------------

			----------------------------
			---- INSERT PROPIEDADES ----

			INSERT INTO @tablaPropiedad ([NF],[Val],[Dir],[Fech],[Activo])

			SELECT [NumFinca],[valor],[direccion],convert(date, fechaLeida, 121) [fechaLeida],1
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Propiedad', 2)
				WITH(
					[NumFinca] VARCHAR(20) '@NumFinca' ,
					[valor]  MONEY '@Valor',
					[direccion] VARCHAR(300) '@Direccion',
					[fechaLeida] VARCHAR(40) '../@fecha');
			
			-------------------------------------
			----INSERT DE PROPIETARIOS MASIVO----

			INSERT INTO [dbo].[Propietario] ([Nombre],[NumId],[TipoID],[FechaInsercion],[Activo])

			SELECT [Nombre],[identi],[tipo],convert(date, fechaLeida, 121) [fechaLeida], 1
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Propietario', 2)
				WITH(
					[Nombre] VARCHAR(100) '@Nombre' ,
					[identi]  VARCHAR(20) '@identificacion',
					[tipo] int '@TipoDocIdentidad',
					[fechaLeida] VARCHAR(100) '../@fecha');

			---------------------------------
			----INSERT DE USUARIOS MASIVO----
			
			INSERT INTO [dbo].[Usuario]([Nombre] ,[Password], [Tipo], [FechaInsercion], [Activo] )
			SELECT [nombre], [contrasena], [tipo], convert(date, fechaLeida, 121) [fechaLeida],1
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Usuario', 1)
				WITH(
					[nombre] VARCHAR(100) '@Nombre',
					[contrasena] VARCHAR(100) '@password',
					[tipo] VARCHAR(100) '@tipo',
					[fechaLeida] VARCHAR(100) '../@fecha');


			----------------------------------
			----INSERT DE PROP.JURIDICO MASIVO----

			INSERT INTO [dbo].[PropietarioJuridico]([IDPropietario],[IDTipoIdResponsable], [NumIdResponsable], [Responsable])
			SELECT [Propietario].[ID], [TipDocIdRepresentante], [DocidRepresentante], [Representante]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/PersonaJuridica',1)
				WITH(	[DocidRepresentante] VARCHAR(100) '@DocidRepresentante',
						[TipDocIdRepresentante] VARCHAR(30) '@TipDocIdRepresentante',
						[docidPersonaJuridica] VARCHAR(100) '@docidPersonaJuridica',
						[fechaLeida] VARCHAR(100)	'../@fecha',
						[Representante]		VARCHAR(100) '@Nombre')
						
						INNER JOIN [dbo].[Propietario] ON [dbo].[Propietario].[NumId] = [docidPersonaJuridica];

  
			--------------------------------------------------------
			WHILE (@fechaActual<@fechaMax)
				BEGIN
					SET NOCOUNT ON 

					--------------------------
					----INSERT PROPIEDADES----
					--------------------------

					INSERT INTO [dbo].[Propiedad] ([NumFinca],[Valor],[Direccion],[FechaInsercion],[Activo], [ConsumoAcumM3], [UltimoReciboM3])
					SELECT [NF],[Val],[Dir],[Fech],1,0,0  FROM @tablaPropiedad 
					WHERE [@tablaPropiedad].[Fech] = @fechaActual ;

					
					-----------------------------------
					-- INSERTS DE TABLAS INTERMEDIAS --
					-----------------------------------
			
					
					----INSERT PROPIEDAD por PROPIETARIO----
					

					INSERT INTO [dbo].[PropiedadXPropietario] ([IDPropiedad],[IDPropietario],[FechaInsercion],[Activo])

					SELECT Propiedad.[ID], Propietario.[ID], @fechaActual,1
					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario', 1)
						WITH(
							[numFincaxml] VARCHAR(20) '@NumFinca' ,
							[numCedula]  VARCHAR(20) '@identificacion',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON [numFincaxml] = Propiedad.NumFinca 
						INNER JOIN Propietario ON [numCedula] = Propietario.NumId
						WHERE [fechaLeida] = @fechaActual ;


					----INSERT DE USUARIOS por PROPIEDAD----


					INSERT INTO [dbo].[UsuarioXPropiedad] ([IDPropiedad],[IDUsuario],[FechaInsercion],[Activo])

					SELECT Propiedad.[ID],Usuario.[ID],@fechaActual,1 

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad', 1)
						WITH(
							[numFincaXml] VARCHAR(20)'@NumFinca' ,
							[nombreUser]  VARCHAR(100) '@nombreUsuario',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON [numFincaXml] = Propiedad.NumFinca 
						INNER JOIN Usuario ON [nombreUser] = Usuario.Nombre
						WHERE [fechaLeida] = @fechaActual ;	


					----INSERT DE CC POR PROPIEDADAES----

					INSERT INTO [dbo].[CCXPropiedad] ([IDCC],[IDPropiedad],[FechaInsercion],[Activo])

					SELECT ConceptoCobro.[ID],Propiedad.[ID],@fechaActual,1

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad', 1)
						WITH(
							[numFincaXml] VARCHAR(20) '@NumFinca' ,
							[idCobro]  VARCHAR(20) '@idcobro',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						INNER JOIN Propiedad ON [numFincaXml] = Propiedad.[NumFinca] 
						INNER JOIN ConceptoCobro ON [idCobro] = ConceptoCobro.[ID]
						WHERE [fechaLeida] = @fechaActual ;


					----PAGOS DIARIOS----
					
					INSERT INTO @tablaPagosDiario ([TipoRecibo], [NumFinca], [Fecha])

					SELECT [tipoRecibo], [numFinca], [fechaLeida]

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Pago', 1)
						WITH(
							[tipoRecibo]  VARCHAR(20) '@TipoRecibo',
							[numFinca] VARCHAR(20) '@NumFinca',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						WHERE [fechaLeida] = @fechaActual;
					

					----CONSUMO DIARIO AGUA----

					INSERT INTO @tablaTransConsumoDiario ([Tipo],[LecturaM3],[Descripcion],[NumFinca], [Fecha])

					SELECT [idTipo], [LecturaM3], [descripcion], [numFinca], [fechaLeida]

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/TransConsumo', 1)
						WITH(
							[idTipo] int '@id',
							[LecturaM3] int '@LecturaM3',
							[descripcion] VARCHAR(100) '@descripcion',
							[numFinca] VARCHAR(20) '@NumFinca',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						WHERE [fechaLeida] = @fechaActual ;


					----CAMBIOS DE VALOR EN LAS PROPIEDADES----

					INSERT INTO @tablaPropiedesCambioValor ([NumFinca],[NuevoValor], [Fecha])

					SELECT [NumFinca], [NuevoValor], [fechaLeida]

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/CambioPropiedad', 1)
						WITH(
							[NumFinca] varchar(20) '@NumFinca',
							[NuevoValor] money '@NuevoValor',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						WHERE [fechaLeida] = @fechaActual ;


					----RECONEXIONES DIARIAS----

					INSERT INTO @tablaReconexiones ([TipoRecibo], [NumFinca], [Fecha])

					SELECT 10, [numFinca], convert(date, fechaLeida, 121) [fechaLeida]

					FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia/Pago', 1)
						WITH(
							[tipoRecibo] int '@TipoRecibo',
							[numFinca] varchar(20) '@NumFinca',
							[fechaLeida] VARCHAR(100) '../@fecha'
						)
						WHERE [fechaLeida] = @fechaActual AND [TipoRecibo] = 10 ;


					EXEC SPGenerarTransConsumoAgua @tablaTransConsumoDiario, @fechaActual
					EXEC SPGenerarRecibos @fechaActual
					EXEC SPGenerarPagos @tablaPagosDiario, @fechaActual
					EXEC SPGenerarCortes @fechaActual
					EXEC SPGenerarReconexiones @tablaReconexiones, @fechaActual
					EXEC SPGenerarCambiosValorPropiedad @tablaPropiedesCambioValor, @fechaActual

					SELECT @fechaActual = DATEADD(DAY,1,@fechaActual);
				END

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 
	  END CATCH
	  
  END 
  
GO
/****** Object:  StoredProcedure [dbo].[LeerTipoEntidad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LeerTipoEntidad]

AS
BEGIN
	BEGIN TRY
		BEGIN TRAN		
			
			--ELIMINAR DATOS BASURA DE LA BASE
			DELETE FROM [DBO].[TipoEntidad]

			DECLARE @TipoEntidad xml
			SELECT @TipoEntidad = C
			
			FROM OPENROWSET (BULK 'C:\Users\esala\OneDrive\Escritorio\XML\TipoEntidad.xml', SINGLE_BLOB) AS TipoEntidad(C)
			SELECT @TipoEntidad
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @TipoEntidad

			INSERT INTO [dbo].[TipoEntidad] ([ID], [Nombre])
			SELECT [id], [nombre]
			FROM OPENXML (@hdoc,'TipoEntidades/Entidad', 1)
				WITH(
				[id]	 int '@id',
				[nombre] VARCHAR(100) '@Nombre');

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los Tipo de Entidad',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[LeerTipoID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerTipoID]

AS


BEGIN
	BEGIN TRY
		BEGIN TRAN

			--ELIMINAR DATOS BASURA DE LA BASE 
			DELETE FROM [DBO].[TipoID]
			
			DECLARE @tipoID xml
			SELECT @tipoID = C

			FROM OPENROWSET (BULK 'C:\Users\esala\OneDrive\Escritorio\XML\TipoDocumentoIdentidad.xml', SINGLE_BLOB) AS TipoId(C)
			SELECT @tipoID
			DECLARE @hdoc int
			
			EXEC sp_xml_preparedocument @hdoc OUTPUT, @tipoID

			INSERT INTO [dbo].[TipoID] ([ID], [Descripcion],[Activo])
			SELECT [codigoDoc],[descripcion],1
			FROM OPENXML (@hdoc,'TipoDocIdentidad/TipoDocId', 1)
				WITH(codigoDoc VARCHAR(100),
					descripcion VARCHAR(100))

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los tipos',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[LeerTipoTransConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LeerTipoTransConsumo]

AS
BEGIN
	BEGIN TRY
		BEGIN TRAN		
			
			--ELIMINAR DATOS BASURA DE LA BASE
			DELETE FROM [DBO].[TipoTransConsumo]

			DECLARE @TipoTransConsumo xml
			SELECT @TipoTransConsumo = C
			
			FROM OPENROWSET (BULK 'C:\Users\esala\OneDrive\Escritorio\XML\TipoTransConsumo.xml', SINGLE_BLOB) AS TipoTransConsumo(C)
			SELECT @TipoTransConsumo
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @TipoTransConsumo

			INSERT INTO [dbo].[TipoTransConsumo] ([ID], [Nombre])
			SELECT [id], [nombre]
			FROM OPENXML (@hdoc,'TipoTransConsumo/TransConsumo', 1)
				WITH(
				[id]	 int '@id',
				[nombre] VARCHAR(100) '@Nombre');

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los Tipo de transacciones de consumo',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[LeerUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LeerUsuario]

AS
BEGIN
	BEGIN TRY
		BEGIN TRAN		
			
			--ELIMINAR DATOS BASURA DE LA BASE
			DELETE FROM [DBO].[Usuario]

			DECLARE @Usuario xml
			SELECT @Usuario = C
			
			FROM OPENROWSET (BULK 'C:\Users\esala\OneDrive\Escritorio\XML\Usuarios.xml', SINGLE_BLOB) AS Usuario(C)
			SELECT @Usuario
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @Usuario

			INSERT INTO [dbo].[Usuario] ([Nombre], [Password], [Tipo], [Activo], [FechaInsercion])
			SELECT nombre, contrasena, tipo, 1, GETDATE()
			FROM OPENXML (@hdoc,'Usuarios/Usuario', 1)
				WITH(nombre VARCHAR(100) '@user',
					contrasena VARCHAR(100) '@password',
					tipo VARCHAR(100) '@tipo');

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los Usuarios',1;
	  END CATCH
  END 
  
GO
/****** Object:  StoredProcedure [dbo].[SPDCCXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPDCCXPropiedad]
	@InNumFinca varchar(20),
	@InIDCC int 
	
AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		DECLARE @IdPropiedad int 
		SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] AS P WHERE P.NumFinca = @InNumFinca

		UPDATE [dbo].[CCXPropiedad]
		SET Activo = 0
		WHERE [IDCC] = @InIDCC AND [IDPropiedad] = @IdPropiedad

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error eliminando la relacion CCXVRSPropiedad',1;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPDConceptoCobro]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPDConceptoCobro] 
    @InID int
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

			UPDATE [dbo].[ConceptoCobro]
			SET [Activo] = 0   
			WHERE  [ID] = @InID

			UPDATE [dbo].[CCXPropiedad]
			SET [Activo] = 0
			WHERE [IDCC] = @InID

		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la eliminacion del Concepto de cobro',1;
	END CATCH
END


	
GO
/****** Object:  StoredProcedure [dbo].[SPDPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDPropiedad]
	@InNumFinca varchar(20)
	
AS

BEGIN
	BEGIN TRY

		DECLARE @IdPropiedad int

		SELECT @IdPropiedad = P.ID FROM [dbo].Propiedad AS P WHERE P.NumFinca = @InNumFinca
		
		BEGIN TRAN
		SET NOCOUNT ON

			UPDATE [dbo].[Propiedad] 
			SET Activo = 0
			WHERE [ID] = @IdPropiedad
	
			UPDATE [dbo].[PropiedadXPropietario] 
			SET Activo = 0
			WHERE [IDPropiedad] = @IdPropiedad

			UPDATE [dbo].[UsuarioXPropiedad] 
			SET Activo = 0
			WHERE [IDPropiedad] = @IdPropiedad

			UPDATE [dbo].[CCXPropiedad] 
			SET Activo = 0
			WHERE [IDPropiedad]= @IdPropiedad

		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la eliminacion de la propiedad',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPDPropiedadXPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPDPropiedadXPropietario]
	@InNumFinca varchar(20),
	@InNumId varchar(20),
	@InIp varchar(20),
	@InNombreUsuario varchar(20),
	@InFecha date

AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON
	
		DECLARE @IdPropXProp int, @IdPropiedad int, @IdPropietario int, @JSONAntes varchar(500), @JSONDespues varchar(500)
		
		SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] AS P WHERE P.NumFinca = @InNumFinca
		SELECT @IdPropietario = Prop.ID FROM [dbo].[Propietario] AS Prop WHERE Prop.NumId = @InNumId
		SELECT @IdPropXProp = PXP.[ID] FROM [dbo].[PropiedadXPropietario] as PXP WHERE PXP.[IDPropiedad] = @IdPropiedad AND PXP.[IDPropietario] = @IdPropietario

		SET @JSONAntes = (SELECT [ID], [IDPropietario], [IDPropiedad], [FechaInsercion], [Activo] FROM [dbo].[PropiedadXPropietario] WHERE [ID] = @IdPropiedad FOR JSON PATH)

		BEGIN TRAN
			UPDATE [dbo].[PropiedadXPropietario] 
			SET [Activo] = 0
			WHERE [ID] = @IdPropXProp 

			SET @JSONDespues = NULL

			EXEC SPICambiosBitacora 4, @IdPropXProp, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFecha

		COMMIT

		END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la eliminacion de la relacion propiedadVRSpropietario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPDPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDPropietario]
	@InNumId varchar(20),
	@InIp varchar(20),
	@InNombreUsuario varchar(20),
	@InFecha date
AS

BEGIN
	BEGIN TRY

		DECLARE @IdPropietario int, @JSONAntes varchar(500), @JSONDespues varchar(500)

		SELECT @IdPropietario = P.ID FROM [dbo].[Propietario] AS P WHERE P.NumId = @InNumId

		SET @JSONAntes = (SELECT [ID], [Nombre], [NumId], [TipoId], [Activo], [FechaInsercion] FROM [dbo].[Propietario] WHERE [ID] = @IdPropietario FOR JSON PATH)

		BEGIN TRAN
		SET NOCOUNT ON

			UPDATE [dbo].[Propietario] 
			SET Activo = 0
			WHERE [ID] = @IdPropietario

			UPDATE [dbo].[PropiedadXPropietario] 
			SET Activo = 0
			WHERE [ID] = @IdPropietario

		SET @JSONDespues = NULL
	
		EXEC SPICambiosBitacora 2, @IdPropietario, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFecha 
	
		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la eliminacion del propietario ',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPDTipoID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPDTipoID] 
    @InID int
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		UPDATE [dbo].[TipoID]
		SET [Activo] = 0 
		WHERE  [ID] = @InID

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la eliminacion del Tipo ID',1;
	END CATCH
END


		
GO
/****** Object:  StoredProcedure [dbo].[SPDUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDUsuario]
	@InUsername varchar(100),
	@InIp varchar(20),
	@InNombreUsuario varchar(20),
	@InFecha date
AS

BEGIN
	BEGIN TRY

		DECLARE @IdUsuario int, @JSONAntes varchar(500), @JSONDespues varchar(500)
		SELECT @IdUsuario = U.ID FROM [dbo].[Usuario] AS U WHERE U.Nombre = @InUsername

		SET @JSONAntes = (SELECT [ID], [Nombre], [Password], [Tipo], [FechaInsercion], [Activo] FROM [dbo].[Usuario] WHERE [ID] = @IdUsuario FOR JSON PATH)


		BEGIN TRAN 
		SET NOCOUNT ON

			UPDATE [dbo].[Usuario] 
			SET Activo = 0
			WHERE [Usuario].[ID] = @IdUsuario

			UPDATE [dbo].[UsuarioXPropiedad]  
			SET Activo = 0
			WHERE [IDUsuario] = @IdUsuario

		SET @JSONDespues = NULL

		EXEC SPICambiosBitacora 3, @IdUsuario, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFecha 

		COMMIT

	END TRY  
	BEGIN CATCH  
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la eliminacion del usuario',1;
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[SPDUsuarioXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPDUsuarioXPropiedad]
	@InNumFinca varchar (20),
	@InUsername varchar(100),
	@InIp varchar(20),
	@InNombreUsuario varchar(20),
	@InFecha date

AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		DECLARE @IdUXP int, @IdPropiedad int, @IdUser int, @JSONAntes varchar(500), @JSONDespues varchar(500)

		SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] AS P WHERE P.NumFinca = @InNumFinca
		SELECT @IdUser = U.ID FROM [dbo].[Usuario] AS U WHERE U.Nombre = @InUsername
		SELECT @IdUXP = UXP.[ID] FROM [dbo].[UsuarioXPropiedad] as UXP WHERE UXP.[IDPropiedad] = @IdPropiedad AND UXP.[IDUsuario] = @IdUser

		SET @JSONAntes = (SELECT [ID], [IDUsuario], [IDPropiedad], [FechaInsercion], [Activo] FROM [dbo].[UsuarioXPropiedad] WHERE [ID] = @IdUXP FOR JSON PATH)
		
		BEGIN TRAN
			UPDATE [dbo].[UsuarioXPropiedad] 
			SET Activo = 0
			WHERE [ID] = @IdUXP

			SET @JSONDespues = NULL

			EXEC SPICambiosBitacora 5, @IdUXP, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFecha 

		COMMIT

		END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la eliminacion de la relacion usuarioVRSpropiedad',1;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPGenerarCambiosValorPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGenerarCambiosValorPropiedad]
	@IntablaCambiosPropiedades TablaCambioPropiedades READONLY,
	@InFechaDeProcesamiento date 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

	DECLARE @firstId int, @maxCantPropiedadesEnTabla int, @numFincaAModificar varchar(20), @cambioValor money

	SELECT @maxCantPropiedadesEnTabla = COUNT(0) FROM @IntablaCambiosPropiedades ---Retorna la cantidad maxima de filas en la tabla

	BEGIN TRAN 

			SELECT TOP 1 @firstId = [Id] FROM @IntablaCambiosPropiedades WHERE [Fecha] = @InfechaDeProcesamiento

			WHILE @firstId <= @maxCantPropiedadesEnTabla
				BEGIN

					SELECT @numFincaAModificar = CP.[NumFinca], @cambioValor = CP.[NuevoValor] FROM @IntablaCambiosPropiedades as CP WHERE  CP.Id = @firstId
					
					UPDATE [dbo].[Propiedad]
					SET [Valor] = @cambioValor
					WHERE [NumFinca] = @numFincaAModificar

					SET @firstId +=1

				END
	COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la generacion de cambios de valor de las propiedades',1;
	END CATCH     
END

GO
/****** Object:  StoredProcedure [dbo].[SPGenerarCortes]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGenerarCortes]
	@InFechaProcesamiento date

AS
	
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		
		DECLARE @firstId int, @maxCantPropiedadesEnTabla int, @idPropiedadACortar int, @montoReciboReconexion money, @idReconexion int
		DECLARE @propiedadesParaCortar table(id int IDENTITY(1,1), idPropiedad int, fechaInsercion date);

		INSERT INTO @propiedadesParaCortar ([idPropiedad], [fechaInsercion])

		SELECT R.[idPropiedad], @InFechaProcesamiento
		FROM [dbo].[Recibos] as R 
		WHERE R.[Estado] = 0 AND R.[FechaVence] < @InFechaProcesamiento AND R.[IDConceptoCobro] = 1
		GROUP BY [IDPropiedad]
		HAVING COUNT (*) > 2 AND NOT EXISTS( SELECT R.[ID] FROM [dbo].[Recibos] as R WHERE R.[IDConceptoCobro] = 10)

		SELECT @maxCantPropiedadesEnTabla = COUNT(0) FROM @propiedadesParaCortar ---Retorna la cantidad maxima de filas en la tabla
		
		BEGIN TRAN

			SELECT TOP 1 @firstId = [Id] FROM @propiedadesParaCortar WHERE [fechaInsercion] = @InFechaProcesamiento

			WHILE @firstId <= @maxCantPropiedadesEnTabla
				BEGIN

					SELECT @idPropiedadACortar = [idPropiedad] FROM @propiedadesParaCortar WHERE id = @firstId

					SELECT @montoReciboReconexion = CCF.[Monto] FROM [dbo].[CCFijo] as CCF WHERE CCF.[IDCC] = 10 

					EXEC SPIRecibo @idPropiedadACortar, 10, NULL, @montoReciboReconexion, @InFechaProcesamiento

					SELECT @idReconexion = IDENT_CURRENT('Recibos') 
					
					INSERT INTO [dbo].[Reconexion] ([ID])
					VALUES(@idReconexion)

					INSERT INTO [dbo].[Cortes] ([IDReconexion], [IDPropiedad])
					VALUES (@idReconexion, @idPropiedadACortar)

					SET @firstId += 1

				END   
		COMMIT 

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la generacion de cortes de agua a las propiedades',1;
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPGenerarPagos]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGenerarPagos]
	@InTablaPagosDiario TablaPagos READONLY,
	@InFechaProcesamiento date

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

	DECLARE @firstId int, @maxCantPropiedadesEnTabla int, @tipoRecibo int, @numFincaAPagar varchar(20), @idPropiedadAPagar int, @diasPasados int,
			@reciboAPagar int, @totalRecibo money, @montoRecibo money, @montoInteresMoratorioPorRecibo int, @tasaInteresMoratorio real, 
			@fechaVencimiento date, @idComprobantePago int

	DECLARE @pagosPorPropiedadPorCC table(idRecibo int, idPropiedad int, idConceptoCobro int, fechaVence  date, monto money, estado int);

	SELECT @maxCantPropiedadesEnTabla = COUNT(0) FROM @InTablaPagosDiario ---Retorna la cantidad maxima de filas en la tabla

	BEGIN TRAN 

			SELECT TOP 1 @firstId = [Id] FROM @InTablaPagosDiario WHERE [Fecha] = @InFechaProcesamiento

			WHILE @firstId <= @maxCantPropiedadesEnTabla

				BEGIN

					SELECT @tipoRecibo = TP.[TipoRecibo], @numFincaAPagar = TP.[NumFinca] FROM @InTablaPagosDiario as TP WHERE TP.[Id] = @firstId
				
					SELECT @idPropiedadAPagar = P.[ID] FROM [dbo].[Propiedad] as P WHERE P.[NumFinca] = @numFincaAPagar

					INSERT INTO @pagosPorPropiedadPorCC([idRecibo], [idPropiedad], [idConceptoCobro], [fechaVence], [monto], [estado])

					SELECT R.[ID], R.[IDPropiedad], R.[IDConceptoCobro], R.[FechaVence], R.[Monto], R.[Estado] FROM [dbo].[Recibos] as R
					WHERE R.[Estado] = 0 AND R.[IDPropiedad] = @idPropiedadAPagar AND R.[IDConceptoCobro] = @tipoRecibo

					SET @totalRecibo = 0 
					SET @montoInteresMoratorioPorRecibo = 0 

					EXEC SPIComprobantePago 0, @InFechaProcesamiento

					SELECT @idComprobantePago = IDENT_CURRENT('ComprobantePago')


					WHILE EXISTS(SELECT [idRecibo] FROM @pagosPorPropiedadPorCC WHERE [estado] = 0)
						BEGIN
							SELECT TOP 1 @reciboAPagar = [idRecibo] FROM @pagosPorPropiedadPorCC WHERE [estado] = 0


							SELECT @fechaVencimiento = [fechaVence] FROM @pagosPorPropiedadPorCC WHERE [idRecibo] = @reciboAPagar
							SELECT @montoRecibo = [monto] FROM @pagosPorPropiedadPorCC WHERE [idRecibo] = @reciboAPagar


							SET @totalRecibo += @montoRecibo

							UPDATE [dbo].[Recibos]
							SET [Estado] = 1, [IDComprobantePago] = @idComprobantePago
							WHERE [ID] = @reciboAPagar

							UPDATE @pagosPorPropiedadPorCC
							SET [Estado] = 1
							WHERE [idRecibo] = @reciboAPagar

							IF(@InFechaProcesamiento > @fechaVencimiento) ----si el recibo estuviera vencido
								BEGIN
									
									SELECT @diasPasados = DATEDIFF(day, @fechaVencimiento, @InFechaProcesamiento);
									SELECT @tasaInteresMoratorio = [TasaInteresMor] FROM [dbo].[ConceptoCobro] WHERE [ID] = @tipoRecibo
									SET @montoInteresMoratorioPorRecibo  = ((@montoRecibo * (@tasaInteresMoratorio/365.0)) * @diasPasados)

									EXEC SPIRecibo @idPropiedadAPagar, 11, @InFechaProcesamiento, @montoInteresMoratorioPorRecibo, @InFechaProcesamiento
									
									UPDATE [dbo].[Recibos]
									SET [Estado] = 1, [IDComprobantePago] = @idComprobantePago
									WHERE [ID] = (SELECT IDENT_CURRENT('Recibos'))

									SET @totalRecibo += @montoInteresMoratorioPorRecibo
								END
						END

						UPDATE [dbo].[ComprobantePago]
						SET [MontoTotal] = @totalRecibo
						WHERE [ID] = @idComprobantePago

					SET @firstId += 1

				END
		COMMIT
		END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la generacion de pagos',1;
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPGenerarRecibos]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGenerarRecibos]
	@InFechaActual date 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

	DECLARE @day int 
	SELECT @day = DAY(@InFechaActual);

	IF @day in (SELECT CC.[DiaCorte] FROM [dbo].[ConceptoCobro] as CC)

		BEGIN

			DECLARE @Idcc int ---Ayuda a buscar los datos por medio del indice principal (PK), aumenta la velocidad

			SELECT @Idcc = CC.[ID] FROM [dbo].[ConceptoCobro] as CC WHERE CC.[DiaCorte] = @day AND [Activo] = 1 

			IF @Idcc = 1 

				BEGIN

					DECLARE @ConsumoAcumM3 int, @ConsumUltimoRecibo int, @MontoRecibo money,  @MontoPorM3 money, 
							@MontoMinRecibo money, @FechaCorte date, @QDiasCorte int
							
					DECLARE @tablaPropiedadeConRecibosAgua table (IDPropiedad int, Activo bit)

					INSERT INTO @tablaPropiedadeConRecibosAgua
					SELECT [IDPropiedad], [Activo]
					FROM [dbo].[CCXPropiedad]
					WHERE [IDCC] = @Idcc

					DECLARE @IdPropiedadAPagar int

					BEGIN TRAN

						WHILE EXISTS(SELECT [IDPropiedad] FROM @tablaPropiedadeConRecibosAgua WHERE [Activo] = 1)

							BEGIN 
								SELECT TOP 1 @IdPropiedadAPagar = [IDPropiedad] FROM @tablaPropiedadeConRecibosAgua WHERE [Activo] = 1

								SELECT @ConsumoAcumM3 = P.[ConsumoAcumM3],@ConsumUltimoRecibo = P.[UltimoReciboM3] 
								FROM [dbo].[Propiedad] as P WHERE P.ID = @IdPropiedadAPagar

								SELECT @MontoPorM3 = CCC.[ValorMetrosCubicos], @MontoMinRecibo = CCC.[MontoMinRecibo]
								FROM [dbo].[CCConsumo] as CCC WHERE CCC.IDCC = @Idcc
							
								SELECT @QDiasCorte = CC.[DiasRestantesVigencia] FROM [dbo].[ConceptoCobro] as CC WHERE CC.ID = @Idcc
								SELECT @FechaCorte = CAST (DATEADD(DAY, @QDiasCorte , @InFechaActual) as date); 

								SET @MontoRecibo = 
								CASE WHEN ((@ConsumoAcumM3 - @ConsumUltimoRecibo) * @MontoPorM3) > @MontoMinRecibo
										THEN ((@ConsumoAcumM3 - @ConsumUltimoRecibo) * @MontoPorM3)
										ELSE @MontoMinRecibo
								END

									EXEC SPIRecibo @IdPropiedadAPagar, @Idcc, @FechaCorte, @MontoRecibo, @InFechaActual
							
									UPDATE @tablaPropiedadeConRecibosAgua
									SET [Activo] = 0
									WHERE [IDPropiedad] = @IdPropiedadAPagar

									UPDATE Propiedad 
									SET [UltimoReciboM3] = @ConsumoAcumM3
									WHERE [ID] = @IdPropiedadAPagar 
							END

						COMMIT
				END

			ELSE IF (SELECT CC.[EsFijo] FROM [dbo].[ConceptoCobro] as CC WHERE [ID] = @Idcc) = 'Si'

				BEGIN

					DECLARE @MontoReciboFijo money, @FechaCorteCCFijo date, @QDiasCorteCCFijo int

					DECLARE @tablaPropiedadeConRecibosFijo table (IDPropiedad int, Activo bit)

					INSERT INTO @tablaPropiedadeConRecibosFijo
					SELECT [IDPropiedad], [Activo]
					FROM [dbo].[CCXPropiedad]
					WHERE [IDCC] = @Idcc

					DECLARE @IdPropiedadAPagarCCFijo int

					BEGIN TRAN

					WHILE EXISTS(SELECT [IDPropiedad] FROM @tablaPropiedadeConRecibosFijo  WHERE [Activo] = 1)
						BEGIN 

							SELECT TOP 1 @IdPropiedadAPagarCCFijo = [IDPropiedad] FROM @tablaPropiedadeConRecibosFijo WHERE [Activo] = 1

							SELECT @MontoReciboFijo = CCF.[Monto] FROM [dbo].[CCFijo] as CCF WHERE CCF.IDCC = @Idcc
							SELECT @QDiasCorteCCFijo = CC.[DiasRestantesVigencia] FROM [dbo].[ConceptoCobro] as CC WHERE CC.ID = @Idcc
							SELECT @FechaCorteCCFijo = CAST (DATEADD(DAY, @QDiasCorteCCFijo , @InFechaActual) as date); 

							EXEC SPIRecibo @IdPropiedadAPagarCCFijo, @Idcc, @FechaCorteCCFijo, @MontoReciboFijo, @InFechaActual
							
							UPDATE @tablaPropiedadeConRecibosFijo
							SET [Activo] = 0
							WHERE [IDPropiedad] = @IdPropiedadAPagarCCFijo
						END

					COMMIT
				END

			ELSE IF (SELECT CC.[EsImpuesto] FROM [dbo].[ConceptoCobro] as CC WHERE [ID] = @Idcc) = 'Si'
				BEGIN

					DECLARE @MontoReciboPorcentaje money,  @FechaCorteCCPorcentaje date, @QDiasCorteCCPorcentaje int, @MontoPropiedad money, @TasaInteres real
							
					DECLARE @tablaPropiedadeConRecibosImpuesto table (IDPropiedad int, Activo bit)

					INSERT INTO @tablaPropiedadeConRecibosImpuesto
					SELECT [IDPropiedad], [Activo]
					FROM [dbo].[CCXPropiedad]
					WHERE [IDCC] = @Idcc

					DECLARE @IdPropiedadAPagarCCPorcentaje int

					BEGIN TRAN

					WHILE EXISTS(SELECT [IDPropiedad] FROM @tablaPropiedadeConRecibosImpuesto  WHERE [Activo] = 1)
						BEGIN 

							SELECT TOP 1 @IdPropiedadAPagarCCPorcentaje = [IDPropiedad] FROM  @tablaPropiedadeConRecibosImpuesto WHERE [Activo] = 1

							SELECT @MontoPropiedad = P.Valor FROM [dbo].[Propiedad] as P WHERE P.ID = @IdPropiedadAPagarCCPorcentaje
							SELECT @TasaInteres = CCP.[ValorPorcentaje] FROM [dbo].[CCPorcentaje] as CCP WHERE CCP.IDCC = @Idcc
							SELECT @QDiasCorteCCPorcentaje = CC.[DiasRestantesVigencia] FROM [dbo].[ConceptoCobro] as CC WHERE CC.ID = @Idcc
							SELECT @FechaCorteCCPorcentaje = CAST (DATEADD(DAY, @QDiasCorteCCPorcentaje , @InFechaActual) as date); 
							SET @MontoReciboPorcentaje = (CAST (@MontoPropiedad as real) * (@TasaInteres/100.00))

							EXEC SPIRecibo @IdPropiedadAPagarCCPorcentaje, @Idcc, @FechaCorteCCPorcentaje, @MontoReciboPorcentaje, @InFechaActual

							UPDATE @tablaPropiedadeConRecibosImpuesto
							SET [Activo] = 0
							WHERE [IDPropiedad] = @IdPropiedadAPagarCCPorcentaje

						END

					COMMIT
				END
		END
	
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la generacion de Recibos',1;
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPGenerarReconexiones]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGenerarReconexiones]
	@InTablaReconexiones TablaPagos READONLY,
	@InFechaProcesamiento date

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		DECLARE @firstId int, @maxCantPropiedadesEnTabla int, @idPropiedadAReconectar int, @diasAtrasados int, @montoInteresMoratorioRecibo money,
				@numFincaAReconectar varchar(20), @idReciboAPagar int, @montoPorRecibo money, @fechaVenceRecibo date, @tasaMoratoria real,
				@montoTotalPorRecibo money, @montoTotalReconexion money, @idComprobantePago int, @idReciboReconexion int, @idReconexion int
				


		DECLARE @tablaRecibosPendientes table(IDRecibo int, FechaVencimiento date, Monto money, Estado int, idPropiedad int)

		

		SELECT @maxCantPropiedadesEnTabla = COUNT(0) FROM @InTablaReconexiones ---Retorna la cantidad maxima de filas en la tabla

		BEGIN TRAN
		
			SELECT TOP 1 @firstId = [Id] FROM @InTablaReconexiones WHERE [Fecha] = @InFechaProcesamiento

	
			WHILE @firstId <= @maxCantPropiedadesEnTabla

				BEGIN
					
					SELECT @numFincaAReconectar = [NumFinca] FROM @InTablaReconexiones WHERE [Id] = @firstId
					SELECT @idPropiedadAReconectar = [ID] FROM [dbo].[Propiedad] WHERE [NumFinca] = @numFincaAReconectar

					SELECT @idComprobantePago = [IDComprobantePago], @idReciboReconexion = [ID] FROM [dbo].[Recibos] 
					WHERE [IDPropiedad] = @idPropiedadAReconectar AND [IDConceptoCobro] = 10


					SELECT @idReconexion = [IDReconexion] FROM [dbo].[Cortes] WHERE IDPropiedad = @idPropiedadAReconectar

					INSERT INTO @tablaRecibosPendientes ([IDRecibo], [FechaVencimiento], [Monto], [Estado], [idPropiedad])
					SELECT R.[ID], R.[FechaVence], R.[Monto], R.[Estado], R.IDPropiedad FROM [dbo].[Recibos] as R
					WHERE R.[IDConceptoCobro] = 1
					AND R.[Estado] = 0
					AND R.[FechaVence] <= @InFechaProcesamiento 
					AND R.[IDPropiedad] = @idPropiedadAReconectar 

					SET @montoTotalReconexion = 0	
					
					SET @montoInteresMoratorioRecibo  = 0

					SET @montoTotalPorRecibo = 0
					WHILE EXISTS(SELECT [IDRecibo] FROM @tablaRecibosPendientes WHERE [Estado] = 0)
						
						BEGIN
						
							SELECT TOP 1 @idReciboAPagar = [IDRecibo] FROM @tablaRecibosPendientes WHERE [Estado] = 0

							SELECT @montoPorRecibo = [Monto], @fechaVenceRecibo = [FechaVencimiento] FROM @tablaRecibosPendientes WHERE [IDRecibo] = @idReciboAPagar

							SELECT @tasaMoratoria = [TasaInteresMor] FROM [dbo].[ConceptoCobro] WHERE [ID] = 1

							SELECT @diasAtrasados = DATEDIFF(day, @fechaVenceRecibo, @InFechaProcesamiento);

							SET @montoInteresMoratorioRecibo  = ((@montoPorRecibo * (@tasaMoratoria/365.0)) * @diasAtrasados)

							EXEC SPIRecibo @idPropiedadAReconectar, 11, @InFechaProcesamiento, @montoInteresMoratorioRecibo, @InFechaProcesamiento

							UPDATE [dbo].[Recibos]
							SET [Estado] = 1, [IDComprobantePago] = @idComprobantePago
							WHERE [ID] = (SELECT IDENT_CURRENT('Recibos'))

							SET @montoTotalPorRecibo = @montoPorRecibo + @montoInteresMoratorioRecibo
							
							---INSERT DE RECIBO POR INTERES MORATORIO
							
							UPDATE [dbo].[Recibos]
							SET [Estado] = 1, [IDComprobantePago] = @idComprobantePago
							WHERE [ID] = @idReciboAPagar

							UPDATE @tablaRecibosPendientes
							SET [Estado] = 1
							WHERE [IDRecibo] = @idReciboAPagar

							UPDATE [dbo].[Recibos]
							SET [Monto] += @montoTotalPorRecibo
							WHERE [ID] = @idReciboReconexion

						END

					INSERT INTO [dbo].[Reconecta] ([IDPropiedad], [IDReconexion])
					VALUES (@idPropiedadAReconectar, @idReconexion)

					SET @firstId +=1
					
				END
		COMMIT
	END TRY
	BEGIN CATCH 
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la generacion de Reconexiones',1;
	END CATCH
END 
  
GO
/****** Object:  StoredProcedure [dbo].[SPGenerarTransConsumoAgua]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGenerarTransConsumoAgua] 
	@IntablaTransDiarias TablaTransConsumo READONLY,
	@InfechaDeProcesamiento date 


AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		DECLARE @firstId int, @numFinca varchar(20), @IdTipoTransConsumo int, @LecturaM3 int, @Razon varchar(100), @maxCantPropiedadesEnTabla int

		SELECT @maxCantPropiedadesEnTabla = COUNT(0) FROM @IntablaTransDiarias ---Retorna la cantidad maxima de filas en la tabla

		BEGIN TRAN 

			SELECT TOP 1 @firstId = [Id] FROM @IntablaTransDiarias WHERE [Fecha] = @InfechaDeProcesamiento
			
			WHILE @firstId <= @maxCantPropiedadesEnTabla

			BEGIN

				SELECT @numFinca = [NumFinca],
						@IdTipoTransConsumo = [Tipo],
						@LecturaM3  = [LecturaM3],
						@Razon = [Descripcion]
				FROM @IntablaTransDiarias WHERE [id] = @firstId

				EXEC SPITranscConsumo @IdTipoTransConsumo, @numFinca, @LecturaM3, @Razon, @InfechaDeProcesamiento

				SET @firstId +=1
			END

		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la generacion de Transacciones de agua',1;
	END CATCH     
END
		





	
GO
/****** Object:  StoredProcedure [dbo].[SPICambiosBitacora]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPICambiosBitacora]
	@InIdTipoEntidad int,
	@InIdEntidad int,
	@InJSONAntes varchar(500),
	@InJSONDespues varchar(500),
	@InInsertedBy varchar(20),
	@InInsertedIn varchar(20),
	@InFechaInsercion date


AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		INSERT INTO [dbo].[BitacoraCambios] ([IDTipoEntidad], [IDEntidad], [Antes], [Despues], [InsertedBy], [InsertedIn], [FechaInsercion])
		VALUES (@InIdTipoEntidad, @InIdEntidad, @InJSONAntes, @InJSONDespues, @InInsertedBy, @InInsertedIn, @InFechaInsercion)

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la insercion de cambios en la bitacora',1;
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPICCConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPICCConsumo]
	@InId int,
	@InNombre varchar(100),
	@InTasaInteresMor varchar(2),
	@InDiasRestantesVigencia int,
	@InDiaCorte int,
	@InEsFijo varchar(2),
	@InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money,
	@InValorMetrosCubicos real,
	@InMontoMinRecibo money
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON
	
		EXEC SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto
		INSERT INTO [dbo].[CCConsumo] ([IDCC], [ValorMetrosCubicos], [MontoMinRecibo])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')), @InValorMetrosCubicos, @InMontoMinRecibo)  
		
		COMMIT	
		
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de Concepto Cobro Consumo',1;
	END CATCH
END



	
GO
/****** Object:  StoredProcedure [dbo].[SPICCFijo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPICCFijo]
	@InId int,
	@InNombre varchar(100),
	@InTasaInteresMor varchar(2),
	@InDiasRestantesVigencia int,
	@InDiaCorte int,
	@InEsFijo varchar(2),
	@InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money 
AS 

BEGIN
	BEGIN TRY	 
		BEGIN TRAN
		SET NOCOUNT ON
	
		EXEC SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto
		INSERT INTO [dbo].[CCFijo] ([IDCC],[Monto])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')), @InMonto)  
	
		COMMIT
		END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de Concepto Cobro Fijo',1; 
	END CATCH
END

	
GO
/****** Object:  StoredProcedure [dbo].[SPICCInteresMoratorio]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPICCInteresMoratorio]
	@InId int,
	@InNombre varchar(100),
	@InTasaInteresMor varchar(2),
	@InDiasRestantesVigencia int,
	@InDiaCorte int,
	@InEsFijo varchar(2),
	@InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money 
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

		EXEC SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto
		INSERT INTO [dbo].[CCInteresMoratorio] ([IDCC])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')))  
		
		COMMIT
		END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de Concepto Cobro Interes Moratorio',1;
	END CATCH
END


	
GO
/****** Object:  StoredProcedure [dbo].[SPICCPorcentaje]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPICCPorcentaje]
	@InId int,
	@InNombre varchar(100),
	@InTasaInteresMor varchar(2),
	@InDiasRestantesVigencia int,
	@InDiaCorte int,
	@InEsFijo varchar(2),
	@InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money,
	@InValorPorcentaje real
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON
	
		EXEC SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto 
		INSERT INTO [dbo].[CCPorcentaje] ([IDCC],[ValorPorcentaje])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')), @InValorPorcentaje)  
	
		COMMIT
		END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de Concepto Cobro Porcentaje',1;
	END CATCH
END



	
GO
/****** Object:  StoredProcedure [dbo].[SPICCXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPICCXPropiedad]
	@InNumFinca varchar(20),
    @InIDCC int

AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
			SET NOCOUNT ON

			DECLARE @idPropiedad int															
			SELECT @idPropiedad = P.ID FROM [dbo].Propiedad as P WHERE P.NumFinca = @InNumFinca
		
		
			DECLARE @idcc int															
			SELECT @idcc= CC.ID FROM [dbo].ConceptoCobro as CC WHERE CC.ID= @InIDCC
		
			SELECT @idcc 
			SELECT @idPropiedad

			IF (@idcc is null OR @idPropiedad is null)
				THROW 70001,'No existe el tipo de concepto ingresado',1;

			INSERT INTO [dbo].[CCXPropiedad] ([IDPropiedad], [IDCC], [FechaInsercion], [Activo])
			VALUES (@idPropiedad, @InIDCC, GETDATE(), 1)
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de la relacion CCXVRSPropiedad',1;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPIComprobantePago]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIComprobantePago]
	@InMontoTotal money,
	@InFechaInsercion date

AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		INSERT INTO [dbo].[ComprobantePago]([MontoTotal],[FechaInsercion])
		VALUES (@InMontoTotal, @InFechaInsercion)

	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la insercion del Comprobante de Pago',1; 
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPIConceptoCobro]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIConceptoCobro]
	@InId int,
	@InNombre varchar(100),
	@InTasaInteresMor varchar(2),
	@InDiasRestantesVigencia int,
	@InDiaCorte int,
	@InEsFijo varchar(2),
	@InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money 
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON
		
		INSERT INTO [dbo].[ConceptoCobro] ([ID], [Nombre], [TasaInteresMor], [DiasRestantesVigencia], [DiaCorte], [EsFijo], [EsRecurrente], [EsImpuesto],[Activo], [Monto])
		Values (@InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, 1, @InMonto)       
		
		END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la insercion del Concepto de Cobro',1;
	END CATCH
END


	
GO
/****** Object:  StoredProcedure [dbo].[SPIPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIPropiedad]
	@InNumFinca varchar(20),
	@InValor money,
	@InDireccion varchar(300),
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)
AS

BEGIN
	
	IF (@InNumFinca < 0 OR @InNumFinca IS NULL  OR  @InValor < 0 OR @InValor IS NULL)  
		THROW 70001, 'No se permiten valores vacíos' , 1;
	IF(NOT LEN(@InDireccion ) > 0)
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo procesar',1;
	
	BEGIN TRY  
	SET NOCOUNT ON

		DECLARE @JSONAntes varchar(500), @JSONDespues varchar(500), @lastId int

		SET @JSONAntes = ''

		BEGIN TRAN 

			INSERT INTO [dbo].[Propiedad]([NumFinca], [Valor], [Direccion], [FechaInsercion], [Activo], [ConsumoAcumM3], [UltimoReciboM3])
			Values (@InNumFinca, @InValor, @InDireccion,@InFechaInsercion, 1, 0, 0);

			SELECT @lastId = IDENT_CURRENT('Propietario')

			SET @JSONDespues = (SELECT [ID], [NumFinca], [Valor], [Direccion], [FechaInsercion], [Activo], [ConsumoAcumM3], [UltimoReciboM3] FROM [dbo].[Propiedad] WHERE [ID] = @lastId FOR JSON PATH)

			EXEC SPICambiosBitacora 1, @lastId, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion 

		COMMIT

	END TRY  
	BEGIN CATCH 
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW 70003,'Hubo un error en la insercion de la propiedad',1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropiedadXPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIPropiedadXPropietario] 
	@InNumFinca varchar(20),
	@InNumId varchar(20),
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)
	
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 	
		
		DECLARE @IDPropietario int, @IDPropiedad int, @JSONAntes varchar(500), @JSONDespues varchar(500), @lastId int

		SELECT @IDPropietario = Prop.ID FROM [dbo].[Propietario] as Prop WHERE Prop.NumId = @InNumId   
		SELECT @IDPropiedad = P.ID FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca

		IF (@IDPropietario is null or @IDPropiedad is null)
		THROW 70001,'El Numero de cedula o el numero de finca no existe',1;

		SET @JSONAntes = NULL

		BEGIN TRAN
			INSERT INTO [dbo].[PropiedadXPropietario] ([IDPropietario], [IDPropiedad],[FechaInsercion],[Activo])
			Values (@IDPropietario, @IDPropiedad, @InFechaInsercion, 1)

			SELECT @lastId = IDENT_CURRENT('PropiedadXPropietario')

			SET @JSONDespues = (SELECT [ID], [IDPropietario], [IDPropiedad], [FechaInsercion], [Activo] FROM [dbo].[PropiedadXPropietario] WHERE [ID] = @lastId FOR JSON PATH)

			EXEC SPICambiosBitacora 4, @lastId, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion
		
		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de la relacion propiedadVRSpropiedtario',1;
	END CATCH
          
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIPropietario]
	@InNombre varchar(100),
	@InNumId varchar(20),
	@InTipoId int,
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)

AS

BEGIN

	DECLARE @maxTipoId int, @JSONAntes varchar(500), @JSONDespues varchar(500), @lastId int 

	SELECT @maxTipoId = MAX(ID) FROM [dbo].TipoID

	IF(@InTipoId > @maxTipoId)
		THROW 70001, 'Error en el tipoID, el valor es muy alto, no se pudo procesar' , 1;		
	IF (@InTipoId < 0) 
		THROW 70001, 'Hubo un campo vacío o erroneo y la solicitud no se pudo procesar' , 1;
	IF(NOT LEN(@InNombre ) > 0 OR NOT LEN(@InNumId ) > 0 )
		THROW 70002, 'Hubo un campo vacío o erroneo y la solicitud no se pudo procesar',1;

	BEGIN TRY
		SET NOCOUNT ON

		SET @JSONAntes = NULL

		BEGIN TRAN
			INSERT INTO [dbo].[Propietario]([Nombre], [NumId], [TipoId], [FechaInsercion], [Activo])
			Values (@InNombre, @InNumId,@InTipoId,@InFechaInsercion,1);
	
			SELECT @lastId = IDENT_CURRENT('Propietario')

			SET @JSONDespues = (SELECT [ID], [Nombre], [NumId], [TipoId], [FechaInsercion], [Activo] FROM [dbo].[Propietario] WHERE [ID] = @lastId FOR JSON PATH)

			EXEC SPICambiosBitacora 2, @lastId, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion
		
		COMMIT

	END TRY  
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001, 'Hubo un error en la insercion del Propietario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropietarioJuridico]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIPropietarioJuridico] 
	@InNumId varchar(20),
	@InNombre varchar(100),
	@InTipoId int,
	@InFechaInsercion date,
    @InIDTipoIdResponsable int,
    @InNumIdResponsable varchar(30),
    @InResponsable varchar(100),
	@InIp varchar(20),
	@InNombreUsuario varchar(20)

AS   

SET NOCOUNT ON 
BEGIN
	BEGIN TRY
		BEGIN TRAN

	IF(LEN(@InNumId) < 1 OR  LEN(@InNombre)<1 OR  LEN(@InNumIdResponsable)<1 OR  LEN(@InResponsable)<1 OR  @InTipoId<1 OR @InIDTipoIdResponsable<1) 
		THROW 70002,'Hay campos vacíos',1;

			EXEC [dbo].[SPIPropietario] @InFechaInsercion,@InNombre, @InNumId, @InTipoId, @InIp, @InNombreUsuario
			INSERT INTO [dbo].[PropietarioJuridico] ([IDPropietario],[IDTipoIdResponsable], [NumIdResponsable], [Responsable])
			Values ((SELECT IDENT_CURRENT('Propietario')), @InIDTipoIdResponsable, @InNumIdResponsable,@InResponsable)     
		
		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de Propietario juridico',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIRecibo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIRecibo]
	@IdPropiedad int,
	@InIDCC int,
	@InFechaVence date,
	@InMonto money,
	@InFechaInsercion date

	
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		INSERT INTO [dbo].[Recibos]([IDPropiedad], [IDConceptoCobro], [Monto], [FechaVence], [Estado], [FechaInsercion])
		Values (@IdPropiedad, @InIDCC, @InMonto, @InFechaVence, 0, @InFechaInsercion)

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la insercion de Recibo',1;
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPITipoID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPITipoID] 
    @InID int,
    @InDescripcion varchar(100)
AS 
	 
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 
	
	INSERT INTO [dbo].[TipoID] ([ID], [Descripcion])
	Values( @InID, @InDescripcion)

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la insercion de Tipo ID',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPITranscConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPITranscConsumo] 
	@InIdTipoTransConsumo int,
	@InNumFinca varchar(20),
	@InLecturaM3 int,
	@InRazon varchar(100),
	@InFechaInsercion date 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 	
		BEGIN 
			
			DECLARE @IdPropiedad int 
			SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca


			IF(@InIdTipoTransConsumo = 1)
				BEGIN 
					DECLARE @ultimoRecibo int, @monto int, @NuevoAcumM3 int 

					SELECT @ultimoRecibo = P.UltimoReciboM3 FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca
					 
					SET @monto = (@InLecturaM3 - @ultimoRecibo)
					SET @NuevoAcumM3 = (SELECT P.ConsumoAcumM3 FROM [dbo].[Propiedad] as P WHERE P.[ID] = @IdPropiedad) + @monto

					BEGIN TRAN
					INSERT INTO [dbo].[TransacConsumo] ([IDTipoTransConsum],[IDPropiedad], [MontoM3], [LecturaConsumoM3],[NuevoAcumM3], [FechaInsercion], [Razon])
					VALUES (@InIdTipoTransConsumo, @IdPropiedad, @monto, @InLecturaM3, @NuevoAcumM3, @InFechaInsercion, @InRazon)

					UPDATE [dbo].[Propiedad]
					SET [ConsumoAcumM3] = @NuevoAcumM3
					WHERE [ID] = @IdPropiedad
					COMMIT
				END

			ELSE IF(@InIdTipoTransConsumo = 2)
				BEGIN

					DECLARE @AcumPorArreglarMenosM3 int, @AcumArregladoMenosM3 int
				
					SELECT @AcumPorArreglarMenosM3 = P.ConsumoAcumM3 FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca
					
					SET @AcumArregladoMenosM3 = @AcumPorArreglarMenosM3 + @InLecturaM3

					BEGIN TRAN
					INSERT INTO [dbo].[TransacConsumo] ([IDTipoTransConsum],[IDPropiedad], [MontoM3], [LecturaConsumoM3],[NuevoAcumM3], [FechaInsercion], [Razon])
					VALUES (@InIdTipoTransConsumo, @IdPropiedad, 0, @InLecturaM3, @AcumArregladoMenosM3, @InFechaInsercion, @InRazon)

					UPDATE [dbo].[Propiedad]
					SET [ConsumoAcumM3] =  @AcumArregladoMenosM3
					WHERE [ID] = @IdPropiedad
					COMMIT
				END 

			ELSE IF(@InIdTipoTransConsumo = 3)   
				BEGIN

					DECLARE @AcumPorArreglarMasM3 int, @AcumArregladoMasM3 int
				
					SELECT @AcumPorArreglarMasM3 = P.ConsumoAcumM3 FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca
					
					SET @AcumArregladoMasM3 = @AcumPorArreglarMasM3 - @InLecturaM3

					BEGIN TRAN
					INSERT INTO [dbo].[TransacConsumo] ([IDTipoTransConsum],[IDPropiedad], [MontoM3], [LecturaConsumoM3],[NuevoAcumM3], [FechaInsercion], [Razon])
					VALUES (@InIdTipoTransConsumo, @IdPropiedad, 0, @InLecturaM3, @AcumArregladoMasM3, @InFechaInsercion, @InRazon)

					UPDATE [dbo].[Propiedad]
					SET [ConsumoAcumM3] =  @AcumArregladoMasM3
					WHERE [ID] = @IdPropiedad
					COMMIT
				END

		END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de Transaccion de Consumo',1;
	END CATCH     
END
		





	
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIUsuario]
	@InNombre varchar(100),
	@InPassword varchar(100),
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)

AS

BEGIN
	BEGIN TRY  

	IF(NOT LEN(@InNombre)>0 OR NOT LEN(@InPassword)>0)
		THROW 70001,'Uno de los campos estaba vacío',1;

		DECLARE @JSONAntes varchar(500), @JSONDespues varchar(500), @lastId int

		SET @JSONAntes = NULL

		BEGIN TRAN

			INSERT INTO [dbo].[Usuario]([Nombre], [Password], [FechaInsercion], [Activo]) 
			Values (@InNombre, @InPassword, @InFechaInsercion, 1)

			SELECT @lastId = IDENT_CURRENT('Usuario')

			SET @JSONDespues = (SELECT [ID], [Nombre], [Password], [FechaInsercion], [Activo] FROM [dbo].[Usuario] WHERE [ID] = @lastId FOR JSON PATH)

			EXEC SPICambiosBitacora 3, @lastId, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion
		
		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion del Usuario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuarioXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIUsuarioXPropiedad] 
	@InNumFinca varchar(20),
	@InUsername varchar(100),
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)

	

AS

BEGIN 
	BEGIN TRY
	SET NOCOUNT ON 

		DECLARE @IDUsuario int, @IDPropiedad int, @JSONAntes varchar(500), @JSONDespues varchar(500), @lastId int
		
		SELECT @IDUsuario = U.ID FROM [dbo].[Usuario] AS U WHERE U.Nombre = @InUserName
		SELECT @IDPropiedad = P.ID FROM [dbo].Propiedad AS P WHERE P.NumFinca = @InNumFinca

		SET @JSONAntes = NULL

		BEGIN TRAN

			INSERT INTO [dbo].[UsuarioXPropiedad] ([IDUsuario], [IDPropiedad],[Activo],[FechaInsercion])
			Values (@IDUsuario, @IDPropiedad, 1, @InFechaInsercion)

			SELECT @lastId = IDENT_CURRENT('UsuarioXPropiedad')

			SET @JSONDespues = (SELECT [ID], [IDUsuario], [IDPropiedad], [FechaInsercion], [Activo] FROM [dbo].[UsuarioXPropiedad] WHERE [ID] = @lastId FOR JSON PATH)

			EXEC SPICambiosBitacora 5, @lastId, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion

		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la insercion de la relacion usuarioVRSpropiedad',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCConsumo] 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

	SELECT ConcpC.[ID], ConcpC.[Nombre], ConcpC.[TasaInteresMor], ConcpC.[DiasRestantesVigencia], ConcpC.[DiaCorte], ConcpC.[EsFijo], ConcpC.[EsRecurrente], ConcpC.[EsImpuesto], ConcpC.[Monto], CCC.[ValorMetrosCubicos], CCC.[MontoMinRecibo]
	FROM [dbo].[ConceptoCobro] as ConcpC INNER JOIN [dbo].[CCConsumo] as CCC on ConcpC.ID = CCC.IDCC 
	WHERE ConcpC.Activo = 1 
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCFijo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCFijo] 

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON   

		SELECT ConcpC.[ID], ConcpC.[Nombre], ConcpC.[TasaInteresMor], ConcpC.[DiasRestantesVigencia], ConcpC.[DiaCorte], ConcpC.[EsFijo], ConcpC.[EsRecurrente],ConcpC.[EsImpuesto], CCF.[Monto]
		FROM   [dbo].[ConceptoCobro] as ConcpC INNER JOIN [dbo].[CCFijo] as CCF on ConcpC.ID = CCF.IDCC 
		WHERE ConcpC.Activo = 1

	END TRY
	BEGIN CATCH 
		THROW 70001,'Hubo un error en la busqueda de concepto cobro fijo',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCPorcentaje]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCPorcentaje] 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		SELECT ConcpC.[ID], ConcpC.[Nombre], ConcpC.[TasaInteresMor], ConcpC.[DiasRestantesVigencia], ConcpC.[DiaCorte], ConcpC.[EsFijo], ConcpC.[EsRecurrente], ConcpC.[EsImpuesto], ConcpC.[Monto], CCP.[ValorPorcentaje]
		FROM   [dbo].[ConceptoCobro] as ConcpC INNER JOIN [dbo].[CCPorcentaje] as CCP on ConcpC.ID = CCP.IDCC 
		WHERE ConcpC.Activo = 1

	END TRY
	BEGIN CATCH 
		THROW 70001,'Hubo un error en la busqueda de concepto de cobro porcentaje',1;
	END CATCH
END 
GO
/****** Object:  StoredProcedure [dbo].[SPSCCPorPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCPorPropiedad] 
    @InNumFinca VARCHAR(20)
AS 
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		CREATE TABLE #TEMP([Nombre] VARCHAR(20),[TasaInteresMor] real	
			,[DiasRestantesVigencia]  int, [DiaCorte] int 
			,[EsFijo] VARCHAR(2),[EsRecurrente]VARCHAR(2)
			,[EsImpuesto] VARCHAR(2),[Activo] BIT
			,[Monto] MONEY
		);

		SELECT P.NumId, P.Nombre, P.TipoId 
		FROM   [Propietario] AS P 
		INNER JOIN [PropiedadXPropietario] AS PXP ON P.ID = PXP.IDPropietario
		INNER JOIN [Propiedad] AS Pr ON Pr.ID = PXP.IDPropiedad 
		WHERE Pr.NumFinca = @InNumFinca AND P.Activo = 1 AND PXP.Activo = 1
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de concepto de cobro por propiedad',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSCCXPropiedad]
@InNumFinca varchar(20)
AS

BEGIN
	BEGIN TRY
			DECLARE @idFinca INT
			SET @idFinca = (SELECT id FROM [dbo].[Propiedad] WHERE [numFinca] = @InNumFinca) 

			SELECT  [ConceptoCobro].[ID],
					[ConceptoCobro].[Nombre],
					[ConceptoCobro].[DiasRestantesVigencia],
					[CCConsumo].[ValorMetrosCubicos],[CCPorcentaje].[ValorPorcentaje],
					[ConceptoCobro].[TasaInteresMor], [ConceptoCobro]. [EsRecurrente],
					[ConceptoCobro].[EsImpuesto],[ConceptoCobro].[DiaCorte],[ConceptoCobro].[EsFijo],[CCFijo].[Monto]

			FROM   [dbo].[ConceptoCobro]
			LEFT OUTER JOIN [CCConsumo] ON [ConceptoCobro].[ID] = [CCConsumo].[IDCC]
			LEFT OUTER JOIN [CCFijo] ON [ConceptoCobro].[ID] = [CCFijo].[IDCC]
			LEFT OUTER JOIN [CCInteresMoratorio] ON [ConceptoCobro].[ID] = [CCInteresMoratorio].[IDCC]
			LEFT OUTER JOIN [CCPorcentaje] ON [ConceptoCobro].[ID] = [CCPorcentaje].[IDCC]
			WHERE [ConceptoCobro].[Activo] = 1 AND [ConceptoCobro].[ID] IN (SELECT IDCC FROM CCXPropiedad WHERE IDPropiedad= @idFinca AND Activo=1)

	  END TRY

	  BEGIN CATCH 
		THROW 70001,'Error en la busqueda de concepto de cobro por propiedad',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[SPSCCXPropiedadPorNumFinca]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCXPropiedadPorNumFinca] 
	@InNumFinca varchar(20)
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 

		SELECT P.NumFinca , P.Valor, P.Direccion, CCXP.IDCC, CC.Nombre 
		FROM   [dbo].[CCXPropiedad] as CCXP 
		INNER JOIN [dbo].[Propiedad] as P on CCXP.IDPropiedad = P.ID 
		INNER JOIN [dbo].[ConceptoCobro] as CC on CC.ID = CCXP.IDCC
		WHERE P.NumFinca = @InNumFinca AND CCXP.Activo = 1 AND P.Activo = 1 AND CC.Activo = 1  

	END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la busqueda de conceptos de cobro por propiedad por numero de finca',1; 
    END CATCH
END

 
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSPropiedad]
AS

BEGIN
	BEGIN TRY
		SET NOCOUNT ON 

		SELECT TOP (200)  [NumFinca], [Valor], [Direccion]
		FROM [dbo].[Propiedad]
		WHERE [Activo] = 1 

	END TRY
    BEGIN CATCH
        THROW 70001,'Hubo un error en la busqueda de propiedades',1;
    END CATCH
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadesPorPropietario] 
    @InNumId varchar(20)

AS 

BEGIN 
	SET NOCOUNT ON  
	BEGIN TRY

		SELECT P.numFinca, P.valor, P.direccion 
		FROM   [dbo].[Propiedad] as P 
		INNER JOIN [PropiedadXPropietario] AS PXP ON P.ID = PXP.IDPropiedad 
		INNER JOIN [Propietario] as Prop ON Prop.ID = PXP.IDPropietario 
		WHERE Prop.NumId = @InNumId AND PXP.Activo = 1 AND P.Activo = 1 AND Prop.Activo = 1 

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propiedades por propietario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorPropietarioJuridico]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadesPorPropietarioJuridico]
@InNumId varchar(20)

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

	SELECT P.numFinca, P.valor, P.direccion 
	FROM   [dbo].[Propiedad] as P 
	INNER JOIN [PropiedadXPropietario] AS PXP ON P.ID = PXP.IDPropiedad 
	INNER JOIN [Propietario] as Prop ON Prop.ID = PXP.IDPropietario 
	WHERE Prop.NumId = @InNumId AND PXP.Activo = 1
		  AND P.Activo = 1 AND Prop.Activo = 1 AND Prop.TipoId=4
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propiedades por propietario juridico',1; 
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadesPorUsuario] 
	@InUsername varchar(100)
AS 
	 
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		SELECT P.NumFinca, P.Valor, P.Direccion 
		FROM   [dbo].[Propiedad] as P 
		INNER JOIN [UsuarioXPropiedad] AS UXP ON P.ID = UXP.IDPropiedad 
		INNER JOIN [Usuario] as U ON U.ID = UXP.IDUsuario 
		WHERE U.Nombre = @InUsername AND U.Activo = 1 AND P.Activo = 1 AND UXP.Activo = 1
	END TRY 

	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propiedades por usuario',1;
	END CATCH  
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadPorNumFinca]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadPorNumFinca]
	@InNumFinca varchar(20)

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		SELECT [ID], [NumFinca], [Valor], [Direccion]
		FROM [dbo].[Propiedad]
		WHERE [NumFinca] LIKE '%'+cast(@InNumFinca as varchar(300))+'%' AND [Activo] = 1
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propiedades por numero de finca',1; 
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadXPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadXPropietario] 

AS 
	
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		SELECT [ID], [IDPropietario], [IDPropiedad] 
		FROM   [dbo].[PropiedadXPropietario] 
		WHERE [Activo] = 1

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propiedad por propietario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSPropietario]

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		SELECT TOP (200) [ID], [Nombre], [NumId], [TipoId]
		FROM [dbo].[Propietario]
		WHERE Activo=1 AND [TipoId]!='4';

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propietarios',1; 
	END CATCH
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietarioJuridico]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietarioJuridico] 

AS 
	
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		SELECT P.[Nombre], P.[NumId],PJ.[IDTipoIdResponsable], PJ.[Responsable]
		FROM   [dbo].[Propietario] as P INNER JOIN [dbo].[PropietarioJuridico] as PJ ON P.ID = PJ.IDPropietario
		WHERE P.Activo = 1

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propietarios juridicos',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietarioJuridicoPorNumID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietarioJuridicoPorNumID]
@InNumId VARCHAR(30)
AS
BEGIN
	BEGIN TRY 
	SET NOCOUNT ON
		IF (NOT LEN(@InNumId)>0)
			THROW 70001,'Hubo un error en la busqueda',1;
		SELECT P.[Nombre], P.[NumId],PJ.[IDTipoIdResponsable], PJ.[Responsable]
		FROM   [dbo].[Propietario] as P INNER JOIN [dbo].[PropietarioJuridico] as PJ ON P.ID = PJ.IDPropietario
		WHERE NumId LIKE '%'+@InNumId +'%' AND Activo = 1 

	END TRY 
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propietario juridico por numero de cedula',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietarioPorNumId]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietarioPorNumId]
@InNumId int
AS
BEGIN
	BEGIN TRY 
	SET NOCOUNT ON
		IF (NOT LEN(@InNumId)>0)
			THROW 70001,'Hubo un error en la busqueda',1;
		SELECT [Nombre], [NumId], [TipoID]
		FROM [dbo].[Propietario]
		WHERE NumId LIKE '%'+cast(@InNumId as varchar(100))+'%' AND Activo = 1 AND TipoId!='4'

	END TRY 
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propietario por numero de cedula',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietariosPorPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietariosPorPropiedad] 
    @InNumFinca varchar(20)
AS 
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 
	
		SELECT P.NumId, P.Nombre, P.TipoId 
		FROM   [Propietario] AS P 
		INNER JOIN [PropiedadXPropietario] AS PXP ON P.ID = PXP.IDPropietario
		INNER JOIN [Propiedad] AS Pr ON Pr.ID = PXP.IDPropiedad 
		WHERE Pr.NumFinca = @InNumFinca AND P.Activo = 1 AND PXP.Activo = 1
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de propietarios por propiedad',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSReciboPorPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSReciboPorPropiedad]
	@InNumFinca varchar(20)
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		DECLARE @IdPropiedad int 
		SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca

		SELECT R.[IDConceptoCobro], R.[Monto], R.[FechaVence], R.[FechaInsercion] FROM [dbo].[Recibos] as R
		WHERE R.[IDPropiedad] = @IdPropiedad

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de Recibos por propiedad',1;
	END CATCH     
END
GO
/****** Object:  StoredProcedure [dbo].[SPSResponsable]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSResponsable] 
	@InNumFinca varchar(20) 
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON

		DECLARE @IdPropiedad int 
		SELECT @IdPropiedad = P.[ID] FROM [dbo].[Propiedad] AS P WHERE P.[NumFinca] = @InNumFinca

		SELECT [IDTipoIdResponsable], [NumIdResponsable], [Responsable]
		FROM   [dbo].[PropietarioJuridico]
		WHERE  [IDPropietario] = @IdPropiedad

	END TRY
    BEGIN CATCH
        THROW 70001,'Hubo un error en la busqueda de responsables',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSTipoID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSTipoID] 
AS 

BEGIN 
	BEGIN TRY
	SET NOCOUNT ON 
 
	SELECT [ID], [Descripcion] 
	FROM   [dbo].[TipoID] 

	END TRY
    BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de Tipos ID',1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPSTranscConsumoPorPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSTranscConsumoPorPropiedad]
	@InNumFinca varchar(20)
	
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 	
		
	 DECLARE @IdPropiedad int 
	 SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca

	 SELECT [IDTipoTransConsum],[LecturaConsumoM3],[NuevoAcumM3],[Razon], [FechaInsercion] FROM [dbo].[TransacConsumo]
	 WHERE [IDPropiedad] = @IdPropiedad 

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de transacciones de consumo de agua por propiedad',1;
	END CATCH     
END
		
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPSUsuario]

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		SELECT [Nombre], [Password]
		FROM [dbo].[Usuario]
		WHERE Activo = 1;
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la busqueda de usuarios',1;
	END CATCH
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuarioPorNombre]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuarioPorNombre]
	@InUsername varchar(100)
AS
BEGIN 
	BEGIN TRY
	SET NOCOUNT ON
		IF (NOT LEN(@InUsername)>0)
			THROW 70001,'Hubo un error en la transaccion',1;
		SELECT [ID], [Nombre], [Password]
		FROM [dbo].[Usuario]
		WHERE Nombre LIKE '%'+@InUsername+'%' AND Activo = 1

	END TRY
    BEGIN CATCH
      THROW 70001,'Hubo un error en la busqueda de usuario por nombre',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuariosPorPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuariosPorPropiedad] 
	@InNumFinca  varchar(20)
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

	SELECT U.Nombre, U.Password 
	FROM   [Usuario] AS U 
	INNER JOIN UsuarioXPropiedad AS UXP ON U.ID = UXP.IDUsuario
	INNER JOIN Propiedad AS PR ON PR.ID = UXP.IDPropiedad 
	WHERE PR.NumFinca = @InNumFinca AND U.Activo = 1 AND UXP.Activo = 1 AND PR.Activo = 1

	END TRY
    BEGIN CATCH
        THROW 70001,'Hubo un error en mostrar la relacion de usuarios por propiedad',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuarioXPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuarioXPropiedad] 
 
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 

	SELECT [ID], [IDUsuario], [IDPropiedad] 
	FROM   [dbo].[UsuarioXPropiedad] 
	WHERE [Activo] = 1

	END TRY
    BEGIN CATCH
        THROW 70001,'Hubo un error en mostrar la relacion entre usuarios y propiedades',1;
    END CATCH
END

	
GO
/****** Object:  StoredProcedure [dbo].[SPUCCConsumo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUCCConsumo] 
    @InIDCC int,
    @InValorMetrosCubicos real,
	@InMontoMinRecibo money,
    @InNombre varchar(100),
    @InTasaInteresMor varchar(2),
    @InDiasRestantesVigencia int,
    @InDiaCorte int,
    @InEsFijo varchar(2),
    @InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money
AS 

BEGIN 
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON  
		
			EXEC SPUConceptoCobro @InIDCC, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto   
			UPDATE [dbo].[CCConsumo]
			SET    [ValorMetrosCubicos] = @InValorMetrosCubicos, [MontoMinRecibo] = @InMontoMinRecibo 
			WHERE  [IDCC] = @InIDCC
		
		COMMIT
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 70001,'Hubo un error en la actualizacion de Concepto Cobro Consumo',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUCCFijo]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUCCFijo] 
    @InIDCC int,
    @InMonto money, 
	@InNombre varchar(100),
    @InTasaInteresMor varchar(2),
    @InDiasRestantesVigencia int,
    @InDiaCorte int,
    @InEsFijo varchar(2),
    @InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2)

AS 

BEGIN 
	BEGIN TRY 
		BEGIN TRAN
		SET NOCOUNT ON  
	
			EXEC SPUConceptoCobro  @InIDCC, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto
			UPDATE [dbo].[CCFijo]
			SET    [Monto] = @InMonto
			WHERE  [IDCC] = @InIDCC
	
		COMMIT
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN;
			THROW 70001,'Hubo un error en la actualizacion de Concepto Cobro Fijo',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUCCPorcentaje]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUCCPorcentaje] 
    @InIDCC int,
    @InValorPorcentaje real,
	@InNombre varchar(100),
    @InTasaInteresMor varchar(2),
    @InDiasRestantesVigencia int,
    @InDiaCorte int,
    @InEsFijo varchar(2),
    @InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2),
	@InMonto money

AS 
	 
BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

			EXEC SPUConceptoCobro @InIDCC, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, @InEsImpuesto, @InMonto
			UPDATE [dbo].[CCPorcentaje]
			SET    [ValorPorcentaje] = @InValorPorcentaje
			WHERE  [IDCC] = @InIDCC

		COMMIT
		END TRY
		BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la actualizacion del CC Porcentaje',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUConceptoCobro]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUConceptoCobro] 
    @InID int,
    @InNombre varchar(100),
    @InTasaInteresMor varchar(2),
    @InDiasRestantesVigencia int,
    @InDiaCorte int,
    @InEsFijo varchar(2),
    @InEsRecurrente varchar(2),
	@InEsImpuesto varchar(2), 
	@InMonto money
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 

		UPDATE [dbo].[ConceptoCobro]
		SET    [Nombre] = @InNombre, [TasaInteresMor] = @InTasaInteresMor, [DiasRestantesVigencia] = @InDiasRestantesVigencia, [DiaCorte] = @InDiaCorte, [EsFijo] = @InEsFijo, [EsRecurrente] = @InEsRecurrente, [EsImpuesto] = @InEsImpuesto, [Monto] = @InMonto
		WHERE  [ID] = @InID AND [Activo] = 1

	END TRY
    BEGIN CATCH
      THROW 70001,'Hubo un error en la actualizacion de Concepto de Cobro',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropiedad]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUPropiedad]
	@InNumFincaViejo varchar(20),
	@InNumFincaNuevo varchar(20),
	@InValor int,
	@InDireccion varchar(300)

AS 

BEGIN
	IF(NOT LEN(@InDireccion ) > 0  OR @InValor<0 OR @InNumFincaNuevo<0) --si los tipos son dif agregue ESTO --> OR NOT LEN(@ ) > 0)
		THROW 70002, 'Hubo un campo vacío o con datos erróneos y  la solicitud no se pudo procesar',1;
	BEGIN TRY 

		DECLARE @IdPropiedad int 
		SELECT @IdPropiedad = P.ID FROM [dbo].[Propiedad] AS P WHERE P.NumFinca = @InNumFincaViejo

		UPDATE [dbo].[Propiedad]
		SET [NumFinca] = @InNumFincaNuevo, [Valor] = @InValor, [Direccion] = @InDireccion
		WHERE [ID] = @IdPropiedad AND [Activo] = 1

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la actualizacion de la Propiedad',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropietario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUPropietario]
	@InNombre varchar(100),
	@InNumIdViejo varchar(20),
	@InNumIdNuevo varchar(20),
	@InTipoId int,
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)
AS 
BEGIN
	IF(NOT LEN(@InNombre) > 0 )
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo procesar',1;
	BEGIN TRY

		DECLARE @IdPropietario int, @JSONAntes varchar(500), @JSONDespues varchar(500)

		SELECT @IdPropietario = P.ID FROM [dbo].[Propietario] AS P WHERE P.NumId = @InNumIdViejo

		SET @JSONAntes = (SELECT [ID], [Nombre], [NumId], [TipoId], [FechaInsercion], [Activo] FROM [dbo].[Propietario] WHERE [ID] = @IdPropietario FOR JSON PATH)

		BEGIN TRAN

			UPDATE [dbo].[Propietario]
			SET [Nombre] = @InNombre, [NumId] = @InNumIdNuevo, [TipoId] = @InTipoId
			WHERE [ID] = @IdPropietario AND [Activo] = 1

			SET @JSONDespues = (SELECT [ID], [Nombre], [NumId], [TipoId], [FechaInsercion], [Activo] FROM [dbo].[Propietario] WHERE [ID] = @IdPropietario FOR JSON PATH)
	
			EXEC SPICambiosBitacora 5, @IdPropietario, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion

		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la actualizacion del Propietario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropietarioJuridico]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUPropietarioJuridico] 
	@InNumIdViejo varchar(20),
	@InNumIdNuevo varchar(20), 
	@InNombre varchar(100),
	@InTipoId int,
	@InFechaInsercion date,
    @InIDTipoIdResponsable int,
    @InNumIdResponsable varchar(50),
    @InResponsable varchar(100),
	@InIp varchar(20),
	@InNombreUsuario varchar(20)

AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON 
		
		EXEC SPUPropietario @InNombre, @InNumIdViejo, @InNumIdNuevo, @InTipoId, @InFechaInsercion, @InIp, @InNombreUsuario 
		DECLARE @IdPropietario int
		SELECT @IdPropietario = P.ID FROM [dbo].[Propietario] AS P WHERE P.NumId = @InNumIdNuevo

		
		UPDATE [dbo].[PropietarioJuridico]
		SET    [IDTipoIdResponsable] = @InIDTipoIdResponsable, [NumIdResponsable] = @InNumIdResponsable, [Responsable] = @InResponsable
		WHERE  [IDPropietario] = @IdPropietario

		COMMIT 
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la actualizacion de Propietario juridico',1;
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUTipoID]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUTipoID] 
    @ID int,
    @Descripcion varchar(100)
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 
	
		UPDATE [dbo].[TipoID]
		SET    [Descripcion] = @Descripcion
		WHERE  [ID] = @ID AND [Activo] = 1

	END TRY
    BEGIN CATCH
        THROW 70001,'Hubo un error en la actualizacion del Tipo ID',1;
    END CATCH
END
	
GO
/****** Object:  StoredProcedure [dbo].[SPUUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUUsuario]
	@InUsernameViejo varchar(100),
	@InUsernameNuevo varchar(100),
	@InPasswordNueva varchar(100),
	@InFechaInsercion date,
	@InIp varchar(20),
	@InNombreUsuario varchar(20)
AS 

BEGIN
	
	BEGIN TRY
	IF(NOT LEN(@InPasswordNueva) > 0 AND NOT LEN(@InPasswordNueva) > 0  )
		THROW 70002, 'Hubo un error en algun campo y la solicitud no se pudo procesar',1;

		DECLARE @IdUser int, @JSONAntes varchar(500), @JSONDespues varchar(500)

		SELECT @IdUser = U.ID FROM [dbo].[Usuario] AS U WHERE U.Nombre = @InUsernameViejo

		SET @JSONAntes = (SELECT [ID], [Nombre], [Password], [Tipo], [FechaInsercion], [Activo] FROM [dbo].[Usuario] WHERE [ID] = @IdUser FOR JSON PATH)

		BEGIN TRAN

			UPDATE [dbo].[Usuario]
			SET [Nombre] = @InUsernameNuevo, [Password] = @InPasswordNueva
			WHERE [ID] = @IdUser AND [Activo] = 1

			SET @JSONAntes = (SELECT [ID], [Nombre], [Password], [Tipo], [FechaInsercion], [Activo] FROM [dbo].[Usuario] WHERE [ID] = @IdUser FOR JSON PATH)

			EXEC SPICambiosBitacora 3, @IdUser, @JSONAntes, @JSONDespues, @InNombreUsuario, @InIp, @InFechaInsercion
		
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la actualizacion del usuario',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 7/7/2020 9:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPValidarUsuario]
	@InUsuario VARCHAR(100),
	@InContrasena VARCHAR(100)
AS 
BEGIN

	IF(NOT LEN(@InUsuario ) > 0 OR NOT LEN(@InContrasena) > 0 )
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo procesar',1;
	BEGIN TRY
		SELECT [U].[Tipo]
		FROM [dbo].[Usuario] AS U
		WHERE U.[Nombre] = @InUsuario AND U.[Password] = @InContrasena
	END TRY

	 BEGIN CATCH
		THROW 70002, 'Hubo se pudo validar el usuario',1;
	END CATCH
 END
GO
USE [master]
GO
ALTER DATABASE [Municipalidad] SET  READ_WRITE 
GO
