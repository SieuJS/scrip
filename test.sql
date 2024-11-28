declare @updated_records int 
update a 
set 
    a.state_num_code = b.state_num_code,
    a.state_string_code = b.state_string_code,
    a.lat = b.lat,
    a.lng = b.lng,
    a.population = b.population,
    a.state_name = b.state_name,
    a.created = b.created,
    a.last_updated = b.last_updated
from [STAGE].[tbl_states] a inner join [STAGE].zzz_tbl_states b 
on  a.state_num_code = b.state_num_code

select * from STAGE.tbl_aqi_datas LIMIT 10;

set @updated_records = (select @@ROWCOUNT)
insert into [STAGE].tbl_audit_log
select 'Incremental Data Update.dtsx', '[STAGE].[tbl_states]', ?, @updated_records, getdate()

update [STAGE].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [STAGE].[tbl_aqi_datas])
where [table_name] = '[STAGE].[tbl_states]' and (select count (*) from [STAGE].[tbl_states]) > 0

select * from [STAGE].tbl_audit_log;
