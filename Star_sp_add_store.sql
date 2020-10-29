use Star
GO

drop procedure if exists sp_add_store
GO

CREATE PROCEDURE sp_add_store (
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

