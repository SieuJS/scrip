Select last_updated_value from [STAGE].[tbl_config_table] where [table_name] = '[STAGE].[tbl_aqi_datas]';

TRUNCATE table [STAGE].[tbl_states] ;
SELECT last_updated_value from [STAGE].[tbl_config_table] where [table_name] = '[STAGE].[tbl_states]';

SELECT * from [STAGE].[tbl_states] WHERE last_updated > ? ;

TRUNCATE table [STAGE].[tbl_counties] ;
SELECT last_updated_value from [STAGE].[tbl_config_table] where [table_name] = '[STAGE].[tbl_counties]';

TRUNCATE table [STAGE].[tbl_aqi] ;
SELECT last_updated_value from [STAGE].[tbl_config_table] where [table_name] = '[STAGE].[tbl_aqi]';