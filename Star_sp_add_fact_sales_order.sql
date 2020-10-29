use Star
GO

drop procedure if exists sp_add_fact_sales_order
GO

CREATE PROCEDURE sp_add_fact_sales_order (
	@date_key [dbo].[udt_surrogate_key],
	@territory_key [dbo].[udt_surrogate_key],
	@employee_key [dbo].[udt_surrogate_key],
	@store_key [dbo].[udt_surrogate_key],
	@individual_customer_key [dbo].[udt_surrogate_key],
	@sales_order_number [dbo].[udt_business_sales_order_number],
	@online_order_flag [dbo].[udt_business_online_order_flag],
	@sale_subtotal [dbo].[udt_money],
	@tax_amount [dbo].[udt_money],
	@shipping_cost [dbo].[udt_money],
	@result int OUTPUT )
AS
BEGIN
	If @date_key is not null
	and @territory_key is not null
	and @employee_key is not null
	and @store_key is not null
	and @individual_customer_key is not null
	and @sales_order_number is not null
	and @online_order_flag is not null
	and @sale_subtotal is not null
	and @tax_amount is not null
	and @shipping_cost is not null

	Begin
	IF EXISTS (
				select [date_key] from [dbo].[fact_sales_order] 
				where [date_key] = @date_key 
				and [territory_key] = @territory_key
				and [employee_key] = @employee_key
				and [store_key] = @store_key
				and [individual_customer_key] = @individual_customer_key
			) 
		BEGIN
			update [dbo].[fact_sales_order]
			set
				[sales_order_number] = @sales_order_number,
				[online_order_flag] = @online_order_flag,
				[sale_subtotal] = @sale_subtotal,
				[tax_amount] = @tax_amount,
				[shipping_cost] = @shipping_cost
			where [date_key] = @date_key 
				and [territory_key] = @territory_key
				and [employee_key] = @employee_key
				and [store_key] = @store_key
				and [individual_customer_key] = @individual_customer_key
			set @result = 202  
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[fact_sales_order]
			([date_key],[territory_key],[employee_key],[store_key],[individual_customer_key],
			[sales_order_number],[online_order_flag],[sale_subtotal],[tax_amount],[shipping_cost]
			) 
			VALUES  (
				@date_key, @territory_key,@employee_key,@store_key,@individual_customer_key,
				@sales_order_number,@online_order_flag,@sale_subtotal,@tax_amount,@shipping_cost
			)

			set @date_key = 200
		END
	END
END






