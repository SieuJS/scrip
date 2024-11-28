declare @updated_records int 
update a 
set a.county_code = b.county_code,
    a.county_name = b.county_name,
    a.fips = b.fips,
    a.lat = b.lat,
    a.lng = b.lng,
    a.population = b.population,
    a.created = b.created,
    a.last_updated = b.last_updated
from [STAGE].[tbl_counties] a inner join [STAGE].zzz_tbl_counties b 
on a.fips = b.fips
set @updated_records = (select @@ROWCOUNT)
insert into [STAGE].tbl_audit_log
select 'Incremental Data Update.dtsx', '[STAGE].[tbl_counties]', ?, @updated_records, getdate()

update [STAGE].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [STAGE].[tbl_counties])
where [table_name] = '[STAGE].[tbl_counties]' and (select count (*) from [STAGE].[tbl_counties]) > 0

select * from [STAGE].tbl_audit_log;
