USE [Municipalidad]
GO
/****** Object:  StoredProcedure [dbo].[SPDPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDPropiedad]
@ID int
AS
BEGIN
	DELETE FROM Propiedad WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SPDPropiedadXPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPDPropiedadXPropietario] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[PropiedadXPropietario]
	WHERE  [ID] = @ID

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPDPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDPropietario]
@ID int
AS
BEGIN
	DELETE FROM Propietario WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SPDTipoID]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPDTipoID] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[TipoID]
	WHERE  [ID] = @ID

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPDUsuario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPDUsuario]
@ID int
AS
BEGIN
	DELETE FROM Usuario WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SPDUsuarioXPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPDUsuarioXPropiedad] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[UsuarioXPropiedad]
	WHERE  [ID] = @ID

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPIPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIPropiedad]
@NumFinca int,
@Valor int,
@Direccion varchar(300)
AS
BEGIN 
	INSERT INTO Propiedad(NumFinca, Valor, Direccion)
						Values(@NumFinca, @Valor, @Direccion);
END
GO
/****** Object:  StoredProcedure [dbo].[SPIPropiedadXPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIPropiedadXPropietario] 
    @IDPropietario int,
    @IDPropiedad int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[PropiedadXPropietario] ([IDPropietario], [IDPropiedad])
	SELECT @IDPropietario, @IDPropiedad
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [IDPropietario], [IDPropiedad]
	FROM   [dbo].[PropiedadXPropietario]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPIPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SPIPropietario]
@Nombre varchar(100),
@NumId int,
@TipoId int
AS
BEGIN 
	INSERT INTO Propietario(Nombre, NumId,TipoId)
						Values(@Nombre, @NumId,@TipoId);
END
GO
/****** Object:  StoredProcedure [dbo].[SPITipoID]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPITipoID] 
    @ID int,
    @Descripcion varchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[TipoID] ([ID], [Descripcion])
	SELECT @ID, @Descripcion
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Descripcion]
	FROM   [dbo].[TipoID]
	WHERE  [ID] = @ID
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SPIUsuario]
@Nombre varchar(100),
@Password varchar(100)
AS
BEGIN 
	INSERT INTO Usuario(Nombre, Password)
						Values(@Nombre, @Password);
END
GO
/****** Object:  StoredProcedure [dbo].[SPIUsuarioXPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPIUsuarioXPropiedad] 
    @ID int,
    @IDUsuario int,
    @IDPropiedad int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UsuarioXPropiedad] ([ID], [IDUsuario], [IDPropiedad])
	SELECT @ID, @IDUsuario, @IDPropiedad
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [IDUsuario], [IDPropiedad]
	FROM   [dbo].[UsuarioXPropiedad]
	WHERE  [ID] = @ID
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSPropiedad]
AS
BEGIN
	SELECT ID,
			NumFinca,
			Valor,
			Direccion
	FROM Propiedad
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadesPorPropietario] 
    @numCedula int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT P.numFinca, P.valor, P.direccion 
	FROM   Propiedad as P INNER JOIN PropiedadXPropietario AS PXP ON P.ID = PXP.IDPropiedad INNER JOIN Propietario ON Propietario.ID = PXP.IDPropietario 
	WHERE Propietario.NumId = @numCedula
	
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadesPorUsuario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadesPorUsuario] 
	
	@username varchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT P.NumFinca, P.Valor, P.Direccion 
	FROM   Propiedad as P INNER JOIN UsuarioXPropiedad AS UXP ON P.ID = UXP.IDPropiedad INNER JOIN Usuario ON Usuario.ID = UXP.IDUsuario 
	WHERE Usuario.Nombre = @username
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadPorNumFinca]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadPorNumFinca]
@NumFinca int
AS
BEGIN 
	SELECT 
	ID,
	NumFinca,
			Valor,
			Direccion
	FROM Propiedad
	WHERE NumFinca LIKE '%'+cast(@NumFinca as varchar(100))+'%'
END
ROLLBACK
GO
/****** Object:  StoredProcedure [dbo].[SPSPropiedadXPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropiedadXPropietario] 

AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDPropietario], [IDPropiedad] 
	FROM   [dbo].[PropiedadXPropietario] 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSPropietario]
AS
BEGIN
	SELECT ID,
			Nombre,
			NumId,
			TipoId
	FROM Propietario
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietarioPorNumId]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietarioPorNumId]
@NumId int
AS
BEGIN 
	SELECT ID,
	Nombre,
		NumId,
		TipoId
	FROM Propietario
	WHERE NumId LIKE '%'+cast(@NumId as varchar(100))+'%'
END
ROLLBACK
GO
/****** Object:  StoredProcedure [dbo].[SPSPropietariosPorPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSPropietariosPorPropiedad] 
    @numFinca int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT P.NumId, P.Nombre, P.TipoId 
	FROM   Propietario as P INNER JOIN PropiedadXPropietario AS PXP ON P.ID = PXP.IDPropietario INNER JOIN Propiedad ON Propiedad.ID = PXP.IDPropiedad 
	WHERE Propiedad.NumFinca = @numFinca

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[SPSTipoID]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSTipoID] 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN 

	SELECT [ID], [Descripcion] 
	FROM   [dbo].[TipoID] 

	END 

GO
/****** Object:  StoredProcedure [dbo].[SPSUsuario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPSUsuario]
AS
BEGIN
	SELECT ID,
			Nombre,
			Password
	FROM Usuario
END
			
			
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuarioPorNombre]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuarioPorNombre]
@Nombre varchar(100)
AS
BEGIN 
	SELECT ID,
			Nombre,
			Password
	FROM Usuario
	WHERE Nombre LIKE '%'+@Nombre+'%'
END
ROLLBACK
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuariosPorPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuariosPorPropiedad] 
	
	@numFinca int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT U.Nombre, U.Password 
	FROM   Usuario as U INNER JOIN UsuarioXPropiedad AS UXP ON U.ID = UXP.IDUsuario INNER JOIN Propiedad ON Propiedad.ID = UXP.IDPropiedad 
	WHERE Propiedad.NumFinca = @numFinca

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPSUsuarioXPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPSUsuarioXPropiedad] 
 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDUsuario], [IDPropiedad] 
	FROM   [dbo].[UsuarioXPropiedad] 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPUPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUPropiedad]
@ID int,
@NumFinca int,
@Valor int,
@Direccion varchar(300)
AS 
BEGIN
UPDATE Propiedad
	SET NumFinca=@NumFinca,
		Valor=@Valor,
		Direccion=@Direccion
	WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SPUPropiedadXPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUPropiedadXPropietario] 
    @ID int,
    @IDPropietario int,
    @IDPropiedad int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[PropiedadXPropietario]
	SET    [IDPropietario] = @IDPropietario, [IDPropiedad] = @IDPropiedad
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [IDPropietario], [IDPropiedad]
	FROM   [dbo].[PropiedadXPropietario]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPUPropietario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUPropietario]
@ID int,
@Nombre VARCHAR(100),
@NumId int,
@TipoId int
AS 
BEGIN
UPDATE Propietario
	SET Nombre=@Nombre,
		NumId=@NumId,
		TipoId=@TipoId
	WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SPUTipoID]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPUTipoID] 
    @ID int,
    @Descripcion varchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[TipoID]
	SET    [Descripcion] = @Descripcion
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Descripcion]
	FROM   [dbo].[TipoID]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SPUUsuario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUUsuario]
@ID int,
@Nombre VARCHAR(100),
@Password VARCHAR(100)
AS 
BEGIN
UPDATE Usuario
	SET Nombre=@Nombre,
		Password=@Password
	WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SPUUsuarioXPropiedad]    Script Date: 4/3/2020 2:32:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 4/3/2020 2:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPValidarUsuario]
@usuario VARCHAR(20),
@contrasena VARCHAR(20)
AS BEGIN
SELECT Nombre,Password
  FROM Usuario
 WHERE Nombre=@usuario AND Password=@contrasena
 END

GO
