/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

-- CREATE DATAWAREHOUSE DATABASE and ALL SCHEMAS
USE master;
GO

-- DROP and Recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	/*
	Use Case - Forces the Datawarehouse database into single-user mode and immediately kicks out all other connections,
			   rolling back any in-progress transactions.
			   ** This can cause data loss if users have uncommitted work. It should usually be done during maintenance windows.

	Switching Command - ALTER DATABASE Datawarehouse SET MULTI_USER;
	*/
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- After dropping previous one, create the database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- CREATE BRONZE, SILVER, GOLD SCHEMAS 
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
