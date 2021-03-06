USE [master]
GO
/****** Object:  Database [Star]    Script Date: 2020-10-28 7:05:32 PM ******/
CREATE DATABASE [Star]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Star', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Star.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Star_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Star_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Star] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Star].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Star] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Star] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Star] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Star] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Star] SET ARITHABORT OFF 
GO
ALTER DATABASE [Star] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Star] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Star] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Star] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Star] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Star] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Star] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Star] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Star] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Star] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Star] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Star] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Star] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Star] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Star] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Star] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Star] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Star] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Star] SET  MULTI_USER 
GO
ALTER DATABASE [Star] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Star] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Star] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Star] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Star] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Star', N'ON'
GO
ALTER DATABASE [Star] SET QUERY_STORE = OFF
GO
USE [Star]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_business_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_business_key] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_business_online_order_flag]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_business_online_order_flag] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_business_sales_order_number]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_business_sales_order_number] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_business_type_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_business_type_string] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_city_name]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_city_name] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_country_name]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_country_name] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_date_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_date_string] FROM [nvarchar](10) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_day_of_month_smallint]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_day_of_month_smallint] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_day_of_month_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_day_of_month_string] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_day_of_week_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_day_of_week_string] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_day_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_day_string] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_dimension_feet_int]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_dimension_feet_int] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_dollar_amount_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_dollar_amount_key] FROM [money] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_gender]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_gender] FROM [nvarchar](10) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_group_name]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_group_name] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_job_title]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_job_title] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_marital_status]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_marital_status] FROM [nvarchar](10) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_money]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_money] FROM [money] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_month_of_year_smallint]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_month_of_year_smallint] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_month_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_month_string] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_person_education]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_person_education] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_person_home_owner_flag]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_person_home_owner_flag] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_person_id]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_person_id] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_person_name]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_person_name] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_person_ocupation]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_person_ocupation] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_quantity_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_quantity_key] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_quarter_smallint]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_quarter_smallint] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_speciality_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_speciality_string] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_sql_date_datetime2]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_sql_date_datetime2] FROM [datetime2](7) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_state_province_name]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_state_province_name] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_surrogate_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_surrogate_key] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_territory_id]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_territory_id] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_territory_name]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_territory_name] FROM [nvarchar](150) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_week_of_year_smallint]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_week_of_year_smallint] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_year_smallint]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_year_smallint] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_year_string]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE TYPE [dbo].[udt_year_string] FROM [nvarchar](4) NOT NULL
GO
/****** Object:  Table [dbo].[dim_date]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_date](
	[date_key] [dbo].[udt_surrogate_key] IDENTITY(1,1) NOT NULL,
	[sql_date] [dbo].[udt_sql_date_datetime2] NOT NULL,
	[day_of_week] [dbo].[udt_day_of_week_string] NOT NULL,
	[day_of_month] [dbo].[udt_day_of_month_smallint] NOT NULL,
	[week_of_year] [dbo].[udt_week_of_year_smallint] NOT NULL,
	[month_of_year] [dbo].[udt_month_of_year_smallint] NOT NULL,
	[month] [dbo].[udt_month_string] NOT NULL,
	[quarter] [dbo].[udt_quarter_smallint] NOT NULL,
	[year] [dbo].[udt_year_smallint] NOT NULL,
 CONSTRAINT [PK_dim_date] PRIMARY KEY CLUSTERED 
(
	[date_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_employee]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_employee](
	[employee_key] [dbo].[udt_surrogate_key] IDENTITY(1,1) NOT NULL,
	[employee_id] [dbo].[udt_person_id] NOT NULL,
	[gender] [dbo].[udt_gender] NOT NULL,
	[marital_status] [dbo].[udt_marital_status] NOT NULL,
	[hire_date] [dbo].[udt_date_string] NOT NULL,
	[job_title] [dbo].[udt_job_title] NOT NULL,
	[employee_name] [dbo].[udt_person_name] NOT NULL,
 CONSTRAINT [PK_dim_employee] PRIMARY KEY CLUSTERED 
(
	[employee_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_individual_customer]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_individual_customer](
	[individual_customer_key] [dbo].[udt_surrogate_key] IDENTITY(1,1) NOT NULL,
	[person_id] [dbo].[udt_person_id] NOT NULL,
	[gender] [dbo].[udt_gender] NOT NULL,
	[marital_status] [dbo].[udt_marital_status] NOT NULL,
	[education] [dbo].[udt_person_education] NOT NULL,
	[occupation] [dbo].[udt_person_ocupation] NOT NULL,
	[home_owner_flag] [dbo].[udt_person_home_owner_flag] NOT NULL,
	[city] [dbo].[udt_city_name] NOT NULL,
	[state_province] [dbo].[udt_state_province_name] NOT NULL,
	[country_region] [dbo].[udt_country_name] NOT NULL,
 CONSTRAINT [PK_dim_individual_customer] PRIMARY KEY CLUSTERED 
(
	[individual_customer_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_store]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_store](
	[store_key] [dbo].[udt_surrogate_key] IDENTITY(1,1) NOT NULL,
	[store_id] [dbo].[udt_business_key] NOT NULL,
	[store_name] [dbo].[udt_person_name] NOT NULL,
	[year_open] [dbo].[udt_year_string] NOT NULL,
	[square_feet] [dbo].[udt_dimension_feet_int] NOT NULL,
	[speciality] [dbo].[udt_speciality_string] NOT NULL,
	[business_type] [dbo].[udt_business_type_string] NOT NULL,
	[city] [dbo].[udt_city_name] NOT NULL,
	[state_province] [dbo].[udt_state_province_name] NOT NULL,
	[country_region] [dbo].[udt_country_name] NOT NULL,
 CONSTRAINT [PK_dim_store] PRIMARY KEY CLUSTERED 
(
	[store_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_territory]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_territory](
	[territory_key] [dbo].[udt_surrogate_key] IDENTITY(1,1) NOT NULL,
	[territory_id] [dbo].[udt_territory_id] NOT NULL,
	[name] [dbo].[udt_territory_name] NOT NULL,
	[country_region_name] [dbo].[udt_country_name] NOT NULL,
	[group_name] [dbo].[udt_group_name] NOT NULL,
 CONSTRAINT [PK_dim_territory] PRIMARY KEY CLUSTERED 
(
	[territory_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_sales_order]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_sales_order](
	[date_key] [dbo].[udt_surrogate_key] NOT NULL,
	[territory_key] [dbo].[udt_surrogate_key] NOT NULL,
	[employee_key] [dbo].[udt_surrogate_key] NOT NULL,
	[store_key] [dbo].[udt_surrogate_key] NOT NULL,
	[individual_customer_key] [dbo].[udt_surrogate_key] NOT NULL,
	[sales_order_number] [dbo].[udt_business_sales_order_number] NOT NULL,
	[online_order_flag] [dbo].[udt_business_online_order_flag] NOT NULL,
	[sale_subtotal] [dbo].[udt_money] NOT NULL,
	[tax_amount] [dbo].[udt_money] NOT NULL,
	[shipping_cost] [dbo].[udt_money] NOT NULL,
 CONSTRAINT [PK_fact_sales_order] PRIMARY KEY CLUSTERED 
(
	[sales_order_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrder]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrder](
	[record_key] [int] IDENTITY(1,1) NOT NULL,
	[salesorder_date] [datetime2](7) NOT NULL,
	[customer_id] [dbo].[udt_person_id] NOT NULL,
	[customer_gender] [dbo].[udt_gender] NULL,
	[customer_marital_status] [dbo].[udt_marital_status] NULL,
	[customer_education] [dbo].[udt_person_education] NULL,
	[customer_occupation] [dbo].[udt_person_ocupation] NULL,
	[customer_home_owner_flag] [dbo].[udt_person_home_owner_flag] NULL,
	[customer_city] [dbo].[udt_city_name] NULL,
	[customer_state_province] [dbo].[udt_state_province_name] NULL,
	[customer_country_region] [dbo].[udt_country_name] NULL,
	[store_id] [dbo].[udt_business_key] NOT NULL,
	[store_name] [dbo].[udt_person_name] NULL,
	[store_year_open] [dbo].[udt_year_string] NULL,
	[store_square_feet] [dbo].[udt_dimension_feet_int] NULL,
	[store_specialty] [dbo].[udt_speciality_string] NULL,
	[store_business_type] [dbo].[udt_business_type_string] NULL,
	[store_city] [dbo].[udt_city_name] NULL,
	[store_state_province] [dbo].[udt_state_province_name] NULL,
	[store_country] [dbo].[udt_country_name] NULL,
	[employee_id] [dbo].[udt_person_id] NOT NULL,
	[employee_gender] [dbo].[udt_gender] NULL,
	[employee_marital_status] [dbo].[udt_marital_status] NULL,
	[employee_hire_date] [dbo].[udt_date_string] NULL,
	[employee_job_title] [dbo].[udt_job_title] NULL,
	[employee_name] [dbo].[udt_person_name] NULL,
	[territory_id] [dbo].[udt_territory_id] NOT NULL,
	[territory_name] [dbo].[udt_territory_name] NULL,
	[territory_country_region_name] [dbo].[udt_country_name] NULL,
	[territory_group_name] [dbo].[udt_group_name] NULL,
	[salesorder_number] [dbo].[udt_business_sales_order_number] NOT NULL,
	[salesorder_online_order_flag] [dbo].[udt_business_online_order_flag] NOT NULL,
	[salesorder_sale_subtotal] [dbo].[udt_money] NOT NULL,
	[salesorder_tax_amount] [dbo].[udt_money] NOT NULL,
	[salesorder_shipping_cost] [dbo].[udt_money] NOT NULL,
	[salesorder_processed] [bit] NULL,
 CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[record_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_fact_sales_order_date_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_fact_sales_order_date_key] ON [dbo].[fact_sales_order]
(
	[date_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_fact_sales_order_employee_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_fact_sales_order_employee_key] ON [dbo].[fact_sales_order]
(
	[employee_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_fact_sales_order_individual_ustomer_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_fact_sales_order_individual_ustomer_key] ON [dbo].[fact_sales_order]
(
	[individual_customer_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_fact_sales_order_store_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_fact_sales_order_store_key] ON [dbo].[fact_sales_order]
(
	[store_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_fact_sales_order_territory_key]    Script Date: 2020-10-28 7:05:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_fact_sales_order_territory_key] ON [dbo].[fact_sales_order]
(
	[territory_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrder] ADD  CONSTRAINT [DF_SalesOrder_salesorder_processed]  DEFAULT ((0)) FOR [salesorder_processed]
GO
ALTER TABLE [dbo].[fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_fact_sales_order_dim_date] FOREIGN KEY([date_key])
REFERENCES [dbo].[dim_date] ([date_key])
GO
ALTER TABLE [dbo].[fact_sales_order] CHECK CONSTRAINT [FK_fact_sales_order_dim_date]
GO
ALTER TABLE [dbo].[fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_fact_sales_order_dim_employee] FOREIGN KEY([employee_key])
REFERENCES [dbo].[dim_employee] ([employee_key])
GO
ALTER TABLE [dbo].[fact_sales_order] CHECK CONSTRAINT [FK_fact_sales_order_dim_employee]
GO
ALTER TABLE [dbo].[fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_fact_sales_order_dim_individual_customer] FOREIGN KEY([individual_customer_key])
REFERENCES [dbo].[dim_individual_customer] ([individual_customer_key])
GO
ALTER TABLE [dbo].[fact_sales_order] CHECK CONSTRAINT [FK_fact_sales_order_dim_individual_customer]
GO
ALTER TABLE [dbo].[fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_fact_sales_order_dim_store] FOREIGN KEY([store_key])
REFERENCES [dbo].[dim_store] ([store_key])
GO
ALTER TABLE [dbo].[fact_sales_order] CHECK CONSTRAINT [FK_fact_sales_order_dim_store]
GO
ALTER TABLE [dbo].[fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_fact_sales_order_dim_territory] FOREIGN KEY([territory_key])
REFERENCES [dbo].[dim_territory] ([territory_key])
GO
ALTER TABLE [dbo].[fact_sales_order] CHECK CONSTRAINT [FK_fact_sales_order_dim_territory]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_date]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_date] (
	@new_date datetime2,
	@date_key [dbo].[udt_surrogate_key] OUTPUT )
AS
BEGIN
	If @new_date is not null
	Begin
	IF EXISTS (select date_key from dim_date where sql_date = @new_date ) 
		BEGIN
			update [dbo].[dim_date]
			set
				[day_of_week]	= DATENAME(dw,@new_date), 
				[day_of_month]	= DATEPART(dd,@new_date),
				[week_of_year]	= DATEPART(wk,@new_date),
				[month_of_year] = DATEPART(mm,@new_date),
				[quarter]		= DATEPART(QQ,@new_date),
				[year]			= DATEPART(yy,@new_date)
			where [sql_date] = @new_date
			
			set @date_key = (SELECT [date_key] from [dbo].[dim_date] where [sql_date] = @new_date) 
			/* select @date_key */   
		END
	ELSE
		BEGIN
			INSERT INTO dim_date
			([sql_date], [day_of_week], [day_of_month], [week_of_year], [month_of_year], 
			[month],[quarter],[year]) 
			VALUES  (@new_date		
				,DATENAME(dw,@new_date) 
				,DATEPART(dd,@new_date)
				,DATEPART(wk,@new_date)
				,DATEPART(mm,@new_date)
				,DATENAME(mm,@new_date)
				,DATEPART(QQ,@new_date)
				,DATEPART(yy,@new_date)
			)
			set @date_key = (SELECT [date_key] from [dbo].[dim_date] where [sql_date] = @new_date)
		END
	END
