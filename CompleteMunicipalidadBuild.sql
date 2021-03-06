USE [Municipalidad]
GO
/****** Object:  Table [dbo].[CCConsumo]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCConsumo](
	[IDCC] [int] NOT NULL,
	[ValorMetrosCubicos] [real] NOT NULL,
 CONSTRAINT [PK_CCConsumo] PRIMARY KEY CLUSTERED 
(
	[IDCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCFijo]    Script Date: 5/19/2020 2:53:37 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCInteresMoratorio]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCInteresMoratorio](
	[IDCC] [int] NOT NULL,
 CONSTRAINT [PK_CCInteresMoratorio] PRIMARY KEY CLUSTERED 
(
	[IDCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCPorcentaje]    Script Date: 5/19/2020 2:53:37 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCXPropiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[IDCC] [int] NOT NULL,
	[FechaInsercion] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_CCXPropiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	[EsImpuesto] [varchar](2) NULL,
	[Activo] [bit] NULL,
	[Monto] [money] NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NOT NULL,
	[Valor] [real] NOT NULL,
	[Direccion] [varchar](300) NOT NULL,
	[FechaInsercion] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadXPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadXPropietario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPropietario] [int] NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[FechaInsercion] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_PropiedadXPropietario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[NumId] [varchar](20) NOT NULL,
	[TipoId] [int] NOT NULL,
	[FechaInsercion] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Propietarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietarioJuridico](
	[IDPropietario] [int] NOT NULL,
	[IDTipoIdResponsable] [int] NOT NULL,
	[NumIdResponsable] [varchar](50) NOT NULL,
	[Responsable] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PropiedadJuridica] PRIMARY KEY CLUSTERED 
(
	[IDPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoID]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoID](
	[ID] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Tipo] [varchar](100) NULL,
	[FechaInsercion] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXPropiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDPropiedad] [int] NOT NULL,
	[FechaInsercion] [date] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_UsuarioXPropiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[LeerConceptoCobro]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerConceptoCobro]

AS

BEGIN
	BEGIN TRY
		BEGIN TRAN


			DELETE FROM [DBO].[CCFijo]
			DELETE FROM [DBO].[CCConsumo]
			DELETE FROM [DBO].[CCPorcentaje]
			DELETE FROM [DBO].[CCInteresMoratorio]
			DELETE FROM [DBO].[ConceptoCobro]

			DECLARE @tipoID xml
			SELECT @tipoID = C

			FROM OPENROWSET (BULK 'C:\Users\mikom\Desktop\xml\ConceptodeCobro.xml', SINGLE_BLOB) AS TipoId(C)
			SELECT @tipoID
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @tipoID
			INSERT INTO [dbo].[ConceptoCobro] (
				[ID], [Nombre],[DiaCorte],[DiasRestantesVigencia],
				[EsRecurrente],[EsFijo],[TasaInteresMor],[EsImpuesto],[Monto]
			)

			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					id int '@id' ,
					nombre VARCHAR(1000) '@Nombre',
					diaCobro int '@DiaCobro',
					DiasVence int '@QDiasVencimiento',
					EsRecurrente VARCHAR(2) '@EsRecurrente',
					EsFijo VARCHAR(2) '@EsFijo',
					TasaIntMor VARCHAR(2) '@TasaInteresMoratoria',
					Impuesto VARCHAR(2) '@EsImpuesto' ,
					Monto money '@Monto'
					);



			--INSERTS DE TABLAS INTERMEDIAS

			--INSERT CCPORCENTAJE 

			INSERT INTO [dbo].[CCPorcentaje] ([IDCC],[ValorPorcentaje])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					id int '@id',
					valor real '@ValorPorcentaje'
				)
			WHERE valor != '';
			

			--INSERT CCFIJO

			INSERT INTO [dbo].[CCFijo] ([IDCC],[Monto])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					id int '@id',
					valor MONEY '@Monto'
				)
			WHERE valor != 0;
			

			--INSERT CCINTERESMORATORIO 

			/*INSERT INTO [dbo].[CCInteresMoratorio] ([IDCC])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					id int '@id',
					valor VARCHAR(2) '@TasaInteresMoratoria'
				)
			WHERE  != '';
			*/

			PRINT 'ULTIMO INSERT';
			INSERT INTO [dbo].[CCConsumo] ([IDCC],[ValorMetrosCubicos])
			SELECT *
			FROM OPENXML (@hdoc,'Conceptos_de_Cobro/conceptocobro', 1)
				WITH(
					id int '@id',
					valorM3 real '@ValorM3'
				)
			WHERE valorM3 != 0;


			--No contiene el elemento de Activo en parte 1 (alguna de yellow? o así? ValMen? Algotm? Proba?)
			UPDATE [dbo].[ConceptoCobro]
			SET [Activo] = 1;

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los tipos',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[LeerTipoID]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerTipoID]

