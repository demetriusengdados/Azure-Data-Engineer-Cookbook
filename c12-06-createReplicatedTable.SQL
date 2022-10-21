Create table dbo.supplier WITH ( DISTRIBUTION = REPLICATE)
 AS
 Select distinct sid
[sid],
'S' + '-' + convert(varchar(2),sid)  as supplier_name
 FROM [dbo].[transaction_tbl_t1]
