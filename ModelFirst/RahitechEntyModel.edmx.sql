
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/21/2023 09:59:07
-- Generated from EDMX file: F:\MVC\ModelFirst\ModelFirst\RahitechEntyModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RahitechMF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Companies'
CREATE TABLE [dbo].[Companies] (
    [ComId] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(max)  NOT NULL,
    [CompanyAddress] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [EmpId] int IDENTITY(1,1) NOT NULL,
    [EmpName] nvarchar(max)  NOT NULL,
    [Position] nvarchar(max)  NOT NULL,
    [ComId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ComId] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [PK_Companies]
    PRIMARY KEY CLUSTERED ([ComId] ASC);
GO

-- Creating primary key on [EmpId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([EmpId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ComId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_CompanyEmployee]
    FOREIGN KEY ([ComId])
    REFERENCES [dbo].[Companies]
        ([ComId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyEmployee'
CREATE INDEX [IX_FK_CompanyEmployee]
ON [dbo].[Employees]
    ([ComId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------