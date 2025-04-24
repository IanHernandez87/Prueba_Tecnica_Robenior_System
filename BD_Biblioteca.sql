CREATE DATABASE DB_Biblioteca;
GO

USE DB_Biblioteca;
GO

-- Crear esquemas
CREATE SCHEMA acce;
GO

CREATE SCHEMA gene;
GO

CREATE TABLE acce.Roles (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(100) UNIQUE NOT NULL,
    Habilitado BIT NOT NULL DEFAULT 1,
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_acce_Roles_Id PRIMARY KEY (Id)
);
GO

CREATE TABLE acce.Pantallas (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Url NVARCHAR(300) NOT NULL,
    Menu NVARCHAR(300) NOT NULL,
    Icono NVARCHAR(300) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_acce_Pantallas_Id PRIMARY KEY (Id)
);
GO

CREATE TABLE acce.PantallasPorRol (
    Id INT IDENTITY(1,1),
    RolId INT NOT NULL,
    PantallaId INT NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_acce_PantallasPorRol_Id PRIMARY KEY (Id),
    CONSTRAINT FK_acce_PantallasPorRol_Rol FOREIGN KEY (RolId) REFERENCES acce.Roles(Id),
    CONSTRAINT FK_acce_PantallasPorRol_Pantalla FOREIGN KEY (PantallaId) REFERENCES acce.Pantallas(Id)
);
GO

CREATE TABLE acce.Usuarios (
    Id INT IDENTITY(1,1),
    NombreUsuario NVARCHAR(100) NOT NULL,
    Contrasena NVARCHAR(255) NOT NULL,
    EsAdmin BIT DEFAULT 0,
    RolId INT,
    UrlFoto NVARCHAR(500),
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_acce_Usuarios_Id PRIMARY KEY (Id),
    CONSTRAINT FK_acce_Usuarios_Rol FOREIGN KEY (RolId) REFERENCES acce.Roles(Id)
);
GO

CREATE TABLE gene.Clientes (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Telefono NVARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT PK_gene_Clientes_Id PRIMARY KEY (Id)
);
GO

CREATE TABLE gene.Productos (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL UNIQUE,
    PrecioCompra DECIMAL(10,2) NOT NULL,
    PrecioVenta DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_gene_Productos_Id PRIMARY KEY (Id)
);
GO
