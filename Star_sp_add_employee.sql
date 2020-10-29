use Star
GO

drop procedure if exists sp_add_employee
GO

CREATE PROCEDURE sp_add_employee (
	@employee_id [dbo].[udt_person_id] ,
	@gender [dbo].[udt_gender] ,
	@marital_status [dbo].[udt_marital_status] ,
	@hire_date [dbo].[udt_date_string] ,
	@job_title [dbo].[udt_job_title] ,
	@employee_name [dbo].[udt_person_name] ,
	@employee_key [dbo].[udt_surrogate_key] OUTPUT )
AS
BEGIN
	If (@employee_id is not null) 
	and (@gender is not null) 
	and (@marital_status is not null) 
	and (@hire_date is not null) 
	and (@job_title is not null) 
	and (@employee_name is not null)  
	Begin
	IF EXISTS (select [employee_key] from [dbo].[dim_employee] where [employee_id] = @employee_id ) 
		BEGIN 
			/* select @date_key */   
			UPDATE [DBO].[dim_employee]
			SET	[gender] = @gender,
				[marital_status] = @marital_status,
				[hire_date] = @hire_date,
				[job_title] = @job_title,
				[employee_name] = @employee_name
			WHERE [employee_id] = @employee_id
			set @employee_key = (SELECT [employee_key] from [dbo].[dim_employee] where [employee_id] = @employee_id) 
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[dim_employee] 
			([employee_id], [gender],[marital_status],[hire_date],[job_title],[employee_name])
			VALUES  (@employee_id, @gender, @marital_status, @hire_date, @job_title, @employee_name)
			set @employee_key = (SELECT [employee_key] from [dbo].[dim_employee] where [employee_id] = @employee_id)
			/*SELECT @date_key*/ 
		END
	END
END






