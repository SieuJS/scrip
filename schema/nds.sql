use AQI_WAREHOUSE;
drop table [nds].tbl_sources;
go
drop table [nds].tbl_states;
go
drop TABLE [nds].tbl_counties;
go
drop table [nds].tbl_aqi;
GO
drop table [nds].zzz_tbl_states;
go 
drop table [nds].zzz_tbl_counties;
go 
drop table [nds].zzz_tbl_aqi;
go

create table [nds].tbl_sources (
    id int primary key identity(1,1),
    source_name nvarchar(100),
    created datetime,
    last_updated datetime
)

create table [nds].tbl_states (
    id int primary key identity(1,1),
    state_alpha_code varchar(2),
    state_number_code varchar(2),
    state_name nvarchar(100),
    source_id int,
    created datetime default getdate(),
    last_updated datetime default getdate() 
)

create table [nds].tbl_counties (
    id int primary key identity(1,1),
    county_code varchar(3),
    county_name nvarchar(100),
    county_fips_code varchar(5),
    state_id int,
    source_id int,
    lng Decimal(9,6),
    lat Decimal(9,6),
    [population] int,
    created datetime default getdate(),
    last_updated datetime default getdate() 
    constraint unique_county unique (county_code, state_id)
)

create table [nds].tbl_aqi (
    id int identity(1,1),
    state_id int,
    county_id int,
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    source_id int,
    created datetime default getdate(),
    last_updated datetime default getdate(),
)

create table [nds].zzz_tbl_states (
    state_alpha_code varchar(2),
    state_number_code varchar(2),
    state_name nvarchar(100),
    source_id int,
    created datetime default getdate(),
    last_updated datetime default getdate() 
)

create table [nds].zzz_tbl_counties(
    county_code varchar(3),
    county_name nvarchar(100),
    state_id int,
    source_id int,
    county_fips_code varchar(5),
    lng Decimal(9,6),
    lat Decimal(9,6),
    [population] int,
    created datetime default getdate(),
    last_updated datetime default getdate() 
)

create table [nds].zzz_tbl_aqi (
    state_id int,
    county_id int,
    "date" date,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    source_id int,
    created datetime default getdate(),
    last_updated datetime default getdate()
)

go

insert into [nds].tbl_sources ( source_name, created, last_updated) values ( 'AQI 2021', getdate(), getdate())
insert into [nds].tbl_sources ( source_name, created, last_updated) values ( 'AQI 2022', getdate(), getdate())
insert into [nds].tbl_sources ( source_name, created, last_updated) values ( 'AQI 2023', getdate(), getdate())

Select id from [nds].[tbl_sources] where source_name = 'AQI 2021';

select * from [nds].tbl_sources;


select * from [nds].tbl_states;
select * from [nds].tbl_counties;
SELECT  distinct ( state_code + county_code) fips , state_code, county_code, county_name, created, last_updated  from [stage].[tbl_aqi_data_2022]
select * from [stage].tbl_aqi_data_2021;