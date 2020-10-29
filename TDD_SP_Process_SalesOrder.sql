

use Star
GO

drop procedure if exists sp_add_fact_sales_order
GO

-- create a loop whitout using cursosrs

CREATE PROCEDURE sp_add_fact_sales_order 
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
		set rowcount 0;

		-- add customer and get its key
		exec [dbo].[sp_add_individual_customer]
				@customer_id, @customer_gender, @customer_marital_status, @customer_education, @customer_occupation, @customer_home_owner_flag,
				@customer_city,@customer_state_province,@customer_country_region,
				@individual_customer_key  OUTPUT; 
		
		if ( @individual_customer_key  is NULL )
		goto next

		-- add store
		
		
next:	
		update [dbo].[SalesOrder]
		set [salesorder_processed] = 1
		where [record_key] = @record_key;

		set @RowCounter = (@RowCounter + 1);

	end
	
END
	
	
	--select [record_key] from [dbo].[SalesOrder] SO where [salesorder_processed] = 0

	

