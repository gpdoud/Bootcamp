# EntityFrameworkCore Powershell Commands

## Add-Migration

Adds a new migration

Example: `add-migration 'initialization'`

| Parms | Type | Positional | Notes |
| ----- | ---- | ---------- | ----- |
| -Name | string | Yes | The name of the Migration |
| -OutputDir | string | - | Defaults to 'Migrations' |

## Drop-Database

Drops the database

Example: `drop-migration`

| Parms | Type | Positional | Notes |
| ----- | ---- | ---------- | ----- |
| -WhatIf | - | - | Shows what would be done but doesn't do it. |

## Get-DbContext

Gets information about the AppDbContext

Example: `get-dbcontext {-Force}`

## Remove-Migration

Deletes the last migration and rolls back the database.

Example: `remove-migration`

| Parms | Type | Positional | Notes |
| ----- | ---- | ---------- | ----- |
| -Force | - | - | Reverts the migration and rolls back the database |

## Scaffold-DbContext

Generates an AppDbContext from an existing database. Note: tables must have primary keys

Example: `scaffold-dbcontext "server=localhost\sqlexpress;database=AppDb;trusted_connection=true;" Microsoft.EntityFrameworkCore.SqlServer {-OutputDir Models} {-ContextDir Models} {-Context AppDbContext} {-Tables "user", "address"}`

| Parms | Type | Positional | Notes |
| ----- | ---- | ---------- | ----- |
| -Connection | string | Yes | Normal connection string |
| -Provider | string | Yes | Microsoft.EntityFrameworkCore.SqlServer |
| -OutputDir | string | - | Directory for created classes (i.e. Models) |
| -ContextDir | string | - | Directory for AppDbContext file (i.e. Models) |
| -Context | string | - | Name of the AppDbContext class |
| -Schemas | string[] | - | Array of schema names. Defaults to all. |
| -Tables | string[] | - | Array of table names. Defaults to all |
| -DataAnnotations | - | - | User attributes where possible |
| -UseDatabaseNames | - | - | User exact names from database tables |
| -Force | - | - | Overright existing files |

## Script-Migration

Creates a SQL script to effect the migration

Example: `script-migration {-From init} {-To lastMigration} {-Output migration.sql}`

| Parms | Type | Positional | Notes |
| ----- | ---- | ---------- | ----- |
| -From | string | - | The first migration to include in the script |
| -To | string | - | The last migration to include in the script |
| -Idempotent | - | - | Creates script that can be run irrespective of current migration |
| -Output | string | - | Output file to write script to |

## Update-Database

Creates a SQL script to effect the migration

Example: `update-migration {-Migration 0 | aMigration}`

| Parms | Type | Positional | Notes |
| ----- | ---- | ---------- | ----- |
| -Migration | string | - | Update the database up to this migration. Zero (0) means before 1st migration |