AS


BEGIN
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM [DBO].[TipoID]
			
			DECLARE @tipoID xml
			SELECT @tipoID = C

			FROM OPENROWSET (BULK 'C:\Users\mikom\Desktop\xml\TipoDocumentoIdentidad.xml', SINGLE_BLOB) AS TipoId(C)
			SELECT @tipoID
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @tipoID

			INSERT INTO [dbo].[TipoID] ([ID], [Descripcion])
			SELECT *
			FROM OPENXML (@hdoc,'TipoDocIdentidad/TipoDocId', 1)
				WITH(codigoDoc VARCHAR(100),
					descripcion VARCHAR(100))

			--No contiene el elemento de Activo en parte 1 (alguna de yellow? o así? Val? Algo? Proba?)
			UPDATE [dbo].[TipoID]
				SET    [Activo] = 1
		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los tipos',1;
	  END CATCH
  END 
GO
/****** Object:  StoredProcedure [dbo].[LeerUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LeerUsuario]

AS
BEGIN
	BEGIN TRY
		BEGIN TRAN			
			DELETE FROM [DBO].[Usuario]

			DECLARE @Usuario xml
			SELECT @Usuario = C
			
			FROM OPENROWSET (BULK 'C:\Users\mikom\Desktop\xml\Administradores.xml', SINGLE_BLOB) AS Usuario(C)
			SELECT @Usuario
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @Usuario

			INSERT INTO [dbo].[Usuario] ([Nombre], [Password])
			SELECT *
			FROM OPENXML (@hdoc,'Administrador/UsuarioAdmi', 1)
				WITH(nombre VARCHAR(100) '@user',
					contrasena VARCHAR(100) '@password')

			--No contiene el elemento de Activo en parte 1 (alguna de yellow? o así? Val? Algo? Proba?)
			UPDATE [dbo].[Usuario]
				SET    [Activo] = 1
		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los Usuarios',1;
	  END CATCH
  END 
  
GO
/****** Object:  StoredProcedure [dbo].[SPDConceptoCobro]    Script Date: 5/19/2020 2:53:37 PM ******/
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

		UPDATE [dbo].[ConceptoCobro]
		SET [Activo] = 0   
		WHERE  [ID] = @InID

		UPDATE [dbo].[CCXPropiedad]
		SET [Activo] = 0
		WHERE [IDCC] = @InID

		COMMIT
		END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END


	
