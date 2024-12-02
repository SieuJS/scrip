declare @updated_records int 
update a
set 
    a.county_name = b.county_name,
    a.state_code = b.state_code,
    a.county_code = b.county_code,
    a.state_name = b.state_name,
    a.aqi = b.aqi,
    a.category = b.category,
    a.defining_parameter = b.defining_parameter,
    a.defining_site = b.defining_site,
    a.number_of_sites_reporting = b.number_of_sites_reporting,
    a."date" = b."date",
    a.created = b.created,
    a.last_updated = b.last_updated
from [STAGE].[tbl_aqi_data_2021] a inner join [STAGE].zzz_tbl_aqi_data_2021 b 
on   a."date" = b."date" and a.defining_parameter = b.defining_parameter and a.defining_site = b.defining_site
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'Incremental Data Update.dtsx', '[stage].[tbl_aqi_data_2021]', ?, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [stage].[tbl_aqi_data_2021])
where [table_name] = '[stage].[tbl_aqi_data_2021]' and (select count (*) from [stage].[tbl_aqi_data_2021]) > 0;

 --2022
declare @updated_records int 
update a
set 
    a.county_name = b.county_name,
    a.state_code = b.state_code,
    a.county_code = b.county_code,
    a.state_name = b.state_name,
    a.aqi = b.aqi,
    a.category = b.category,
    a.defining_parameter = b.defining_parameter,
    a.defining_site = b.defining_site,
    a.number_of_sites_reporting = b.number_of_sites_reporting,
    a."date" = b."date",
    a.created = b.created,
    a.last_updated = b.last_updated
from [STAGE].[tbl_aqi_data_2022] a inner join [STAGE].zzz_tbl_aqi_data_2022 b 
on   a."date" = b."date" and a.defining_parameter = b.defining_parameter and a.defining_site = b.defining_site
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'Incremental Data Update.dtsx', '[stage].[tbl_aqi_data_2022]', ?, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [stage].[tbl_aqi_data_2022])
where [table_name] = '[stage].[tbl_aqi_data_2022]' and (select count (*) from [stage].[tbl_aqi_data_2022]) > 0

-- 2023
declare @updated_records int 
update a
set 
    a.county_name = b.county_name,
    a.state_code = b.state_code,
    a.county_code = b.county_code,
    a.state_name = b.state_name,
    a.aqi = b.aqi,
    a.category = b.category,
    a.defining_parameter = b.defining_parameter,
    a.defining_site = b.defining_site,
    a.number_of_sites_reporting = b.number_of_sites_reporting,
    a."date" = b."date",
    a.created = b.created,
    a.last_updated = b.last_updated
from [STAGE].[tbl_aqi_data_2023] a inner join [STAGE].zzz_tbl_aqi_data_2023 b 
on   a."date" = b."date" and a.defining_parameter = b.defining_parameter and a.defining_site = b.defining_site
set @updated_records = (select @@ROWCOUNT)
insert into [meta].tbl_audit_log
select 'Incremental Data Update.dtsx', '[stage].[tbl_aqi_data_2023]', ?, @updated_records, getdate()

update [meta].[tbl_config_table]
set [last_updated_value] = (select max ([last_updated]) from [stage].[tbl_aqi_data_2023])
where [table_name] = '[stage].[tbl_aqi_data_2023]' and (select count (*) from [stage].[tbl_aqi_data_2023]) > 0



select * from [meta].tbl_audit_log;

select * from [stage].[tbl_aqi_data_2022] order by [date] asc;

