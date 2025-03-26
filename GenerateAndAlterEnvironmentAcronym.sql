--In these examples we are generating the script of objects but changing "DBPRD" to "DBDEV" inside the SQL text of that object
--Need to do this configuration: Tools > Options > Query Results > SQL Server > Results to Text > Maximum number of characters displayed in each column

SELECT REPLACE(REPLACE(m.definition, N'DBPRD', N'DBDEV'), N'CREATE PROC', N'ALTER PROC') + CHAR(13) + CHAR(10) + N'GO'
FROM sys.sql_modules AS m
INNER JOIN sys.procedures AS p ON m.[object_id] = p.[object_id]
WHERE LEN(m.definition) <= 4000 AND m.definition LIKE '%DBPRD%'
ORDER BY p.name;

SELECT REPLACE(REPLACE(m.definition, N'DBPRD', N'DBDEV'), N'CREATE VIEW', N'ALTER VIEW') + CHAR(13) + CHAR(10) + N'GO'
FROM sys.sql_modules AS m
INNER JOIN sys.views AS v ON v.[object_id] = m.[object_id]
WHERE LEN(m.definition) <= 4000 AND m.definition LIKE '%DBPRD%'
ORDER BY v.name;

SELECT REPLACE(REPLACE(m.definition, N'DBPRD', N'DBDEV'), N'CREATE FUNCTION', N'ALTER FUNCTION') + CHAR(13) + CHAR(10) + N'GO'
FROM sys.sql_modules AS m
INNER JOIN sys.objects AS o ON o.[object_id] = m.[object_id]
WHERE LEN(m.definition) <= 4000 AND m.definition LIKE '%DBPRD%' AND o.type IN ('FN', 'IF', 'TF')
ORDER BY o.name;
