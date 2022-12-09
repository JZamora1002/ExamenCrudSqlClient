TRUNCATE TABLE Usuario
INSERT INTO Usuario (Nombre, FechaDeNacimiento, NumeroDeTelefono, Email, UserName, ApellidoPaterno, ApellidoMaterno, [Password], Sexo, Celular, CURP, IdRol) VALUES ('Javier','10-19-2002','5589756862','finaaldestiny@gmail.com','Finaldestiny09','Zamora', 'García', 'qwerty123', 'H','5574915053', 'ZAGJ021019HDFMRVA7',1)
INSERT INTO Usuario (Nombre, FechaDeNacimiento, NumeroDeTelefono, Email, UserName, ApellidoPaterno, ApellidoMaterno, [Password], Sexo, Celular, CURP, IdRol) VALUES ('Diana','11-22-2002','5510569987','dk.reyna.h@edu.utc.mx','xTOXICAx65','Reyna', 'Hernández', 'DianaKaren12', 'M','5620347895', 'REHD021122MDFYRDO9',2)


ALTER TABLE Usuario
ALTER COLUMN UserName VARCHAR(50) NOT NULL;


ALTER TABLE Usuario
ALTER COLUMN ApellidoPaterno VARCHAR(50) NOT NULL;

ALTER TABLE Usuario
ALTER COLUMN Sexo CHAR(2) NOT NULL;

ALTER TABLE Usuario
ALTER COLUMN [Password] VARCHAR(50) NOT NULL;



ALTER TABLE Usuario
ADD UNIQUE (Email);

ALTER TABLE Usuario
ADD UNIQUE (UserName);

CREATE PROCEDURE UsuarioAdd
@Nombre VARCHAR(50),
@FechaDeNacimiento DATE, 
@NumeroDeTelefono VARCHAR(20), 
@Email VARCHAR(254), 
@UserName VARCHAR(50), 
@ApellidoPaterno VARCHAR(50), 
@ApellidoMaterno VARCHAR(50), 
@Password VARCHAR (50), 
@Sexo CHAR(2), 
@Celular VARCHAR(20), 
@CURP VARCHAR(50)
AS
INSERT INTO Usuario (Nombre, FechaDeNacimiento, NumeroDeTelefono, Email, UserName, ApellidoPaterno, ApellidoMaterno, [Password], Sexo, Celular, CURP) VALUES (@Nombre, @FechaDeNacimiento, @NumeroDeTelefono, @Email, @UserName, @ApellidoPaterno, @ApellidoMaterno, @Password, @Sexo, @Celular, @CURP);
                        
CREATE PROCEDURE UsuarioGetAll
AS
SELECT IdUsuario, Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, Sexo, CURP, NumeroDeTelefono, Celular, Email, UserName, [Password] FROM Usuario

CREATE PROCEDURE UsuarioGetById
@IdUsuario INT
AS
SELECT IdUsuario, Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, Sexo, CURP, NumeroDeTelefono, Celular, Email, UserName, [Password] FROM Usuario WHERE IdUsuario = @IdUsuario

CREATE PROCEDURE UsuarioDelete
@IdUsuario INT
AS
DELETE FROM Usuario WHERE IdUsuario = @IdUsuario

CREATE PROCEDURE UsuarioUpdate
@NombreCampo VARCHAR (50),
@ContenidoCampo VARCHAR (50),
@IdUsuario INT
AS 
UPDATE Usuario SET @NombreCampo = '[@ContenidoCampo]' WHERE IdUsuario = @IdUsuario

UsuarioGetById 2

UsuarioUpdate '[Nombre]', 'Karen',2;
UsuarioGetById 2;

EXEC UsuarioUpdate Nombre,''

CREATE TABLE Rol(
IdRol INT PRIMARY KEY IDENTITY (1,1),
Rol VARCHAR (50)
) 

ALTER TABLE Usuario
ADD IdRol INT FOREIGN KEY REFERENCES Rol(IdRol);
 

INSERT INTO Rol (Rol) VALUES ('Administrador')
INSERT INTO Rol (Rol) VALUES ('Usuario')

SELECT * FROM Rol

SELECT * FROM Usuario

UPDATE Usuario SET  IdRol= 2 WHERE IdUsuario = 2

CREATE PROCEDURE RolGetAll
AS
SELECT IdRol, Rol FROM Rol

--SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
--FROM Orders
--INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT IdUsuario, Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, Sexo, CURP, NumeroDeTelefono, Celular, Email, UserName, [Password], Rol.IdRol, Rol.Rol FROM Usuario
INNER JOIN Rol ON Usuario.IdRol = Rol.IdRol


