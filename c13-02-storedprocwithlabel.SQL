CREATE PROC [dbo].[get_transactiontable_df] AS

Select * from dbo.transactiontable
Option (LABEL = 'ADF: SQLtoParquet - Dataflow')
