use AQI_WAREHOUSE;
GO 

DROP TABLE IF EXISTS [STAGE].tbl_states; 
DROP TABLE IF EXISTS [STAGE].zzz_tbl_states;

CREATE TABLE [STAGE].tbl_states
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    state_name NVARCHAR(100),
    state_num_code  VARCHAR(2) , 
    state_string_code VARCHAR(2) ,
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)
GO

CREATE TABLE [STAGE].zzz_tbl_states
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    state_name NVARCHAR(100),
    state_num_code  VARCHAR(2) ,
    state_string_code VARCHAR(2) ,
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)
GO

DROP TABLE IF EXISTS [STAGE].tbl_counties;
DROP TABLE IF EXISTS [STAGE].zzz_tbl_counties;

CREATE TABLE [STAGE].tbl_counties
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    state_id INT,
    county_name NVARCHAR(100),
    county_code VARCHAR(3) , 
    fips VARCHAR(5),
    lat DECIMAL(9,6),
    lng DECIMAL(9,6),
    population BIGINT,
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)
GO

create table [STAGE].zzz_tbl_counties
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    state_id INT,
    county_name NVARCHAR(100),
    county_code VARCHAR(3) , 
    fips VARCHAR(5),
    lat DECIMAL(9,6),
    lng DECIMAL(9,6),
    population BIGINT,
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)

CREATE TABLE [STAGE].tbl_aqi
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    county_id INT,
    "date" DATE,        -- Changed
    aqi INT,          -- Changed
    category NVARCHAR(50), -- Changed
    defining_parameter NVARCHAR(50), -- Changed
    defining_site NVARCHAR(50),   -- Changed
    number_of_sites_reporting INT, -- Changed
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)
GO

CREATE TABLE [STAGE].zzz_tbl_aqi
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    county_id INT,
    "date" DATE,        -- Changed
    aqi INT,          -- Changed
    category NVARCHAR(50), -- Changed
    defining_parameter NVARCHAR(50), -- Changed
    defining_site NVARCHAR(50),   -- Changed
    number_of_sites_reporting INT, -- Changed
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)
GO

insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_states]', 'last_updated', '1900-01-01 00:00:00.000');
insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_counties]', 'last_updated', '1900-01-01 00:00:00.000');
insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_aqi]', 'last_updated', '1900-01-01 00:00:00.000');