SELECT IdUsuario, Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, Sexo, CURP, NumeroDeTelefono, Celular, Email, UserName, [Password], IdRol FROM Usuario 

CREATE TABLE Pais(
IdPais INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR (50) NOT NULL)

CREATE TABLE Estado(
IdEstado INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR (50) NOT NULL,
IdPais INT FOREIGN KEY REFERENCES Pais(IdPais)
)

CREATE TABLE Municipio(
IdMunicipio INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR(50) NOT NULL,
IdEstado INT FOREIGN KEY REFERENCES Estado(IdEstado)
)

CREATE TABLE Colonia(
IdColonia INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR(50) NOT NULL,
CodigoPostal VARCHAR (50) NOT NULL,
IdMunicipio INT FOREIGN KEY REFERENCES Municipio(IdMunicipio)
)

CREATE TABLE Direccion(
IdDireccion INT PRIMARY KEY IDENTITY(1,1),
Calle VARCHAR(50) NOT NULL,
NumeroInterior VARCHAR(20) NOT NULL,
NumeroExterior VARCHAR(20) NOT NULL,
IdColonia INT FOREIGN KEY REFERENCES Colonia(IdColonia),
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) 
)

INSERT INTO Pais (Nombre) VALUES ('Estados Unidos')
INSERT INTO Pais (Nombre) VALUES ('Alemania')

INSERT INTO Estado (Nombre, IdPais) VALUES ('Texas', 1)
INSERT INTO Estado (Nombre, IdPais) VALUES ('California', 1)
INSERT INTO Estado (Nombre, IdPais) VALUES ('Hamburgo', 2)
INSERT INTO Estado (Nombre, IdPais) VALUES ('Berlin', 2)

INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Carrollton', 1)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Irving', 1)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Los Angeles', 2)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Beverly Hills', 2)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Hamburgo', 3)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Hamburgo-Mitte', 3)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Friedrichshain', 4)
INSERT INTO Municipio (Nombre, IdEstado) VALUES ('Halensee', 4)

INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('N Josey', '75006', 1)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Kirkwood', '75006', 1)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Douglas', '75014', 2)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('William', '75014', 2)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Rosewood', '90004', 3)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Oakwood', '90004', 3)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Dayton', '90209', 4)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Clifton', '90209', 4)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Bredengrund', '21149', 5)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Schanzengrund', '21149', 5)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Steindamm', '20099', 6)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Kirchenallee', '20099', 6)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Köpenicker', '10179', 7)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Dresdener', '10179', 7)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Wilmersdorfer', '10629', 8)
INSERT INTO Colonia (Nombre, CodigoPostal, IdMunicipio) VALUES ('Droysenstraße', '10629', 8)

INSERT INTO Direccion (Calle, NumeroInterior, NumeroExterior, IdColonia, IdUsuario) VALUES ('Boulevard 1920', '50', '50', 1, 1)
INSERT INTO Direccion (Calle, NumeroInterior, NumeroExterior, IdColonia, IdUsuario) VALUES ('Street Munchy', '120', '120', 2, 2)
INSERT INTO Direccion (Calle, NumeroInterior, NumeroExterior, IdColonia, IdUsuario) VALUES ('Avenue 203 Watson', '100', '100', 7, 7)

SELECT * FROM Pais

SELECT * FROM Estado

SELECT * FROM Municipio

SELECT * FROM Colonia

SELECT * FROM Direccion

CREATE PROCEDURE PaisGetAll
AS
SELECT IdPais, Nombre FROM Pais

CREATE PROCEDURE EstadoGetByIdPais
@IdPais INT
AS
SELECT IdEstado, Nombre FROM Estado WHERE IdPais = @IdPais

CREATE PROCEDURE MunicipioGetByIdEstado 
@IdEstado INT
AS
SELECT IdMunicipio, Nombre FROM Municipio WHERE IdEstado = @IdEstado

CREATE PROCEDURE ColoniaGetByIdMunicipio
@IdMunicipio INT
AS 
SELECT Nombre, CodigoPostal FROM Colonia WHERE IdMunicipio = @IdMunicipio

ALTER TABLE Usuario
ADD Imagen VARBINARY(MAX)

UPDATE Usuario SET Imagen = null

ALTER TABLE Usuario
ALTER COLUMN Imagen VARCHAR(MAX)

CREATE TABLE Empresa (
IdEmpresa INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Telefono VARCHAR(50),
Email VARCHAR(254),
DireccionWeb VARCHAR(100),
Logo VARCHAR(MAX)
)

