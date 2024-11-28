use AQI_WAREHOUSE;
GO 

CREATE TABLE [STAGE].tbl_states
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    state_name NVARCHAR(100),
    state_num_code  NVARCHAR(2) , 
    state_string_code NVARCHAR(2) ,
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)

CREATE TABLE [STAGE].tbl_counties
(
    "id" int PRIMARY KEY IDENTITY(1,1) ,
    state_id INT,
    county_name NVARCHAR(100),
    county_code NVARCHAR(3) , 
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
)

CREATE TABLE [STAGE].tbl_aqi_datas
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