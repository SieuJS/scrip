TRUNCATE table [STAGE].tblAqiDatas ;

SELEct * from [STAGE].tblAqiDatas where defining_site = '02-013-0002' ORDER BY state_code, county_code, "date", defining_site, created, last_updated


SELECT * from [STAGE].tbl_audit_log;

SELECT * from [STAGE].tbl_config_table;