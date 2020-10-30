
use Star
go

exec [dbo].[sp_process_salesorder]

select * from [dbo].[SalesOrder]
select * from [dbo].[fact_sales_order]
delete [dbo].[fact_sales_order] 

update [dbo].[SalesOrder]
set [salesorder_processed] = 0
where [salesorder_processed] = 1 
