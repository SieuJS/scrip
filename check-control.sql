select * from [STAGE].tbl_audit_log;
SELECT * from [STAGE].tbl_config_table;

SELECT distinct state_code from [STAGE].[tbl_aqi_datas] order by state_code ASC;
SELECT * from [STAGE].tbl_states;

select top(100) * from [STAGE].[tbl_states] order by state_num_code desc;

select top(100) * from [STAGE].[tbl_aqi_datas] order by state_code ASC;
select * from [STAGE].tbl_states;
SELECT * from [STAGE].[tbl_config_table];
SELECT * from [STAGE].tbl_audit_log;
SELECT * from [stage].tbl_counties;

SELECT distinct ( state_code + county_code) fips , county_code, state_code from [STAGE].[tbl_aqi_datas]  ORDER BY fips ASC;
-- renew 

TRUNCATE table test ;
TRUNCATE table test1 ;
TRUNCATE table [STAGE].[zzz_tbl_aqi_datas]
TRUNCATE table [STAGE].[tbl_aqi_datas] ;
TRUNCATE table [STAGE].[tbl_states] ;
TRUNCATE table [STAGE].[tbl_counties] ;
TRUNCATE TABLE [STAGE].[tbl_audit_log];
TRUNCATE TABLE [STAGE].[tbl_config_table];

INSERT into [STAGE].tbl_config_table values ('[STAGE].[tbl_aqi_datas]', 'last_updated', '1900-01-01 00:00:00.000');
insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_states]', 'last_updated', '1900-01-01 00:00:00.000');
insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_counties]', 'last_updated', '1900-01-01 00:00:00.000');
insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_aqi]', 'last_updated', '1900-01-01 00:00:00.000');

TRUNCATE table [STAGE].[zzz_tbl_counties] ;
SELECT last_updated_value from [STAGE].[tbl_config_table] where [table_name] = '[STAGE].[tbl_counties]';

SELECT * from [STAGE].[tbl_aqi_datas] WHERE last_updated > ? ;