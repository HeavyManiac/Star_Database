-- TABLE [dbo].[dim_individual_customer](

use Star
Go
--- send existing customer, receive key only
Declare @individual_customer_key [dbo].[udt_surrogate_key]
Declare @person_id [dbo].[udt_person_id] 
Declare @gender [dbo].[udt_gender] 
Declare @marital_status [dbo].[udt_marital_status] 
Declare @education [dbo].[udt_person_education] 
Declare @occupation [dbo].[udt_person_ocupation] 
Declare @home_owner_flag [dbo].[udt_person_home_owner_flag] 
Declare @city [dbo].[udt_city_name] 
Declare @state_province [dbo].[udt_state_province_name] 
Declare @country_region [dbo].[udt_country_name] 

SET @person_id = 2222345  -- 333XXXX
SET	@gender = null --'Male'
SET @marital_status = NULL --'Married'
SET @education = null --'College'
SET @occupation = null --'Buys'
SET @home_owner_flag = null --0
SET @city = null --'Edmonton'
SET @state_province = NULL --'Alberta'
SET @country_region = NULL --'Canada'

exec [dbo].[sp_add_individual_customer]
	@person_id ,	@gender ,@marital_status ,@education ,@occupation ,@home_owner_flag  ,
	@city,@state_province,@country_region,
	@individual_customer_key  OUTPUT 

select @individual_customer_key 'KEY', 
	@person_id ,
	@gender, 
	@marital_status, 
	@education ,
	@occupation ,
	@home_owner_flag, 
	@city, 
	@state_province,
	@country_region

select * from [dbo].[dim_individual_customer] where [individual_customer_key] = @individual_customer_key

GO
---- New customer
use Star
go

Declare @individual_customer_key [dbo].[udt_surrogate_key]
Declare @person_id [dbo].[udt_person_id] 
Declare @gender [dbo].[udt_gender] 
Declare @marital_status [dbo].[udt_marital_status] 
Declare @education [dbo].[udt_person_education] 
Declare @occupation [dbo].[udt_person_ocupation] 
Declare @home_owner_flag [dbo].[udt_person_home_owner_flag] 
Declare @city [dbo].[udt_city_name] 
Declare @state_province [dbo].[udt_state_province_name] 
Declare @country_region [dbo].[udt_country_name] 

SET @person_id = 22224444  -- 333XXXX
SET	@gender = 'Male'
SET @marital_status = 'Married'
SET @education = 'College'
SET @occupation = 'Marketing'
SET @home_owner_flag = 1 --0
SET @city = 'Cochrane'
SET @state_province = 'Alberta'
SET @country_region = 'Canada'

exec [dbo].[sp_add_individual_customer]
	@person_id ,	@gender ,@marital_status ,@education ,@occupation ,@home_owner_flag  ,
	@city,@state_province,@country_region,
	@individual_customer_key  OUTPUT 

select @individual_customer_key 'KEY', 
	@person_id ,
	@gender, 
	@marital_status, 
	@education ,
	@occupation ,
	@home_owner_flag, 
	@city, 
	@state_province,
	@country_region

select * from [dbo].[dim_individual_customer] where [individual_customer_key] = @individual_customer_key

GO