CREATE PROCEDURE EmpresaAdd
@Nombre VARCHAR(50),
@Telefono VARCHAR(50),
@Email VARCHAR(254),
@DireccionWeb VARCHAR(100),
@Logo VARCHAR(MAX)
AS
INSERT INTO Empresa (Nombre, Telefono, Email, DireccionWeb, Logo) VALUES (@Nombre, @Telefono, @Email, @DireccionWeb, @Logo)

CREATE PROCEDURE EmpresaUpdate
@IdEmpresa INT,
@Nombre VARCHAR(50),
@Telefono VARCHAR(50),
@Email VARCHAR(254),
@DireccionWeb VARCHAR(100),
@Logo VARCHAR(MAX)
AS
UPDATE Empresa SET Nombre = @Nombre, Telefono = @Telefono, Email = @Email, DireccionWeb = @DireccionWeb, Logo = @Logo WHERE IdEmpresa = @IdEmpresa

CREATE PROCEDURE EmpresaDelete
@IdEmpresa INT
AS
DELETE FROM Empresa WHERE IdEmpresa = @IdEmpresa

CREATE PROCEDURE EmpresaGetAll
AS
SELECT IdEmpresa, Nombre, Telefono, Email, DireccionWeb, Logo FROM Empresa

CREATE PROCEDURE EmpresaGetById
@IdEmpresa INT
AS
SELECT IdEmpresa, Nombre, Telefono, Email, DireccionWeb, Logo FROM Empresa WHERE IdEmpresa = @IdEmpresa

UsuarioGetAll '', '',0

ALTER TABLE Usuario
ADD [Status] BIT 

UPDATE Usuario SET [Status] = 'true'
UsuarioGetAll '', '',0

ALTER TABLE Usuario
ALTER COLUMN [Status] BIT NOT NULL

CREATE PROCEDURE UsuarioUpdateStatus
@Status BIT,
@IdUsuario INT
AS
UPDATE Usuario SET [Status] = @Status WHERE IdUsuario = @IdUsuario

CREATE TABLE Empleado(
NumeroEmpleado VARCHAR(50) PRIMARY KEY,
RFC VARCHAR(50),
Nombre VARCHAR(50) NOT NULL,
ApellidoPaterno VARCHAR(50) NOT NULL,
ApellidoMaterno VARCHAR(50),
Email VARCHAR(254) NOT NULL UNIQUE,
Telefono VARCHAR(20) NOT NULL,
FechaDeNacimiento DATE,
NSS VARCHAR(20),
FechaIngreso DATE,
Foto VARCHAR(MAX),
IdEmpresa INT FOREIGN KEY REFERENCES Empresa(IdEmpresa)
)

CREATE PROCEDURE EmpleadoGetAll
AS
SELECT NumeroEmpleado, RFC, Nombre, ApellidoPaterno, ApellidoMaterno, Email, Telefono, FechaDeNacimiento, NSS, FechaIngreso, Foto, IdEmpresa FROM Empleado

CREATE PROCEDURE EmpleadoGetById
@NumeroEmpleado VARCHAR(50)
AS
SELECT NumeroEmpleado, RFC, Nombre, ApellidoPaterno, ApellidoMaterno, Email, Telefono, FechaDeNacimiento, NSS, FechaIngreso, Foto, IdEmpresa FROM Empleado WHERE NumeroEmpleado = @NumeroEmpleado

CREATE PROCEDURE EmpleadoAdd
@NumeroEmpleado VARCHAR(50),
@RFC VARCHAR(50),
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@Email VARCHAR(254),
@Telefono VARCHAR(20),
@FechaDeNacimiento DATE,
@NSS VARCHAR(20),
@FechaIngreso DATE,
@Foto VARCHAR(MAX),
@IdEmpresa INT
AS
INSERT INTO Empleado (NumeroEmpleado, RFC, Nombre, ApellidoPaterno, ApellidoMaterno, Email, Telefono, FechaDeNacimiento, NSS, FechaIngreso, Foto, IdEmpresa) VALUES (@NumeroEmpleado, @RFC, @Nombre, @ApellidoPaterno, @ApellidoMaterno, @Email, @Telefono, @FechaDeNacimiento, @NSS, @FechaIngreso, @Foto, @IdEmpresa)

CREATE PROCEDURE EmpleadoUpdate
@NumeroEmpleado VARCHAR(50),
@RFC VARCHAR(50),
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@Email VARCHAR(254),
@Telefono VARCHAR(20),
@FechaDeNacimiento DATE,
@NSS VARCHAR(20),
@FechaIngreso DATE,
@Foto VARCHAR(MAX),
@IdEmpresa INT
AS
UPDATE Empleado SET NumeroEmpleado = @NumeroEmpleado, RFC = @RFC, Nombre = @Nombre, ApellidoPaterno = @ApellidoPaterno, ApellidoMaterno = @ApellidoMaterno, Email = @Email, Telefono = @Telefono, FechaDeNacimiento = @FechaDeNacimiento, NSS = @NSS, FechaIngreso = @FechaIngreso, Foto = @Foto, IdEmpresa = @IdEmpresa WHERE NumeroEmpleado = @NumeroEmpleado

