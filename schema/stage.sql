use AQI_WAREHOUSE; 
drop table [stage].tbl_aqi_data_2021;
drop table [stage].tbl_aqi_data_2022;
drop table [stage].tbl_aqi_data_2023;
drop table [stage].zzz_tbl_aqi_data_2021;
drop table [stage].zzz_tbl_aqi_data_2022;
drop table [stage].zzz_tbl_aqi_data_2023;
go

create table [stage].tbl_aqi_data_2021 (
    state_name nvarchar(100),
    county_name nvarchar(100),
    state_code varchar(2),
    county_code varchar(3),
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    created datetime,
    last_updated datetime
)

create table [stage].tbl_aqi_data_2022 (
    state_name nvarchar(100),
    county_name nvarchar(100),
    state_code varchar(2),
    county_code varchar(3),
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    created datetime,
    last_updated datetime
)

create table [stage].tbl_aqi_data_2023 (
    state_name nvarchar(100),
    county_name nvarchar(100),
    state_code varchar(2),
    county_code varchar(3),
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    created datetime,
    last_updated datetime
)



create table [stage].zzz_tbl_aqi_data_2021 (
    state_name nvarchar(100),
    county_name nvarchar(100),
    state_code varchar(2),
    county_code varchar(3),
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    created datetime,
    last_updated datetime
)

create table [stage].zzz_tbl_aqi_data_2022 (
    state_name nvarchar(100),
    county_name nvarchar(100),
    state_code varchar(2),
    county_code varchar(3),
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    created datetime,
    last_updated datetime
)

create table [stage].zzz_tbl_aqi_data_2023 (
    state_name nvarchar(100),
    county_name nvarchar(100),
    state_code varchar(2),
    county_code varchar(3),
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    created datetime,
    last_updated datetime
);



