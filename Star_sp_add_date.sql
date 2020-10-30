use Star
GO

drop procedure if exists sp_add_date
GO

CREATE PROCEDURE sp_add_date (
	@new_date datetime2,
	@date_key [dbo].[udt_surrogate_key] OUTPUT )
AS
BEGIN
	If @new_date is not null
	Begin
		IF EXISTS (select date_key from dim_date where sql_date = @new_date ) 
			begin
				update [dbo].[dim_date]
				set
					[day_of_week]	= DATENAME(dw,@new_date), 
					[day_of_month]	= DATEPART(dd,@new_date),
					[week_of_year]	= DATEPART(wk,@new_date),
					[month_of_year] = DATEPART(mm,@new_date),
					[quarter]		= DATEPART(QQ,@new_date),
					[year]			= DATEPART(yy,@new_date)
				where [sql_date] = @new_date
			end
		else
			begin
				INSERT INTO dim_date
				([sql_date], [day_of_week], [day_of_month], [week_of_year], [month_of_year], 
				[month],[quarter],[year]) 
				VALUES  (@new_date		
					,DATENAME(dw,@new_date) 
					,DATEPART(dd,@new_date)
					,DATEPART(wk,@new_date)
					,DATEPART(mm,@new_date)
					,DATENAME(mm,@new_date)
					,DATEPART(QQ,@new_date)
					,DATEPART(yy,@new_date)
				)
			END
		
		set @date_key = 
			(SELECT [date_key] from [dbo].[dim_date] where [sql_date] = @new_date) 
	end
END