GO
/****** Object:  StoredProcedure [dbo].[SPDPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDPropiedad]
	@InID int
AS

BEGIN
	BEGIN TRY
		BEGIN TRAN

			UPDATE [dbo].[Propiedad] 
			SET Activo = 0
			WHERE [ID]=@InID
	
			UPDATE [dbo].[PropiedadXPropietario] 
			SET Activo = 0
			WHERE [IDPropiedad] = @InID

			UPDATE [dbo].[UsuarioXPropiedad] 
			SET Activo = 0
			WHERE [IDPropiedad] = @InID

			UPDATE [dbo].[CCXPropiedad] 
			SET Activo = 0
			WHERE [IDPropiedad]= @InID

		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPDPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDPropietario]
	@InID int
AS

BEGIN
	BEGIN TRY
		BEGIN TRAN
			UPDATE [dbo].[Propietario] 
			SET Activo = 0
			WHERE [ID]=@InID

			UPDATE [dbo].[PropiedadXPropietario] 
			SET Activo = 0
			WHERE [ID]=@InID

		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		THROW
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPDTipoID]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPDTipoID] 
    @InID int
AS 

BEGIN
	BEGIN TRY

		UPDATE [dbo].[TipoID]
		SET [Activo] = 0 
		WHERE  [ID] = @InID

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END


		
GO
/****** Object:  StoredProcedure [dbo].[SPDUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDUsuario]
	@InID int
AS

BEGIN
	BEGIN TRY
		BEGIN TRAN 

			UPDATE [dbo].[Usuario] 
			SET Activo = 0
			WHERE [ID]=@InID

			UPDATE [dbo].[UsuarioXPropiedad] 
			SET Activo = 0
			WHERE [IDUsuario] = @InID

		COMMIT
	END TRY  
	BEGIN CATCH  
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[SPICCConsumo]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	@InValorMetrosCubicos real 
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON
	
		exec SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente
		INSERT INTO [dbo].[CCConsumo] ([IDCC], [ValorMetrosCubicos])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')), @InValorMetrosCubicos)  
		
		COMMIT		
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END



	
GO
/****** Object:  StoredProcedure [dbo].[SPICCFijo]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	@InMonto money 
AS 

BEGIN
	BEGIN TRY	 
		BEGIN TRAN
		 SET NOCOUNT ON
	
		exec SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente
		INSERT INTO [dbo].[CCFijo] ([IDCC],[Monto])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')), @InMonto)  
	
		COMMIT
		END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1; 
	END CATCH
END

	
GO
/****** Object:  StoredProcedure [dbo].[SPICCInteresMoratorio]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	@InEsRecurrente varchar(2)
	-- Introducir el paramentro que corresponda @
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

		exec SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente
		INSERT INTO [dbo].[CCInteresMoratorio] ([IDCC])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')))  
		
		COMMIT
		END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END


	
GO
/****** Object:  StoredProcedure [dbo].[SPICCPorcentaje]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	@InValorPorcentaje real
AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON
	
		exec SPIConceptoCobro @InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente
		INSERT INTO [dbo].[CCPorcentaje] ([IDCC],[ValorPorcentaje])
		Values ((SELECT IDENT_CURRENT('ConceptoCobro')), @InValorPorcentaje)  
	
		COMMIT
		END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END



	
GO
/****** Object:  StoredProcedure [dbo].[SPICCXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPICCXPropiedad]
	@InNumFinca int,
    @InIDCC int,
	@InFechaInsercion date

AS 

BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

		DECLARE @idPropiedad int															
		SELECT @idPropiedad = P.ID FROM [dbo].Propiedad as P WHERE P.NumFinca = @InNumFinca --OBTENER EL IDPropiedad CON EL NumFinca
		
		IF (@idPropiedad is null)
		THROW 70001,'No existe la propiedad ingresada',1;


		INSERT INTO [dbo].[CCXPropiedad] ([IDPropiedad], [IDCC], [FechaInsercion], [Activo])
		VALUES (@idPropiedad, @InIDCC, @InFechaInsercion, 1)
	
	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPIConceptoCobro]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	@InEsRecurrente varchar(2)
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON
		
		INSERT INTO [dbo].[ConceptoCobro] ([ID], [Nombre], [TasaInteresMor], [DiasRestantesVigencia], [DiaCorte], [EsFijo], [EsRecurrente], [Activo] )
		Values (@InId, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente, 1)       
		
		END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END


	
GO
/****** Object:  StoredProcedure [dbo].[SPIPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIPropiedad]
	@InNumFinca int,
	@InValor int,
	@InDireccion varchar(300),
	@InFechaInsercion date

AS

BEGIN
	
	IF (@InNumFinca < 0 OR @InNumFinca IS NULL  OR  @InValor < 0 OR @InValor IS NULL) 
		THROW 70001, 'No se permiten valores vacíos' , 1;
	IF(NOT LEN(@InDireccion ) > 0)
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo porcesar',1;
	
	BEGIN TRY  
	SET NOCOUNT ON

		INSERT INTO [dbo].[Propiedad]([NumFinca], [Valor], [Direccion], [FechaInsercion], [Activo])
		Values(@InNumFinca, @InValor, @InDireccion,@InFechaInsercion, 1);

	END TRY  

	BEGIN CATCH 
		THROW 70003,'Hubo un error procesando la solicitud, revise los campos',1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropiedadXPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIPropiedadXPropietario] 
	@InNumFinca int,
	@InNumCedula varchar(20) 
    
AS 
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 	
		BEGIN TRAN

		DECLARE @IDPropietario int
		DECLARE @IDPropiedad int

		SELECT @IDPropietario = Prop.ID FROM [dbo].[Propietario] as Prop WHERE Prop.NumId = @InNumCedula   
		SELECT @IDPropiedad = P.ID FROM [dbo].[Propiedad] as P WHERE P.NumFinca = @InNumFinca

		IF (@IDPropietario is null or @IDPropiedad is null)
		THROW 70001,'El Numero de cedula o el numero de finca no existe',1;

		INSERT INTO [dbo].[PropiedadXPropietario] ([IDPropietario], [IDPropiedad])
		SELECT @IDPropietario, @IDPropiedad
	
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
          
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIPropietario]
@InNombre varchar(300),
@InNumId varchar(20),
@InTipoId int,
@InFechaInsercion date

AS

BEGIN

	DECLARE @maxTipoId int 
	SELECT @maxTipoId = MAX(ID) FROM [dbo].TipoID

	IF(@InTipoId > @maxTipoId)
		THROW 70001, 'Error en el tipoID, el valor es muy alto, no se pudo porcesar' , 1;		
	IF (@InTipoId < 0) 
		THROW 70001, 'Hubo un campo vacío o erroneo y la solicitud no se pudo porcesar' , 1;
	IF(NOT LEN(@InNombre ) > 0 OR NOT LEN(@InNumId ) > 0 )
		THROW 70002, 'Hubo un campo vacío o erroneo y la solicitud no se pudo porcesar',1;
	

	BEGIN TRY
		SET NOCOUNT ON

		INSERT INTO [dbo].[Propietario](Nombre, NumId,TipoId,FechaInsercion,Activo)
			Values(@InNombre, @InNumId,@InTipoId,@InFechaInsercion,1);
	
	END TRY  

	BEGIN CATCH  
		THROW 70001, 'Hubo un error y la solicitud no se pudo porcesar',1;

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropietarioJuridico]    Script Date: 5/19/2020 2:53:37 PM ******/
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
    @InNumIdResponsable varchar(50),
    @InResponsable varchar(100)
