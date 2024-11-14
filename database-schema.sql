IF NOT EXISTS(SELECT *
FROM sys.databases
WHERE name = 'AQI_WAREHOUSE')
  BEGIN
    CREATE DATABASE [AQI_WAREHOUSE]
END
GO

USE [AQI_WAREHOUSE];
GO

CREATE SCHEMA [STAGE] AUTHORIZATION dbo;
GO

CREATE SCHEMA [NDS] AUTHORIZATION dbo;
GO

-- Create Staging Table for States
CREATE TABLE [STAGE].states
(
    state_code INT PRIMARY KEY,
    state_name NVARCHAR(50) 
);

-- Create Staging Table for Counties
CREATE TABLE [STAGE].counties
(
    county_code INT , 
    state_code INT,
    county_name NVARCHAR(50),

);

-- Create Staging Table for AQI Data
DROP TABLE [STAGE].tblAqiDatas
CREATE TABLE [STAGE].tblAqiDatas
(
    state_name NVARCHAR(100),
    county_name NVARCHAR(100),
    state_code  INT,
    county_code INT,  -- Changed
    "date" DATE,        -- Changed
    aqi INT,          -- Changed
    category NVARCHAR(50), -- Changed
    defining_parameter NVARCHAR(50), -- Changed
    defining_site NVARCHAR(50),   -- Changed
    number_of_sites_reporting INT, -- Changed
    created DATETIME,      -- Changed
    last_updated DATETIME    -- Changed
);

-- Create States Table
CREATE TABLE [NDS].states
(
    state_id INT PRIMARY KEY,
    state_name NVARCHAR(50) 
);

-- Create Counties Table
CREATE TABLE [NDS].counties
(
    county_id INT PRIMARY KEY IDENTITY(1,1),
    county_fips NVARCHAR(10) ,
    county_name NVARCHAR(50) ,
    state_id INT ,
    CONSTRAINT fk_state_county FOREIGN KEY (state_id) REFERENCES [NDS].states(state_id)
);

-- Create Sites Table
CREATE TABLE [NDS].sites
(
    site_id NVARCHAR(20) PRIMARY KEY,
    county_id INT ,
    state_id INT ,
    CONSTRAINT fk_county_site FOREIGN KEY (county_id) REFERENCES [NDS].counties(county_id),
    CONSTRAINT fk_state_site FOREIGN KEY (state_id) REFERENCES [NDS].states(state_id)
);

-- Create Parameters Table
CREATE TABLE [NDS].parameters
(
    parameter_id INT PRIMARY KEY IDENTITY(1,1),
    parameter_name NVARCHAR(20) 
);

-- Create Categories Table
CREATE TABLE [NDS].categories
(
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(20) 
);

-- Create AQI Data Table [NDS].(Fact Table)
CREATE TABLE [NDS].aqi_data
(
    aqi_id INT PRIMARY KEY IDENTITY(1,1),
    date DATE ,
    aqi_value INT ,
    category_id INT ,
    parameter_id INT ,
    site_id NVARCHAR(20) ,
    number_of_sites_reporting INT ,
    created DATETIME ,
    CONSTRAINT fk_category_aqi FOREIGN KEY (category_id) REFERENCES [NDS].categories(category_id),
    CONSTRAINT fk_parameter_aqi FOREIGN KEY (parameter_id) REFERENCES [NDS].parameters(parameter_id),
    CONSTRAINT fk_site_aqi FOREIGN KEY (site_id) REFERENCES [NDS].sites(site_id)
);
GO

CREATE TABLE ETL_Control (
    job_name NVARCHAR(100) PRIMARY KEY,
    lset DATETIME,
    cet DATETIME
);
GO


CREATE TABLE tbl_audit_log (
    id int identity,
    package_name varchar(200), 
    tablename varchar(200) ,
    records_inserted int,
    records_updated int,
    dated datetime 
);
GO 

-- create config table 
create table tbl_config_table (
    id int identity , 
    table_name varchar(200), 
    last_updated_column varchar(100) , 
    last_updated_value datetime
);

