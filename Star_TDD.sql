Use Star
Go


'2020-01-02 15:50:49.5466667'
'2020-02-23 14:51:15.1100000'
'2020-03-20 09:27:05.6200000'
'2020-04-16 13:40:22.9100000'

--- adding data to dimemsion date
--- Always new date and get new key
declare @date as datetime2
declare @key as int;

select @date = '2018-01-24 11:40:01' --getdate()
exec sp_add_date @date, @key output
select @date as [Date], @key as [Key]

GO
--- Always date exists
declare @date as datetime2
declare @key as int;

Set @date = (select [sql_date] from [dbo].[dim_date] where [date_key] = 2)
exec sp_add_date @date, @key output
select @date as [Date], @key as [Key]
-- 2020-10-23 02:21:15.1100000, 2
GO

declare @date as datetime2
declare @key as int;

Set @date = NULL
exec sp_add_date @date, @key output
select @date as [Date], @key as [Key]
-- NULL, NULL
GO
USE Star
GO





--- Another country 
use Star
Go
Declare @store_key [dbo].[udt_surrogate_key]
Declare @store_id [dbo].[udt_business_key] 
Declare @store_name [dbo].[udt_person_name] 
Declare @year_open [dbo].[udt_year_string] 
Declare @square_feet [dbo].[udt_dimension_feet_int] 
Declare @speciality [dbo].[udt_speciality_string] 
Declare @business_type [dbo].[udt_business_type_string] 
Declare @city [dbo].[udt_city_name] 
Declare @state_province [dbo].[udt_state_province_name] 
Declare @country_region [dbo].[udt_country_name] 

SET @store_id = 444
SET	@store_name ='Store Big'
SET @year_open = '1990'
SET @square_feet = 40500
SET @speciality = 'Resellers'
SET @business_type = 'Retail'
SET @city = 'Monterrey'
SET @state_province = 'Nuevo Leon'
SET @country_region = 'Mexico'

exec [dbo].[sp_add_store]
	@store_id ,
	@store_name ,
	@year_open ,
	@square_feet ,
	@speciality,
	@business_type,
	@city,
	@state_province,
	@country_region,
	@store_key  OUTPUT 

select @store_key 'KEY', 
	@store_id,
	@store_name,
	@year_open, 
	@square_feet, 
	@speciality,
	@business_type,
	@city,  
	@state_province,
	@country_region

select * from [dbo].[dim_store] where [store_key] = @store_key

GO

--- Territory 
use Star
Go
--- New/update
Declare @territory_key [dbo].[udt_surrogate_key]
Declare @territory_id [dbo].[udt_territory_id]
Declare @territory_name [dbo].[udt_territory_name] 
Declare @country_region [dbo].[udt_country_name] 
Declare @group_name [dbo].[udt_group_name] 

SET @territory_id = 88880001
SET	@territory_name ='North America'
SET @country_region = 'USA'
SET @group_name = 'US'

exec [dbo].[sp_add_territory]
	@territory_id,
	@territory_name ,
	@country_region ,
	@group_name ,
	@territory_key  OUTPUT 

select @territory_key 'KEY', 
	@territory_id,
	@territory_name,
	@country_region, 
	@group_name

select * from [dbo].[dim_territory] where [territory_key] = @territory_key

GO