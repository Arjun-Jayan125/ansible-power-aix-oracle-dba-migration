MERGE INTO oracle_sql_oracledb_test target
USING (
  SELECT 1 AS id, 'oracledb migration test' AS test_value
  FROM dual
) source
ON (target.id = source.id)
WHEN MATCHED THEN
  UPDATE SET target.test_value = source.test_value
WHEN NOT MATCHED THEN
  INSERT (id, test_value)
  VALUES (source.id, source.test_value);
