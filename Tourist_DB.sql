USE [master]
GO
/****** Object:  Database [TClub]    Script Date: 04.05.2018 6:59:24 ******/
CREATE DATABASE [TClub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TClub', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.ZHEKA\MSSQL\DATA\TClub.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TClub_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.ZHEKA\MSSQL\DATA\TClub_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TClub] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TClub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TClub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TClub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TClub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TClub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TClub] SET ARITHABORT OFF 
GO
ALTER DATABASE [TClub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TClub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TClub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TClub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TClub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TClub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TClub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TClub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TClub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TClub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TClub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TClub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TClub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TClub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TClub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TClub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TClub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TClub] SET RECOVERY FULL 
GO
ALTER DATABASE [TClub] SET  MULTI_USER 
GO
ALTER DATABASE [TClub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TClub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TClub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TClub] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TClub] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TClub', N'ON'
GO
ALTER DATABASE [TClub] SET QUERY_STORE = OFF
GO
USE [TClub]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TClub]
GO
/****** Object:  Table [dbo].[Група]    Script Date: 04.05.2018 6:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Група](
	[Код групи] [nchar](10) NOT NULL,
	[№] [nchar](10) NOT NULL,
	[Код тренера] [nchar](10) NOT NULL,
	[Код секції] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Змагання]    Script Date: 04.05.2018 6:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Змагання](
	[Код змагання] [nchar](10) NOT NULL,
	[Назва змагання] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категорія походу]    Script Date: 04.05.2018 6:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категорія походу](
	[Код категорії походу] [nchar](10) NOT NULL,
	[Назва] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категорія туриста]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категорія туриста](
	[Код категорії туриста] [nchar](10) NOT NULL,
	[Навза] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Маршрут]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Маршрут](
	[Код маршруту] [nchar](10) NOT NULL,
	[Кількість днів] [nchar](10) NULL,
	[Початок] [time](7) NULL,
	[Кінець] [time](7) NULL,
	[Привал] [varchar](50) NULL,
	[Стоянка] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Похід]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Похід](
	[Код походу] [nchar](10) NOT NULL,
	[Міра складності] [varchar](50) NULL,
	[Дата] [date] NULL,
	[Код інструктора] [nchar](10) NULL,
	[Код категорії походу] [nchar](10) NULL,
	[Код маршруту] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Розподіл категорій]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Розподіл категорій](
	[Код розподілу категорії] [nchar](10) NOT NULL,
	[Код категорії туриста] [nchar](10) NULL,
	[Код туриста] [nchar](10) NULL,
	[Код секції] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Секция]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Секция](
	[Код секції] [nchar](10) NOT NULL,
	[Назва] [varchar](50) NULL,
	[Місце] [varchar](50) NULL,
	[Дні] [varchar](10) NULL,
	[Час початку] [time](7) NULL,
	[Час завершення] [time](7) NULL,
	[ПІП керівника] [varchar](50) NULL,
	[Зарплата керівника] [money] NULL,
	[Дата народження] [date] NULL,
	[Рік] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тренування]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тренування](
	[Код тренування] [nchar](10) NOT NULL,
	[Код групи] [nchar](10) NOT NULL,
	[Дата] [datetime] NULL,
	[Тривалість, год] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Турист]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Турист](
	[Код туриста] [nchar](10) NOT NULL,
	[ПІП] [varchar](50) NULL,
	[Стать] [varchar](50) NULL,
	[Дата народження] [date] NULL,
	[Зарплата] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Турист в змаганнях]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Турист в змаганнях](
	[Код туриста в змаганнях] [nchar](10) NULL,
	[Код туриста] [nchar](10) NULL,
	[Код змагання] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Туристи в групі]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Туристи в групі](
	[Код туриста в групі] [nchar](10) NOT NULL,
	[Код туриста] [nchar](10) NULL,
	[Код групи] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Туристи в поході]    Script Date: 04.05.2018 6:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Туристи в поході](
	[Код туриста в поході] [nchar](10) NOT NULL,
	[Код туриста] [nchar](10) NULL,
	[Код походу] [nchar](10) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TClub] SET  READ_WRITE 
GO
------------------------------------------------------------------
--1--показує згорнутий список всіх туристів. можливо, що один турист 
--тобто тренер тренує дві групи
select ПІП = ISNULL(ПІП, 'Всього'), [К-сть] = COUNT(ПІП) 
from Турист t join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста] 
join Група g on g.[Код групи]=tg.[Код групи]
join Секция s on s.[Код секції] = g.[Код секції]
where s.Назва = 'Екстрим' and [№]= 101
group by cube (ПІП)
--2--
select ПІП, kt.Навза Категорія, t.Зарплата, Назва Спеціалізація
from Турист t join [Розподіл категорій] rk on t.[Код туриста]=rk.[Код туриста] 
join [Категорія туриста] kt on kt.[Код категорії туриста] = rk.[Код категорії туриста]
join Секция s on s.[Код секції] = rk.[Код секції]
where Навза = 'Тренер'
--3--
select [Назва змагання], s.Назва Секція, COUNT([Назва змагання]) Кількість
from змагання z join [Турист в змаганнях] tvz on z.[Код змагання]=tvz.[Код змагання] 
join Турист t on t.[Код туриста] = tvz.[Код туриста] 
join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста]
join Група g on g.[Код групи]=tg.[Код групи]
join Секция s on s.[Код секції] = g.[Код секції]
group by s.Назва, [Назва змагання] 
order by Секція
--4--
select ПІП тренер, g.[№], cast(Дата as date) [Дата]
from Турист t join Група g on t.[Код туриста]=g.[Код тренера]
join Тренування tr on g.[Код групи]=tr.[Код групи]
where (day(Дата) between day('2018/10/23') And day('2018/10/27')) and g.[№] = 101 
order by Дата
--5--
select distinct ПІП, s.Назва, count(p.Назва) [к-сть походів]
from Турист t join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста] 
join Група g on g.[Код групи]=tg.[Код групи]
join Секция s on s.[Код секції] = g.[Код секції]
join [Туристи в поході] tvp on tvp.[Код туриста] = t.[Код туриста]
join Похід p on  p.[Код походу] = tvp.[Код походу]
join Маршрут m on m.[Код маршруту] = p.[Код маршруту] 
where s.Назва = 'Екстрим' and (p.Назва = 'Похід 2' or p.Назва = 'Похід 3' or p.Назва = 'Похід 1') and m.Стоянка = 'Стоянка А'
group by ПІП,  s.Назва
having count(p.Назва) > 1
--6--
select Секция.[ПІП керівника], [Зарплата керівника], Рік [Рік прибуття на роботу], [Дата народження] from Секция
where [Зарплата керівника] between 7000 and 10000 and (Рік = '2010') 
--7--
select distinct t.ПІП, sum([Тривалість, год]) [к-сть годин]--, s.Назва  
 from Турист t 
join Група g on t.[Код туриста] = g.[Код тренера] 
join Тренування tr on tr.[Код групи] = g.[Код групи]
join Секция s on s.[Код секції] = g.[Код секції]
group by t.ПІП--, s.Назва
order by піп

--8--
select distinct t.ПІП, m.[Код маршруту], Дата, 
case  
	when t.[Код туриста] between 1 and 10 
	then 'Інструктор' 
	else 'Турист' 
end 
from Турист t 
join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста] 
join Група g on g.[Код групи]=tg.[Код групи]
join Секция s on s.[Код секції] = g.[Код секції]
join [Туристи в поході] tvp on tvp.[Код туриста] = t.[Код туриста]
join Похід p on  p.[Код походу] = tvp.[Код походу] 
join Маршрут m on m.[Код маршруту] = p.[Код маршруту]
where  (month(Дата) between month('2018-06-01') And month('2018-08-01')) 
order by Дата

--9--
select distinct m.[Код маршруту] 
from Маршрут m join Похід p on m.[Код маршруту] = p.[Код маршруту]
where m.[Кількість днів] > 1 and m.Стоянка = 'Стоянка 2' and p.[Міра складності] = 'Середній'	

--10--показує максимальну категорію, яку пройшов даний турист де 1 - просто, 2-сер, 3 - важко
select distinct ПІП, max(p.[Міра складності]) max_cat 
from Турист t join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста] 
join Група g on g.[Код групи]=tg.[Код групи]
join Секция s on s.[Код секції] = g.[Код секції]
join [Туристи в поході] tvp on tvp.[Код туриста] = t.[Код туриста]
join Похід p on  p.[Код походу] = tvp.[Код походу] 
join [Категорія походу] kp on kp.[Код категорії походу] = p.[Код категорії походу]
where s.Назва = 'Екстрим' and [№]= 101	and kp.Назва = 'Кінний'	
group by ПІП

--11--
select distinct ПІП, kt.Навза Інструктор, count(p.Назва) [к-сть походів] from  Турист t 
join [Розподіл категорій] rk on rk.[Код туриста] = t.[Код туриста]
 join [Категорія Туриста] kt on kt.[Код категорії туриста] = rk.[Код категорії туриста]	
  join Похід p on p.[Код інструктора] = t.[Код туриста]
where p.Назва = 'Похід 1'
group by ПІП, kt.Навза 
having count(p.Назва) > =1	
 
 --12--туристи, які не тренери, але були інструкторами
select distinct ПІП, kt.Навза Турист, p.[Код інструктора], 
 case  
	when t.[Код туриста] between 1 and 10 
	then 'Інструктор' 
	else 'Турист' 
 end  
from  Турист t 
join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста] 
 join Група g on g.[Код групи]=tg.[Код групи]
  join Секция s on s.[Код секції] = g.[Код секції]
   join [Розподіл категорій] rk on rk.[Код туриста] = t.[Код туриста]
    join [Категорія Туриста] kt on kt.[Код категорії туриста] = rk.[Код категорії туриста]	
     join [Туристи в поході] tvp on tvp.[Код туриста] = t.[Код туриста]
      join Похід p on  p.[Код інструктора] = t.[Код туриста]
where s.Назва = 'Екстрим' and p.[Код інструктора] between 5 and 10 

--13--Нема туристів, які проходили всі 5 маршрутів
select distinct t.ПІП,count(m.[Код маршруту])
from Турист t 
join [Туристи в групі] tg on tg.[Код туриста] = t.[Код туриста] 
 join Група g on g.[Код групи]=tg.[Код групи]
  join Секция s on s.[Код секції] = g.[Код секції]
   join [Туристи в поході] tvp on tvp.[Код туриста] = t.[Код туриста]
    join Похід p on  p.[Код походу] = tvp.[Код походу] 
     join Маршрут m on m.[Код маршруту] = p.[Код маршруту]
--where m.[Код маршруту] in (1,2,3,4,5)	
group by t.ПІП
having count(m.[Код маршруту]) = 5	
--
select distinct (t.ПІП + ' ' + t.Зарплата) 
  from Турист t	
 			
