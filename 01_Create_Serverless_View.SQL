CREATE DATABASE serverless
GO
USE serverless
GO
CREATE VIEW covid AS
SELECT
   *
FROM
    OPENROWSET(
        BULK 'https://packatadesynapse.dfs.core.windows.net/synapse/CSV/covid-data.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
, HEADER_ROW = TRUE
    ) AS [result]


