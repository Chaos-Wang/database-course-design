USE [master]
GO
/****** Object:  Database [db]    Script Date: 2019/6/22 19:19:30 ******/
CREATE DATABASE [db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db] SET ARITHABORT OFF 
GO
ALTER DATABASE [db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db] SET RECOVERY FULL 
GO
ALTER DATABASE [db] SET  MULTI_USER 
GO
ALTER DATABASE [db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db', N'ON'
GO
ALTER DATABASE [db] SET QUERY_STORE = OFF
GO
USE [db]
GO
/****** Object:  User [dbuser]    Script Date: 2019/6/22 19:19:30 ******/
CREATE USER [dbuser] FOR LOGIN [dbuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbuser]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [dbuser]
GO
/****** Object:  Table [dbo].[BOOK]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK](
	[Book_id] [int] NOT NULL,
	[Customer_id] [char](18) NOT NULL,
	[Car_number] [varchar](20) NOT NULL,
	[Pick_time] [datetime] NOT NULL,
	[Lift_car] [char](6) NOT NULL,
	[Flag] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR](
	[Car_number] [varchar](20) NOT NULL,
	[Car_model] [varchar](30) NOT NULL,
	[Car_date] [datetime] NOT NULL,
	[Car_flag] [char](6) NOT NULL,
	[Car_price] [int] NOT NULL,
	[Car_type] [varchar](20) NOT NULL,
	[Earnest_money] [int] NOT NULL,
	[Car_deposit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Car_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[Customer_id] [char](18) NOT NULL,
	[Customer_name] [varchar](8) NOT NULL,
	[Customer_age] [varchar](3) NOT NULL,
	[Customer_phone] [char](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Customer_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRIVER]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVER](
	[Driver_id] [char](18) NOT NULL,
	[Driver_name] [varchar](8) NOT NULL,
	[Driver_age] [varchar](3) NOT NULL,
	[Driver_phone] [varchar](11) NOT NULL,
	[Driver_flag] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Driver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Driver_age] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LEASE]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LEASE](
	[Lease_id] [int] NOT NULL,
	[Customer_id] [char](18) NOT NULL,
	[Car_number] [varchar](20) NOT NULL,
	[Start_time] [datetime] NOT NULL,
	[End_time] [datetime] NOT NULL,
	[Rental] [int] NOT NULL,
	[Return_car] [char](6) NOT NULL,
	[Flag] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Lease_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[user_id] [nvarchar](50) NULL,
	[userpwd] [nvarchar](50) NULL,
	[access] [varchar](max) NULL,
	[name] [nvarchar](50) NULL,
	[avatar] [varchar](max) NULL,
	[token] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD FOREIGN KEY([Car_number])
REFERENCES [dbo].[CAR] ([Car_number])
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[CUSTOMER] ([Customer_id])
GO
ALTER TABLE [dbo].[LEASE]  WITH CHECK ADD FOREIGN KEY([Car_number])
REFERENCES [dbo].[CAR] ([Car_number])
GO
ALTER TABLE [dbo].[LEASE]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[CUSTOMER] ([Customer_id])
GO
/****** Object:  StoredProcedure [dbo].[PRO_CAR_FLAG]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_CAR_FLAG]   --通过租赁状态查询
	@CAR_FLAG CHAR(6) 
	AS
	SELECT*
	FROM CAR
	WHERE Car_flag=@CAR_FLAG
GO
/****** Object:  StoredProcedure [dbo].[PRO_CAR_MODEL]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_CAR_MODEL]  --通过车辆型号查询
	@CAR_MODEL VARCHAR(30)
	AS
	SELECT *
	FROM CAR
	WHERE Car_model=@CAR_MODEL
GO
/****** Object:  StoredProcedure [dbo].[PRO_CAR_PRICE]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_CAR_PRICE] --通过租金查询
	@CAR_PRICE INT
	AS
	SELECT *
	FROM CAR
	WHERE Car_price<=@CAR_PRICE

GO
/****** Object:  StoredProcedure [dbo].[PRO_CAR_TYPE]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_CAR_TYPE]  --通过车辆类型查询
	@CAR_TYPE VARCHAR(20)
	AS
	SELECT*
	FROM CAR
	WHERE Car_type=@CAR_TYPE
GO
/****** Object:  StoredProcedure [dbo].[PRO_CUSTOMER_BOOK]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_CUSTOMER_BOOK]   --查询已预约的客户
	AS
	SELECT CUSTOMER.Customer_name,CUSTOMER.Customer_id,
		   CUSTOMER.Customer_age,CUSTOMER.Customer_phone
	FROM CUSTOMER,BOOK
	WHERE CUSTOMER.Customer_id=BOOK.Customer_id AND BOOK.Lift_car='未提车'
GO
/****** Object:  StoredProcedure [dbo].[PRO_CUSTOMER_DELAY]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_CUSTOMER_DELAY]   --查询租赁时间到期但并未还车的客户，进行催车还交
	@CUSTOMER_DELAY DATETIME
	AS
	SELECT LEASE.Lease_id,CUSTOMER.Customer_name,CUSTOMER.Customer_id,
		   CUSTOMER.Customer_age,CUSTOMER.Customer_phone
	FROM CUSTOMER,LEASE
	WHERE CUSTOMER.Customer_id=LEASE.Customer_id AND
		  LEASE.Return_car='未还车'AND LEASE.End_time<@CUSTOMER_DELAY
GO
/****** Object:  StoredProcedure [dbo].[PRO_CUSTOMER_LEASE]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_CUSTOMER_LEASE]  --查询租赁车辆的客户
	AS
	SELECT CUSTOMER.Customer_name,CUSTOMER.Customer_id,
		   CUSTOMER.Customer_age,CUSTOMER.Customer_phone
	FROM CUSTOMER,LEASE
	WHERE CUSTOMER.Customer_id=LEASE.Customer_id 
GO
/****** Object:  StoredProcedure [dbo].[PRO_DRIVER_FLAG]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_DRIVER_FLAG]  --通过出车状态查询司机
	@DRIVER_FLAG CHAR(6)
	AS
	SELECT *
	FROM DRIVER
	WHERE DRIVER.Driver_flag=@DRIVER_FLAG
GO
/****** Object:  StoredProcedure [dbo].[PRO_LEASE_END]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_LEASE_END]    --还车结算
	@LEASE_END_ID INT, --需还车的订单号
	@LEASE_END_DATE DATETIME --还车的日期
	AS
	UPDATE LEASE          --对还车的租赁表进行修改
	SET Return_car='已还车',End_time=@LEASE_END_DATE,
	Rental=(
		SELECT DATEDIFF(DAY,LEASE.Start_time,@LEASE_END_DATE)*CAR.Car_price  --计算订单总租金
		FROM LEASE,CAR WHERE LEASE.Lease_id=@LEASE_END_ID AND LEASE.Car_number=CAR.Car_number
	) 
	WHERE LEASE.Lease_id=@LEASE_END_ID
	UPDATE CAR            --对所还车辆的出租状态进行修改
	SET Car_flag='未出租' FROM CAR,LEASE WHERE LEASE.Lease_id=@LEASE_END_ID AND LEASE.Car_number=CAR.Car_number
	SELECT * FROM LEASE
GO
/****** Object:  StoredProcedure [dbo].[PRO_LEASE_RENEW]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_LEASE_RENEW]  --续约 
	@LEASE_RENEW_ID INT,
	@LEASE_RENEW_DATE DATETIME
	AS
	UPDATE LEASE
	SET LEASE.End_time=@LEASE_RENEW_DATE
	WHERE LEASE.Lease_id=@LEASE_RENEW_ID
	SELECT * FROM LEASE
GO
/****** Object:  StoredProcedure [dbo].[PRO_LEASE_RENTAL]    Script Date: 2019/6/22 19:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PRO_LEASE_RENTAL]    --对某天所得租金进行统计
	@LEASE_RENTAL DATETIME
	AS
	SELECT SUM(CAR.Car_price)
	FROM CAR,LEASE
	WHERE CAR.Car_number=LEASE.Car_number  AND
		  (End_time>@LEASE_RENTAL OR Return_car='未还车')
GO
USE [master]
GO
ALTER DATABASE [db] SET  READ_WRITE 
GO
