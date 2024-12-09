select * from [meta].tbl_config_table;


select * from [nds].[tbl_states];
Select id from [nds].[tbl_sources] where source_name = 'AQI 2022';

select * from [nds].tbl_counties;

select * from test;

select * from [nds].[tbl_aqi]

update [meta].[tbl_config_table] set [last_updated_value] = ? where [table_name] = '[dds].*'  ;