END






GO
/****** Object:  StoredProcedure [dbo].[sp_add_employee]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_employee] (
	@employee_id [dbo].[udt_person_id] ,
	@gender [dbo].[udt_gender] ,
	@marital_status [dbo].[udt_marital_status] ,
	@hire_date [dbo].[udt_date_string] ,
	@job_title [dbo].[udt_job_title] ,
	@employee_name [dbo].[udt_person_name] ,
	@employee_key [dbo].[udt_surrogate_key] OUTPUT )
AS
BEGIN
	If (@employee_id is not null) 
	and (@gender is not null) 
	and (@marital_status is not null) 
	and (@hire_date is not null) 
	and (@job_title is not null) 
	and (@employee_name is not null)  
	Begin
	IF EXISTS (select [employee_key] from [dbo].[dim_employee] where [employee_id] = @employee_id ) 
		BEGIN 
			/* select @date_key */   
			UPDATE [DBO].[dim_employee]
			SET	[gender] = @gender,
				[marital_status] = @marital_status,
				[hire_date] = @hire_date,
				[job_title] = @job_title,
				[employee_name] = @employee_name
			WHERE [employee_id] = @employee_id
			set @employee_key = (SELECT [employee_key] from [dbo].[dim_employee] where [employee_id] = @employee_id) 
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[dim_employee] 
			([employee_id], [gender],[marital_status],[hire_date],[job_title],[employee_name])
			VALUES  (@employee_id, @gender, @marital_status, @hire_date, @job_title, @employee_name)
			set @employee_key = (SELECT [employee_key] from [dbo].[dim_employee] where [employee_id] = @employee_id)
			/*SELECT @date_key*/ 
		END
	END