AS 
BEGIN

	IF(LEN(@InNumId) > 0 OR NOT LEN(@InNombre)>0 OR NOT LEN(@InNumIdResponsable)>0 OR NOT LEN(@InResponsable)>0) 
		THROW 70002,'Hay campos vacíos',1;

	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON 

		exec [dbo].[SPIPropietario] @InNombre, @InNumId, @InTipoId, @InFechaInsercion
		INSERT INTO [dbo].[PropietarioJuridico] ([IDPropietario],[IDTipoIdResponsable], [NumIdResponsable], [Responsable])
		Values ((SELECT IDENT_CURRENT('Propietario')), @InIDTipoIdResponsable, @InNumIdResponsable,@InResponsable)     
		
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPITipoID]    Script Date: 5/19/2020 2:53:37 PM ******/
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
	VALUES( @InID, @InDescripcion)

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIUsuario]
	@InNombre varchar(100),
	@InPassword varchar(100)
AS

BEGIN 
	BEGIN TRY
	INSERT INTO [dbo].[Usuario](Nombre, Password, Activo) 
	Values(@InNombre, @InPassword,1)

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuarioXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIUsuarioXPropiedad] 
	@InUserName varchar(100),
	@InNumFinca int
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON 

		DECLARE @IDUsuario int
		DECLARE @IDPropiedad int

		SELECT @IDUsuario = U.ID FROM [dbo].[Usuario] as U WHERE U.Nombre = @InUserName
		SELECT @IDPropiedad = P.ID FROM [dbo].Propiedad as P WHERE P.NumFinca = @InNumFinca

		INSERT INTO [dbo].[UsuarioXPropiedad] ([IDUsuario], [IDPropiedad])
		VALUES (@IDUsuario, @IDPropiedad)

		COMMIT
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN;
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCConsumo]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCConsumo] 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

	SELECT ConcpC.[ID], ConcpC.[Nombre], ConcpC.[TasaInteresMor], ConcpC.[DiasRestantesVigencia], ConcpC.[DiaCorte], ConcpC.[EsFijo], ConcpC.[EsRecurrente], CCC.[ValorMetrosCubicos]
	FROM [dbo].[ConceptoCobro] as ConcpC INNER JOIN [dbo].[CCConsumo] as CCC on ConcpC.ID = CCC.IDCC 
	WHERE ConcpC.Activo = 1
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCFijo]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCFijo] 

AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON   

		SELECT ConcpC.[ID], ConcpC.[Nombre], ConcpC.[TasaInteresMor], ConcpC.[DiasRestantesVigencia], ConcpC.[DiaCorte], ConcpC.[EsFijo], ConcpC.[EsRecurrente], CCF.[Monto]
		FROM   [dbo].[ConceptoCobro] as ConcpC INNER JOIN [dbo].[CCFijo] as CCF on ConcpC.ID = CCF.IDCC 
		WHERE ConcpC.Activo = 1
	END TRY
		 
	BEGIN CATCH 
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSCCPorcentaje]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCPorcentaje] 

AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		SELECT ConcpC.[ID], ConcpC.[Nombre], ConcpC.[TasaInteresMor], ConcpC.[DiasRestantesVigencia], ConcpC.[DiaCorte], ConcpC.[EsFijo], ConcpC.[EsRecurrente], CCP.[ValorPorcentaje]
		FROM   [dbo].[ConceptoCobro] as ConcpC INNER JOIN [dbo].[CCPorcentaje] as CCP on ConcpC.ID = CCP.IDCC 
		WHERE ConcpC.Activo = 1
	END TRY
	BEGIN CATCH 
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END 
GO
/****** Object:  StoredProcedure [dbo].[SPSCCXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCXPropiedad] 
AS 

BEGIN 
	BEGIN TRY
	SET NOCOUNT ON 

	SELECT [ID], [IDPropiedad], [IDCC] 
	FROM   [dbo].[CCXPropiedad] 
	WHERE [CCXPropiedad].Activo = 1
	
	END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[SPSCCXPropiedadPorNumFinca]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSCCXPropiedadPorNumFinca] 
	@NumFinca int 
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 

		SELECT P.NumFinca , P.Valor, P.Direccion, CCXP.IDCC, CC.Nombre 
		FROM   [dbo].[CCXPropiedad] as CCXP 
		INNER JOIN [dbo].[Propiedad] as P on CCXP.IDPropiedad = P.ID 
		INNER JOIN [dbo].[ConceptoCobro] as CC on CC.ID = CCXP.IDCC
		WHERE P.NumFinca = @NumFinca AND CCXP.Activo = 1 AND P.Activo = 1 AND CC.Activo = 1  

	END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSPropiedad]
AS

BEGIN
	BEGIN TRY
		SET NOCOUNT ON 

		SELECT [ID], [NumFinca], [Valor], [Direccion]
		FROM [dbo].[Propiedad]
		WHERE [Activo] = 1

	END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadesPorPropietario] 
    @InNumCedula int
AS 
BEGIN
	SET NOCOUNT ON  
	BEGIN TRY

		SELECT P.numFinca, P.valor, P.direccion 
		FROM   [dbo].[Propiedad] as P 
		INNER JOIN [PropiedadXPropietario] AS PXP ON P.ID = PXP.IDPropiedad 
		INNER JOIN [Propietario] as Prop ON Prop.ID = PXP.IDPropietario 
		WHERE Prop.NumId = @InNumCedula AND PXP.Activo = 1 AND P.Activo = 1 AND Prop.Activo = 1 
	END TRY

	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
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
		THROW
	END CATCH 

END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadPorNumFinca]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadPorNumFinca]
	@InNumFinca int
AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		SELECT [ID], [NumFinca], [Valor], [Direccion]
		FROM [dbo].[Propiedad]
		WHERE [NumFinca] LIKE '%'+cast(@InNumFinca as varchar(300))+'%'
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadXPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
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

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSPropietario]
AS

BEGIN
	BEGIN TRY
	SET NOCOUNT ON

	SELECT [ID], [Nombre], [NumId], [TipoId]
		FROM [dbo].[Propietario]
		WHERE Activo=1;

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1; 
	END CATCH
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietarioJuridico]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietarioJuridico] 
AS 
	
BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

		SELECT [ID], [Nombre], [NumId] 
		FROM   [dbo].[Propietario]
		WHERE  TipoId = 4 

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietarioPorNumId]    Script Date: 5/19/2020 2:53:37 PM ******/
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
		SELECT [ID], [Nombre], [NumId], [TipoID]
		FROM [dbo].[Propietario]
		WHERE NumId LIKE '%'+cast(@InNumId as varchar(100))+'%' AND Activo = 1 

	END TRY 
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietariosPorPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietariosPorPropiedad] 
    @InNumFinca int
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
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSResponsable]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSResponsable] 
	@ID int
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 

		SELECT [IDTipoIdResponsable], [NumIdResponsable], [Responsable]
		FROM   [dbo].[PropietarioJuridico]
		WHERE @ID = [IDPropietario]
	END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSTipoID]    Script Date: 5/19/2020 2:53:37 PM ******/
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
		THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPSUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSUsuario]
AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON

		SELECT [ID], [Nombre], [Password]
		FROM [dbo].[Usuario]
		WHERE Activo = 1;
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuarioPorNombre]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuarioPorNombre]
	@InNombre varchar(100)
AS
BEGIN 
	BEGIN TRY
	SET NOCOUNT ON

		SELECT [ID], [Nombre], [Password]
		FROM [dbo].[Usuario]
		WHERE Nombre LIKE '%'+@InNombre+'%' AND Activo = 1

	END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuariosPorPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuariosPorPropiedad] 
	@InNumFinca int
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
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuarioXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
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
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END

	
GO
/****** Object:  StoredProcedure [dbo].[SPUCCConsumo]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUCCConsumo] 

    @InIDCC int,
    @InValorMetrosCubicos real,
    @InNombre varchar(100),
    @InTasaInteresMor varchar(2),
    @InDiasRestantesVigencia int,
    @InDiaCorte int,
    @InEsFijo varchar(2),
    @InEsRecurrente varchar(2)
AS 

BEGIN 
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON  
		
		exec SPUConceptoCobro @InIDCC, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente   
		UPDATE [dbo].[CCConsumo]
		SET    [ValorMetrosCubicos] = @InValorMetrosCubicos
		WHERE  [IDCC] = @InIDCC
		
		COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;
			THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUCCFijo]    Script Date: 5/19/2020 2:53:37 PM ******/
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
    @InEsRecurrente varchar(2)

AS 

BEGIN 
	BEGIN TRY 
		BEGIN TRAN
		SET NOCOUNT ON  
	
		exec SPUConceptoCobro  @InIDCC, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente 
		UPDATE [dbo].[CCFijo]
		SET    [Monto] = @InMonto
		WHERE  [IDCC] = @InIDCC
	
		COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;
			THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUCCPorcentaje]    Script Date: 5/19/2020 2:53:37 PM ******/
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
    @InEsRecurrente varchar(2)
AS 
	 
BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

		exec SPUConceptoCobro @InIDCC, @InNombre, @InTasaInteresMor, @InDiasRestantesVigencia, @InDiaCorte, @InEsFijo, @InEsRecurrente
		UPDATE [dbo].[CCPorcentaje]
		SET    [ValorPorcentaje] = @InValorPorcentaje
		WHERE  [IDCC] = @InIDCC

		COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;
			THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUCCXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUCCXPropiedad] 
    @InNumFinca int,
    @InIDCC int

AS 

BEGIN 
	BEGIN TRY 
		BEGIN TRAN 
		SET NOCOUNT ON

		DECLARE @IdPropiedad int
		DECLARE @IdCCXP int
		
		SELECT @IdPropiedad = Prop.ID FROM [dbo].[Propiedad] AS Prop WHERE Prop.NumFinca = @InNumFinca
		SELECT @IdCCXP = CCXP.ID FROM [dbo].[CCXPropiedad] AS CCXP WHERE CCXP.IDPropiedad = @IdPropiedad AND CCXP.IDCC = @InIDCC

		UPDATE [dbo].[CCXPropiedad]
		SET    [IDPropiedad] = @IDPropiedad, [IDCC] = @InIDCC
		WHERE  [ID] = @IdCCXP AND [Activo] = 1
		
		COMMIT
		END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
		

GO
/****** Object:  StoredProcedure [dbo].[SPUConceptoCobro]    Script Date: 5/19/2020 2:53:37 PM ******/
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
    @InEsRecurrente varchar(2)
AS 

BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 

	UPDATE [dbo].[ConceptoCobro]
	SET    [Nombre] = @InNombre, [TasaInteresMor] = @InTasaInteresMor, [DiasRestantesVigencia] = @InDiasRestantesVigencia, [DiaCorte] = @InDiaCorte, [EsFijo] = @InEsFijo, [EsRecurrente] = @InEsRecurrente
	WHERE  [ID] = @InID AND [Activo] = 1

	END TRY
    BEGIN CATCH
      THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUPropiedad]
	@InID int,
	@InNumFinca int,
	@InValor int,
	@InDireccion varchar(300)
