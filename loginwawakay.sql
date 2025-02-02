USE [master]
GO
/****** Object:  Database [login]    Script Date: 17/7/2024 15:41:09 ******/
CREATE DATABASE [login]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'login', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\login.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'login_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\login_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [login] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [login].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [login] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [login] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [login] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [login] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [login] SET ARITHABORT OFF 
GO
ALTER DATABASE [login] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [login] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [login] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [login] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [login] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [login] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [login] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [login] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [login] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [login] SET  DISABLE_BROKER 
GO
ALTER DATABASE [login] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [login] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [login] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [login] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [login] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [login] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [login] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [login] SET RECOVERY FULL 
GO
ALTER DATABASE [login] SET  MULTI_USER 
GO
ALTER DATABASE [login] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [login] SET DB_CHAINING OFF 
GO
ALTER DATABASE [login] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [login] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [login] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [login] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'login', N'ON'
GO
ALTER DATABASE [login] SET QUERY_STORE = ON
GO
ALTER DATABASE [login] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [login]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[idAlumnos] [int] IDENTITY(1,1) NOT NULL,
	[CédulaAlumno] [nvarchar](10) NOT NULL,
	[NombresAlumno] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[Direccion] [nvarchar](200) NULL,
	[fechaRegistroA] [datetime] NULL,
	[estadoA] [bit] NULL,
	[idRepresentante] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumnos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asistencias]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencias](
	[idAsistencia] [int] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NULL,
	[fecha] [date] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAsistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[Paralelo] [nvarchar](50) NOT NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
	[fechaRegistroC] [datetime] NULL,
	[estadoC] [bit] NULL,
	[idDocente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deberes]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deberes](
	[idDeber] [int] IDENTITY(1,1) NOT NULL,
	[idMatricula] [int] NULL,
	[Parcial] [int] NULL,
	[NombreDeber] [nvarchar](100) NULL,
	[Calificacion] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDeber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[idDocente] [int] IDENTITY(1,1) NOT NULL,
	[NombresDocente] [nvarchar](100) NOT NULL,
	[CedulaDocente] [nvarchar](10) NOT NULL,
	[TelefonoDocente] [nvarchar](15) NULL,
	[EmailDocente] [nvarchar](100) NULL,
	[fechaRegistroD] [datetime] NULL,
	[estadoD] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[idMateria] [int] IDENTITY(1,1) NOT NULL,
	[NombreMateria] [nvarchar](100) NOT NULL,
	[fechaRegistroM] [datetime] NULL,
	[estadoM] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matriculas]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matriculas](
	[idMatricula] [int] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NULL,
	[idCurso] [int] NULL,
	[fechaRegistroMt] [datetime] NULL,
	[estadoMt] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Representante]    Script Date: 17/7/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Representante](
	[idRepresentante] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Cedula] [nvarchar](10) NOT NULL,
	[Telefono] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[fechaRegistroR] [datetime] NULL,
	[estadoR] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRepresentante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202407140029129_InitialCreate', N'loginwawaky.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD14CEDA6E8DC617649DA06F0157E2AE85489422518E8D225FD6877E527FA14389BAF1A2CBAEBCBB2E02042B727866381C92C3E1D0FFFEFDCFF8D707DF33EE7114BB01999807A37DD3C0C40E1C972C276642172F5E9BBFBEF9FEBBF199E33F181F73BA2346072D493C31EF280D8F2D2BB6EFB08FE291EFDA5110070B3AB203DF424E601DEEEFFF621D1C5818204CC0328CF1FB8450D7C7E9077C4E0362E39026C8BB0C1CECC5BC1C6A6629AA71857C1C87C8C613D30B962EF98ABEA2CF8FA38CDA344E3C17812433EC2D4C031112504441CEE30F319ED12820CB590805C8BB7D0C31D02D9017632EFF7149DEB52BFB87AC2B56D93087B29398067E4FC08323AE1B4B6CBE9286CD4277A0BD33D0327D64BD4E3538312F1C9C16BD0F3C5080C8F078EA458C78625E162C4EE2F00AD351DE7094419E4700F735883E8FAA887B46E7767B852D1D8EF6D9BF3D639A783489F084E08446C8DB336E92B9E7DA7FE0C7DBE0332693A383F9E2E8F5CB57C8397AF5333E7A59ED29F415E86A0550741305218E4036BC28FA6F1A56BD9D25362C9A55DA645A015B8269611A97E8E11D264B7A0713E6F0B5699CBB0FD8C94BB8717D202ECC226844A3043EAF12CF43730F17F556234FF67F03D7C397AF06E17A85EEDD653AF4027F983811CCABF7D84B6BE33B37CCA6576DBC3F71B2F328F0D977DDBEB2DA4FB320896CD699404B728BA225A675E9C65669BC9D4C9A410D6FD639EAEE9B369354366F2529EBD02A332167B1E9D990CBFBB47C3B5BDC4918C2E0A5A6C534D26470F26635125AEF19159AD2740EBA9A0E812EFD9F57C2331FB9DE004B61072EE0852CDCC8C7452FDF06607888F496F906C531AC04CEEF28BE6B101D7E0E20FA0CDB4904063AA3C80F9F9CDBCD5D40F055E2CF99DD6F8ED7604373FB353847360DA233C25AAD8DF72EB03F07093D23CE29A2F803B57340F679EBFADD010611E7C4B6711C9F833163671A80939D035E107A74D81B8E2D50DB7645A61E727DB52F222CA59F72D2D21F5153483E89864CE5973489FA8EADE4DD44CD49F5A26614ADA272B2BEA232B06E92724ABDA02941AB9C19D5609E5E3A42C3BB7A29ECEEFB7AEB6DDEBAB5A0A2C619AC90F8374C7004CB98738328C5112947A0CBBAB10D67211D3EC6F4C9F7A694D347E42543B35A6936A48BC0F0B32185DDFDD9908A09C5F7AEC3BC920E07A09C18E03BD1ABCF56ED734E906CD3D3A1D6CD4D33DFCC1AA09B2E27711CD86E3A0B14A12F1EB8A8CB0F3E9CD11EC5C87A234642A06360E82EDBF2A004FA668A46754D4EB18729364EEC2C343845B18D1C598DD021A78760F98EAA10AC8C88D485FB49E209968E23D608B143500C33D525549E162EB1DD1079AD5A125A76DCC258DF0B1E62CD290E31610C5B35D185B93A00C20428F80883D2A6A1B155B1B86643D478ADBA316F7361CB7197E2121BB1C916DF596397DC7F7B12C36CD6D8068CB359255D04D006F3B661A0FCACD2D500C483CBAE19A87062D2182877A93662A0758D6DC140EB2A7976069A1D51BB8EBF705EDD35F3AC1F9437BFAD37AA6B0BB659D3C78E9966E67B421B0A2D70249BE7E99C55E207AA389C819CFC7C167357573411063EC3B41EB229FD5DA51F6A35838846D404581A5A0B28BF069480A409D543B83C96D7281DF7227AC0E671B74658BEF60BB0151B90B1ABD7A11542FDA5A9689C9D4E1F45CF0A6B908CBCD361A182A3300871F1AA77BC835274715959315D7CE13EDE70A5637C301A14D4E2B96A94947766702DE5A6D9AE259543D6C7255B4B4B82FBA4D152DE99C1B5C46DB45D490AA7A0875BB0968AEA5BF840932D8F7414BB4D5137B6B22C295E30B634E954E34B14862E5956D2AB788931CB72ABA62F66FD938EFC0CC3B26345EE51216DC18906115A62A1165883A4E76E14D35344D11CB138CFD4F12532E5DEAA59FE7396D5ED531EC47C1FC8A9D9EFAC85E2F2BEB6D7CACE08C738871EFACCA349C3E88AF157373758BA1BF250A488DC4F032FF189DEC1D2B7CEEEEFAAEDB31219616C09F24B0E94A42DC9CDADABBED3C0C89362A0412AFC97D5074A0FA15377EE7D5615AEF348F5287980AA8AA20B5A6D6DE0748E4CAFC1127DC4FE63D58AF034F38A27A6540178514F8C4A6E830456A9EB8E5A4F3FA962D66BBA230A39265548A1AA8794D54C929A90D58A95F0341A555374E720E78E54D1E5DAEEC88A2C922AB4A27A056C85CC625D775445A249155851DD1DBBCC3A1117D11DDEB9B4279795B7AEEC70BBDEDEA5C1789A157198ADAF72875F05AA14F7C4E2B7F412182FDF496BD29EF056B6A62CA6B19E356930F42B4FEDF6BBBEF0345ED9EB316B57DAB5C5BDE94A5F8FD7CF669FD432A4039E4852702F0E7AC2816ECC0F57ED8F68A4D35646621AB91A61637F8C29F6478C6034FBE24D3D17B3653C27B844C45DE09866691CE6E1FEC1A1F00E6777DEC45871EC788AC3A9EE614C7DCC36909145EE5164DFA148CE8F58E3DD48092A859E2F88831F26E65F69ABE3348AC17EA5C57BC645FC81B85F12A8B88D126C7C93F33D87C9A3EFF072A310F4DBB37812D15DE5177F7ECA9AEE19D7114CA763635F50F42AC35F7F28D14B9AACE91AD2ACFC7CE2F9CEB6DADB0425AA305B567F8A3077E920CF1072297FF0D1C38F7D45533E35580B51F19C6028BC4154A87B2EB00A96F6A980039F347D2AD0AFB3EAA703AB88A67D36E092FE60E2A381EECB50DE728BFB90E2C0B4892529D5736BD2F55A1998DBDE9BA4DCECB526BA9C7FDD036ED01CEBF55C946796BB3CD8D6A9484D1E0C7B9B76FFE4F9C8BB92825C3AEDDBCD3CDE64B271C385D2FF2AC77807B2E214593EDBCF24DEB4ADE922C03B9E8ED92F5F78C78C8D6FF3DBCF0ADEB4B1E902C43B6E6CBD727F77CCD6B6B57F6ED9D23A6FA15BCFE4959392343739AA28725BA66E167287E3FF3C0023C83CCAEC81A53A35AC29ADB5856149A267AACF4913194B1347E22B5134B3EDD757BEE1377696D334B3D5647236F1E6EB7F236F4ED3CC5B931FB98D1C636586A22AEFBB651D6B4A9F7A4E39C5B59EB4A4B0B7F9AC8DD7F2CF29857810A5D4668FE676F9F9640C0FA29221A74E8F0C61F9A218F6CECADF6484FD3B76972504FB0B8D04DBB55DB3A0B9208B20DFBC05897212214273892972604B3D89A8BB4036856A16804E5F88A7413D760D32C7CE05B94E689850E832F6E75E2DE0C59C8026FE691A745DE6F175C8BEE221BA0062BA2C707F4DDE26AEE714729F2B62421A08E65DF0702F1B4BCAC2BECBC702E92A201D81B8FA0AA7E816FBA10760F13599A17BBC8A6C607EEFF012D98F65045007D23E1075B58F4F5DB48C901F738CB23D7C820D3BFEC39BFF0042BC41059A540000, N'6.5.1')
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([idAlumnos], [CédulaAlumno], [NombresAlumno], [FechaNacimiento], [Direccion], [fechaRegistroA], [estadoA], [idRepresentante]) VALUES (1, N'1234567890', N'Mishell Alejandra Chiles Cholango', CAST(N'2004-12-23' AS Date), N'Colinas del Norte', NULL, 1, 1)
INSERT [dbo].[Alumnos] ([idAlumnos], [CédulaAlumno], [NombresAlumno], [FechaNacimiento], [Direccion], [fechaRegistroA], [estadoA], [idRepresentante]) VALUES (2, N'1212121212', N'Camila Gonzales', CAST(N'2003-02-12' AS Date), N'El Inca', CAST(N'2024-07-13T21:05:22.953' AS DateTime), 1, 2)
INSERT [dbo].[Alumnos] ([idAlumnos], [CédulaAlumno], [NombresAlumno], [FechaNacimiento], [Direccion], [fechaRegistroA], [estadoA], [idRepresentante]) VALUES (3, N'1756187967', N'Shaden Lorena Guerrero Condor', CAST(N'2004-12-21' AS Date), N'Av. 6 De Diciembre, Calle Los Viniedos', NULL, 1, 3)
INSERT [dbo].[Alumnos] ([idAlumnos], [CédulaAlumno], [NombresAlumno], [FechaNacimiento], [Direccion], [fechaRegistroA], [estadoA], [idRepresentante]) VALUES (4, N'1719284752', N'Elvis Pachacama', CAST(N'2020-01-22' AS Date), N'Los Viñedos', CAST(N'2024-07-16T16:15:31.407' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Asistencias] ON 

INSERT [dbo].[Asistencias] ([idAsistencia], [idAlumno], [fecha], [estado]) VALUES (13, 3, CAST(N'2024-07-14' AS Date), 1)
INSERT [dbo].[Asistencias] ([idAsistencia], [idAlumno], [fecha], [estado]) VALUES (14, 2, CAST(N'2024-07-14' AS Date), 1)
INSERT [dbo].[Asistencias] ([idAsistencia], [idAlumno], [fecha], [estado]) VALUES (15, 1, CAST(N'2024-07-14' AS Date), 1)
INSERT [dbo].[Asistencias] ([idAsistencia], [idAlumno], [fecha], [estado]) VALUES (16, 2, CAST(N'2024-07-14' AS Date), 1)
INSERT [dbo].[Asistencias] ([idAsistencia], [idAlumno], [fecha], [estado]) VALUES (17, 3, CAST(N'2024-07-16' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Asistencias] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd6843ad0-f08b-4744-8448-381e19afc086', N'slorenagcjl1216@gmail.com', 0, N'ANrNoRB4xnBFa784b9N3Vof6owJqNJYYi+zCh6WJY/2VDIrCenfUjODXYO9CBFH07w==', N'dbd0a0a4-e024-437d-a9d3-3526b3508d69', NULL, 0, 0, NULL, 1, 0, N'slorenagcjl1216@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([idCurso], [Paralelo], [fechaInicio], [fechaFin], [fechaRegistroC], [estadoC], [idDocente]) VALUES (1, N'PRIMERO A', CAST(N'2024-09-15' AS Date), CAST(N'2025-06-05' AS Date), NULL, 1, 1)
INSERT [dbo].[Cursos] ([idCurso], [Paralelo], [fechaInicio], [fechaFin], [fechaRegistroC], [estadoC], [idDocente]) VALUES (2, N'PRIMERO B', CAST(N'2024-09-15' AS Date), CAST(N'2025-06-05' AS Date), NULL, 1, 2)
INSERT [dbo].[Cursos] ([idCurso], [Paralelo], [fechaInicio], [fechaFin], [fechaRegistroC], [estadoC], [idDocente]) VALUES (3, N'SEGUNDO A', CAST(N'2024-09-15' AS Date), CAST(N'2025-06-05' AS Date), NULL, 0, 3)
INSERT [dbo].[Cursos] ([idCurso], [Paralelo], [fechaInicio], [fechaFin], [fechaRegistroC], [estadoC], [idDocente]) VALUES (4, N'SEGUNDO B', CAST(N'2024-09-15' AS Date), CAST(N'2025-06-05' AS Date), NULL, 1, 3)
INSERT [dbo].[Cursos] ([idCurso], [Paralelo], [fechaInicio], [fechaFin], [fechaRegistroC], [estadoC], [idDocente]) VALUES (5, N'TERCERO A', CAST(N'2025-06-05' AS Date), CAST(N'2024-09-15' AS Date), NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Deberes] ON 

INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (3, 2, 1, N'Seres Vertebrados', CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (4, 2, 2, N'Seres Invertebrados', CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (5, 2, 3, N'Seres Vivos', CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (6, 2, 1, NULL, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (7, 2, 2, NULL, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (8, 2, 3, NULL, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (9, 2, 1, NULL, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (10, 2, 2, NULL, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (11, 2, 3, NULL, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (12, 2, 1, NULL, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (13, 2, 2, NULL, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (14, 2, 3, NULL, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (15, 2, 1, NULL, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (16, 2, 2, NULL, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (17, 2, 3, NULL, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (18, 2, 1, NULL, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (19, 2, 2, NULL, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Deberes] ([idDeber], [idMatricula], [Parcial], [NombreDeber], [Calificacion]) VALUES (20, 2, 3, NULL, CAST(10.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Deberes] OFF
GO
SET IDENTITY_INSERT [dbo].[Docente] ON 

INSERT [dbo].[Docente] ([idDocente], [NombresDocente], [CedulaDocente], [TelefonoDocente], [EmailDocente], [fechaRegistroD], [estadoD]) VALUES (1, N'Isabel Godoy', N'1234975631', N'0946375867', N'isabel.godoy@gmail.com', NULL, 1)
INSERT [dbo].[Docente] ([idDocente], [NombresDocente], [CedulaDocente], [TelefonoDocente], [EmailDocente], [fechaRegistroD], [estadoD]) VALUES (2, N'Salomé Castro', N'185647596', N'095746857', N'salome.castro@hotmail.com', NULL, 1)
INSERT [dbo].[Docente] ([idDocente], [NombresDocente], [CedulaDocente], [TelefonoDocente], [EmailDocente], [fechaRegistroD], [estadoD]) VALUES (3, N'Camila Estrella', N'1743549851', N'0945873254', N'camila.estrella@gmail.com', NULL, 1)
SET IDENTITY_INSERT [dbo].[Docente] OFF
GO
SET IDENTITY_INSERT [dbo].[Materias] ON 

INSERT [dbo].[Materias] ([idMateria], [NombreMateria], [fechaRegistroM], [estadoM]) VALUES (1, N'Matematicas', CAST(N'2010-07-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Materias] ([idMateria], [NombreMateria], [fechaRegistroM], [estadoM]) VALUES (2, N'Lengua y Literatura', CAST(N'2024-07-14T07:03:18.640' AS DateTime), NULL)
INSERT [dbo].[Materias] ([idMateria], [NombreMateria], [fechaRegistroM], [estadoM]) VALUES (3, N'Ciencias Naturales', CAST(N'2024-07-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Materias] ([idMateria], [NombreMateria], [fechaRegistroM], [estadoM]) VALUES (5, N'Estudios Sociales', CAST(N'2024-07-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Materias] ([idMateria], [NombreMateria], [fechaRegistroM], [estadoM]) VALUES (6, N'Ingles', CAST(N'2024-07-14T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Materias] OFF
GO
SET IDENTITY_INSERT [dbo].[Matriculas] ON 

INSERT [dbo].[Matriculas] ([idMatricula], [idAlumno], [idCurso], [fechaRegistroMt], [estadoMt]) VALUES (1, 2, 2, CAST(N'2024-07-14T09:51:44.243' AS DateTime), NULL)
INSERT [dbo].[Matriculas] ([idMatricula], [idAlumno], [idCurso], [fechaRegistroMt], [estadoMt]) VALUES (2, 1, 2, CAST(N'2024-07-14T10:45:47.257' AS DateTime), NULL)
INSERT [dbo].[Matriculas] ([idMatricula], [idAlumno], [idCurso], [fechaRegistroMt], [estadoMt]) VALUES (3, 3, 1, CAST(N'2024-07-14T14:28:39.407' AS DateTime), NULL)
INSERT [dbo].[Matriculas] ([idMatricula], [idAlumno], [idCurso], [fechaRegistroMt], [estadoMt]) VALUES (4, 2, 5, CAST(N'2024-07-14T20:47:10.660' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Matriculas] OFF
GO
SET IDENTITY_INSERT [dbo].[Representante] ON 

INSERT [dbo].[Representante] ([idRepresentante], [Nombres], [Cedula], [Telefono], [Email], [fechaRegistroR], [estadoR]) VALUES (1, N'Juan Perez', N'1726374869', N'0967364746', N'juan.perez@gmail.com', NULL, 1)
INSERT [dbo].[Representante] ([idRepresentante], [Nombres], [Cedula], [Telefono], [Email], [fechaRegistroR], [estadoR]) VALUES (2, N'Micaela Suarez', N'1234543213', N'0938745768', N'micaela.suarez@hotmail.com', NULL, 1)
INSERT [dbo].[Representante] ([idRepresentante], [Nombres], [Cedula], [Telefono], [Email], [fechaRegistroR], [estadoR]) VALUES (3, N'Teresa Condor', N'1716866163', N'0939516970', N'teresajesus171@hotmail.com', CAST(N'2024-07-14T14:27:38.773' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Representante] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/7/2024 15:41:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17/7/2024 15:41:10 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17/7/2024 15:41:10 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 17/7/2024 15:41:10 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 17/7/2024 15:41:10 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/7/2024 15:41:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumnos] ADD  DEFAULT (getdate()) FOR [fechaRegistroA]
GO
ALTER TABLE [dbo].[Cursos] ADD  DEFAULT (getdate()) FOR [fechaRegistroC]
GO
ALTER TABLE [dbo].[Docente] ADD  DEFAULT (getdate()) FOR [fechaRegistroD]
GO
ALTER TABLE [dbo].[Materias] ADD  DEFAULT (getdate()) FOR [fechaRegistroM]
GO
ALTER TABLE [dbo].[Matriculas] ADD  DEFAULT (getdate()) FOR [fechaRegistroMt]
GO
ALTER TABLE [dbo].[Representante] ADD  DEFAULT (getdate()) FOR [fechaRegistroR]
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD FOREIGN KEY([idRepresentante])
REFERENCES [dbo].[Representante] ([idRepresentante])
GO
ALTER TABLE [dbo].[Asistencias]  WITH CHECK ADD FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumnos])
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD FOREIGN KEY([idDocente])
REFERENCES [dbo].[Docente] ([idDocente])
GO
ALTER TABLE [dbo].[Deberes]  WITH CHECK ADD FOREIGN KEY([idMatricula])
REFERENCES [dbo].[Matriculas] ([idMatricula])
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumnos])
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
USE [master]
GO
ALTER DATABASE [login] SET  READ_WRITE 
GO