END






GO
/****** Object:  StoredProcedure [dbo].[sp_add_fact_sales_order]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create a loop whitout using cursosrs

CREATE PROCEDURE [dbo].[sp_add_fact_sales_order] 
AS
BEGIN
	DECLARE @NumberRecords int, @RowCounter int;
	DECLARE 
			@date_key [dbo].[udt_surrogate_key],
			@employee_key [dbo].[udt_surrogate_key],
			@individual_customer_key [dbo].[udt_surrogate_key],
			@store_key [dbo].[udt_surrogate_key],
			@territory_key [dbo].[udt_surrogate_key];
	declare 
		@record_key [dbo].[udt_surrogate_key],
		@salesorder_date datetime2(7),
        @customer_id [dbo].[udt_person_id],
			@customer_gender [dbo].[udt_gender],
			@customer_marital_status [dbo].[udt_marital_status],
			@customer_education [dbo].[udt_person_education],
			@customer_occupation [dbo].[udt_person_ocupation],
			@customer_home_owner_flag [dbo].[udt_person_home_owner_flag],
			@customer_city [dbo].[udt_city_name],
			@customer_state_province [dbo].[udt_state_province_name],
			@customer_country_region [dbo].[udt_country_name],
		@store_id [dbo].[udt_business_key],
           @store_name [dbo].[udt_person_name],
           @store_year_open [dbo].[udt_year_string],
           @store_square_feet [dbo].[udt_dimension_feet_int],
           @store_specialty [dbo].[udt_speciality_string],
           @store_business_type [dbo].[udt_business_type_string],
           @store_city [dbo].[udt_city_name],
           @store_state_province [dbo].[udt_state_province_name],
           @store_country [dbo].[udt_country_name],
		@employee_id [dbo].[udt_person_id],
           @employee_gender [dbo].[udt_gender],
           @employee_marital_status [dbo].[udt_marital_status],
           @employee_hire_date [dbo].[udt_date_string],
           @employee_job_title [dbo].[udt_job_title],
           @employee_name [dbo].[udt_person_name],
		@territory_id [dbo].[udt_territory_id],
           @territory_name [dbo].[udt_territory_name],
           @territory_country_region_name [dbo].[udt_country_name],
           @territory_group_name [dbo].[udt_group_name],
		@salesorder_number [dbo].[udt_business_sales_order_number],
           @salesorder_online_order_flag [dbo].[udt_business_online_order_flag],
           @salesorder_sale_subtotal [dbo].[udt_money],
           @salesorder_tax_amount [dbo].[udt_money],
           @salesorder_shipping_cost [dbo].[udt_money];


	set @RowCounter = (1);
	
	set @NumberRecords = (select count(*) from [dbo].[SalesOrder] SO where [salesorder_processed] = 0);
	select * from [dbo].[SalesOrder] SO where [salesorder_processed] = 0
	select @RowCounter, @NumberRecords

	while @RowCounter <= @NumberRecords
	begin
		set rowcount 0;
		select 
			@record_key = [record_key],
			@salesorder_date = [salesorder_date],
			@customer_id = [customer_id] ,
				@customer_gender  = [customer_gender],
				@customer_marital_status = [customer_marital_status],
				@customer_education = [customer_education],
				@customer_occupation = [customer_occupation],
				@customer_home_owner_flag = [customer_home_owner_flag],
				@customer_city = [customer_city],
				@customer_state_province = [customer_state_province],
				@customer_country_region = [customer_country_region],
			@store_id =[store_id],
				@store_name = [store_name],
				@store_year_open = [store_year_open],
				@store_square_feet = [store_square_feet],
				@store_specialty = [store_specialty],
				@store_business_type = [store_business_type],
				@store_city = [store_city],
				@store_state_province = [store_state_province],
				@store_country =[store_country],
			@employee_id = [employee_id],
				@employee_gender = [employee_gender],
				@employee_marital_status = [employee_marital_status],
				@employee_hire_date = [employee_hire_date],
				@employee_job_title = [employee_job_title],
				@employee_name = [employee_name],
			@territory_id = [territory_id],
				@territory_name = [territory_name],
				@territory_country_region_name = [territory_country_region_name],
				@territory_group_name = [territory_group_name],
			@salesorder_number = [salesorder_number],
				@salesorder_online_order_flag = [salesorder_online_order_flag],
				@salesorder_sale_subtotal = [salesorder_sale_subtotal],
				@salesorder_tax_amount = [salesorder_tax_amount],
				@salesorder_shipping_cost = [salesorder_shipping_cost]
		from [dbo].[SalesOrder]
		where [salesorder_processed] = 0;

		-- add customer and get its key
		exec [dbo].[sp_add_individual_customer]
				@customer_id, @customer_gender, @customer_marital_status, @customer_education, @customer_occupation, @customer_home_owner_flag,
				@customer_city,@customer_state_province,@customer_country_region,
				@individual_customer_key  OUTPUT; 
		
		if ( @individual_customer_key  is NULL )
		goto next

		select @salesorder_number, @RowCounter;
		
next:	
		update [dbo].[SalesOrder]
		set [salesorder_processed] = 1
		where [record_key] = @record_key;

		set @RowCounter = (@RowCounter + 1);

	end
	set rowcount 0;
END
	
	
	--select [record_key] from [dbo].[SalesOrder] SO where [salesorder_processed] = 0

	

GO
/****** Object:  StoredProcedure [dbo].[sp_add_individual_customer]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_individual_customer] (
	@person_id [dbo].[udt_person_id] ,
	@gender [dbo].[udt_gender] ,
	@marital_status [dbo].[udt_marital_status] ,
	@education [dbo].[udt_person_education] ,
	@occupation [dbo].[udt_job_title] ,
	@home_owner_flag [dbo].[udt_person_name] ,
	@city [dbo].[udt_city_name],
	@state_province [dbo].[udt_state_province_name],
	@country_region [dbo].[udt_country_name],
	@individual_customer_key [dbo].[udt_surrogate_key] OUTPUT )
AS
BEGIN
	If (@person_id is not null) 
	and (@gender is not null) 
	and (@marital_status is not null) 
	and (@education is not null) 
	and (@occupation is not null)  
	and (@home_owner_flag is not null)
	and (@city is not null)
	and (@state_province is not null)
	and (@country_region is not null)
	BEGIN
		IF EXISTS (select [individual_customer_key] from [dbo].[dim_individual_customer] where [person_id] = @person_id) 
			BEGIN    
				UPDATE [DBO].[dim_individual_customer]
				SET	[gender] = @gender,
					[marital_status] = @marital_status,
					[education] = @education,
					[occupation] = @occupation,
					[home_owner_flag] = @home_owner_flag,
					[city] = @city,
					[state_province] = @state_province,
					[country_region] = @country_region
				WHERE [person_id] = @person_id 
			END
		ELSE
			BEGIN
				INSERT INTO [dbo].[dim_individual_customer] 
				([person_id], [gender],[marital_status],[education],[occupation],[home_owner_flag],[city],[state_province],[country_region])
				VALUES  (@person_id, @gender, @marital_status, @education, @occupation, @home_owner_flag, @city, @state_province, @country_region)
			END
	END -- IF, PARAMETERS VALID
		
	IF (@person_id IS NOT NULL)
		BEGIN
			SET @individual_customer_key = 
					(SELECT [individual_customer_key] from [dbo].[dim_individual_customer] where [person_id] = @person_id)
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_add_store]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_store] (
	@store_id [dbo].[udt_business_key],
	@store_name [dbo].[udt_person_name],
	@year_open [dbo].[udt_year_string] ,
	@square_feet [dbo].[udt_dimension_feet_int],
	@speciality [dbo].[udt_speciality_string],
	@business_type [dbo].[udt_business_type_string],
	@city [dbo].[udt_city_name],
	@state_province [dbo].[udt_state_province_name],
	@country_region [dbo].[udt_country_name],
	@store_key [dbo].[udt_surrogate_key] OUTPUT )
AS
BEGIN
	If (@store_id is not null) 
	and (@store_name is not null) 
	and (@year_open is not null) 
	and (@square_feet is not null) 
	and (@speciality is not null)
	and (@business_type is not null)
	and (@city is not null)
	and (@state_province is not null)
	and (@country_region is not null) 
	BEGIN
		IF EXISTS (select [store_key] from [dbo].[dim_store] where [store_id] = @store_id) 
			BEGIN   
				UPDATE [DBO].[dim_store]
				SET	[store_name] = @store_name,
					[year_open] = @year_open,
					[square_feet] = @square_feet,
					[speciality] = @speciality,
					[business_type] = @business_type,
					[city] = @city,
					[state_province] = @state_province,
					[country_region] = @country_region
				WHERE [store_id] = @store_id
			END
		ELSE
			BEGIN
				INSERT INTO [dbo].[dim_store] 
				([store_id],[store_name] ,[year_open],[square_feet],[speciality],[business_type],[city],[state_province],[country_region])
				VALUES  (@store_id, @store_name, @year_open,@square_feet, @business_type, @speciality, @city, @state_province, @country_region)
				
			END
	END
	If (@store_id is not null)
	begin
		set @store_key = 
			(SELECT [store_key] from [dbo].[dim_store] where [store_id] = @store_id)
	end
END

GO
/****** Object:  StoredProcedure [dbo].[sp_add_territory]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_territory] (
	@territory_id [dbo].[udt_territory_id],
	@territory_name [dbo].[udt_territory_name] ,
	@country_region [dbo].[udt_country_name] ,
	@group_name [dbo].[udt_group_name],
	@territory_key [dbo].[udt_surrogate_key] OUTPUT)

AS
BEGIN
	If (@territory_id is not null) 
	and (@territory_name is not null) 
	and (@country_region is not null) 
	and (@group_name is not null) 
	BEGIN
		IF EXISTS (select [territory_key] from [dbo].[dim_territory] where [territory_id] = @territory_id) 
			BEGIN 
				/* select @date_key */   
				UPDATE [DBO].[dim_territory]
				SET	[name] = @territory_name,
					[country_region_name] = @country_region,
					[group_name] = @group_name
				WHERE [territory_id] = @territory_id
				SET @territory_key = 
					(SELECT [territory_key] from [dbo].[dim_territory] where [territory_id] = @territory_id) 
			END
		ELSE
			BEGIN
				INSERT INTO [dbo].[dim_territory] 
				([territory_id],[name] ,[country_region_name],[group_name])
				VALUES  (@territory_id,@territory_name, @country_region, @group_name)
				set @territory_key = 
					(SELECT [territory_key] from [dbo].[dim_territory] where [territory_id] = @territory_id)
			END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_fact_foreign_key_create]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_fact_foreign_key_create]