AS 

BEGIN
	IF(NOT LEN(@InDireccion ) > 0 ) --si los tipos son dif agregue ESTO --> OR NOT LEN(@ ) > 0)
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo porcesar',1;
	BEGIN TRY 

	UPDATE [dbo].[Propiedad]
	SET [NumFinca] = @InNumFinca, [Valor] = @InValor, [Direccion] = @InDireccion
	WHERE [ID] = @InID

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropiedadXPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUPropiedadXPropietario] 
	@InNumFinca int, 
	@InNumCedula varchar(20)
AS 
	 
BEGIN 
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON

		DECLARE @IdPropietario int  
		DECLARE @IdPropiedad int
		DECLARE @IdPXP int

		SELECT @IdPropietario = P.ID FROM [dbo].[Propietario] AS P WHERE P.NumId = @InNumCedula
		SELECT @IdPropiedad = Pr.ID FROM [dbo].[Propiedad] AS Pr WHERE Pr.NumFinca = @InNumFinca
		SELECT @IdPXP = PXP.ID FROM [dbo].[PropiedadXPropietario] AS PXP WHERE PXP.IDPropiedad = @IdPropiedad AND PXP.IDPropietario = @IdPropietario

		UPDATE [dbo].[PropiedadXPropietario]
		SET    [IDPropietario] = @IdPropietario, [IDPropiedad] = @IdPropiedad
		WHERE  [ID] = @IdPXP AND [Activo] = 1
	
		END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropietario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUPropietario]
	@InID int,
	@InNombre varchar(100),
	@InNumId int,
	@InTipoId int
AS 
BEGIN
	IF(NOT LEN(@InNombre) > 0 )
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo porcesar',1;
	BEGIN TRY
		UPDATE [dbo].[Propietario]
		SET [Nombre] = @InNombre, [NumId] = @InNumId, [TipoId] = @InTipoId
		WHERE [ID] = @InID AND [Activo] = 1

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropietarioJuridico]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUPropietarioJuridico] 
    @InIDPropietario int,
    @InIDTipoIdResponsable int,
    @InNumIdResponsable varchar(50),
    @InResponsable varchar(100),
	@InNombre varchar(100),
	@InNumId int,
	@InTipoId int
AS 

BEGIN
	BEGIN TRY
	SET NOCOUNT ON 

	exec SPUPropietario @InIDPropietario, @InNombre, @InNumId, @InTipoId 
	UPDATE [dbo].[PropietarioJuridico]
	SET    [IDTipoIdResponsable] = @InIDTipoIdResponsable, [NumIdResponsable] = @InNumIdResponsable, [Responsable] = @InResponsable
	WHERE  [IDPropietario] = @InIDPropietario

	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUTipoID]    Script Date: 5/19/2020 2:53:37 PM ******/
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
        THROW 70001,'Hubo un error en la transaccion',1;
    END CATCH
END
	
GO
/****** Object:  StoredProcedure [dbo].[SPUUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUUsuario]
	@InID int,
	@InNombre varchar(100),
	@InPassword varchar(100)
AS 

BEGIN
	BEGIN TRY

		UPDATE [dbo].[Usuario]
		SET [Nombre] = @InNombre, [Password] = @InPassword
		WHERE [ID] = @InID AND [Activo] = 1
	
	END TRY
	BEGIN CATCH
		THROW 70001,'Hubo un error en la transaccion',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPUUsuarioXPropiedad]    Script Date: 5/19/2020 2:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUUsuarioXPropiedad] 
    @ID int,
    @IDUsuario int,
    @IDPropiedad int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[UsuarioXPropiedad]
	SET    [IDUsuario] = @IDUsuario, [IDPropiedad] = @IDPropiedad
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [IDUsuario], [IDPropiedad]
	FROM   [dbo].[UsuarioXPropiedad]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 5/19/2020 2:53:37 PM ******/
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
		THROW 70002, 'Hubo un campo vacío y la solicitud no se pudo porcesar',1;
	BEGIN TRY
	SELECT Nombre,Password
	  FROM [dbo].[Usuario]
	 WHERE Nombre=@Incontrasena AND Password=@InUsuario
	 END TRY

	 BEGIN CATCH
		THROW
	END CATCH
 END

GO
