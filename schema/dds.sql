drop table [dds].fact_aqi;
drop table [dds].dim_date;
drop table [dds].dim_counties;
drop table [dds].dim_states;
drop table [dds].dim_sources;
GO

create table [dds].dim_sources (
    source_id int primary key,
    source_name nvarchar(100),
    created datetime,
    last_updated datetime
);
GO

create table [dds].dim_states (
    state_id int primary key,
    state_alpha_code varchar(2),
    state_number_code varchar(2),
    state_name nvarchar(100),
    created datetime,
    last_updated datetime
);
GO
create table [dds].dim_counties (
    county_id int primary key,
    county_code varchar(3),
    county_name nvarchar(100),
    county_fips_code varchar(5),
    state_id int foreign key references [dds].dim_states(state_id),
    created datetime,
    last_updated datetime,
    unique (county_code, state_id)
);
GO
create table [dds].dim_date (
    date_id int primary key identity(1,1),
    calendar_date date,
    year int,
    quarter int,
    month int,
    day int,
    is_daylight_saving bit
);
Go

create table [dds].fact_aqi (
    aqi_id int primary key identity(1,1),
    date_id int foreign key references [dds].dim_date(date_id),
    state_id int foreign key references [dds].dim_states(state_id),
    county_id int foreign key references [dds].dim_counties(county_id),
    aqi int,
    category nvarchar(50),
    defining_parameter nvarchar(50),
    defining_site nvarchar(50),
    number_of_sites_reporting int,
    source_id int foreign key references [dds].dim_sources(source_id),
    created datetime,
    last_updated datetime
);
GO