@fact_table_name NVARCHAR(150) = NULL

AS

BEGIN

DECLARE @sql_command NVARCHAR(MAX) = N'';

BEGIN TRY

WITH fact_cte
AS
(
SELECT s.[name] as schemas_name
   ,t.[name] as fact_table_name
   ,c.[name] as column_name   
FROM sys.columns c
INNER JOIN sys.tables  t ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.[name] LIKE 'fact_%' and c.[name] LIKE '%_key'
),
dim_cte
AS
(
SELECT s.[name] as schemas_name
   ,t.[name] as dim_table_name
   ,c.[name] as column_name   
FROM sys.columns c
INNER JOIN sys.tables  t ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.[name] LIKE 'dim_%' and c.[name] LIKE '%_key'
)
SELECT @sql_command += N'
ALTER TABLE ' + QUOTENAME(f.schemas_name) + '.' + QUOTENAME(f.fact_table_name) 
+ ' ADD CONSTRAINT [FK_' + f.fact_table_name + '_' + d.dim_table_name 
+ '] FOREIGN KEY (' +  QUOTENAME(f.column_name) + ') '
+ 'REFERENCES ' + QUOTENAME(d.schemas_name) + '.' + QUOTENAME(d.dim_table_name)
+ '(' + QUOTENAME(d.column_name) +');'
FROM fact_cte f INNER JOIN dim_cte d ON f.column_name = d.column_name
WHERE f.fact_table_name = @fact_table_name OR @fact_table_name is NULL; 
EXEC (@sql_command)

