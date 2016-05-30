--
-- Target: Microsoft SQL Server 
-- Syntax: isql /Uuser /Ppassword /Sserver -i\path\filename.sql
-- Date  : May 30 2016 15:18
-- Script Generated by Database Design Studio 2.21.3 
--

--
-- Select Database: 'db_name'
--
USE db_name
GO
 
IF DB_NAME() = 'db_name'
    RAISERROR('''db_name'' DATABASE CONTEXT NOW IN USE.',1,1)
ELSE
    RAISERROR('ERROR IN BATCH FILE, ''USE db_name'' FAILED!  KILLING THE SPID NOW.',22,127) WITH LOG
 
GO
EXECUTE SP_DBOPTION 'db_name' ,'TRUNC. LOG ON CHKPT.' ,'TRUE'
GO
--
-- Drop Table    : 'Faktura'   
--
DROP TABLE Faktura
GO
--
-- Drop Table    : 'OrdeListe'   
--
DROP TABLE OrdeListe
GO
--
-- Drop Table    : 'Forsendelse'   
--
DROP TABLE Forsendelse
GO
--
-- Drop Table    : 'Ordre'   
--
DROP TABLE Ordre
GO
--
-- Drop Table    : 'FragtMade'   
--
DROP TABLE FragtMade
GO
--
-- Drop Table    : 'Produkt'   
--
DROP TABLE Produkt
GO
--
-- Drop Table    : 'Ansat'   
--
DROP TABLE Ansat
GO
--
-- Drop Table    : 'Kunde'   
--
DROP TABLE Kunde
GO
--
-- Drop Table    : 'BetalingMade'   
--
DROP TABLE BetalingMade
GO