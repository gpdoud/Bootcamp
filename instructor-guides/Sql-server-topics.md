# SQL Server Topics

* NULL - absence of value
    * default for all columns
    * test for : is null, is not null

* WHERE operators
    * equal, not equal : =, !=, <>
    * LT, GT : <, >
    * not LT, GT : !<, !>
    * in (..)
    * like : % _ ; like ('%AB_')
    * boolean : and, or, not
    * between : between a and b (inclusive)

* Comments
    * to end of line : //
    * all in between : /* .. */

* DML
    * delete (DML)
        * DELETE From tablename {Where condition}
    * insert (DML)
        * INSERT Into tablename (col1, col2, ...) Values (val1, val2, ...)
        * valN can be a constant
        * INSERT Into Table-A // create table-A first
            SELECT col1, col2, ... From Table-B
    * update (DML)
        * UPDATE tablename Set col1 = val1, col2 = val2, ... {Where condition}
    * transactions
        * BEGIN TRANSACTION {name}
        * ROLLBACK { TRANSACTION { name } }
        * COMMIT { TRANSACTION {name} }

* DDL
    * create table
    
* functions
* procedures
    * @@ROWCOUNT : rows affected by last operation
    * go
* system tables