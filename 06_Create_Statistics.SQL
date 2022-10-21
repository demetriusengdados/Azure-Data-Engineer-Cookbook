CREATE STATISTICS ext_transaction_tbl_pid on ext_transaction_tbl(pid)
GO
DBCC SHOW_STATISTICS(ext_transaction_tbl,ext_transaction_tbl_pid)
GO
