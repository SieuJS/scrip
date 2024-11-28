-- Drop the database if it exists
USE "master"

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'AQI_WAREHOUSE')
BEGIN
    ALTER DATABASE [AQI_WAREHOUSE] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [AQI_WAREHOUSE];
END
GO

-- Create the database
CREATE DATABASE [AQI_WAREHOUSE];
GO

-- Use the database
USE [AQI_WAREHOUSE];
GO

-- Create schemas
CREATE SCHEMA [STAGE];
GO
CREATE SCHEMA [NDS];
GO

-- Create Staging Tables

CREATE TABLE [STAGE].tbl_aqi_datas
(
    state_name NVARCHAR(100),
    county_name NVARCHAR(100),
    state_code  VARCHAR(2),
    county_code VARCHAR(3),  -- Changed
    "date" DATE,        -- Changed
    aqi INT,          -- Changed
    category NVARCHAR(50), -- Changed
    defining_parameter NVARCHAR(50), -- Changed
    defining_site NVARCHAR(50),   -- Changed
    number_of_sites_reporting INT, -- Changed
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
);

CREATE TABLE [STAGE].zzz_tbl_aqi_datas
(
    state_name NVARCHAR(100),
    county_name NVARCHAR(100),
    state_code  VARCHAR(2),
    county_code VARCHAR(3),  -- Changed
    "date" DATE,        -- Changed
    aqi INT,          -- Changed
    category NVARCHAR(50), -- Changed
    defining_parameter NVARCHAR(50), -- Changed
    defining_site NVARCHAR(50),   -- Changed
    number_of_sites_reporting INT, -- Changed
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
);
GO

CREATE TABLE [STAGE].tbl_audit_log (
    id int identity,
    package_name varchar(200), 
    tablename varchar(200) ,
    records_inserted int,
    records_updated int,
    dated datetime 
);
GO 

-- create config table 
create table [STAGE].tbl_config_table (
    id int identity , 
    table_name varchar(200), 
    last_updated_column varchar(100) , 
    last_updated_value datetime
);
GO

insert into [STAGE].[tbl_config_table] values ('[STAGE].[tbl_aqi_datas]', 'last_updated', '1900-01-01 00:00:00.000');

