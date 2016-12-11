
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/29/2016 17:39:40
-- Generated from EDMX file: C:\Users\mnage\Documents\Visual Studio 2013\Projects\ProductFinderService\ProductFinderService\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SPXFlow];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_IndustrySubIndustry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubIndustries] DROP CONSTRAINT [FK_IndustrySubIndustry];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductImage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_ProductImage];
GO
IF OBJECT_ID(N'[dbo].[FK_IndustryProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_IndustryProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_CategorysubCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[subCategories] DROP CONSTRAINT [FK_CategorysubCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_CategoryProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_BrandProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_BrandProduct];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Industries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Industries];
GO
IF OBJECT_ID(N'[dbo].[SubIndustries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubIndustries];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Keywords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Keywords];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Images]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Images];
GO
IF OBJECT_ID(N'[dbo].[subCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[subCategories];
GO
IF OBJECT_ID(N'[dbo].[Brands]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Brands];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Industries'
CREATE TABLE [dbo].[Industries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IndustryName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SubIndustries'
CREATE TABLE [dbo].[SubIndustries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [IndustryId] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Keywords'
CREATE TABLE [dbo].[Keywords] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Word] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DisplayName] nvarchar(max)  NOT NULL,
    [RevisionDate] datetime  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [ListOrderOverride] int  NOT NULL,
    [ShortDescription] nvarchar(max)  NOT NULL,
    [IndustryId] int  NOT NULL,
    [CategoryId] int  NOT NULL,
    [BrandId] int  NOT NULL
);
GO

-- Creating table 'Images'
CREATE TABLE [dbo].[Images] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ImageURI] nvarchar(max)  NOT NULL,
    [ProductId] int  NOT NULL
);
GO

-- Creating table 'subCategories'
CREATE TABLE [dbo].[subCategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'Brands'
CREATE TABLE [dbo].[Brands] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Stars] int  NOT NULL,
    [Comments] nvarchar(max)  NOT NULL,
    [ProductId] int  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Industries'
ALTER TABLE [dbo].[Industries]
ADD CONSTRAINT [PK_Industries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubIndustries'
ALTER TABLE [dbo].[SubIndustries]
ADD CONSTRAINT [PK_SubIndustries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Keywords'
ALTER TABLE [dbo].[Keywords]
ADD CONSTRAINT [PK_Keywords]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [PK_Images]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'subCategories'
ALTER TABLE [dbo].[subCategories]
ADD CONSTRAINT [PK_subCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Brands'
ALTER TABLE [dbo].[Brands]
ADD CONSTRAINT [PK_Brands]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IndustryId] in table 'SubIndustries'
ALTER TABLE [dbo].[SubIndustries]
ADD CONSTRAINT [FK_IndustrySubIndustry]
    FOREIGN KEY ([IndustryId])
    REFERENCES [dbo].[Industries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_IndustrySubIndustry'
CREATE INDEX [IX_FK_IndustrySubIndustry]
ON [dbo].[SubIndustries]
    ([IndustryId]);
GO

-- Creating foreign key on [ProductId] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [FK_ProductImage]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductImage'
CREATE INDEX [IX_FK_ProductImage]
ON [dbo].[Images]
    ([ProductId]);
GO

-- Creating foreign key on [IndustryId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_IndustryProduct]
    FOREIGN KEY ([IndustryId])
    REFERENCES [dbo].[Industries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_IndustryProduct'
CREATE INDEX [IX_FK_IndustryProduct]
ON [dbo].[Products]
    ([IndustryId]);
GO

-- Creating foreign key on [CategoryId] in table 'subCategories'
ALTER TABLE [dbo].[subCategories]
ADD CONSTRAINT [FK_CategorysubCategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategorysubCategory'
CREATE INDEX [IX_FK_CategorysubCategory]
ON [dbo].[subCategories]
    ([CategoryId]);
GO

-- Creating foreign key on [CategoryId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_CategoryProduct]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryProduct'
CREATE INDEX [IX_FK_CategoryProduct]
ON [dbo].[Products]
    ([CategoryId]);
GO

-- Creating foreign key on [BrandId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_BrandProduct]
    FOREIGN KEY ([BrandId])
    REFERENCES [dbo].[Brands]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BrandProduct'
CREATE INDEX [IX_FK_BrandProduct]
ON [dbo].[Products]
    ([BrandId]);
GO

-- Creating foreign key on [ProductId] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_ProductReview]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductReview'
CREATE INDEX [IX_FK_ProductReview]
ON [dbo].[Reviews]
    ([ProductId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------