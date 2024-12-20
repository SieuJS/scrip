drop table [dds].tbl_dim_sources;
go
drop table [dds].tbl_fact_aqi;
go
drop table [dds].tbl_dim_date;
drop table [dds].tbl_dim_counties;
go
drop table [dds].tbl_dim_states;
go



drop table [dds].zzz_tbl_dim_states;
drop table [dds].zzz_tbl_dim_counties; 
drop table [dds].zzz_tbl_dim_fact_aqi
GO

create table [dds].tbl_dim_sources (
    source_id int primary key,
    source_name nvarchar(100),
    created datetime,
    last_updated datetime
);
GO

create table [dds].tbl_dim_states (
    state_id int primary key,
    state_alpha_code varchar(2),
    state_number_code varchar(2),
    state_name nvarchar(100),
    created datetime,
    last_updated datetime
);
GO
create table [dds].tbl_dim_counties (
    county_id int primary key,
    county_code varchar(3),
    county_name nvarchar(100),
    county_fips_code varchar(5),
    state_id int foreign key references [dds].tbl_dim_states(state_id),
    lng decimal(9,6),
    lat decimal(9,6),
    [population] int,
    created datetime,
    last_updated datetime,
    unique (county_code, state_id)
);
GO
create table [dds].tbl_dim_date (
    date_id int primary key identity(1,1),
    calendar_date date,
    year int,
    quarter int,
    month int,
    day int,
    is_daylight_saving bit
);
Go

create table [dds].tbl_fact_aqi (
    aqi_id int primary key identity(1,1),
    date_id int foreign key references [dds].tbl_dim_date(date_id),
    state_id int foreign key references [dds].tbl_dim_states(state_id),
    county_id int foreign key references [dds].tbl_dim_counties(county_id),
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    source_id int ,
    created datetime,
    last_updated datetime
);
GO

create table [dds].zzz_tbl_dim_states (
    state_id int PRIMARY key ,
    state_alpha_code varchar(2),
    state_number_code varchar(2),
    state_name nvarchar(100),
    created datetime,
    last_updated datetime
);
go 

create table [dds].zzz_tbl_dim_counties (
    county_id int primary key,
    county_code varchar(3),
    county_name nvarchar(100),
    county_fips_code varchar(5),
    state_id int ,
    lng decimal(9,6),
    lat decimal(9,6),
    [population] int,
    created datetime,
    last_updated datetime,
    unique (county_code, state_id)
)
GO


create table [dds].zzz_tbl_dim_fact_aqi (
    aqi_id int primary key,
    date_id int ,
    state_id int,
    county_id int ,
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    source_id int,
    created datetime,
    last_updated datetime
)
go