END TRY

BEGIN CATCH

 DECLARE @ErrorMessage NVARCHAR(4000);
 DECLARE @ErrorSeverity INT;
 DECLARE @ErrorState INT;
 SELECT @ErrorMessage = ERROR_MESSAGE(),
  @ErrorSeverity = ERROR_SEVERITY(),
  @ErrorState = ERROR_STATE();

 RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState );

 RETURN 1

END CATCH

RETURN 0

END	
GO
/****** Object:  StoredProcedure [dbo].[sp_fact_foreign_key_drop]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_fact_foreign_key_drop]
@fact_table_name NVARCHAR(150) = NULL
AS

BEGIN

DECLARE @sql_command NVARCHAR(MAX) = N''

BEGIN TRY

SELECT @sql_command +=N'
ALTER TABLE ' + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name) 
+ ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';'
FROM sys.foreign_keys AS fk INNER JOIN sys.tables AS ct
	ON fk.parent_object_id = ct.[object_id]
INNER JOIN sys.schemas AS cs 
	ON ct.[schema_id] = cs.[schema_id]
WHERE ct.name = @fact_table_name OR @fact_table_name is NULL ;

EXEC (@sql_command)

END TRY

BEGIN CATCH

DECLARE @ErrorMessage NVARCHAR(4000);

      DECLARE @ErrorSeverity INT;

      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE(),
      @ErrorSeverity = ERROR_SEVERITY(),
      @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState );

      RETURN 1

END CATCH

RETURN 0

END

GO
/****** Object:  StoredProcedure [dbo].[sp_non_clustered_index_disable]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_non_clustered_index_disable]
	@fact_table_name NVARCHAR(150)
AS
BEGIN
	DECLARE @sql_command NVARCHAR(MAX) = N''
	BEGIN TRY
		SELECT @sql_command += N'
			ALTER INDEX ' + QUOTENAME(ix.[name]) + ' ON ' 
			+ OBJECT_NAME(ID) + ' DISABLE; '
		FROM  sysindexes ix
		WHERE ix.indid > 1 --Nonclustered index(>1)
              AND QUOTENAME(ix.[Name]) like '%IX_fact_%'
              AND OBJECT_NAME(ID) = @fact_table_name
		EXEC (@sql_command)
    END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState );
        RETURN 1
    END CATCH
    RETURN 0
END	
GO
/****** Object:  StoredProcedure [dbo].[sp_non_clustered_index_rebuild]    Script Date: 2020-10-28 7:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_non_clustered_index_rebuild]
	@fact_table_name NVARCHAR(150)
AS
BEGIN
	DECLARE @sql_command NVARCHAR(MAX) = N''
	BEGIN TRY
		SELECT @sql_command += N'
			ALTER INDEX ' + QUOTENAME(ix.[name]) + ' ON ' 
			+ OBJECT_NAME(ID) + ' REBUILD; '
		FROM  sysindexes ix
		WHERE ix.indid > 1 --Nonclustered index(>1)
              AND QUOTENAME(ix.[Name]) like '%IX_fact_%'
              AND OBJECT_NAME(ID) = @fact_table_name
		EXEC (@sql_command)
    END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState );
        RETURN 1
    END CATCH
    RETURN 0
END
GO
USE [master]
GO
ALTER DATABASE [Star] SET  READ_WRITE 
GO
