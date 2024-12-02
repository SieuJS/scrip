
declare @updated_records int 
update a
set 
    a.state_name =  (select top 1 state_name from [nds].zzz_tbl_states where state_number_code = a.state_number_code order by last_updated desc),
    a.last_updated = GETDATE()
from [nds].[tbl_states] a inner join [nds].[zzz_tbl_states] b
on   a.state_number_code = b.state_number_code
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'stage-to-source.dtsx', '[nds].[tbl_states]', 0, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [nds].[tbl_states])
where [table_name] = '[nds].[tbl_states]' and (select count (*) from [nds].[tbl_states]) > 0;



declare @updated_records int 
update a
set 
    a.county_name = b.county_name,
    a.source_id = b.source_id,
    a.last_updated = GETDATE()
from [nds].[tbl_counties] a inner join [nds].[zzz_tbl_counties] b
on   a.county_fips_code = b.county_fips_code 
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'stage-to-source.dtsx', '[nds].[tbl_counties]', 0, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [nds].[tbl_counties])
where [table_name] = '[nds].[tbl_counties]' and (select count (*) from [nds].[tbl_counties]) > 0;


declare @updated_records int
update a 
set a.aqi = b.aqi,
    a.category = b.category,
    a.defining_parameter = b.defining_parameter,
    a.defining_site = b.defining_site,
    a.number_of_sites_reporting = b.number_of_sites_reporting,
    a."date" = b."date",
    a.last_updated = GETDATE()
from [nds].[tbl_aqi] a inner join [nds].zzz_tbl_aqi b
on a.county_id = b.county_id and a."date" = b."date" and a.defining_parameter = b.defining_parameter and a.defining_site = b.defining_site
set @updated_records = (select @@ROWCOUNT)  
insert into [meta].tbl_audit_log
select 'stage-to-source.dtsx', '[nds].[tbl_aqi]', 0, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [nds].[tbl_aqi])
where [table_name] = '[nds].[tbl_aqi]' and (select count (*) from [nds].[tbl_aqi]) > 0

select * from [nds].[tbl_counties];
