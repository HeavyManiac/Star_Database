use Star
GO

drop procedure if exists sp_add_individual_customer
GO

CREATE PROCEDURE sp_add_individual_customer (
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

