# Murach - SQL Server notes

## Chapter 1 

This is an overview of all the topics that will be covered in more detail. Instructors should NOT spend too much time or covering any topic tset IDENTITY_INSERT TermsCopy on;

insert into TermsCopy (TermsId, TermsDescription, TermsDueDays)
    select TermsId, TermsDescription, TermsDueDays from Terms;

set IDENTITY_INSERT TermsCopy off;o deeply.

## Chapter 2 - SSMS

There are databases provided. The scripts are all in C:\Murach\Sql Server 2019\Databases

Double click on the AP script to load it into SSMS then execute it.

The SQL language is case INSENSITIVE.

Explain to students how to navigate the Object Explorer by expanding the subcategoris

Skip DETACHING A DATABASE, BACKUP, COMPATIBILITY LEVEL

Creating a database diagram by adding all the tables then SSMS will format the diagram.

## Chapter 3 - SELECT syntax

## Chapter 4 - Inner & Outer Join Views

## Chapter 5 - Group by and Having

## Chapter 6 - Subqueries

## Chapter 7 - Insert, Update, Delete

### Create duplicate table

```
-- Script Create

set IDENTITY_INSERT TermsCopy on;

insert into TermsCopy (TermsId, TermsDescription, TermsDueDays)
    select TermsId, TermsDescription, TermsDueDays from Terms;

set IDENTITY_INSERT TermsCopy off;
```