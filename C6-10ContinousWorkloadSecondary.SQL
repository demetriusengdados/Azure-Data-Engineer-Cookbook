While 1=1
Begin
Select * from sys.objects; 
WAITFOR DELAY '0:00:01'
END
