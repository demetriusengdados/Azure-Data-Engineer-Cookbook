New-Item -Path c:\temp -ItemType directory
cd c:\temp
Invoke-WebRequest "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2019.bak"  -OutFile "AdventureWorksLT2019.bak"
