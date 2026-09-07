/*
================================================================
create database and schemas
================================================================
Script purpose;
	this script creates a new database named 'DataWarehouse'after 
	checking if it already exists.if the database exists, it is 
	dropped and recreated. additionally, the script sets up three
	schemas wit hin the database:'bronze','silver',and 'gold'.
*/
USE master;
go

--drop and recreate the 'datawarehouse' database--
if exists(select 1 from sys.databases where name = 'datawarehouse')
begin
 alter database datawarehouse set single user with rollback immedate;
 drop database datawarehouse;
end;
go

--create the 'datawarehouse' database--
create database datawarehouse;
go

use datawarehouse;
go

--create schemas--
create schema bronze;
go

create schema silver;
go

create schema gold;
go
