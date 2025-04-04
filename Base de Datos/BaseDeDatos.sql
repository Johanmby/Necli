USE [master]
GO
/****** Object:  Database [Necli]    Script Date: 26/03/2025 2:02:24 a. m. ******/
CREATE DATABASE [Necli]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Necli', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Necli.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Necli_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Necli_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Necli] ADD FILEGROUP [Empty]
GO
ALTER DATABASE [Necli] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Necli].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Necli] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Necli] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Necli] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Necli] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Necli] SET ARITHABORT OFF 
GO
ALTER DATABASE [Necli] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Necli] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Necli] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Necli] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Necli] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Necli] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Necli] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Necli] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Necli] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Necli] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Necli] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Necli] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Necli] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Necli] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Necli] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Necli] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Necli] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Necli] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Necli] SET  MULTI_USER 
GO
ALTER DATABASE [Necli] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Necli] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Necli] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Necli] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Necli] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Necli] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Necli] SET QUERY_STORE = ON
GO
ALTER DATABASE [Necli] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Necli]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 26/03/2025 2:02:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Saldo] [float] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 26/03/2025 2:02:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[Numero] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[NumeroCuentaOrigen] [varchar](50) NOT NULL,
	[NumeroCuentaDestino] [varchar](50) NOT NULL,
	[Monto] [float] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (0, N'string', N'string', N'string', N'string', N'string', 0, CAST(N'2025-03-25T21:20:18.553' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (1, N'Juan', N'Pérez', N'juan.perez@email.com', N'Pass1234', N'3001234567', 150000.5, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (2, N'María', N'López', N'maria.lopez@email.com', N'Clave456', N'3112345678', 250000.75, CAST(N'2024-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (3, N'Carlos', N'González', N'carlos.gonzalez@email.com', N'Segura789', N'3209876543', 10000, CAST(N'2024-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (4, N'Ana', N'Martínez', N'ana.martinez@email.com', N'P@ssword1', N'3151234567', 50000.25, CAST(N'2024-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (5, N'Pedro', N'Ramírez', N'pedro.ramirez@email.com', N'Qwerty987', N'3223456789', 75000.8, CAST(N'2024-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (6, N'Laura', N'Hernández', N'laura.hernandez@email.com', N'1234Segura', N'3012345678', 92000.6, CAST(N'2024-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (7, N'Andrés', N'Díaz', N'andres.diaz@email.com', N'ClaveSegura', N'3123456789', 300000, CAST(N'2024-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (8, N'Sofía', N'Torres', N'sofia.torres@email.com', N'MiContraseña1', N'3187654321', 12500.9, CAST(N'2024-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (9, N'Ricardo', N'Jiménez', N'ricardo.jimenez@email.com', N'ABCdef789', N'3198765432', 87000.1, CAST(N'2024-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (10, N'Daniela', N'Castro', N'daniela.castro@email.com', N'P4ssw0rd', N'3009876543', 45000.45, CAST(N'2024-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (11, N'Felipe', N'Ortega', N'felipe.ortega@email.com', N'Ortega321', N'3145678901', 120000.75, CAST(N'2024-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (12, N'Natalia', N'Reyes', N'natalia.reyes@email.com', N'ReySegura', N'3167890123', 65000.3, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (13, N'Oscar', N'Mendoza', N'oscar.mendoza@email.com', N'Clave2024', N'3178901234', 99000, CAST(N'2024-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (14, N'Valeria', N'Romero', N'valeria.romero@email.com', N'Pass123Val', N'3101236789', 130000.2, CAST(N'2024-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (15, N'Camilo', N'Santos', N'camilo.santos@email.com', N'Santos456', N'3212345670', 67000.55, CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (16, N'Manuela', N'Fernández', N'manuela.fernandez@email.com', N'F3rn4ndez!', N'3225678901', 87000.95, CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (17, N'Sebastián', N'Mejía', N'sebastian.mejia@email.com', N'S3guro123', N'3114567890', 50000.6, CAST(N'2024-03-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (18, N'Lucía', N'Guzmán', N'lucia.guzman@email.com', N'Luci@2024', N'3196543210', 34500.7, CAST(N'2024-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (19, N'Javier', N'Pardo', N'javier.pardo@email.com', N'Javi123!', N'3106785432', 159000.9, CAST(N'2024-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (20, N'Isabella', N'Vargas', N'isabella.vargas@email.com', N'VargasPass', N'3143210987', 72000.15, CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (21, N'Mateo', N'Suárez', N'mateo.suarez@email.com', N'Suarez456', N'3125674321', 285000.45, CAST(N'2024-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (22, N'Gabriela', N'Moreno', N'gabriela.moreno@email.com', N'Moren@123', N'3138765432', 97000.85, CAST(N'2024-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (23, N'Esteban', N'Ríos', N'esteban.rios@email.com', N'Rios1234', N'3156547890', 44000.25, CAST(N'2024-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (24, N'Carolina', N'Pérez', N'carolina.perez@email.com', N'Perez2024', N'3167890543', 110000.7, CAST(N'2024-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (25, N'Alejandro', N'León', N'alejandro.leon@email.com', N'LeonFuerte', N'3178905678', 63000.5, CAST(N'2024-03-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (26, N'Marcos', N'Salazar', N'marcos.salazar@email.com', N'S4lazar!', N'3223456789', 54000.3, CAST(N'2024-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (27, N'Elena', N'Castaño', N'elena.castano@email.com', N'C4stano2024', N'3005674321', 78000.4, CAST(N'2024-03-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (28, N'Hugo', N'Beltrán', N'hugo.beltran@email.com', N'BeltranPass', N'3189876543', 88000.2, CAST(N'2024-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (29, N'Fernanda', N'López', N'fernanda.lopez@email.com', N'L0pez123', N'3197654321', 205000.9, CAST(N'2024-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (30, N'Diego', N'Navarro', N'diego.navarro@email.com', N'N@varro789', N'3018765432', 134500.35, CAST(N'2024-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Cuentas] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Saldo], [FechaCreacion]) VALUES (31, N'string', N'string', N'string', N'string', N'string', 0, CAST(N'2025-03-25T21:03:53.880' AS DateTime))
GO
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (1, CAST(N'2025-03-01' AS Date), N'1001', N'2001', 15000.5, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (2, CAST(N'2025-03-02' AS Date), N'1002', N'2002', 25000.75, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (3, CAST(N'2025-03-03' AS Date), N'1003', N'2003', 5000, N'Retiro')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (4, CAST(N'2025-03-04' AS Date), N'1004', N'2004', 75000.25, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (5, CAST(N'2025-03-05' AS Date), N'1005', N'2005', 12500, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (6, CAST(N'2025-03-06' AS Date), N'1006', N'2006', 3000, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (7, CAST(N'2025-03-07' AS Date), N'1007', N'2007', 45000, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (8, CAST(N'2025-03-08' AS Date), N'1008', N'2008', 8000.5, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (9, CAST(N'2025-03-09' AS Date), N'1009', N'2009', 27000.75, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (10, CAST(N'2025-03-10' AS Date), N'1010', N'2010', 6000, N'Retiro')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (11, CAST(N'2025-03-11' AS Date), N'1011', N'2011', 15500.5, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (12, CAST(N'2025-03-12' AS Date), N'1012', N'2012', 22000.25, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (13, CAST(N'2025-03-13' AS Date), N'1013', N'2013', 3200, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (14, CAST(N'2025-03-14' AS Date), N'1014', N'2014', 71000, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (15, CAST(N'2025-03-15' AS Date), N'1015', N'2015', 9200.5, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (16, CAST(N'2025-03-16' AS Date), N'1016', N'2016', 19000.75, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (17, CAST(N'2025-03-17' AS Date), N'1017', N'2017', 7300, N'Retiro')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (18, CAST(N'2025-03-18' AS Date), N'1018', N'2018', 60000.25, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (19, CAST(N'2025-03-19' AS Date), N'1019', N'2019', 4500.5, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (20, CAST(N'2025-03-20' AS Date), N'1020', N'2020', 30000, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (21, CAST(N'2025-03-21' AS Date), N'1021', N'2021', 5300.75, N'Retiro')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (22, CAST(N'2025-03-22' AS Date), N'1022', N'2022', 84000, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (23, CAST(N'2025-03-23' AS Date), N'1023', N'2023', 12000.5, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (24, CAST(N'2025-03-24' AS Date), N'1024', N'2024', 17000.25, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (25, CAST(N'2025-03-25' AS Date), N'1025', N'2025', 2500, N'Retiro')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (26, CAST(N'2025-03-26' AS Date), N'1026', N'2026', 72000.5, N'Depósito')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (27, CAST(N'2025-03-27' AS Date), N'1027', N'2027', 13500.75, N'Transferencia')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (28, CAST(N'2025-03-28' AS Date), N'1028', N'2028', 26000, N'Pago')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (29, CAST(N'2025-03-29' AS Date), N'1029', N'2029', 4100, N'Retiro')
INSERT [dbo].[Transacciones] ([Numero], [Fecha], [NumeroCuentaOrigen], [NumeroCuentaDestino], [Monto], [Tipo]) VALUES (30, CAST(N'2025-03-30' AS Date), N'1030', N'2030', 90000.25, N'Depósito')
GO
USE [master]
GO
ALTER DATABASE [Necli] SET  READ_WRITE 
GO
