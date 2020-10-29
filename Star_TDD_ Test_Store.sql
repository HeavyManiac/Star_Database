--- Store
--- update existing 
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

SET @store_id = 333
SET	@store_name ='Edmonton Store Centre'
SET @year_open = '1999'
SET @square_feet = 6000
SET @speciality = 'Consumers'
SET @business_type = 'Retail'
SET @city = 'Edmonton'
SET @state_province = 'Alberta'
SET @country_region = 'Canada'

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

-- get store
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

SET @store_id = 333
SET	@store_name = null --'Edmonton Store Centre'
SET @year_open = null --'1999'
SET @square_feet = null --6000
SET @speciality = null --'Consumers'
SET @business_type = null --'Retail'
SET @city = null --'Edmonton'
SET @state_province = null --'Alberta'
SET @country_region = null --'Canada'

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

-- add new store

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

SET @store_id = 555  -- this exists, add anothe new, otherwise will be updated
SET	@store_name ='Toronto Store Centre'
SET @year_open = '2010'
SET @square_feet = 8000
SET @speciality = 'Consumers'
SET @business_type = 'Retail'
SET @city = 'Toronto'
SET @state_province = 'Ontario'
SET @country_region = 'Canada'

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
