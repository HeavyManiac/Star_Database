

USE Star
GO


SELECT	ee.employee_id, ee.employee_name, sum(ff.sale_subtotal) sales 
FROM	[dbo].[fact_sales_order] ff, [dbo].[dim_employee] ee
WHERE	ee.employee_key = ff.employee_key
GROUP BY ee.employee_id,  ee.employee_name
order by sales

