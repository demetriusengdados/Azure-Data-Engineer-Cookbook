 SELECT '[' + sch.[name] + '].[' + t.[name] + '];' AS table_name, c.[state] , p.[distribution_policy_desc] 
      FROM sys.tables t  
      JOIN sys.pdw_replicated_table_cache_state c  
        ON c.object_id = t.object_id 
      JOIN sys.pdw_table_distribution_properties p 
        ON p.object_id = t.object_id 
      JOIN sys.schemas sch
        ON t.schema_id = sch.schema_id
    WHERE p.[distribution_policy_desc] = 'REPLICATE'
    ORDER BY c.[state], table_name
