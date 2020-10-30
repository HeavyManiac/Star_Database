use Star
GO

drop procedure if exists sp_add_territory
GO

CREATE PROCEDURE sp_add_territory (
	@territory_id [dbo].[udt_territory_id],
	@territory_name [dbo].[udt_territory_name] ,
	@country_region [dbo].[udt_country_name] ,
	@group_name [dbo].[udt_group_name],
	@territory_key [dbo].[udt_surrogate_key] OUTPUT)

AS
BEGIN
	If (@territory_id is not null) 
	and (@territory_name is not null) 
	and (@country_region is not null) 
	and (@group_name is not null) 
	BEGIN
		IF EXISTS (select [territory_key] from [dbo].[dim_territory] where [territory_id] = @territory_id) 
			BEGIN 
				UPDATE [DBO].[dim_territory]
				SET	[name] = @territory_name,
					[country_region_name] = @country_region,
					[group_name] = @group_name
				WHERE [territory_id] = @territory_id;
			END
		ELSE
			BEGIN
				INSERT INTO [dbo].[dim_territory] 
				([territory_id],[name] ,[country_region_name],[group_name])
				VALUES  (@territory_id,@territory_name, @country_region, @group_name);
			END
	END
	
	If (@territory_id is not null)
	begin
		set @territory_key = 
			(SELECT [territory_key] from [dbo].[dim_territory] where [territory_id] = @territory_id);
	end
END

