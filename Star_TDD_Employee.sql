

-- Add/update employee
declare	@employee_id [dbo].[udt_person_id]
declare	@gender [dbo].[udt_gender]
declare	@marital_status [dbo].[udt_marital_status]
declare @hire_date [dbo].[udt_date_string]
declare	@job_title [dbo].[udt_job_title]
declare	@employee_name [dbo].[udt_person_name]
declare	@employee_key [dbo].[udt_surrogate_key]

SET @employee_id = '3330034'
SET	@gender ='Female'
SET @marital_status ='Married'
SET @hire_date = '2019-06-01'
SET @job_title = 'Sales'
SET @employee_name = 'Jun May'

exec [dbo].[sp_add_employee]
	@employee_id ,
	@gender ,
	@marital_status ,
	@hire_date ,
	@job_title ,
	@employee_name  ,
	@employee_key  OUTPUT 

select @employee_key 'KEY', @employee_id ,@gender ,@marital_status ,@hire_date ,@job_title ,@employee_name
select * from [dbo].[dim_employee] where [employee_key] = @employee_key
GO
-- UPDATE employee
declare	@employee_id [dbo].[udt_person_id]
declare	@gender [dbo].[udt_gender]
declare	@marital_status [dbo].[udt_marital_status]
declare @hire_date [dbo].[udt_date_string]
declare	@job_title [dbo].[udt_job_title]
declare	@employee_name [dbo].[udt_person_name]
declare	@employee_key [dbo].[udt_surrogate_key]

SET @employee_id = '50067'
SET	@gender ='Male'
SET @marital_status ='Single'
SET @hire_date = '2020-01-23'
SET @job_title = 'Business Analyst'
SET @employee_name = 'Jose Luevano'

exec [dbo].[sp_add_employee]
	@employee_id ,
	@gender ,
	@marital_status ,
	@hire_date ,
	@job_title ,
	@employee_name  ,
	@employee_key  OUTPUT 

select @employee_key 'KEY', @employee_id ,@gender ,@marital_status ,@hire_date ,@job_title ,@employee_name
select * from [dbo].[dim_employee] where [employee_key] = @employee_key
GO
-- fail employee
declare	@employee_id [dbo].[udt_person_id]
declare	@gender [dbo].[udt_gender]
declare	@marital_status [dbo].[udt_marital_status]
declare @hire_date [dbo].[udt_date_string]
declare	@job_title [dbo].[udt_job_title]
declare	@employee_name [dbo].[udt_person_name]
declare	@employee_key [dbo].[udt_surrogate_key]

SET @employee_id = '50067'
SET	@gender ='Male'
SET @marital_status = NULL -- 'Married'
SET @hire_date = '2020-01-23'
SET @job_title = 'Business Analyst'
SET @employee_name = 'Jose Luevano'

exec [dbo].[sp_add_employee]
	@employee_id ,
	@gender ,
	@marital_status ,
	@hire_date ,
	@job_title ,
	@employee_name  ,
	@employee_key  OUTPUT 

select @employee_key 'KEY', @employee_id ,@gender ,@marital_status ,@hire_date ,@job_title ,@employee_name
select * from [dbo].[dim_employee] where [employee_key] = @employee_key
GO
