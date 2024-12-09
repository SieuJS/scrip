declare @updated_records int 
update a
set 
    a.state_name = b.state_name ,
    a.state_number_code = b.state_number_code , 
    a.state_alpha_code = b.state_alpha_code ,
    a.created = b.created ,
    a.last_updated = b.last_updated
	
from [dds].tbl_dim_states a inner join [dds].zzz_tbl_dim_states b 
on   a.state_id = b.state_id
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'stage-to-source.dtsx', '[dds].[tbl_dim_states]', 0, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [dds].[tbl_dim_states])
where [table_name] = '[dds].[tbl_dim_states]' and (select count (*) from [dds].[tbl_dim_states]) > 0;

declare @updated_records int 
update a
set 
    a.county_code = b.county_code ,
    a.county_fips_code = b.county_fips_code,
    a.county_name = b.county_name,
    a.created = b.created , 
    a.last_updated = b.last_updated,
    a.lat = b.lat, 
    a.lng = b.lng ,
    a.population = b.population
	
from [dds].tbl_dim_counties a inner join [dds].zzz_tbl_dim_counties b 
on   a.county_id = b.county_id
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'stage-to-source.dtsx', '[dds].[tbl_dim_counties]', 0, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [dds].[tbl_dim_counties])
where [table_name] = '[dds].[tbl_dim_counties]' and (select count (*) from [dds].[tbl_dim_counties]) > 0;


declare @updated_records int
update a
set 
    a.aqi = b.aqi,
    a.category = b.category,
    a.date_id = b.date_id,
    a.state_id = b.state_id,
    a.county_id = b.county_id,
    a.defining_parameter = b.defining_parameter,
    a.defining_site = b.defining_site,
    a.number_of_sites_reporting = b.number_of_sites_reporting,
    a.source_id = b.source_id,
    a.created = b.created,
    a.last_updated = b.last_updated
from [dds].tbl_fact_aqi a inner join [dds].zzz_tbl_dim_fact_aqi b
on a.aqi_id = b.aqi_id
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'stage-to-source.dtsx', '[dds].[tbl_fact_aqi]', 0, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [dds].[tbl_fact_aqi])
where [table_name] = '[dds].[tbl_fact_aqi]' and (select count (*) from [dds].[tbl_fact_aqi]) > 0;