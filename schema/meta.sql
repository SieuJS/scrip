use AQI_WAREHOUSE; 
drop table [meta].tbl_audit_log;
drop table [meta].tbl_config_table;
go

create table [meta].tbl_audit_log(
    id int identity,
    package_name varchar(200),
    tablename varchar(200),
    records_inserted int,
    records_updated int,
    dated datetime
)

create table [meta].tbl_config_table(
    id int identity,
    table_name varchar(200),
    last_updated_value datetime
)

insert into [meta].tbl_config_table values ('[stage].[tbl_aqi_data_2021]', '1900-01-01 00:00:00.000')
insert into [meta].tbl_config_table values ('[stage].[tbl_aqi_data_2022]', '1900-01-01 00:00:00.000')
insert into [meta].tbl_config_table values ('[stage].[tbl_aqi_data_2023]', '1900-01-01 00:00:00.000')


insert into [meta].[tbl_config_table] values ('[dds].*', GETDATE())

select * from [meta].[tbl_config_table] ;