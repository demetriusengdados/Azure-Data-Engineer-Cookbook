# Azure Data Engineering Cookbook	2nd-edition
<a href="https://www.packtpub.com/product/azure-data-engineering-cookbook-second-edition/9781803246789"><img src="https://static.packt-cdn.com/products/9781803246789/cover/smaller" alt="Azure Data Engineering Cookbook" height="256px" align="right"></a>

This is the code repository for [Azure Data Engineering Cookbook](https://www.packtpub.com/product/azure-data-engineering-cookbook-second-edition/9781803246789), published by Packt.

**Get well versed in various data engineering techniques in Azure using this recipe-based guide**

## What is this book about?
The famous quote 'Data is the new oil' seems more true every day as the key to most organizations' long-term success lies in extracting insights from raw data. One of the major challenges organizations face in leveraging value out of data is building performant data engineering pipelines for data visualization, ingestion, storage, and processing. This second edition of the immensely successful book by Ahmad Osama brings to you several recent enhancements in Azure data engineering and shares approximately 80 useful recipes covering common scenarios in building data engineering pipelines in Microsoft Azure.

You’ll explore recipes from Azure Synapse Analytics workspaces Gen 2 and get to grips with Synapse Spark pools, SQL Serverless pools, Synapse integration pipelines, and Synapse data flows. You’ll also understand Synapse SQL Pool optimization techniques in this second edition. Besides Synapse enhancements, you’ll discover helpful tips on managing Azure SQL Database and learn about security, high availability, and performance monitoring. Finally, the book takes you through overall data engineering pipeline management, focusing on monitoring using Log Analytics and tracking data lineage using Azure Purview.

By the end of this book, you’ll be able to build superior data engineering pipelines along with having an invaluable go-to guide.

This book covers the following exciting features: 
* Process data using Azure Databricks and Azure Synapse Analytics
* Perform data transformation using Azure Synapse data flows
* Perform common administrative tasks in Azure SQL Database
* Build effective Synapse SQL pools which can be consumed by Power BI
* Monitor Synapse SQL and Spark pools using Log Analytics
* Track data lineage using Microsoft Purview integration with pipelines	

If you feel this book is for you, get your [copy](https://www.amazon.in/Azure-Data-Engineering-Cookbook-recipe-based/dp/1803246782) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations
All of the code is organized into folders.

The code will look like the following:
```
CREATE TABLE dbo.transaction_tbl WITH (DISTRIBUTION = ROUND_
ROBIN)
AS
Select * from dbo.ext_transaction_tbl;
GO
Select TOP 100 * from dbo.transaction_tbl
GO
```
Any command-line input or output is written as follows:
```
Connect-AzAccount
```
**Following is what you need for this book:**
This book is for data engineers, data architects, database administrators, and data professionals who want to get well versed with the Azure data services for building data pipelines. Basic understanding of cloud and data engineering concepts will help in getting the most out of this book.	

With the following software and hardware list you can run all code files present in the book (Chapter 1-13).

### Software and Hardware List

| Chapter  | Software required                                                                    | OS required                        |
| -------- | -------------------------------------------------------------------------------------| -----------------------------------|
|  	1-13 | Azure subscription                    							                                  | Windows 10 or above|
|   1-13     | Powershell 7 or above with Azure PowerShell installed 		                            |
|   1-13       | SQL Server Management Studio installed                                               |
|   1-13       | Power BI Desktop installed                                                           |

We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://packt.link/CJshA).


### Related products <Other books you may enjoy>
* Data Engineering with Alteryx [[Packt]](https://www.packtpub.com/product/data-engineering-with-alteryx/9781803236483?_ga=2.55284649.323560873.1662352858-1347501151.1654864057) [[Amazon]](https://www.amazon.in/Data-Engineering-Alteryx-engineers-practices/dp/1803236485/ref=sr_1_1?crid=2KS4L5ZF89W5M&keywords=Data+Engineering+with+Alteryx&qid=1662354402&s=books&sprefix=data+engineering+with+alteryx%2Cstripbooks%2C197&sr=1-1)

* Simplifying Data Engineering and Analytics with Delta
 [[Packt]](https://www.packtpub.com/product/simplifying-data-engineering-and-analytics-with-delta/9781801814867?_ga=2.87293850.323560873.1662352858-1347501151.1654864057) [[Amazon]](https://www.amazon.in/Simplifying-Data-Engineering-Analytics-Delta/dp/1801814864/ref=sr_1_1_sspa?crid=3IA7LP4MAIZJ6&keywords=Simplifying+Data+Engineering+and+Analytics+with+Delta&qid=1662354526&s=books&sprefix=simplifying+data+engineering+and+analytics+with+delta%2Cstripbooks%2C247&sr=1-1-spons&psc=1)

## Get to Know the Author(s)
**Nagaraj Venkatesan** 	 works as a cloud solution architect at Microsoft. At Microsoft, he works with some of the largest companies in the world, solving their complex data engineering problems and helping them build effective solutions using cutting-edge technologies based on Azure. Nagaraj, based out of Singapore, is a popular member of the data and AI community and is a regular speaker at several international data and AI conferences. He is a two-time Microsoft Most Valuable Professional (MVP) award winner, in 2016 and 2017. Nagaraj shares his technical expertise through his blog and on his YouTube channel called DataChannel. He also holds a master’s degree in computing from the National University of Singapore.

**Ahmad Osama**  works for Pitney Bowes Pvt. Ltd. as a technical architect and is a former Microsoft Data Platform MVP. In his day job, he works on developing and maintaining high performant, on-premises and cloud SQL Server OLTP environments as well as deployment and automating tasks using PowerShell. When not working, Ahmad blogs at DataPlatformLabs and can be found glued to his Xbox.


