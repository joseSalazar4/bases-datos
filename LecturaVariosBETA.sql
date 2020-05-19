USE [Municipalidad]
GO
/****** Object:  StoredProcedure [dbo].[LeerConceptoCobro]    Script Date: 5/18/2020 10:09:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LeerVarios]

AS

BEGIN
	BEGIN TRY
		BEGIN TRAN
			DECLARE @tipoID xml
			SELECT @tipoID = C	

			FROM OPENROWSET (BULK 'C:\Users\mikom\Desktop\xml\varios.xml', SINGLE_BLOB) AS TipoId(C)
			SELECT @tipoID	
			DECLARE @hdoc int

			EXEC sp_xml_preparedocument @hdoc OUTPUT, @tipoID


			--INSERT PROPIEDAD

			INSERT INTO [dbo].[Propiedad] (
				[NumFinca],[Valor],[Direccion],[FechaInsercion]
			)

			SELECT NumFinca,valor,direccion,convert(datetime, orderdate, 103) [orderdate]
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(
					NumFinca int 'Propiedad/@NumFinca' ,
					Valor  money 'Propiedad/@Valor',
					Direccion VARCHAR(300) 'Propiedad/@Direccion'	,
					[orderdate] VARCHAR (40)'Dia/@fecha'
					);



			--INSERT DE PROPIETARIOS

			INSERT INTO [dbo].[Propietario] (
				[Nombre],[NumId],[TipoId],[FechaInsercion]
			)

			SELECT *
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(
					Nombre VARCHAR(100) 'Propietario/@Nombre' ,
					identi  VARCHAR(100) 'Propietario/@identificacion',
					tipo int 'Propietario/@TipoDocIdentidad',
					Fecha date 'Dia/@fecha'
			);



			--INSERT DE USUARIOS
			
			INSERT INTO [dbo].[Usuario]      ([Nombre],
					[Password],[FechaInsercion])
			SELECT nombre, contra ,convert(datetime, orderdate, 103) [orderdate]
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(nombre VARCHAR(100) '@user',
					contrasena VARCHAR(100) '@password',
					[orderdate] date 'Dia/@fecha'
				);




			---------------------------------
			--INSERTS DE TABLAS INTERMEDIAS--
			---------------------------------

			--INSERT DE PROPIETARIOS de una PROPIEDAD

			INSERT INTO [dbo].[PropiedadXPropietario]   ([IDPropiedad],[IDPropietario],[FechaInsercion])

			SELECT *
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(
					Num int 'PropiedadVersusPropietario/@NumFinca' ,
					identi  int 'PropiedadVersusPropietario/@identificacion',
					Fecha date 'Dia/@fecha'
				);



			--INSERT DE PROPIETARIOS

			INSERT INTO [dbo].[PropietarioJuridico]   ([IDTipoIdResponsable],[NumIdResponsable],[Responsable])

			SELECT *
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(
					tipoID int 'PropiedadVersusPropietario/@NumFinca' ,
					Tipo  int 'PropiedadVersusPropietario/@identificacion',
					Fecha varchar 'Dia/@fecha'
				);


			--INSERT DE USUARIOS por PROPIEDAD


			INSERT INTO [dbo].[UsuarioXPropiedad]   ([IDPropiedad],[IDUsuario],[FechaInsercion])

			SELECT *
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(
					Num int 'PropiedadVersusPropietario/@NumFinca' ,
					identi  int 'PropiedadVersusPropietario/@identificacion',
					Fecha varchar 'Dia/@fecha'
				);


			--INSERT DE CC POR PROPIEDADAES

			INSERT INTO [dbo].[CCXPropiedad]   ([IDCC],[FechaInsercion],[IDPropiedad])

			SELECT *
			FROM OPENXML (@hdoc,'Operaciones_por_Dia/OperacionDia', 1)
				WITH(
					Num int 'PropiedadVersusPropietario/@NumFinca' ,
					identi  int 'PropiedadVersusPropietario/@identificacion',
					Fecha date 'Dia/@fecha'
				);
			 

			 /*ACÁ VAN TODOS LOS UPDATES DONDE TENEMOS QUE SETTEAR ACTIVO A 1 
			 Y ES SOLAMENTE HACER LO MISMO PARA CADA TABLA*/
			 UPDATE [Usuario]
			 SET Activo = 1;

		COMMIT
	  END TRY

	  BEGIN CATCH 
		ROLLBACK;
		THROW 70001,'Error en la insercion de los tipos',1;
	  END CATCH
  END 