CREATE PROCEDURE EmpleadoDelete
@NumeroEmpleado VARCHAR(50)
AS
DELETE FROM Empleado WHERE NumeroEmpleado = @NumeroEmpleado

CREATE TABLE DependienteTipo(
IdDependienteTipo INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR(50) NOT NULL)

CREATE PROCEDURE DependienteTipoGetAll
AS
SELECT IdDependienteTipo, Nombre FROM DependienteTipo

CREATE TABLE Dependiente(
IdDependiente INT PRIMARY KEY IDENTITY (1,1),
NumeroEmpleado VARCHAR(50) FOREIGN KEY REFERENCES Empleado(NumeroEmpleado),
Nombre VARCHAR(50) NOT NULL,
ApellidoPaterno VARCHAR(50) NOT NULL,
ApellidoMaterno VARCHAR(50),
FechaDeNacimiento DATE,
EstadoCivil VARCHAR(50),
Genero VARCHAR(50),
Telefono VARCHAR(20) NOT NULL,
RFC VARCHAR(50),
IdDependienteTipo INT FOREIGN KEY REFERENCES DependienteTipo(IdDependienteTipo)
)

CREATE PROCEDURE DependienteGetAll
AS
SELECT IdDependiente, NumeroEmpleado, Dependiente.Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, EstadoCivil, Genero, Telefono, RFC, 
Dependiente.IdDependienteTipo, DependienteTipo.Nombre AS 'TipoDependiente' FROM Dependiente INNER JOIN DependienteTipo ON Dependiente.IdDependienteTipo = DependienteTipo.IdDependienteTipo

CREATE PROCEDURE DependienteGetById
@IdDependiente INT
AS
SELECT IdDependiente, NumeroEmpleado, Dependiente.Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, EstadoCivil, Genero, Telefono, RFC, 
Dependiente.IdDependienteTipo, DependienteTipo.Nombre AS 'TipoDependiente' FROM Dependiente INNER JOIN DependienteTipo ON Dependiente.IdDependienteTipo = DependienteTipo.IdDependienteTipo WHERE IdDependiente = @IdDependiente

CREATE PROCEDURE DependienteAdd
@NumeroEmpleado VARCHAR(50),
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@FechaDeNacimiento DATE,
@EstadoCivil VARCHAR(50),
@Genero VARCHAR(50),
@Telefono VARCHAR(20),
@RFC VARCHAR(50),
@IdDependienteTipo INT
AS
INSERT INTO Dependiente (NumeroEmpleado, Nombre, ApellidoPaterno, ApellidoMaterno, FechaDeNacimiento, EstadoCivil, Genero, Telefono, RFC, IdDependienteTipo) VALUES (@NumeroEmpleado, @Nombre, @ApellidoPaterno, @ApellidoMaterno, @FechaDeNacimiento, @EstadoCivil, @Genero, @Telefono, @RFC, @IdDependienteTipo)

CREATE PROCEDURE DependienteUpdate
@IdDependiente INT,
@NumeroEmpleado VARCHAR(50),
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@FechaDeNacimiento DATE,
@EstadoCivil VARCHAR(50),
@Genero VARCHAR(50),
@Telefono VARCHAR(20),
@RFC VARCHAR(50),
@IdDependienteTipo INT
AS
UPDATE Dependiente SET NumeroEmpleado = @NumeroEmpleado, Nombre = @Nombre, ApellidoPaterno = @ApellidoPaterno, ApellidoMaterno = @ApellidoMaterno, FechaDeNacimiento = @FechaDeNacimiento, EstadoCivil = @EstadoCivil, Genero = @Genero, Telefono = @Telefono, RFC = @RFC, IdDependienteTipo = @IdDependienteTipo WHERE IdDependiente = @IdDependiente

CREATE PROCEDURE DependienteDelete
@IdDependiente INT
AS DELETE FROM Dependiente WHERE IdDependiente = @IdDependiente

INSERT INTO DependienteTipo (Nombre) VALUES ('Padre')
INSERT INTO DependienteTipo (Nombre) VALUES ('Madre')
INSERT INTO DependienteTipo (Nombre) VALUES ('Hermano/a')
INSERT INTO DependienteTipo (Nombre) VALUES ('Hijo/a')
INSERT INTO DependienteTipo (Nombre) VALUES ('Conyuge')

SELECT * FROM DependienteTipo