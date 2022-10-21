try:
    database_name = "lake_db"
    tables = spark.sql(f"SHOW TABLES FROM `{database_name}`").select("tableName").collect()
    tables = [(row.tableName) for row in tables]
    for table_name in tables:
        spark.sql(f"OPTIMIZE `{database_name}`.`{table_name}`")   
        spark.sql(f"VACUUM `{database_name}`.`{table_name}` RETAIN 720 HOURS")
except Exception as ex:
    raise Exception(f"error:`{str(ex)}`")
