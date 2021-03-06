USE [master]
GO
/****** Object:  Database [226205]    Script Date: 13.05.2020 15:44:36 ******/
CREATE DATABASE [226205]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'226205', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\226205.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'226205_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\226205_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [226205] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [226205].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [226205] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [226205] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [226205] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [226205] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [226205] SET ARITHABORT OFF 
GO
ALTER DATABASE [226205] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [226205] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [226205] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [226205] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [226205] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [226205] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [226205] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [226205] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [226205] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [226205] SET  DISABLE_BROKER 
GO
ALTER DATABASE [226205] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [226205] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [226205] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [226205] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [226205] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [226205] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [226205] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [226205] SET RECOVERY FULL 
GO
ALTER DATABASE [226205] SET  MULTI_USER 
GO
ALTER DATABASE [226205] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [226205] SET DB_CHAINING OFF 
GO
ALTER DATABASE [226205] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [226205] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [226205] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'226205', N'ON'
GO
ALTER DATABASE [226205] SET QUERY_STORE = OFF
GO
USE [226205]
GO
/****** Object:  Table [dbo].[Chmiele]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chmiele](
	[Nazwa] [nvarchar](50) NULL,
	[Alfa_kwasy] [float] NULL,
	[ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Chmiele] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chmiele_przepisu]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chmiele_przepisu](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_chmielu] [numeric](18, 0) NOT NULL,
	[ID_przepisu] [numeric](18, 0) NOT NULL,
	[Etap] [numeric](18, 0) NULL,
	[Ilosc] [float] NOT NULL,
	[Czas] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Chmiele_przepisu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chmiele_uzytkownika]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chmiele_uzytkownika](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_chmielu] [numeric](18, 0) NOT NULL,
	[ID_uzytkownika] [numeric](18, 0) NOT NULL,
	[Ilosc] [float] NULL,
 CONSTRAINT [PK_Chmiele_uzytkownika] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dodatki]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dodatki](
	[Nazwa] [nchar](10) NOT NULL,
	[Typ] [nchar](10) NULL,
	[ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Dodatki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dodatki_przepisu]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dodatki_przepisu](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_dodatku] [numeric](18, 0) NOT NULL,
	[ID_przepisu] [numeric](18, 0) NOT NULL,
	[ID_etapu] [numeric](18, 0) NULL,
	[Ilosc] [float] NOT NULL,
	[Czas] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Dodatki_przepisu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dodatki_uzytkownika]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dodatki_uzytkownika](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_dodatku] [numeric](18, 0) NOT NULL,
	[ID_uzytkownika] [numeric](18, 0) NOT NULL,
	[Ilosc] [float] NULL,
 CONSTRAINT [PK_Dodatki_uzytkownika] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drozdze]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drozdze](
	[Kod_i_nazwa] [nvarchar](50) NULL,
	[Forma] [nvarchar](50) NULL,
	[ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Drozdze] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drozdze_przepisu]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drozdze_przepisu](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_drozdzy] [numeric](18, 0) NOT NULL,
	[ID_przepisu] [numeric](18, 0) NOT NULL,
	[Ilosc] [float] NULL,
 CONSTRAINT [PK_Drozdze_przepisu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drozdze_uzytkownika]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drozdze_uzytkownika](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_drozdzy] [numeric](18, 0) NOT NULL,
	[ID_uzytkownika] [numeric](18, 0) NOT NULL,
	[Data_pobrania] [date] NULL,
 CONSTRAINT [PK_Drozdze_uzytkownika] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etapy]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etapy](
	[ID] [numeric](18, 0) NOT NULL,
	[Opis_etapu] [ntext] NULL,
	[Nazwa_etapu] [nvarchar](50) NULL,
	[ID_przepisu] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Etapy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fazy_przepisu]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fazy_przepisu](
	[NazwaFazy] [nvarchar](50) NULL,
	[CzasTrwaniaDni] [nchar](10) NULL,
	[CzasTrwaniaGodziny] [numeric](18, 0) NULL,
	[CzasTrwaniaMinuty] [numeric](18, 0) NULL,
	[NrKolejnosciFazy] [numeric](18, 0) NULL,
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IDPrzepisu] [numeric](18, 0) NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Fazy_przepisu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fermentujace_przepisu]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fermentujace_przepisu](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_slodu] [numeric](18, 0) NOT NULL,
	[ilosc] [float] NOT NULL,
	[ID_przepisu] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Slody_przepisu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fermetujace_surowce]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fermetujace_surowce](
	[Nazwa] [nvarchar](50) NOT NULL,
	[Typ] [nvarchar](50) NULL,
	[Ekstrakcja] [float] NULL,
	[EBC] [float] NULL,
	[ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Slody] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fermetujace_uzytkownika]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fermetujace_uzytkownika](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_slodu] [numeric](18, 0) NOT NULL,
	[ID_uzytkownika] [numeric](18, 0) NOT NULL,
	[Ilosc] [float] NULL,
 CONSTRAINT [PK_Fermetujace_uzytkownika] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Harmonogram]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Harmonogram](
	[IDPrzepisuUzytkownikow] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przepisy]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przepisy](
	[ID_Autora] [numeric](18, 0) NOT NULL,
	[BLG] [float] NULL,
	[IBU] [float] NULL,
	[ABV] [float] NULL,
	[ID_Stylu] [numeric](18, 0) NOT NULL,
	[SRM] [float] NULL,
	[Nazwa_przepisu] [nvarchar](50) NOT NULL,
	[IDStylu] [numeric](18, 0) NULL,
	[ID] [numeric](18, 0) NOT NULL,
	[opis] [nchar](10) NULL,
 CONSTRAINT [PK_Przepisy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrzepisyUzytkownikow]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrzepisyUzytkownikow](
	[ID] [numeric](18, 0) NOT NULL,
	[IDPrzepisu] [numeric](18, 0) NULL,
	[IDUzytwkonika] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PrzepisyUzytkownikow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Style_piwne]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Style_piwne](
	[Nazwa] [nvarchar](50) NOT NULL,
	[Pochodzenie] [nvarchar](50) NULL,
	[Ramowe_max_IBU] [float] NULL,
	[Ramowe_min_IBU] [float] NULL,
	[Ramowe_max_ABV] [float] NULL,
	[Ramowe_min_ABV] [float] NULL,
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Style_piwne] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[ID] [numeric](18, 0) NOT NULL,
	[Login] [nchar](10) NULL,
	[Haslo] [nchar](10) NULL,
	[Mail] [nchar](10) NULL,
 CONSTRAINT [PK_Uzytkownicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warki]    Script Date: 13.05.2020 15:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warki](
	[ID] [numeric](18, 0) NOT NULL,
	[ID_wykonawcy] [numeric](18, 0) NOT NULL,
	[ID_autora] [numeric](18, 0) NOT NULL,
	[Oczekiwana_ilosc_piwa] [float] NULL,
	[Data_wykonania] [numeric](18, 0) NULL,
	[IDPrzepisu] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Warki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chmiele_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Chmiele_przepisu_Chmiele] FOREIGN KEY([ID_chmielu])
REFERENCES [dbo].[Chmiele] ([ID])
GO
ALTER TABLE [dbo].[Chmiele_przepisu] CHECK CONSTRAINT [FK_Chmiele_przepisu_Chmiele]
GO
ALTER TABLE [dbo].[Chmiele_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Chmiele_przepisu_Przepisy] FOREIGN KEY([ID_przepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Chmiele_przepisu] CHECK CONSTRAINT [FK_Chmiele_przepisu_Przepisy]
GO
ALTER TABLE [dbo].[Chmiele_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Chmiele_uzytkownika_Chmiele] FOREIGN KEY([ID_chmielu])
REFERENCES [dbo].[Chmiele] ([ID])
GO
ALTER TABLE [dbo].[Chmiele_uzytkownika] CHECK CONSTRAINT [FK_Chmiele_uzytkownika_Chmiele]
GO
ALTER TABLE [dbo].[Chmiele_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Chmiele_uzytkownika_Uzytkownicy] FOREIGN KEY([ID_uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Chmiele_uzytkownika] CHECK CONSTRAINT [FK_Chmiele_uzytkownika_Uzytkownicy]
GO
ALTER TABLE [dbo].[Dodatki_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Dodatki_przepisu_Dodatki] FOREIGN KEY([ID_dodatku])
REFERENCES [dbo].[Dodatki] ([ID])
GO
ALTER TABLE [dbo].[Dodatki_przepisu] CHECK CONSTRAINT [FK_Dodatki_przepisu_Dodatki]
GO
ALTER TABLE [dbo].[Dodatki_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Dodatki_przepisu_Przepisy] FOREIGN KEY([ID_przepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Dodatki_przepisu] CHECK CONSTRAINT [FK_Dodatki_przepisu_Przepisy]
GO
ALTER TABLE [dbo].[Dodatki_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Dodatki_uzytkownika_Dodatki] FOREIGN KEY([ID_dodatku])
REFERENCES [dbo].[Dodatki] ([ID])
GO
ALTER TABLE [dbo].[Dodatki_uzytkownika] CHECK CONSTRAINT [FK_Dodatki_uzytkownika_Dodatki]
GO
ALTER TABLE [dbo].[Dodatki_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Dodatki_uzytkownika_Uzytkownicy] FOREIGN KEY([ID_uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Dodatki_uzytkownika] CHECK CONSTRAINT [FK_Dodatki_uzytkownika_Uzytkownicy]
GO
ALTER TABLE [dbo].[Drozdze_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Drozdze_przepisu_Drozdze] FOREIGN KEY([ID_drozdzy])
REFERENCES [dbo].[Drozdze] ([ID])
GO
ALTER TABLE [dbo].[Drozdze_przepisu] CHECK CONSTRAINT [FK_Drozdze_przepisu_Drozdze]
GO
ALTER TABLE [dbo].[Drozdze_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Drozdze_przepisu_Przepisy] FOREIGN KEY([ID_przepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Drozdze_przepisu] CHECK CONSTRAINT [FK_Drozdze_przepisu_Przepisy]
GO
ALTER TABLE [dbo].[Drozdze_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Drozdze_uzytkownika_Drozdze] FOREIGN KEY([ID_drozdzy])
REFERENCES [dbo].[Drozdze] ([ID])
GO
ALTER TABLE [dbo].[Drozdze_uzytkownika] CHECK CONSTRAINT [FK_Drozdze_uzytkownika_Drozdze]
GO
ALTER TABLE [dbo].[Drozdze_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Drozdze_uzytkownika_Uzytkownicy] FOREIGN KEY([ID_uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Drozdze_uzytkownika] CHECK CONSTRAINT [FK_Drozdze_uzytkownika_Uzytkownicy]
GO
ALTER TABLE [dbo].[Etapy]  WITH CHECK ADD  CONSTRAINT [FK_Etapy_Przepisy] FOREIGN KEY([ID_przepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Etapy] CHECK CONSTRAINT [FK_Etapy_Przepisy]
GO
ALTER TABLE [dbo].[Fazy_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Fazy_przepisu_Przepisy1] FOREIGN KEY([IDPrzepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Fazy_przepisu] CHECK CONSTRAINT [FK_Fazy_przepisu_Przepisy1]
GO
ALTER TABLE [dbo].[Fermentujace_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Slody_przepisu_Przepisy] FOREIGN KEY([ID_przepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Fermentujace_przepisu] CHECK CONSTRAINT [FK_Slody_przepisu_Przepisy]
GO
ALTER TABLE [dbo].[Fermentujace_przepisu]  WITH CHECK ADD  CONSTRAINT [FK_Slody_przepisu_Slody] FOREIGN KEY([ID_slodu])
REFERENCES [dbo].[Fermetujace_surowce] ([ID])
GO
ALTER TABLE [dbo].[Fermentujace_przepisu] CHECK CONSTRAINT [FK_Slody_przepisu_Slody]
GO
ALTER TABLE [dbo].[Fermetujace_uzytkownika]  WITH CHECK ADD  CONSTRAINT [FK_Fermetujace_uzytkownika_Uzytkownicy] FOREIGN KEY([ID_uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Fermetujace_uzytkownika] CHECK CONSTRAINT [FK_Fermetujace_uzytkownika_Uzytkownicy]
GO
ALTER TABLE [dbo].[Harmonogram]  WITH CHECK ADD  CONSTRAINT [FK_Harmonogram_PrzepisyUzytkownikow] FOREIGN KEY([IDPrzepisuUzytkownikow])
REFERENCES [dbo].[PrzepisyUzytkownikow] ([ID])
GO
ALTER TABLE [dbo].[Harmonogram] CHECK CONSTRAINT [FK_Harmonogram_PrzepisyUzytkownikow]
GO
ALTER TABLE [dbo].[Przepisy]  WITH CHECK ADD  CONSTRAINT [FK_Przepisy_Style_piwne] FOREIGN KEY([IDStylu])
REFERENCES [dbo].[Style_piwne] ([ID])
GO
ALTER TABLE [dbo].[Przepisy] CHECK CONSTRAINT [FK_Przepisy_Style_piwne]
GO
ALTER TABLE [dbo].[PrzepisyUzytkownikow]  WITH CHECK ADD  CONSTRAINT [FK_PrzepisyUzytkownikow_Przepisy] FOREIGN KEY([IDPrzepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[PrzepisyUzytkownikow] CHECK CONSTRAINT [FK_PrzepisyUzytkownikow_Przepisy]
GO
ALTER TABLE [dbo].[PrzepisyUzytkownikow]  WITH CHECK ADD  CONSTRAINT [FK_PrzepisyUzytkownikow_Uzytkownicy] FOREIGN KEY([IDUzytwkonika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[PrzepisyUzytkownikow] CHECK CONSTRAINT [FK_PrzepisyUzytkownikow_Uzytkownicy]
GO
ALTER TABLE [dbo].[Warki]  WITH CHECK ADD  CONSTRAINT [FK_Warki_Przepisy] FOREIGN KEY([IDPrzepisu])
REFERENCES [dbo].[Przepisy] ([ID])
GO
ALTER TABLE [dbo].[Warki] CHECK CONSTRAINT [FK_Warki_Przepisy]
GO
ALTER TABLE [dbo].[Warki]  WITH CHECK ADD  CONSTRAINT [FK_Warki_Uzytkownicy] FOREIGN KEY([ID_wykonawcy])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Warki] CHECK CONSTRAINT [FK_Warki_Uzytkownicy]
GO
USE [master]
GO
ALTER DATABASE [226205] SET  READ_WRITE 
GO
