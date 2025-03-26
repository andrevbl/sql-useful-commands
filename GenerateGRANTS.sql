SELECT 'GRANT SELECT ON ' + name + ' TO YOUR_DATABASE' FROM sysobjects WHERE xtype IN ('V', 'TF', 'IF')
SELECT 'GRANT EXEC ON ' + name + ' TO YOUR_DATABASE' FROM sysobjects WHERE xtype IN ('P', 'FN') AND name NOT LIKE '%\_%' ESCAPE '\'
