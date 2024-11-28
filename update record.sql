
declare @updated_records int 
update a 
set a.[AQI] = b.[AQI],
    a.[state_name] = b.[state_name],
    a.[county_name] = b.[county_name],
    a.[state_code] = b.[state_code],
    a.[date] = b.[date],
    a.[category] = b.[category],
    a.[defining_parameter] = b.[defining_parameter],
    a.[defining_site] = b.[defining_site],
    a.[number_of_sites_reporting] = b.[number_of_sites_reporting],
    a.[created] = b.[created],
    a.[last_updated] = b.[last_updated]
from [STAGE].[tbl_aqi_datas] a inner join [STAGE].zzz_tbl_aqi_datas b 
on a.[defining_site] = b.[defining_site] 
    and a.[defining_parameter] = b.[defining_parameter]
    and a.[date] = b.[date]
where b.last_updated > a.last_updated
set @updated_records = (select @@ROWCOUNT)
insert into [STAGE].tbl_audit_log
select 'Incremental Data Update.dtsx', '[STAGE].[tbl_aqi_datas]', ?, @updated_records, getdate()

update [STAGE].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [STAGE].[tbl_aqi_datas])
where [table_name] = '[STAGE].[tbl_aqi_datas]' and (select count (*) from [STAGE].[tbl_aqi_datas]) > 0

select * from [STAGE].tbl_audit_log;
