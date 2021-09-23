USE [master]
GO
/****** Object:  Database [SMSDB]    Script Date: 9/23/2021 7:10:27 PM ******/
CREATE DATABASE [SMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SMSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SMSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SMSDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMSDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMSDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMSDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [SMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMSDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SMSDB] SET QUERY_STORE = OFF
GO
USE [SMSDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/23/2021 7:10:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcademicClass]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ClassSerial] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AcademicClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcademicSection]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicSection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[AcademicClassId] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
	[AcademicSessionId] [int] NOT NULL,
 CONSTRAINT [PK_AcademicSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcademicSession]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AcademicSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcademicSubject]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](max) NULL,
	[AcademicSubjectTypeId] [int] NOT NULL,
	[TotalMarks] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
	[SubjectFor] [nvarchar](1) NOT NULL,
	[SubjectCode] [int] NULL,
 CONSTRAINT [PK_AcademicSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcademicSubjectType]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicSubjectType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectTypeName] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AcademicSubjectType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttachDocs]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachDocs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentsName] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[StudentId] [int] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_AttachDocs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceDate] [datetime2](7) NOT NULL,
	[IsPresent] [bit] NOT NULL,
	[StudentId] [int] NOT NULL,
	[InTime] [datetime2](7) NOT NULL,
	[OutTime] [datetime2](7) NOT NULL,
	[AcademicClassId] [int] NOT NULL,
	[AcademicSessionId] [int] NOT NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassFeeList]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassFeeList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentFeeHeadId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[AcademicClassId] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
	[AcademicSessionId] [int] NULL,
 CONSTRAINT [PK_ClassFeeList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
	[DesignationTypeId] [int] NOT NULL,
	[EmpTypeId] [int] NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationType]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationTypeName] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DesignationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DivisionId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](40) NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[GenderId] [int] NOT NULL,
	[ReligionId] [int] NOT NULL,
	[NationalityId] [int] NOT NULL,
	[NIDNo] [bigint] NOT NULL,
	[NIDCard] [nvarchar](max) NULL,
	[Phone] [bigint] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Nominee] [nvarchar](max) NULL,
	[NomineePhone] [bigint] NOT NULL,
	[EmpTypeId] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[JoiningDate] [datetime2](7) NOT NULL,
	[PresentAddress] [nvarchar](max) NULL,
	[PresentUpazilaId] [int] NOT NULL,
	[PresentDistrictId] [int] NOT NULL,
	[PresentDivisionId] [int] NULL,
	[PermanentAddress] [nvarchar](max) NULL,
	[PermanentUpazilaId] [int] NOT NULL,
	[PermanentDistrictId] [int] NOT NULL,
	[PermanentDivisionId] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
	[Status] [bit] NOT NULL,
	[BloodGroupId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpType]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmpType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institute]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ISO] [nvarchar](max) NULL,
	[EIIN] [nvarchar](max) NULL,
	[Slogan] [nvarchar](max) NULL,
	[Banner] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Institute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religion]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ClassRoll] [int] NOT NULL,
	[AcademicClassId] [int] NOT NULL,
	[AcademicSectionId] [int] NULL,
	[FatherName] [nvarchar](max) NULL,
	[MotherName] [nvarchar](max) NULL,
	[AdmissionDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNo] [bigint] NOT NULL,
	[GuardianPhone] [bigint] NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[DOB] [datetime2](7) NOT NULL,
	[ReligionId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
	[BloodGroupId] [int] NOT NULL,
	[NationalityId] [int] NOT NULL,
	[PresentAddressArea] [nvarchar](max) NULL,
	[PresentAddressPO] [nvarchar](max) NULL,
	[PresentUpazilaId] [int] NOT NULL,
	[PresentDistrictId] [int] NOT NULL,
	[PresentDivisiontId] [int] NOT NULL,
	[PermanentAddressArea] [nvarchar](max) NULL,
	[PermanentAddressPO] [nvarchar](max) NULL,
	[PermanentUpazilaId] [int] NOT NULL,
	[PermanentDistrictId] [int] NOT NULL,
	[PermanentDivisiontId] [int] NOT NULL,
	[AcademicSessionId] [int] NOT NULL,
	[PreviousSchool] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
	[PermanentDivisionId] [int] NULL,
	[PresentDivisionId] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentFeeHead]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFeeHead](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Repeatedly] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StudentFeeHead] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPayment]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ReceiptNo] [nvarchar](max) NOT NULL,
	[PaidDate] [datetime2](7) NOT NULL,
	[WaiverAmount] [float] NOT NULL,
	[WaiverFor] [nvarchar](max) NULL,
	[Attachment] [nvarchar](max) NULL,
	[TotalPayment] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StudentPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPaymentDetails]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentPaymentId] [int] NOT NULL,
	[StudentFeeHeadId] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StudentPaymentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Upazila]    Script Date: 9/23/2021 7:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Upazila](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DistrictId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[EditedBy] [nvarchar](max) NULL,
	[EditedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Upazila] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210521042757_InitialMigration', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210523151407_DesignationConnectWithDesignationType', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210526162059_sessionIdRemovedFromAcademicClass', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210622165900_EmployeeModified', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210622184219_DesignationModified', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210622195043_Employee_BloodGroup_Added', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210625002344_AcademicSectionModified', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210628124324_AcademicSubjectTypeModified', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210628184331_AcademicSubjectModified', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210629134124_AcademicSubjectModified_SubjectCodeAdded', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[AcademicClass] ON 

INSERT [dbo].[AcademicClass] ([Id], [Name], [ClassSerial], [Description], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Class 6(Six)', 6, N'this is class six', 1, NULL, CAST(N'2021-09-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[AcademicClass] ([Id], [Name], [ClassSerial], [Description], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Class 7(Seven)', 7, N'this is class seven', 1, NULL, CAST(N'2021-09-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[AcademicClass] ([Id], [Name], [ClassSerial], [Description], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Class 8(Eight)', 8, N'this is class eight', 1, NULL, CAST(N'2021-09-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[AcademicClass] ([Id], [Name], [ClassSerial], [Description], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (4, N'Class 9(Nine)', 9, N'this is class nine', 1, NULL, CAST(N'2021-09-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[AcademicClass] ([Id], [Name], [ClassSerial], [Description], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (5, N'Class 10(Ten)', 10, N'this is class ', 1, NULL, CAST(N'2021-09-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AcademicClass] OFF
GO
SET IDENTITY_INSERT [dbo].[AcademicSection] ON 

INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (1, N'Section -A', 1, 1, NULL, CAST(N'2021-09-23T14:39:44.5990899' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (2, N'Section -A', 1, 2, NULL, CAST(N'2021-09-23T14:39:55.0739069' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (3, N'Section -A', 1, 3, NULL, CAST(N'2021-09-23T14:40:04.1738881' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (4, N'Section -A', 1, 4, NULL, CAST(N'2021-09-23T14:40:31.0935682' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (5, N'Section -A', 1, 5, NULL, CAST(N'2021-09-23T14:40:44.7974706' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (6, N'Section -A', 1, 1, NULL, CAST(N'2021-09-23T14:40:54.3598202' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (7, N'Section -A', 1, 2, NULL, CAST(N'2021-09-23T14:41:02.0207047' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (8, N'Section -A', 1, 3, NULL, CAST(N'2021-09-23T14:41:11.9581596' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (9, N'Section -A', 1, 4, NULL, CAST(N'2021-09-23T14:41:28.4946873' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[AcademicSection] ([Id], [Name], [Status], [AcademicClassId], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [AcademicSessionId]) VALUES (10, N'Section -A', 1, 5, NULL, CAST(N'2021-09-23T14:41:36.2124335' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[AcademicSection] OFF
GO
SET IDENTITY_INSERT [dbo].[AcademicSession] ON 

INSERT [dbo].[AcademicSession] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'2021-2022', 1, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2021-09-23T14:46:13.4716756' AS DateTime2))
INSERT [dbo].[AcademicSession] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'2020-2021', 1, NULL, CAST(N'2021-09-23T14:35:53.9030529' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AcademicSession] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodGroup] ON 

INSERT [dbo].[BloodGroup] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'O+', 1, NULL, CAST(N'2021-09-23T16:04:35.8154658' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BloodGroup] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'B+', 1, NULL, CAST(N'2021-09-23T16:04:46.3910435' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BloodGroup] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'AB+', 1, NULL, CAST(N'2021-09-23T16:04:53.6469963' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[BloodGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Cumilla', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Feni', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Brahmanbaria', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (4, N'Rangamati', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (5, N'Noakhali', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (6, N'Chandpur', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (7, N'Lakshmipur', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (8, N'Chattogram', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (9, N'Coxsbazar', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (10, N'Khagrachhari', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (11, N'Bandarban', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (12, N'Sirajganj', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (13, N'Pabna', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (14, N'Bogura', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (15, N'Rajshahi', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (16, N'Natore', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (17, N'Joypurhat', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (18, N'Chapainawabganj', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (19, N'Naogaon', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (20, N'Jashore', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (21, N'Satkhira', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (22, N'Meherpur', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (23, N'Narail', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (24, N'Chuadanga', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (25, N'Kushtia', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (26, N'Magura', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (27, N'Khulna', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (28, N'Bagerhat', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (29, N'Jhenaidah', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (30, N'Jhalakathi', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (31, N'Patuakhali', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (32, N'Pirojpur', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (33, N'Barishal', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (34, N'Bhola', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (35, N'Barguna', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (36, N'Sylhet', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (37, N'Moulvibazar', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (38, N'Habiganj', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (39, N'Sunamganj', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (40, N'Narsingdi', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (41, N'Gazipur', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (42, N'Shariatpur', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (43, N'Narayanganj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (44, N'Tangail', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (45, N'Kishoreganj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (46, N'Manikganj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (47, N'Dhaka', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (48, N'Munshiganj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (49, N'Rajbari', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (50, N'Madaripur', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (51, N'Gopalganj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (52, N'Faridpur', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (53, N'Panchagarh', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (54, N'Dinajpur', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (55, N'Lalmonirhat', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (56, N'Nilphamari', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (57, N'Gaibandha', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (58, N'Thakurgaon', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (59, N'Rangpur', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (60, N'Kurigram', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (61, N'Sherpur', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (62, N'Mymensingh', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (63, N'Jamalpur', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[District] ([Id], [Name], [DivisionId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (64, N'Netrokona', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[Division] ON 

INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Chattogram', 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Rajshahi', 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Khulna', 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (4, N'Barishal', 1, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T16:34:57.3635855' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (5, N'Sylhet', 1, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T16:34:27.1341057' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (6, N'Dhaka', 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (7, N'Rangpur', 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Division] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (8, N'Mymensingh', 1, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T16:36:26.6658650' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Division] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Male', 1, NULL, CAST(N'2021-09-23T16:02:33.0519295' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Gender] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Female', 1, NULL, CAST(N'2021-09-23T16:02:44.4193982' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Gender] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Others', 1, NULL, CAST(N'2021-09-23T16:02:52.6429994' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Bangladeshi', 1, NULL, CAST(N'2021-09-23T16:05:11.4746707' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Nationality] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Indian', 1, NULL, CAST(N'2021-09-23T16:05:18.3890789' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Nationality] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Pakistani', 1, NULL, CAST(N'2021-09-23T16:05:26.3891552' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Nationality] OFF
GO
SET IDENTITY_INSERT [dbo].[Religion] ON 

INSERT [dbo].[Religion] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Islam', 1, NULL, CAST(N'2021-09-23T16:03:34.5611565' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Religion] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Hindu', 1, NULL, CAST(N'2021-09-23T16:03:43.6992536' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Religion] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Cristian', 1, NULL, CAST(N'2021-09-23T16:03:52.8769994' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Religion] ([Id], [Name], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (4, N'Buddhist', 1, NULL, CAST(N'2021-09-23T16:04:01.2595093' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Religion] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [ClassRoll], [AcademicClassId], [AcademicSectionId], [FatherName], [MotherName], [AdmissionDate], [Email], [PhoneNo], [GuardianPhone], [Photo], [DOB], [ReligionId], [GenderId], [BloodGroupId], [NationalityId], [PresentAddressArea], [PresentAddressPO], [PresentUpazilaId], [PresentDistrictId], [PresentDivisiontId], [PermanentAddressArea], [PermanentAddressPO], [PermanentUpazilaId], [PermanentDistrictId], [PermanentDivisiontId], [AcademicSessionId], [PreviousSchool], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt], [PermanentDivisionId], [PresentDivisionId]) VALUES (1, N'Akter Hossain', 20216001, 1, 6, N'Akter Hossain', N'Akter Hossain', CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), N'nillakash4097@gmail.com', 1711894097, 1977894097, N'S_SMS._20216001.png', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), 1, 1, 2, 1, N'asdf', N'Mirpur', 511, 47, 0, N'asdf', N'Mirpur', 511, 47, 0, 2, NULL, 1, NULL, CAST(N'2021-09-23T16:08:33.3680520' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentFeeHead] ON 

INSERT [dbo].[StudentFeeHead] ([Id], [Name], [Repeatedly], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Monthly Fee', 1, NULL, CAST(N'2021-09-23T14:42:59.9395948' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[StudentFeeHead] ([Id], [Name], [Repeatedly], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Admission Fee', 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2021-09-23T14:44:16.8610488' AS DateTime2))
INSERT [dbo].[StudentFeeHead] ([Id], [Name], [Repeatedly], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Exam Fee', 0, NULL, CAST(N'2021-09-23T14:44:02.8358140' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[StudentFeeHead] OFF
GO
SET IDENTITY_INSERT [dbo].[Upazila] ON 

INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (1, N'Debidwar', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (2, N'Barura', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (3, N'Brahmanpara', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (4, N'Chandina', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (5, N'Chauddagram', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (6, N'Daudkandi', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (7, N'Homna', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (8, N'Laksam', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (9, N'Muradnagar', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (10, N'Nangalkot', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (11, N'Comilla Sadar', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (12, N'Meghna', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (13, N'Monohargonj', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (14, N'Sadarsouth', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (15, N'Titas', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (16, N'Burichang', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (17, N'Lalmai', 1, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (18, N'Chhagalnaiya', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (19, N'Feni Sadar', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (20, N'Sonagazi', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (21, N'Fulgazi', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (22, N'Parshuram', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (23, N'Daganbhuiyan', 2, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (24, N'Brahmanbaria Sadar', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (25, N'Kasba', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (26, N'Nasirnagar', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (27, N'Sarail', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (28, N'Ashuganj', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (29, N'Akhaura', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (30, N'Nabinagar', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (31, N'Bancharampur', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (32, N'Bijoynagar', 3, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (33, N'Rangamati Sadar', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (34, N'Kaptai', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (35, N'Kawkhali', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (36, N'Baghaichari', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (37, N'Barkal', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (38, N'Langadu', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (39, N'Rajasthali', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (40, N'Belaichari', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (41, N'Juraichari', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (42, N'Naniarchar', 4, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (43, N'Noakhali Sadar', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (44, N'Companiganj', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (45, N'Begumganj', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (46, N'Hatia', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (47, N'Subarnachar', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (48, N'Kabirhat', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (49, N'Senbug', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (50, N'Chatkhil', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (51, N'Sonaimori', 5, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (52, N'Haimchar', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (53, N'Kachua', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (54, N'Shahrasti', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (55, N'Chandpur Sadar', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (56, N'Matlab South', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (57, N'Hajiganj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (58, N'Matlab North', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (59, N'Faridgonj', 6, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (60, N'Lakshmipur Sadar', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (61, N'Kamalnagar', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (62, N'Raipur', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (63, N'Ramgati', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (64, N'Ramganj', 7, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (65, N'Rangunia', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (66, N'Sitakunda', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (67, N'Mirsharai', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (68, N'Patiya', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (69, N'Sandwip', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (70, N'Banshkhali', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (71, N'Boalkhali', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (72, N'Anwara', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (73, N'Chandanaish', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (74, N'Satkania', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (75, N'Lohagara', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (76, N'Hathazari', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (77, N'Fatikchhari', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (78, N'Raozan', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (79, N'Karnafuli', 8, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (80, N'Coxsbazar Sadar', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (81, N'Chakaria', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (82, N'Kutubdia', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (83, N'Ukhiya', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (84, N'Moheshkhali', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (85, N'Pekua', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (86, N'Ramu', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (87, N'Teknaf', 9, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (88, N'Khagrachhari Sadar', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (89, N'Dighinala', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (90, N'Panchari', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (91, N'Laxmichhari', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (92, N'Mohalchari', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (93, N'Manikchari', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (94, N'Ramgarh', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (95, N'Matiranga', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (96, N'Guimara', 10, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (97, N'Bandarban Sadar', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (98, N'Alikadam', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (99, N'Naikhongchhari', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (100, N'Rowangchhari', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (101, N'Lama', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (102, N'Ruma', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (103, N'Thanchi', 11, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (104, N'Belkuchi', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (105, N'Chauhali', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (106, N'Kamarkhand', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (107, N'Kazipur', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (108, N'Raigonj', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (109, N'Shahjadpur', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (110, N'Sirajganj Sadar', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (111, N'Tarash', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (112, N'Ullapara', 12, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (113, N'Sujanagar', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (114, N'Ishurdi', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (115, N'Bhangura', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (116, N'Pabna Sadar', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (117, N'Bera', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (118, N'Atghoria', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (119, N'Chatmohar', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (120, N'Santhia', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (121, N'Faridpur', 13, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (122, N'Kahaloo', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (123, N'Bogra Sadar', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (124, N'Shariakandi', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (125, N'Shajahanpur', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (126, N'Dupchanchia', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (127, N'Adamdighi', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (128, N'Nondigram', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (129, N'Sonatala', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (130, N'Dhunot', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (131, N'Gabtali', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (132, N'Sherpur', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (133, N'Shibganj', 14, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (134, N'Paba', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (135, N'Durgapur', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (136, N'Mohonpur', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (137, N'Charghat', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (138, N'Puthia', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (139, N'Bagha', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (140, N'Godagari', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (141, N'Tanore', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (142, N'Bagmara', 15, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (143, N'Natore Sadar', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (144, N'Singra', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (145, N'Baraigram', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (146, N'Bagatipara', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (147, N'Lalpur', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (148, N'Gurudaspur', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (149, N'Naldanga', 16, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (150, N'Akkelpur', 17, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (151, N'Kalai', 17, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (152, N'Khetlal', 17, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (153, N'Panchbibi', 17, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (154, N'Joypurhat Sadar', 17, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (155, N'Chapainawabganj Sadar', 18, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (156, N'Gomostapur', 18, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (157, N'Nachol', 18, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (158, N'Bholahat', 18, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (159, N'Shibganj', 18, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (160, N'Mohadevpur', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (161, N'Badalgachi', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (162, N'Patnitala', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (163, N'Dhamoirhat', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (164, N'Niamatpur', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (165, N'Manda', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (166, N'Atrai', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (167, N'Raninagar', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (168, N'Naogaon Sadar', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (169, N'Porsha', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (170, N'Sapahar', 19, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (171, N'Manirampur', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (172, N'Abhaynagar', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (173, N'Bagherpara', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (174, N'Chougachha', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (175, N'Jhikargacha', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (176, N'Keshabpur', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (177, N'Jessore Sadar', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (178, N'Sharsha', 20, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (179, N'Assasuni', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (180, N'Debhata', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (181, N'Kalaroa', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (182, N'Satkhira Sadar', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (183, N'Shyamnagar', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (184, N'Tala', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (185, N'Kaliganj', 21, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (186, N'Mujibnagar', 22, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (187, N'Meherpur Sadar', 22, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (188, N'Gangni', 22, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (189, N'Narail Sadar', 23, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (190, N'Lohagara', 23, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (191, N'Kalia', 23, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (192, N'Chuadanga Sadar', 24, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (193, N'Alamdanga', 24, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (194, N'Damurhuda', 24, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (195, N'Jibannagar', 24, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (196, N'Kushtia Sadar', 25, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (197, N'Kumarkhali', 25, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (198, N'Khoksa', 25, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (199, N'Mirpur', 25, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (200, N'Daulatpur', 25, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (201, N'Bheramara', 25, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (202, N'Shalikha', 26, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (203, N'Sreepur', 26, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (204, N'Magura Sadar', 26, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (205, N'Mohammadpur', 26, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (206, N'Paikgasa', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (207, N'Fultola', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (208, N'Digholia', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (209, N'Rupsha', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (210, N'Terokhada', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (211, N'Dumuria', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (212, N'Botiaghata', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (213, N'Dakop', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (214, N'Koyra', 27, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (215, N'Fakirhat', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (216, N'Bagerhat Sadar', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (217, N'Mollahat', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (218, N'Sarankhola', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (219, N'Rampal', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (220, N'Morrelganj', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (221, N'Kachua', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (222, N'Mongla', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (223, N'Chitalmari', 28, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (224, N'Jhenaidah Sadar', 29, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (225, N'Shailkupa', 29, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (226, N'Harinakundu', 29, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (227, N'Kaliganj', 29, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (228, N'Kotchandpur', 29, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (229, N'Moheshpur', 29, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (230, N'Jhalakathi Sadar', 30, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (231, N'Kathalia', 30, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (232, N'Nalchity', 30, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (233, N'Rajapur', 30, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (234, N'Bauphal', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (235, N'Patuakhali Sadar', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (236, N'Dumki', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (237, N'Dashmina', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (238, N'Kalapara', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (239, N'Mirzaganj', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (240, N'Galachipa', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (241, N'Rangabali', 31, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (242, N'Pirojpur Sadar', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (243, N'Nazirpur', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (244, N'Kawkhali', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (245, N'Zianagar', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (246, N'Bhandaria', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (247, N'Mathbaria', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (248, N'Nesarabad', 32, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (249, N'Barisal Sadar', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (250, N'Bakerganj', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (251, N'Babuganj', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (252, N'Wazirpur', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (253, N'Banaripara', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (254, N'Gournadi', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (255, N'Agailjhara', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (256, N'Mehendiganj', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (257, N'Muladi', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (258, N'Hizla', 33, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (259, N'Bhola Sadar', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (260, N'Borhan Sddin', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (261, N'Charfesson', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (262, N'Doulatkhan', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (263, N'Monpura', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (264, N'Tazumuddin', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (265, N'Lalmohan', 34, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (266, N'Amtali', 35, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (267, N'Barguna Sadar', 35, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (268, N'Betagi', 35, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (269, N'Bamna', 35, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (270, N'Pathorghata', 35, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (271, N'Taltali', 35, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (272, N'Balaganj', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (273, N'Beanibazar', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (274, N'Bishwanath', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (275, N'Companiganj', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (276, N'Fenchuganj', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (277, N'Golapganj', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (278, N'Gowainghat', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (279, N'Jaintiapur', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (280, N'Kanaighat', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (281, N'Sylhet Sadar', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (282, N'Zakiganj', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (283, N'Dakshinsurma', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (284, N'Osmaninagar', 36, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (285, N'Barlekha', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (286, N'Kamolganj', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (287, N'Kulaura', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (288, N'Moulvibazar Sadar', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (289, N'Rajnagar', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (290, N'Sreemangal', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (291, N'Juri', 37, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (292, N'Nabiganj', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (293, N'Bahubal', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (294, N'Ajmiriganj', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (295, N'Baniachong', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (296, N'Lakhai', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (297, N'Chunarughat', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (298, N'Habiganj Sadar', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (299, N'Madhabpur', 38, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (300, N'Sunamganj Sadar', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (301, N'South Sunamganj', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (302, N'Bishwambarpur', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (303, N'Chhatak', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (304, N'Jagannathpur', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (305, N'Dowarabazar', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (306, N'Tahirpur', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (307, N'Dharmapasha', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (308, N'Jamalganj', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (309, N'Shalla', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (310, N'Derai', 39, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (311, N'Belabo', 40, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (312, N'Monohardi', 40, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (313, N'Narsingdi Sadar', 40, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (314, N'Palash', 40, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (315, N'Raipura', 40, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (316, N'Shibpur', 40, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (317, N'Kaliganj', 41, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (318, N'Kaliakair', 41, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (319, N'Kapasia', 41, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (320, N'Gazipur Sadar', 41, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (321, N'Sreepur', 41, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (322, N'Shariatpur Sadar', 42, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (323, N'Naria', 42, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (324, N'Zajira', 42, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (325, N'Gosairhat', 42, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (326, N'Bhedarganj', 42, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (327, N'Damudya', 42, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (328, N'Araihazar', 43, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (329, N'Bandar', 43, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (330, N'Narayanganj Sadar', 43, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (331, N'Rupganj', 43, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (332, N'Sonargaon', 43, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (333, N'Basail', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (334, N'Bhuapur', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (335, N'Delduar', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (336, N'Ghatail', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (337, N'Gopalpur', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (338, N'Madhupur', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (339, N'Mirzapur', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (340, N'Nagarpur', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (341, N'Sakhipur', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (342, N'Tangail Sadar', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (343, N'Kalihati', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (344, N'Dhanbari', 44, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (345, N'Itna', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (346, N'Katiadi', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (347, N'Bhairab', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (348, N'Tarail', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (349, N'Hossainpur', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (350, N'Pakundia', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (351, N'Kuliarchar', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (352, N'Kishoreganj Sadar', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (353, N'Karimgonj', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (354, N'Bajitpur', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (355, N'Austagram', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (356, N'Mithamoin', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (357, N'Nikli', 45, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (358, N'Harirampur', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (359, N'Saturia', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (360, N'Manikganj Sadar', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (361, N'Gior', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (362, N'Shibaloy', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (363, N'Doulatpur', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (364, N'Singiar', 46, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (365, N'Savar', 47, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (366, N'Dhamrai', 47, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (367, N'Keraniganj', 47, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (368, N'Nawabganj', 47, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (369, N'Dohar', 47, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (370, N'Munshiganj Sadar', 48, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (371, N'Sreenagar', 48, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (372, N'Sirajdikhan', 48, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (373, N'Louhajanj', 48, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (374, N'Gajaria', 48, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (375, N'Tongibari', 48, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (376, N'Rajbari Sadar', 49, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (377, N'Goalanda', 49, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (378, N'Pangsa', 49, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (379, N'Baliakandi', 49, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (380, N'Kalukhali', 49, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (381, N'Madaripur Sadar', 50, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (382, N'Shibchar', 50, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (383, N'Kalkini', 50, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (384, N'Rajoir', 50, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (385, N'Gopalganj Sadar', 51, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (386, N'Kashiani', 51, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (387, N'Tungipara', 51, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (388, N'Kotalipara', 51, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (389, N'Muksudpur', 51, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (390, N'Faridpur Sadar', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (391, N'Alfadanga', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (392, N'Boalmari', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (393, N'Sadarpur', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (394, N'Nagarkanda', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (395, N'Bhanga', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (396, N'Charbhadrasan', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (397, N'Madhukhali', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (398, N'Saltha', 52, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (399, N'Panchagarh Sadar', 53, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (400, N'Debiganj', 53, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (401, N'Boda', 53, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (402, N'Atwari', 53, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (403, N'Tetulia', 53, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (404, N'Nawabganj', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (405, N'Birganj', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (406, N'Ghoraghat', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (407, N'Birampur', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (408, N'Parbatipur', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (409, N'Bochaganj', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (410, N'Kaharol', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (411, N'Fulbari', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (412, N'Dinajpur Sadar', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (413, N'Hakimpur', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (414, N'Khansama', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (415, N'Birol', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (416, N'Chirirbandar', 54, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (417, N'Lalmonirhat Sadar', 55, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (418, N'Kaliganj', 55, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (419, N'Hatibandha', 55, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (420, N'Patgram', 55, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (421, N'Aditmari', 55, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (422, N'Syedpur', 56, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (423, N'Domar', 56, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (424, N'Dimla', 56, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (425, N'Jaldhaka', 56, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (426, N'Kishorganj', 56, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (427, N'Nilphamari Sadar', 56, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (428, N'Sadullapur', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (429, N'Gaibandha Sadar', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (430, N'Palashbari', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (431, N'Saghata', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (432, N'Gobindaganj', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (433, N'Sundarganj', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (434, N'Phulchari', 57, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (435, N'Thakurgaon Sadar', 58, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (436, N'Pirganj', 58, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (437, N'Ranisankail', 58, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (438, N'Haripur', 58, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (439, N'Baliadangi', 58, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (440, N'Rangpur Sadar', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (441, N'Gangachara', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (442, N'Taragonj', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (443, N'Badargonj', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (444, N'Mithapukur', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (445, N'Pirgonj', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (446, N'Kaunia', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (447, N'Pirgacha', 59, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (448, N'Kurigram Sadar', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (449, N'Nageshwari', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (450, N'Bhurungamari', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (451, N'Phulbari', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (452, N'Rajarhat', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (453, N'Ulipur', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (454, N'Chilmari', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (455, N'Rowmari', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (456, N'Charrajibpur', 60, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (457, N'Sherpur Sadar', 61, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (458, N'Nalitabari', 61, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (459, N'Sreebordi', 61, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (460, N'Nokla', 61, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (461, N'Jhenaigati', 61, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (462, N'Fulbaria', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (463, N'Trishal', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (464, N'Bhaluka', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (465, N'Muktagacha', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (466, N'Mymensingh Sadar', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (467, N'Dhobaura', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (468, N'Phulpur', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (469, N'Haluaghat', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (470, N'Gouripur', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (471, N'Gafargaon', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (472, N'Iswarganj', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (473, N'Nandail', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (474, N'Tarakanda', 62, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (475, N'Jamalpur Sadar', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (476, N'Melandah', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (477, N'Islampur', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (478, N'Dewangonj', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (479, N'Sarishabari', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (480, N'Madarganj', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (481, N'Bokshiganj', 63, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (482, N'Barhatta', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (483, N'Durgapur', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (484, N'Kendua', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (485, N'Atpara', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (486, N'Madan', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (487, N'Khaliajuri', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (488, N'Kalmakanda', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (489, N'Mohongonj', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (490, N'Purbadhala', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (491, N'Netrokona Sadar', 64, 1, NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-07-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (492, N'Adabor', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (493, N'Uttar Khan', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (494, N'Uttara', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (495, N'Kadamtali', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (496, N'Kalabagan', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (497, N'Kafrul', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (498, N'Kamrangirchar', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (499, N'Cantonment', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (500, N'Kotwali', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (501, N'Khilkhet', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (502, N'Khilgaon', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (503, N'Gulshan', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (504, N'Gendaria', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (505, N'Chawkbazar Model', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (506, N'Demra', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (507, N'Turag', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (508, N'Tejgaon', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (509, N'Tejgaon I/A', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (510, N'Dakshinkhan', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (511, N'Darus Salam', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (512, N'Dhanmondi', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (513, N'New Market', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (514, N'Paltan', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (515, N'Pallabi', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (516, N'Bangshal', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (517, N'Badda', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (518, N'Bimanbandar', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (519, N'Motijheel', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (520, N'Mirpur Model', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (521, N'Mohammadpur', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (522, N'Jatrabari', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (523, N'Ramna', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (524, N'Rampura', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (525, N'Lalbagh', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (526, N'Shah Ali', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (527, N'Shahbagh', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (528, N'Sher-e-Bangla Nagar', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (529, N'Shyampur', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (530, N'Sabujbagh', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (531, N'Sutrapur', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (532, N'Hazaribagh', 47, 1, NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (533, N'CHITTAGONG PORT', 8, 1, NULL, CAST(N'2020-09-12T12:51:19.2835417' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (534, N'BAYEJID BOSTAMI', 8, 1, NULL, CAST(N'2020-09-12T12:51:34.5963806' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (535, N'CHANDGAON', 8, 1, NULL, CAST(N'2020-09-12T12:51:48.0736040' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (536, N'BAKALIA', 8, 1, NULL, CAST(N'2020-09-12T12:52:11.8514853' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (537, N'DOUBLE MOORING', 8, 1, NULL, CAST(N'2020-09-12T13:51:32.0493218' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (538, N'HALISHAHAR', 8, 1, NULL, CAST(N'2020-09-12T13:52:20.1748203' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (539, N'KOTWALI', 8, 1, NULL, CAST(N'2020-09-12T13:53:07.9289941' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (540, N'KHULSHI', 8, 1, NULL, CAST(N'2020-09-12T13:53:32.0993929' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (541, N'PAHARTALI', 8, 1, NULL, CAST(N'2020-09-12T13:54:37.2551508' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (542, N'PANCHLAISH', 8, 1, NULL, CAST(N'2020-09-12T13:55:02.0186889' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (543, N'PATENGA', 8, 1, NULL, CAST(N'2020-09-12T13:55:35.2664315' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Upazila] ([Id], [Name], [DistrictId], [Status], [CreatedBy], [CreatedAt], [EditedBy], [EditedAt]) VALUES (544, N'Tongi', 41, 1, NULL, CAST(N'2020-09-15T12:25:37.2720031' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Upazila] OFF
GO
/****** Object:  Index [IX_AcademicSection_AcademicClassId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicSection_AcademicClassId] ON [dbo].[AcademicSection]
(
	[AcademicClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicSection_AcademicSessionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicSection_AcademicSessionId] ON [dbo].[AcademicSection]
(
	[AcademicSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicSubject_AcademicSubjectTypeId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicSubject_AcademicSubjectTypeId] ON [dbo].[AcademicSubject]
(
	[AcademicSubjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttachDocs_EmployeeId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AttachDocs_EmployeeId] ON [dbo].[AttachDocs]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttachDocs_StudentId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AttachDocs_StudentId] ON [dbo].[AttachDocs]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendances_AcademicClassId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_AcademicClassId] ON [dbo].[Attendances]
(
	[AcademicClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendances_AcademicSessionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_AcademicSessionId] ON [dbo].[Attendances]
(
	[AcademicSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendances_StudentId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_StudentId] ON [dbo].[Attendances]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassFeeList_AcademicClassId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassFeeList_AcademicClassId] ON [dbo].[ClassFeeList]
(
	[AcademicClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassFeeList_AcademicSessionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassFeeList_AcademicSessionId] ON [dbo].[ClassFeeList]
(
	[AcademicSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassFeeList_StudentFeeHeadId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassFeeList_StudentFeeHeadId] ON [dbo].[ClassFeeList]
(
	[StudentFeeHeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Designation_DesignationTypeId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Designation_DesignationTypeId] ON [dbo].[Designation]
(
	[DesignationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Designation_EmpTypeId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Designation_EmpTypeId] ON [dbo].[Designation]
(
	[EmpTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_District_DivisionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_District_DivisionId] ON [dbo].[District]
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_BloodGroupId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_BloodGroupId] ON [dbo].[Employee]
(
	[BloodGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_DesignationId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_DesignationId] ON [dbo].[Employee]
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_EmpTypeId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_EmpTypeId] ON [dbo].[Employee]
(
	[EmpTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_GenderId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_GenderId] ON [dbo].[Employee]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_NationalityId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_NationalityId] ON [dbo].[Employee]
(
	[NationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_PermanentDistrictId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_PermanentDistrictId] ON [dbo].[Employee]
(
	[PermanentDistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_PermanentDivisionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_PermanentDivisionId] ON [dbo].[Employee]
(
	[PermanentDivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_PermanentUpazilaId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_PermanentUpazilaId] ON [dbo].[Employee]
(
	[PermanentUpazilaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_PresentDistrictId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_PresentDistrictId] ON [dbo].[Employee]
(
	[PresentDistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_PresentDivisionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_PresentDivisionId] ON [dbo].[Employee]
(
	[PresentDivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_PresentUpazilaId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_PresentUpazilaId] ON [dbo].[Employee]
(
	[PresentUpazilaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_ReligionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_ReligionId] ON [dbo].[Employee]
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_AcademicClassId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_AcademicClassId] ON [dbo].[Student]
(
	[AcademicClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_AcademicSectionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_AcademicSectionId] ON [dbo].[Student]
(
	[AcademicSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_AcademicSessionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_AcademicSessionId] ON [dbo].[Student]
(
	[AcademicSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_BloodGroupId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_BloodGroupId] ON [dbo].[Student]
(
	[BloodGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_GenderId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_GenderId] ON [dbo].[Student]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_NationalityId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_NationalityId] ON [dbo].[Student]
(
	[NationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_PermanentDistrictId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_PermanentDistrictId] ON [dbo].[Student]
(
	[PermanentDistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_PermanentDivisionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_PermanentDivisionId] ON [dbo].[Student]
(
	[PermanentDivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_PermanentUpazilaId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_PermanentUpazilaId] ON [dbo].[Student]
(
	[PermanentUpazilaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_PresentDistrictId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_PresentDistrictId] ON [dbo].[Student]
(
	[PresentDistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_PresentDivisionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_PresentDivisionId] ON [dbo].[Student]
(
	[PresentDivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_PresentUpazilaId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_PresentUpazilaId] ON [dbo].[Student]
(
	[PresentUpazilaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_ReligionId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_ReligionId] ON [dbo].[Student]
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentPayment_StudentId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentPayment_StudentId] ON [dbo].[StudentPayment]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentPaymentDetails_StudentFeeHeadId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentPaymentDetails_StudentFeeHeadId] ON [dbo].[StudentPaymentDetails]
(
	[StudentFeeHeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentPaymentDetails_StudentPaymentId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentPaymentDetails_StudentPaymentId] ON [dbo].[StudentPaymentDetails]
(
	[StudentPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Upazila_DistrictId]    Script Date: 9/23/2021 7:10:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Upazila_DistrictId] ON [dbo].[Upazila]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AcademicSection] ADD  DEFAULT ((0)) FOR [AcademicSessionId]
GO
ALTER TABLE [dbo].[AcademicSubject] ADD  DEFAULT (N'') FOR [SubjectFor]
GO
ALTER TABLE [dbo].[Designation] ADD  DEFAULT ((0)) FOR [DesignationTypeId]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((0)) FOR [BloodGroupId]
GO
ALTER TABLE [dbo].[AcademicSection]  WITH CHECK ADD  CONSTRAINT [FK_AcademicSection_AcademicClass_AcademicClassId] FOREIGN KEY([AcademicClassId])
REFERENCES [dbo].[AcademicClass] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcademicSection] CHECK CONSTRAINT [FK_AcademicSection_AcademicClass_AcademicClassId]
GO
ALTER TABLE [dbo].[AcademicSection]  WITH CHECK ADD  CONSTRAINT [FK_AcademicSection_AcademicSession_AcademicSessionId] FOREIGN KEY([AcademicSessionId])
REFERENCES [dbo].[AcademicSession] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcademicSection] CHECK CONSTRAINT [FK_AcademicSection_AcademicSession_AcademicSessionId]
GO
ALTER TABLE [dbo].[AcademicSubject]  WITH CHECK ADD  CONSTRAINT [FK_AcademicSubject_AcademicSubjectType_AcademicSubjectTypeId] FOREIGN KEY([AcademicSubjectTypeId])
REFERENCES [dbo].[AcademicSubjectType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcademicSubject] CHECK CONSTRAINT [FK_AcademicSubject_AcademicSubjectType_AcademicSubjectTypeId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AttachDocs]  WITH CHECK ADD  CONSTRAINT [FK_AttachDocs_Employee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[AttachDocs] CHECK CONSTRAINT [FK_AttachDocs_Employee_EmployeeId]
GO
ALTER TABLE [dbo].[AttachDocs]  WITH CHECK ADD  CONSTRAINT [FK_AttachDocs_Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[AttachDocs] CHECK CONSTRAINT [FK_AttachDocs_Student_StudentId]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_AcademicClass_AcademicClassId] FOREIGN KEY([AcademicClassId])
REFERENCES [dbo].[AcademicClass] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_AcademicClass_AcademicClassId]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_AcademicSession_AcademicSessionId] FOREIGN KEY([AcademicSessionId])
REFERENCES [dbo].[AcademicSession] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_AcademicSession_AcademicSessionId]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Student_StudentId]
GO
ALTER TABLE [dbo].[ClassFeeList]  WITH CHECK ADD  CONSTRAINT [FK_ClassFeeList_AcademicClass_AcademicClassId] FOREIGN KEY([AcademicClassId])
REFERENCES [dbo].[AcademicClass] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassFeeList] CHECK CONSTRAINT [FK_ClassFeeList_AcademicClass_AcademicClassId]
GO
ALTER TABLE [dbo].[ClassFeeList]  WITH CHECK ADD  CONSTRAINT [FK_ClassFeeList_AcademicSession_AcademicSessionId] FOREIGN KEY([AcademicSessionId])
REFERENCES [dbo].[AcademicSession] ([Id])
GO
ALTER TABLE [dbo].[ClassFeeList] CHECK CONSTRAINT [FK_ClassFeeList_AcademicSession_AcademicSessionId]
GO
ALTER TABLE [dbo].[ClassFeeList]  WITH CHECK ADD  CONSTRAINT [FK_ClassFeeList_StudentFeeHead_StudentFeeHeadId] FOREIGN KEY([StudentFeeHeadId])
REFERENCES [dbo].[StudentFeeHead] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassFeeList] CHECK CONSTRAINT [FK_ClassFeeList_StudentFeeHead_StudentFeeHeadId]
GO
ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [FK_Designation_DesignationType_DesignationTypeId] FOREIGN KEY([DesignationTypeId])
REFERENCES [dbo].[DesignationType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [FK_Designation_DesignationType_DesignationTypeId]
GO
ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [FK_Designation_EmpType_EmpTypeId] FOREIGN KEY([EmpTypeId])
REFERENCES [dbo].[EmpType] ([Id])
GO
ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [FK_Designation_EmpType_EmpTypeId]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_Division_DivisionId] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Division] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_Division_DivisionId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_BloodGroup_BloodGroupId] FOREIGN KEY([BloodGroupId])
REFERENCES [dbo].[BloodGroup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_BloodGroup_BloodGroupId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Designation_DesignationId] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Designation_DesignationId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_District_PermanentDistrictId] FOREIGN KEY([PermanentDistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_District_PermanentDistrictId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_District_PresentDistrictId] FOREIGN KEY([PresentDistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_District_PresentDistrictId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Division_PermanentDivisionId] FOREIGN KEY([PermanentDivisionId])
REFERENCES [dbo].[Division] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Division_PermanentDivisionId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Division_PresentDivisionId] FOREIGN KEY([PresentDivisionId])
REFERENCES [dbo].[Division] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Division_PresentDivisionId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmpType_EmpTypeId] FOREIGN KEY([EmpTypeId])
REFERENCES [dbo].[EmpType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmpType_EmpTypeId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender_GenderId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Nationality_NationalityId] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Nationality_NationalityId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Religion_ReligionId] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[Religion] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Religion_ReligionId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Upazila_PermanentUpazilaId] FOREIGN KEY([PermanentUpazilaId])
REFERENCES [dbo].[Upazila] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Upazila_PermanentUpazilaId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Upazila_PresentUpazilaId] FOREIGN KEY([PresentUpazilaId])
REFERENCES [dbo].[Upazila] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Upazila_PresentUpazilaId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_AcademicClass_AcademicClassId] FOREIGN KEY([AcademicClassId])
REFERENCES [dbo].[AcademicClass] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_AcademicClass_AcademicClassId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_AcademicSection_AcademicSectionId] FOREIGN KEY([AcademicSectionId])
REFERENCES [dbo].[AcademicSection] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_AcademicSection_AcademicSectionId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_AcademicSession_AcademicSessionId] FOREIGN KEY([AcademicSessionId])
REFERENCES [dbo].[AcademicSession] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_AcademicSession_AcademicSessionId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_BloodGroup_BloodGroupId] FOREIGN KEY([BloodGroupId])
REFERENCES [dbo].[BloodGroup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_BloodGroup_BloodGroupId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_District_PermanentDistrictId] FOREIGN KEY([PermanentDistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_District_PermanentDistrictId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_District_PresentDistrictId] FOREIGN KEY([PresentDistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_District_PresentDistrictId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Division_PermanentDivisionId] FOREIGN KEY([PermanentDivisionId])
REFERENCES [dbo].[Division] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Division_PermanentDivisionId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Division_PresentDivisionId] FOREIGN KEY([PresentDivisionId])
REFERENCES [dbo].[Division] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Division_PresentDivisionId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Gender_GenderId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Nationality_NationalityId] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Nationality_NationalityId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Religion_ReligionId] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[Religion] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Religion_ReligionId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Upazila_PermanentUpazilaId] FOREIGN KEY([PermanentUpazilaId])
REFERENCES [dbo].[Upazila] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Upazila_PermanentUpazilaId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Upazila_PresentUpazilaId] FOREIGN KEY([PresentUpazilaId])
REFERENCES [dbo].[Upazila] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Upazila_PresentUpazilaId]
GO
ALTER TABLE [dbo].[StudentPayment]  WITH CHECK ADD  CONSTRAINT [FK_StudentPayment_Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentPayment] CHECK CONSTRAINT [FK_StudentPayment_Student_StudentId]
GO
ALTER TABLE [dbo].[StudentPaymentDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentDetails_StudentFeeHead_StudentFeeHeadId] FOREIGN KEY([StudentFeeHeadId])
REFERENCES [dbo].[StudentFeeHead] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentPaymentDetails] CHECK CONSTRAINT [FK_StudentPaymentDetails_StudentFeeHead_StudentFeeHeadId]
GO
ALTER TABLE [dbo].[StudentPaymentDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentDetails_StudentPayment_StudentPaymentId] FOREIGN KEY([StudentPaymentId])
REFERENCES [dbo].[StudentPayment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentPaymentDetails] CHECK CONSTRAINT [FK_StudentPaymentDetails_StudentPayment_StudentPaymentId]
GO
ALTER TABLE [dbo].[Upazila]  WITH CHECK ADD  CONSTRAINT [FK_Upazila_District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Upazila] CHECK CONSTRAINT [FK_Upazila_District_DistrictId]
GO
USE [master]
GO
ALTER DATABASE [SMSDB] SET  READ_WRITE 
GO
