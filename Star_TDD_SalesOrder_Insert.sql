USE [Star]
GO




--- Insert in all rows, not used yet
INSERT INTO [dbo].[SalesOrder]
           ([salesorder_date]
           ,[customer_id]
           ,[customer_gender]
           ,[customer_marital_status]
           ,[customer_education]
           ,[customer_occupation]
           ,[customer_home_owner_flag]
           ,[customer_city]
           ,[customer_state_province]
           ,[customer_country_region]
           ,[store_id]
           ,[store_name]
           ,[store_year_open]
           ,[store_square_feet]
           ,[store_specialty]
           ,[store_business_type]
           ,[store_city]
           ,[store_state_province]
           ,[store_country]
           ,[employee_id]
           ,[employee_gender]
           ,[employee_marital_status]
           ,[employee_hire_date]
           ,[employee_job_title]
           ,[employee_name]
           ,[territory_id]
           ,[territory_name]
           ,[territory_country_region_name]
           ,[territory_group_name]
           ,[salesorder_number]
           ,[salesorder_online_order_flag]
           ,[salesorder_sale_subtotal]
           ,[salesorder_tax_amount]
           ,[salesorder_shipping_cost])
     VALUES
           (<salesorder_date, datetime2(7),>
           ,<customer_id, [dbo].[udt_person_id],>
           ,<customer_gender, [dbo].[udt_gender],>
           ,<customer_marital_status, [dbo].[udt_marital_status],>
           ,<customer_education, [dbo].[udt_person_education],>
           ,<customer_occupation, [dbo].[udt_person_ocupation],>
           ,<customer_home_owner_flag, [dbo].[udt_person_home_owner_flag],>
           ,<customer_city, [dbo].[udt_city_name],>
           ,<customer_state_province, [dbo].[udt_state_province_name],>
           ,<customer_country_region, [dbo].[udt_country_name],>
           ,<store_id, [dbo].[udt_business_key],>
           ,<store_name, [dbo].[udt_person_name],>
           ,<store_year_open, [dbo].[udt_year_string],>
           ,<store_square_feet, [dbo].[udt_dimension_feet_int],>
           ,<store_specialty, [dbo].[udt_speciality_string],>
           ,<store_business_type, [dbo].[udt_business_type_string],>
           ,<store_city, [dbo].[udt_city_name],>
           ,<store_state_province, [dbo].[udt_state_province_name],>
           ,<store_country, [dbo].[udt_country_name],>
           ,<employee_id, [dbo].[udt_person_id],>
           ,<employee_gender, [dbo].[udt_gender],>
           ,<employee_marital_status, [dbo].[udt_marital_status],>
           ,<employee_hire_date, [dbo].[udt_date_string],>
           ,<employee_job_title, [dbo].[udt_job_title],>
           ,<employee_name, [dbo].[udt_person_name],>
           ,<territory_id, [dbo].[udt_territory_id],>
           ,<territory_name, [dbo].[udt_territory_name],>
           ,<territory_country_region_name, [dbo].[udt_country_name],>
           ,<territory_group_name, [dbo].[udt_group_name],>
           ,<salesorder_number, [dbo].[udt_business_sales_order_number],>
           ,<salesorder_online_order_flag, [dbo].[udt_business_online_order_flag],>
           ,<salesorder_sale_subtotal, [dbo].[udt_money],>
           ,<salesorder_tax_amount, [dbo].[udt_money],>
           ,<salesorder_shipping_cost, [dbo].[udt_money],>)
GO
---------------------------------
--- see the data before insert, check that salesnumber is not repetead
Use Star
Go

select	distinct dd.sql_date as salesorder_date, 
		cc.person_id as customer_id, 
		ss.store_id as store_id, 
		ee.employee_id as employee_id,
		tt.territory_id as territory_id,
		ss.store_id*10000 
			+ datepart(minute,dd.sql_date) * 100
			+ datepart(HOUR,dd.sql_date)  * 10
			+ dd.date_key + tt.territory_key + cc.individual_customer_key + ee.employee_key as salesoder_number,
		case 
			when cc.marital_status = 'Single' then 1 else 0 
		end as salesorder_online_flag,
		cast( dd.date_key * ss.store_key * cc.individual_customer_key + employee_key       as money) as salesorder_sub_total,
		cast((dd.date_key * ss.store_key * cc.individual_customer_key + employee_key)*0.15 as money) as salesorder_tax,
		case 
			when cc.marital_status = 'Single' then 5 else 0 
		end as salesorder_shipping
from [dbo].[dim_date] dd,
	[dbo].[dim_employee] ee,
	[dbo].[dim_individual_customer] cc,
	[dbo].[dim_store] ss,
	[dbo].dim_territory tt
where ee.job_title = 'Sales'      -- only employees on sales
and ss.store_id = ee.employee_id/10000 -- grpup employees by its store
and ss.store_id = cc.person_id/10000 -- customers per store
and ss.country_region = tt.country_region_name -- countries per region
and dd.sql_date > ee.hire_date -- sales done after being hired
and ss.store_id*10000 
	+ datepart(minute,dd.sql_date) * 100
	+ datepart(HOUR,dd.sql_date)  * 10
	+ dd.date_key + tt.territory_key + cc.individual_customer_key + ee.employee_key
	not in (select [salesorder_number] from [dbo].[SalesOrder] where 1=2)
order by salesorder_date


-- 0001 add row to salesorder table
Use Star
go

INSERT INTO [dbo].[SalesOrder]
           ([salesorder_date]
           ,[customer_id]
           ,[store_id]
           ,[employee_id]
           ,[territory_id]
           ,[salesorder_number]
           ,[salesorder_online_order_flag]
           ,[salesorder_sale_subtotal]
           ,[salesorder_tax_amount]
           ,[salesorder_shipping_cost])
     (
select	distinct dd.sql_date as salesorder_date, 
		cc.person_id as customer_id, 
		ss.store_id as store_id, 
		ee.employee_id as employee_id,
		tt.territory_id as territory_id,
		ss.store_id*10000 
			+ datepart(minute,dd.sql_date) * 100
			+ datepart(HOUR,dd.sql_date)  * 10
			+ dd.date_key + tt.territory_key + cc.individual_customer_key + ee.employee_key as salesoder_number,
		case 
			when cc.marital_status = 'Single' then 1 else 0 
		end as salesorder_online_flag,
		cast( dd.date_key * ss.store_key * cc.individual_customer_key + employee_key       as money) as salesorder_sub_total,
		cast((dd.date_key * ss.store_key * cc.individual_customer_key + employee_key)*0.15 as money) as salesorder_tax,
		case 
			when cc.marital_status = 'Single' then 5 else 0 
		end as salesorder_shipping
from [dbo].[dim_date] dd,
	[dbo].[dim_employee] ee,
	[dbo].[dim_individual_customer] cc,
	[dbo].[dim_store] ss,
	[dbo].dim_territory tt
where ee.job_title = 'Sales'      -- only employees on sales
and ss.store_id = ee.employee_id/10000 -- grpup employees by its store
and ss.store_id = cc.person_id/10000 -- customers per store
and ss.country_region = tt.country_region_name -- countries per region
and dd.sql_date > ee.hire_date -- sales done after being hired
and ss.store_id*10000 
	+ datepart(minute,dd.sql_date) * 100
	+ datepart(HOUR,dd.sql_date)  * 10
	+ dd.date_key + tt.territory_key + cc.individual_customer_key + ee.employee_key
	not in (select [salesorder_number] from [dbo].[SalesOrder])
--order by salesorder_date
)



