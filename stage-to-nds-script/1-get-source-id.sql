-- update [nds].[tbl_sources] set last_updated = (select * from [meta].tbl_audit_log where tablename = '[stage].[tbl_aqi_data_2021]') where id = 1 ;
use AQI_WAREHOUSE
go
select * from [nds].[tbl_sources] ;
