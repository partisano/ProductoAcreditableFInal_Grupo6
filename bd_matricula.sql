USE [master]
GO
/****** Object:  Database [bd_matricula]    Script Date: 19/12/2020 16:50:04 ******/
CREATE DATABASE [bd_matricula] ON  PRIMARY 
( NAME = N'bd_matricula', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\bd_matricula.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bd_matricula_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\bd_matricula_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bd_matricula] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_matricula].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_matricula] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_matricula] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_matricula] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_matricula] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_matricula] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_matricula] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bd_matricula] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_matricula] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_matricula] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_matricula] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_matricula] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_matricula] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_matricula] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_matricula] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_matricula] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_matricula] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_matricula] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_matricula] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_matricula] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_matricula] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_matricula] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_matricula] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_matricula] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_matricula] SET  MULTI_USER 
GO
ALTER DATABASE [bd_matricula] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_matricula] SET DB_CHAINING OFF 
GO
USE [bd_matricula]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[Idalumno] [int] IDENTITY(1,1) NOT NULL,
	[Apellidos] [varchar](150) NULL,
	[Nombres] [varchar](100) NULL,
	[DNI] [char](8) NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [char](9) NULL,
	[Idusuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Idasignatura] [int] IDENTITY(1,1) NOT NULL,
	[Asignatura] [varchar](50) NOT NULL,
	[Idcarrera] [int] NULL,
	[Idciclo] [int] NULL,
	[Iddocente] [int] NULL,
	[Creditos] [int] NULL,
	[Costo] [decimal](18, 0) NULL,
	[Numvacante] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idasignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carreras](
	[Idcarrera] [int] IDENTITY(1,1) NOT NULL,
	[Nombrecarrera] [varchar](50) NOT NULL,
	[Nummeses] [int] NULL,
	[Idfacultad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idcarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ciclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ciclo](
	[Idciclo] [int] IDENTITY(1,1) NOT NULL,
	[Nomciclo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idciclo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Docente](
	[Iddocente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Celular] [char](9) NULL,
	[Idusuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Iddocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Facultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facultad](
	[Idfacultad] [int] IDENTITY(1,1) NOT NULL,
	[Nomfacultad] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idfacultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Matricula](
	[Idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Idalumno] [int] NULL,
	[Idasignatura] [int] NULL,
	[Periodo] [varchar](50) NULL,
	[Estado] [varchar](20) NULL,
	[Idperiodo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pago](
	[Idpago] [int] IDENTITY(1,1) NOT NULL,
	[FechaPago] [datetime] NULL,
	[Idtramite] [int] NULL,
	[Idalumno] [int] NULL,
	[Observacion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Periodo](
	[Idperiodo] [int] IDENTITY(1,1) NOT NULL,
	[Nomperiodo] [varchar](50) NOT NULL,
	[Finicio] [date] NULL,
	[Ffin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idperiodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tramite](
	[Idtramite] [int] IDENTITY(1,1) NOT NULL,
	[Tramites] [varchar](50) NOT NULL,
	[Costo] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idtramite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Usuario] [varchar](25) NOT NULL,
	[Clave] [varchar](20) NULL,
	[Tipo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([Idalumno], [Apellidos], [Nombres], [DNI], [Direccion], [Telefono], [Idusuario]) VALUES (1, N'Mendoza Rengifo', N'Genaro', N'47973508', N'san Antonio 750 - chiclayo', N'456987123', 5)
INSERT [dbo].[Alumno] ([Idalumno], [Apellidos], [Nombres], [DNI], [Direccion], [Telefono], [Idusuario]) VALUES (2, N'Carrera Sanchez', N'rosvel', N'123456  ', N'jr emiliano niño - chiclayo', N'45632189 ', 6)
INSERT [dbo].[Alumno] ([Idalumno], [Apellidos], [Nombres], [DNI], [Direccion], [Telefono], [Idusuario]) VALUES (3, N'salazar vega', N'wilfredo', N'4569832 ', N'lambayeque', N'456987321', 7)
SET IDENTITY_INSERT [dbo].[Alumno] OFF
SET IDENTITY_INSERT [dbo].[Asignatura] ON 

INSERT [dbo].[Asignatura] ([Idasignatura], [Asignatura], [Idcarrera], [Idciclo], [Iddocente], [Creditos], [Costo], [Numvacante]) VALUES (1, N'Programación I', 1, 5, 1, 5, CAST(100 AS Decimal(18, 0)), 25)
INSERT [dbo].[Asignatura] ([Idasignatura], [Asignatura], [Idcarrera], [Idciclo], [Iddocente], [Creditos], [Costo], [Numvacante]) VALUES (2, N'Inteligencia de Negocios', 1, 3, 1, 5, CAST(100 AS Decimal(18, 0)), 30)
INSERT [dbo].[Asignatura] ([Idasignatura], [Asignatura], [Idcarrera], [Idciclo], [Iddocente], [Creditos], [Costo], [Numvacante]) VALUES (3, N'Redes y Comunicaciones', 1, 8, 1, 5, CAST(100 AS Decimal(18, 0)), 30)
INSERT [dbo].[Asignatura] ([Idasignatura], [Asignatura], [Idcarrera], [Idciclo], [Iddocente], [Creditos], [Costo], [Numvacante]) VALUES (4, N'Investigación I', 1, 9, 2, 5, CAST(100 AS Decimal(18, 0)), 25)
INSERT [dbo].[Asignatura] ([Idasignatura], [Asignatura], [Idcarrera], [Idciclo], [Iddocente], [Creditos], [Costo], [Numvacante]) VALUES (5, N'PPP', 1, 10, 2, 5, CAST(100 AS Decimal(18, 0)), 25)
SET IDENTITY_INSERT [dbo].[Asignatura] OFF
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([Idcarrera], [Nombrecarrera], [Nummeses], [Idfacultad]) VALUES (1, N'Ingeniería de Sistemas', 50, 1)
INSERT [dbo].[Carreras] ([Idcarrera], [Nombrecarrera], [Nummeses], [Idfacultad]) VALUES (2, N'Derecho', 50, 2)
INSERT [dbo].[Carreras] ([Idcarrera], [Nombrecarrera], [Nummeses], [Idfacultad]) VALUES (3, N'Matematica Pura', 50, 5)
SET IDENTITY_INSERT [dbo].[Carreras] OFF
SET IDENTITY_INSERT [dbo].[Ciclo] ON 

INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (1, N'Ciclo - I')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (2, N'Ciclo - II')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (3, N'Ciclo - III')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (4, N'Ciclo - IV')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (5, N'Ciclo - V')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (6, N'Ciclo - VI')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (7, N'Ciclo - VII')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (8, N'Ciclo - VIII')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (9, N'Ciclo - IX')
INSERT [dbo].[Ciclo] ([Idciclo], [Nomciclo]) VALUES (10, N'Ciclo - X')
SET IDENTITY_INSERT [dbo].[Ciclo] OFF
SET IDENTITY_INSERT [dbo].[Docente] ON 

INSERT [dbo].[Docente] ([Iddocente], [Nombres], [Apellidos], [Direccion], [Celular], [Idusuario]) VALUES (1, N'William', N'Sanchez Vargas', N'lambayeque ', N'123568971', 2)
INSERT [dbo].[Docente] ([Iddocente], [Nombres], [Apellidos], [Direccion], [Celular], [Idusuario]) VALUES (2, N'jose ', N'Bravo Bravo', N'san jose chiclayo', N'546465464', 3)
INSERT [dbo].[Docente] ([Iddocente], [Nombres], [Apellidos], [Direccion], [Celular], [Idusuario]) VALUES (3, N'pedro', N'mendoza lopez', N'av jose galvez', N'125463987', 4)
SET IDENTITY_INSERT [dbo].[Docente] OFF
SET IDENTITY_INSERT [dbo].[Facultad] ON 

INSERT [dbo].[Facultad] ([Idfacultad], [Nomfacultad]) VALUES (1, N'Facultad de ingeniería, Arquitectura y Urbanismo')
INSERT [dbo].[Facultad] ([Idfacultad], [Nomfacultad]) VALUES (2, N'Facultad de Derecho')
INSERT [dbo].[Facultad] ([Idfacultad], [Nomfacultad]) VALUES (4, N'Facultad de Economía')
INSERT [dbo].[Facultad] ([Idfacultad], [Nomfacultad]) VALUES (5, N'Facultad de Educación y Ciencias Sociales')
SET IDENTITY_INSERT [dbo].[Facultad] OFF
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([Idmatricula], [Fecha], [Idalumno], [Idasignatura], [Periodo], [Estado], [Idperiodo]) VALUES (4, CAST(N'2020-11-20' AS Date), 1, 3, N'MATRICULA', N'PENDIENTE', 2)
INSERT [dbo].[Matricula] ([Idmatricula], [Fecha], [Idalumno], [Idasignatura], [Periodo], [Estado], [Idperiodo]) VALUES (5, CAST(N'2020-11-20' AS Date), 1, 4, N'MATRICULA', N'PENDIENTE', 2)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
SET IDENTITY_INSERT [dbo].[Pago] ON 

INSERT [dbo].[Pago] ([Idpago], [FechaPago], [Idtramite], [Idalumno], [Observacion]) VALUES (1, CAST(N'2020-11-20 00:00:00.000' AS DateTime), 3, 1, N'Matricula Programación I')
INSERT [dbo].[Pago] ([Idpago], [FechaPago], [Idtramite], [Idalumno], [Observacion]) VALUES (2, CAST(N'2020-11-20 00:00:00.000' AS DateTime), 3, 1, N'Matricula para Sistemas inteligentes')
INSERT [dbo].[Pago] ([Idpago], [FechaPago], [Idtramite], [Idalumno], [Observacion]) VALUES (3, CAST(N'2020-11-20 00:00:00.000' AS DateTime), 1, 1, N'Reservar Programación I e Inteligencia de negocios')
INSERT [dbo].[Pago] ([Idpago], [FechaPago], [Idtramite], [Idalumno], [Observacion]) VALUES (5, CAST(N'2020-11-20 00:00:00.000' AS DateTime), 3, 1, N'Matricula Redes y Comunicaciones')
INSERT [dbo].[Pago] ([Idpago], [FechaPago], [Idtramite], [Idalumno], [Observacion]) VALUES (6, CAST(N'2020-11-20 00:00:00.000' AS DateTime), 3, 1, N'Pago por Investigación I')
SET IDENTITY_INSERT [dbo].[Pago] OFF
SET IDENTITY_INSERT [dbo].[Periodo] ON 

INSERT [dbo].[Periodo] ([Idperiodo], [Nomperiodo], [Finicio], [Ffin]) VALUES (1, N'2020-I', CAST(N'2020-02-20' AS Date), CAST(N'2020-06-18' AS Date))
INSERT [dbo].[Periodo] ([Idperiodo], [Nomperiodo], [Finicio], [Ffin]) VALUES (2, N'2020-II', CAST(N'2020-07-31' AS Date), CAST(N'2020-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[Periodo] OFF
SET IDENTITY_INSERT [dbo].[Tramite] ON 

INSERT [dbo].[Tramite] ([Idtramite], [Tramites], [Costo]) VALUES (1, N'Reserva de Matrícula', CAST(50 AS Decimal(18, 0)))
INSERT [dbo].[Tramite] ([Idtramite], [Tramites], [Costo]) VALUES (2, N'Solicitud de reservsa', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Tramite] ([Idtramite], [Tramites], [Costo]) VALUES (3, N'matricula cursos de carrera', CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Tramite] ([Idtramite], [Tramites], [Costo]) VALUES (4, N'matricula cursos regulares', CAST(80 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Tramite] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (1, N'genaro', N'genaro', N'123456', N'Administrador')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (2, N'William Sanchez Vargas', N'wiliam', N'123456', N'Docente')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (3, N'jose  Bravo Bravo', N'jose', N'123456', N'Docente')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (4, N'pedro mendoza lopez', N'pedro', N'123456', N'Docente')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (5, N'Genaro Mendoza Rengifo', N'gena', N'123456', N'Alumno')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (6, N'rosvel Carrera Sanchez', N'rosvel', N'123456', N'Alumno')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (7, N'wilfredo salazar vega', N'wilfredo', N'123456', N'Alumno')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (8, N'anibal', N'anibal', N'123456', N'Academico')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (9, N'Piero', N'piero', N'123456', N'Escuela')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (10, N'victor', N'victor', N'123456', N'Director')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombres], [Usuario], [Clave], [Tipo]) VALUES (11, N'wilmer', N'wilmer', N'123456', N'Decano')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_asignatura_ciclo] FOREIGN KEY([Idciclo])
REFERENCES [dbo].[Ciclo] ([Idciclo])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_asignatura_ciclo]
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_carrera_asignatura] FOREIGN KEY([Idcarrera])
REFERENCES [dbo].[Carreras] ([Idcarrera])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_carrera_asignatura]
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_docente_asignatura] FOREIGN KEY([Iddocente])
REFERENCES [dbo].[Docente] ([Iddocente])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_docente_asignatura]
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD  CONSTRAINT [FK_carreras_facultad] FOREIGN KEY([Idfacultad])
REFERENCES [dbo].[Facultad] ([Idfacultad])
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [FK_carreras_facultad]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_matricula_alumno] FOREIGN KEY([Idalumno])
REFERENCES [dbo].[Alumno] ([Idalumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_matricula_alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_matricula_asignatura] FOREIGN KEY([Idasignatura])
REFERENCES [dbo].[Asignatura] ([Idasignatura])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_matricula_asignatura]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Periodo] FOREIGN KEY([Idperiodo])
REFERENCES [dbo].[Periodo] ([Idperiodo])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Periodo]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Alumno] FOREIGN KEY([Idalumno])
REFERENCES [dbo].[Alumno] ([Idalumno])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Alumno]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Tramite] FOREIGN KEY([Idtramite])
REFERENCES [dbo].[Tramite] ([Idtramite])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Tramite]
GO
/****** Object:  StoredProcedure [dbo].[AddAlumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddAlumno]   
(          
    @Apellidos VARCHAR(150),
	@Nombres  VARCHAR(100),
	@DNI char(8), 
	@Direccion VARCHAR(50),
	@Telefono char(9),
	@Usuario varchar(35),     
	@Clave varchar(20)   
)          
as           
BEGIN        
 DECLARE @ID as INT  


 INSERT INTO Usuarios Values (@Nombres +' ' +@Apellidos,@Usuario,@Clave,'Alumno')  
 SET @ID = SCOPE_IDENTITY()

 INSERT INTO Alumno Values (@Apellidos,@Nombres,@DNI,@Direccion,@Telefono,@ID)  


 
          
End  


GO
/****** Object:  StoredProcedure [dbo].[AddAsignatura]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddAsignatura]
(          
	@Asignatura  VARCHAR(50) ,
	@Idcarrera int,
	@Idciclo int,
	@Iddocente int,
	@Creditos int,
	@Costo decimal,
	@Numvacante int

)          
as           
BEGIN           
 INSERT INTO Asignatura Values (@Asignatura,@Idcarrera,@Idciclo,@Iddocente,@Creditos,@Costo,@Numvacante)               
End 


GO
/****** Object:  StoredProcedure [dbo].[AddCarreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[AddCarreras]
(          
	@Nombrecarrera  VARCHAR(50) ,
	@Nummeses int,
	@Idfacultad int

)          
as           
BEGIN           
 INSERT INTO Carreras Values (@Nombrecarrera,@Nummeses,@Idfacultad)               
End 


GO
/****** Object:  StoredProcedure [dbo].[AddCiclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--agregar ciclo --
Create procedure [dbo].[AddCiclo]          
(          
 
    @Nomciclo VARCHAR(50)       
)          
as           
Begin           
 Insert into Ciclo Values (@Nomciclo)               
End  



GO
/****** Object:  StoredProcedure [dbo].[AddDocente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddDocente]
(          
	@Nombres  VARCHAR(100),
	@Apellidos VARCHAR(150),
	@Direccion VARCHAR(50),
	@Celular char(9) ,
	@Usuario varchar(35),     
	@Clave varchar(20)         
)          
as           
BEGIN   
DECLARE @ID as INT          

 
 
 INSERT INTO Usuarios Values (@Nombres +' ' +@Apellidos,@Usuario,@Clave,'Docente')  
 SET @ID = SCOPE_IDENTITY()

 INSERT INTO Docente Values (@Nombres,@Apellidos,@Direccion,@Celular,@ID)    
 
            
End 


GO
/****** Object:  StoredProcedure [dbo].[AddFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddFacultad]
(          
	@Nomfacultad  VARCHAR(100)  
)          
as           
BEGIN           
 INSERT INTO Facultad Values (@Nomfacultad)               
End 


GO
/****** Object:  StoredProcedure [dbo].[AddMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddMatricula]
(          
	@Fecha date,
	@Idalumno int,
	@Idasignatura int,
	@Idperiodo int
)          
as  
         
BEGIN      


   INSERT INTO Matricula Values (@Fecha,@Idalumno,@Idasignatura,'MATRICULA','PENDIENTE',@Idperiodo)  

END




GO
/****** Object:  StoredProcedure [dbo].[AddMatricula2]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddMatricula2]
(          

	@Fecha date,
	@Idalumno int,
	@Idasignatura int,
	@Idperiodo int

)          
as  
         
BEGIN      

    declare @TOTAL int
	declare @VACANTE int
	 
	SET @TOTAL =(select count(*) from Matricula WHERE Idasignatura=@Idasignatura)

	SET @VACANTE =(select Numvacante from Asignatura WHERE Idasignatura=@Idasignatura)

	 if(@TOTAL >= @VACANTE)
	   begin
	      PRINT 'HA EXCEDIDO LAS VACANTE'
	   end 
	  else

	    begin
           INSERT INTO Matricula Values (@Fecha,@Idalumno,@Idasignatura,'MATRICULA','PENDIENTE',@Idperiodo)  
		   PRINT 'INSERTADO'
		end
	
END

GO
/****** Object:  StoredProcedure [dbo].[AddPago]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddPago]
(          
	@FechaPago date,
	@Idtramite int,
	@Idalumno int,
	@Observacion varchar(100)
)          
as           
BEGIN           
 INSERT INTO Pago Values (@FechaPago,@Idtramite,@Idalumno,@Observacion)               
End 

GO
/****** Object:  StoredProcedure [dbo].[AddPeriodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--agregar ciclo --
CREATE procedure [dbo].[AddPeriodo]        
(          
 
    @Nomperiodo VARCHAR(50),
	@Finicio date,
	@Ffin date       
)          
as           
Begin           
 Insert into Periodo Values (@Nomperiodo,@Finicio,@Ffin)               
End  


GO
/****** Object:  StoredProcedure [dbo].[AddTramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddTramite]
(          
	@Tramites varchar(100),
	@Costo decimal
)          
as           
BEGIN           
 INSERT INTO Tramite Values (@Tramites,@Costo)               
End 

GO
/****** Object:  StoredProcedure [dbo].[AddUsuario]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddUsuario]
(          
	@Nombres varchar(50),
	@Usuario varchar(35),
	@Clave varchar(25),
	@Tipo varchar(20)
)          
as           
BEGIN           
 INSERT INTO Usuarios Values (@Nombres,@Usuario,@Clave,@Tipo)               
End 

GO
/****** Object:  StoredProcedure [dbo].[AllAlumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllAlumno]
AS
    select * from Alumno
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllAsignatura]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllAsignatura]
AS
    select Idasignatura ,Asignatura,Creditos,ci.Nomciclo,ca.nombrecarrera,d.Apellidos +' '+ d.Nombres as docente,Costo,Numvacante from Asignatura a , Docente d , Carreras ca , Ciclo ci
	WHERE a.Idcarrera=ca.Idcarrera AND a.Idciclo=ci.Idciclo AND a.Iddocente=d.Iddocente
RETURN


GO
/****** Object:  StoredProcedure [dbo].[AllAsignatura2]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllAsignatura2]
(
@Idalumno int
)
AS
    select Idasignatura ,Asignatura,Creditos,ci.Nomciclo,ca.nombrecarrera,d.Apellidos +' '+ d.Nombres as docente,Costo,Numvacante 
	from Asignatura a , Docente d , Carreras ca , Ciclo ci
	WHERE a.Idcarrera=ca.Idcarrera AND a.Idciclo=ci.Idciclo AND a.Iddocente=d.Iddocente 
	AND Idasignatura NOT in (Select Idasignatura from Matricula WHERE Idalumno=@Idalumno)


RETURN



GO
/****** Object:  StoredProcedure [dbo].[AllCarreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllCarreras]
AS
    select * from Carreras c , Facultad f
	WHERE c.Idfacultad=f.Idfacultad 
	Order BY c.Nombrecarrera
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllCiclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllCiclo]
AS
    select * from Ciclo
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllDocente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllDocente]
AS
    select * from Docente
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllFacultad]
AS
    select * from Facultad
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMatricula]
AS
  
  
   select * from Matricula m , Alumno a , Asignatura c

   where m.Idalumno=a.Idalumno AND m.Idasignatura=c.Idasignatura


RETURN


GO
/****** Object:  StoredProcedure [dbo].[AllPago]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllPago]
AS
    select * from Pago p, Tramite t, Alumno a
	WHERE p.Idtramite=t.Idtramite AND p.Idalumno=a.Idalumno
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllPeriodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllPeriodo]
AS
    select * from Periodo
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllTramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllTramite]
AS
    select * from Tramite
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AllUsuario]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllUsuario]
AS
    select * from Usuarios
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AprobarMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AprobarMatricula]
(          
    @Cod int  
   
)          
as           
Begin           
 UPDATE  Matricula SET Estado='APROBADO' WHERE Idmatricula=@Cod           
End  


GO
/****** Object:  StoredProcedure [dbo].[BorrarAlumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarAlumno]         
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Alumno  WHERE Idalumno=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[BorrarAsignatura]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarAsignatura]         
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Asignatura  WHERE Idasignatura=@Cod           
End

GO
/****** Object:  StoredProcedure [dbo].[BorrarCarreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarCarreras]         
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Carreras  WHERE Idcarrera=@Cod           
End 

GO
/****** Object:  StoredProcedure [dbo].[BorrarCiclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarCiclo]          
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Ciclo  WHERE Idciclo=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[BorrarDocente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarDocente]       
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Docente  WHERE Iddocente=@Cod           
End 

GO
/****** Object:  StoredProcedure [dbo].[BorrarFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarFacultad]         
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Facultad  WHERE Idfacultad=@Cod           
End 

GO
/****** Object:  StoredProcedure [dbo].[BorrarMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarMatricula]        
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Matricula  WHERE Idmatricula=@Cod           
End 

GO
/****** Object:  StoredProcedure [dbo].[BorrarPago]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarPago]       
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Pago  WHERE Idpago=@Cod           
End 

GO
/****** Object:  StoredProcedure [dbo].[BorrarPeriodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[BorrarPeriodo]         
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Periodo  WHERE Idperiodo=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[BorrarTramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarTramite]       
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Tramite  WHERE Idtramite=@Cod           
End 
---------

GO
/****** Object:  StoredProcedure [dbo].[BorrarUsuarios]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[BorrarUsuarios]        
(          
    @Cod int       
)          
as           
Begin           
 DELETE FROM Usuarios  WHERE IdUsuario=@Cod           
End 

GO
/****** Object:  StoredProcedure [dbo].[Buscar]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar]
(
       @texto nvarchar(max)
)
AS
BEGIN

SELECT *
FROM   Alumno
WHERE   Apellidos +  + Nombres  LIKE '%'+@texto+'%'

END



GO
/****** Object:  StoredProcedure [dbo].[ComboFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComboFacultad]
AS
    Select * from Facultad
RETURN



GO
/****** Object:  StoredProcedure [dbo].[comprueba]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[comprueba]
(          
	@Idalumno int,
	@Idasignatura int
)          
as           
   
select * from Matricula 
where Idalumno=@Idalumno AND @Idasignatura=@Idasignatura


GO
/****** Object:  StoredProcedure [dbo].[DesaprobarMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[DesaprobarMatricula]
(          
    @Cod int  
   
)          
as           
Begin           
 UPDATE  Matricula SET Estado='PENDIENTE' WHERE Idmatricula=@Cod           
End  


GO
/****** Object:  StoredProcedure [dbo].[EditAlumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[EditAlumno]
(          
   
	@Apellidos VARCHAR(150),
	@Nombres VARCHAR(50),
	@DNI int,
	@Direccion VARCHAR(100),
	@Telefono int,
	@Idalumno int

)          
as           
Begin           
 UPDATE Alumno SET Apellidos=@Apellidos,Nombres=@Nombres,DNI=@DNI,Direccion=@Direccion,Telefono=@Telefono WHERE Idalumno=@Idalumno
End

GO
/****** Object:  StoredProcedure [dbo].[EditAsignatura]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditAsignatura]
    @Cod int,
	@Asignatura VARCHAR(50),
	@Idcarrera int,
	@Idciclo int,
	@Iddocente int,
	@creditos int

as           
Begin           
 UPDATE Asignatura SET 
 Asignatura=@Asignatura,
 Idcarrera=@Idcarrera,
 Idciclo=@Idciclo,
 Iddocente=@Iddocente,
 creditos=@creditos

 WHERE Idasignatura=@Cod           
End

GO
/****** Object:  StoredProcedure [dbo].[EditCarreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditCarreras]
    @Cod int,
	@Nombrecarrera VARCHAR(150),
	@Nummeses int,
	@Idfacultad int          
as           
Begin           
 UPDATE Carreras SET 
 Nombrecarrera=@Nombrecarrera,
 Nummeses=@Nummeses,
 Idfacultad=@Idfacultad
 WHERE Idcarrera=@Cod           
End

GO
/****** Object:  StoredProcedure [dbo].[EditCiclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EditCiclo]
(          
    @Cod int,
    @Nomciclo VARCHAR(100)
   
)          
as           
Begin           
 UPDATE  Ciclo SET  Nomciclo=@Nomciclo WHERE Idciclo=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[EditDocente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditDocente]
(          
    @Cod int,
    @Nombres VARCHAR(50),
	@Apellidos VARCHAR(100),
	@Direccion VARCHAR(100),
	@Celular char(9)
   
)          
as           
Begin           
 UPDATE  Docente SET Nombres=@Nombres,Apellidos=@Apellidos,Direccion=@Direccion,Celular=@Celular  WHERE Iddocente=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[EditFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditFacultad]
(          
    @Cod int,
    @Nomfacultad VARCHAR(100)
   
)          
as           
Begin           
 UPDATE  Facultad SET  Nomfacultad=@Nomfacultad WHERE Idfacultad=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[EditPeriodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditPeriodo]
(          
    @Cod int,
    @Nomperiodo VARCHAR(100),
   	@Finicio date,
	@Ffin date 
)          
as           
Begin           
 UPDATE  Periodo SET  Nomperiodo=@Nomperiodo , Finicio=@Finicio,Ffin=@Ffin WHERE Idperiodo=@Cod           
End  

GO
/****** Object:  StoredProcedure [dbo].[EditTramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditTramite]        
(          
    @Cod int,    
    @Tramites VARCHAR(50),
	@Costo decimal      
)          
as           
Begin           
 UPDATE  Tramite SET Tramites=@Tramites,Costo=@Costo  WHERE Idtramite=@Cod           
End  


GO
/****** Object:  StoredProcedure [dbo].[EditUsuario]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditUsuario]       
(          
    @Cod int,    
	@Clave varchar(25)  
)          
as           
Begin           
 UPDATE  Usuarios SET  Clave=@Clave  WHERE IdUsuario=@Cod           
End  


GO
/****** Object:  StoredProcedure [dbo].[getAlumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAlumno]
(
	@cod int
)
AS
    select * from Alumno where Idalumno=@cod


GO
/****** Object:  StoredProcedure [dbo].[getAsignatura]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getAsignatura]
(
	@cod int
)
AS
    select * from Asignatura where Idasignatura=@cod


GO
/****** Object:  StoredProcedure [dbo].[getCarreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getCarreras]
(
	@cod int
)
AS
    select * from Carreras where Idcarrera=@cod


GO
/****** Object:  StoredProcedure [dbo].[getCiclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCiclo]
@cod int
AS
    select * from Ciclo where Idciclo=@cod
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[getDocente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getDocente]
(
	@cod int
)
AS
    select * from Docente where Iddocente=@cod


GO
/****** Object:  StoredProcedure [dbo].[getFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getFacultad]
(
	@cod int
)
AS
    select * from Facultad where Idfacultad=@cod


GO
/****** Object:  StoredProcedure [dbo].[getMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getMatricula]
(
	@cod int
)
AS
    select * from Matricula where Idmatricula=@cod


GO
/****** Object:  StoredProcedure [dbo].[getPago]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getPago]
(
	@cod int
)
AS
    select * from Pago where Idpago=@cod


GO
/****** Object:  StoredProcedure [dbo].[getPeriodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPeriodo]
@cod int
AS
    select * from Periodo where Idperiodo=@cod
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[getTramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getTramite]
(
	@cod int
)
AS
    select * from Tramite where Idtramite=@cod


GO
/****** Object:  StoredProcedure [dbo].[getUsuario]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUsuario]
(
	@cod int
)
AS
    select * from Usuarios where IdUsuario=@cod


GO
/****** Object:  StoredProcedure [dbo].[ListadoCiclo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListadoCiclo]
@Id int
AS
    select * from Ciclo
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[ListadoPeriodo]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListadoPeriodo]
@Id int
AS
    select * from Periodo
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[ListarAlumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListarAlumno]
@Id int
AS
    Select * from Alumno
RETURN



GO
/****** Object:  StoredProcedure [dbo].[ListarCarreras]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarCarreras]
@Id int
AS
    Select * from Carreras
RETURN

GO
/****** Object:  StoredProcedure [dbo].[ListarCurso]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListarCurso]
@Id int
AS
    Select * from Cursos
RETURN



GO
/****** Object:  StoredProcedure [dbo].[ListarDocentes]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListarDocentes]
@Id int
AS
    Select * from Docentes
RETURN


GO
/****** Object:  StoredProcedure [dbo].[ListarFacultad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarFacultad]
@Id int
AS
    Select * from Facultad
RETURN



GO
/****** Object:  StoredProcedure [dbo].[ListarMatricula]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListarMatricula]
@Id int
AS
    Select * from Matricula
RETURN


GO
/****** Object:  StoredProcedure [dbo].[ListarPago]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListarPago]
@Id int
AS
    Select * from Pago
RETURN



GO
/****** Object:  StoredProcedure [dbo].[ListarTramite]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarTramite]
@Id int
AS
    Select * from Tramite
RETURN

GO
/****** Object:  StoredProcedure [dbo].[ListarUsuario]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListarUsuario]
@Id int
AS
    Select * from Matricula
RETURN



GO
/****** Object:  StoredProcedure [dbo].[loginusuario]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loginusuario]
(
@Usuario as varchar(30),
@Clave as varchar(30)
)
AS
BEGIN
    Select * from Usuarios where Usuario=@Usuario and Clave=@Clave
END

GO
/****** Object:  StoredProcedure [dbo].[MisAlumnos]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MisAlumnos]
(
   @Iddocente int
)
AS
  
  
   select * from Matricula m , Alumno a , Asignatura c

   where m.Idalumno=a.Idalumno AND m.Idasignatura=c.Idasignatura AND c.Iddocente=@Iddocente


RETURN


GO
/****** Object:  StoredProcedure [dbo].[MisAsignaturas]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MisAsignaturas]
@Iddocente int

AS
    select Idasignatura ,Asignatura,Creditos,ci.Nomciclo,ca.nombrecarrera,d.Apellidos +' '+ d.Nombres as docente,Costo,Numvacante from Asignatura a , Docente d , Carreras ca , Ciclo ci
	WHERE a.Idcarrera=ca.Idcarrera AND a.Idciclo=ci.Idciclo AND a.Iddocente=d.Iddocente AND a.Iddocente=@Iddocente
RETURN


GO
/****** Object:  StoredProcedure [dbo].[Miscursos]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Miscursos]
(
   @Idalumno int
)
AS
  
  
   select * from Matricula m , Alumno a , Asignatura c

   where m.Idalumno=a.Idalumno AND m.Idasignatura=c.Idasignatura AND a.Idalumno= @Idalumno


RETURN


GO
/****** Object:  StoredProcedure [dbo].[obteneridalumno]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[obteneridalumno]
(
   @Idusuario int
)
AS
  
  
   select Idalumno from Alumno where  Idusuario= @Idusuario


RETURN


GO
/****** Object:  StoredProcedure [dbo].[obteneriddocente]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[obteneriddocente]
(
   @Idusuario int
)
AS
  
  
   select Iddocente from Docente where  Idusuario= @Idusuario


RETURN


GO
/****** Object:  StoredProcedure [dbo].[validad]    Script Date: 19/12/2020 16:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[validad]
(          
	@Idalumno int,
	@Idasignatura int,
	@existe bit output
)          
as           
   
	if exists (select * from Matricula where Idalumno=@Idalumno AND @Idasignatura=@Idasignatura)
		 begin 
		 set @existe=1
		 end
	else
		 begin
		 set @existe=0
		 end



GO
USE [master]
GO
ALTER DATABASE [bd_matricula] SET  READ_WRITE 
GO
