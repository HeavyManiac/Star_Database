
use [Star]
go

	DECLARE @NumberRecords int, @RowCounter int, @result int;
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

---
	select @date_key = 1, @territory_key = 1, @employee_key = 1, @store_key = 3, @individual_customer_key=1;
	select @salesorder_number = 1001, @salesorder_online_order_flag=1, @salesorder_sale_subtotal=50,
			@salesorder_tax_amount=5, @salesorder_shipping_cost=1

select 'add fac sales order';
		exec [dbo].[sp_add_fact_sales_order]
			@date_key, @territory_key, @employee_key, @store_key, @individual_customer_key,
			@salesorder_number, @salesorder_online_order_flag, @salesorder_sale_subtotal,
			@salesorder_tax_amount, @salesorder_shipping_cost,
			@result OUTPUT;
		select 'add fac sales order', @result;


