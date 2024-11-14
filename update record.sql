
declare @updated_records int 
update a 
set a.[AQI] = b.[AQI],
    a.[state_name] = b.[state_name],
    a.[county_name] = b.[county_name],
    a.[state_code] = b.[state_code],
    a.[date] = b.["date"],
    a.[category] = b.[category],
    a.[defining_parameter] = b.[defining_parameter],
    a.[defining_site] = b.[defining_site],
    a.[number_of_sites_reporting] = b.[number_of_site_reporting],
    a.[created] = b.[created],
    a.[last_updated] = b.[last_updated]
from [STAGE].[tblAqiDatas] a inner join [dbo].[Stage tblTempAqiDatas] b 
on a.[defining_site] = b.[defining_site] 
    and a.[defining_parameter] = b.[defining_parameter]
    and a.[date] = b.["date"]
set @updated_records = (select @@ROWCOUNT)
insert into tbl_audit_log
select 'Incremental Data Update.dtsx', '[STAGE].[tblAqiDatas]', 0, @updated_records, getdate()

update [dbo].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [STAGE].[tblAqiDatas])
where [table_name] = '[STAGE].[tblAqiDatas]' and (select count (*) from [STAGE].[tblAqiDatas]) > 0
