select MAX(last_updated_value) from [meta].[tbl_config_table] where table_name = '[dim].[tbl_dim_states]';
select MAX(last_updated_value) from [meta].[tbl_config_table] where table_name = '[dim].[tbl_dim_counties]';
select MAX(last_updated_value) from [meta].[tbl_config_table] where table_name = '[dim].[tbl_dim_sources]';
select MAX(last_updated_value) from [meta].[tbl_config_table] where table_name = '[dim].[tbl_dim_date]';
select MAX(last_updated_value) from [meta].[tbl_config_table] where table_name = '[dim].[tbl_fact_aqi]';
