/*
The DUAL table is a special one-row, one-column table present by default in Oracle and other database installations. 
In Oracle, the table has a single VARCHAR2(1) column called DUMMY that has a value of 'X'.
'DUMMY' and 'X' both work as variable and can be replaced as per query.
It is suitable for use in selecting a pseudo column such as SYSDATE or USER.
It is accessible to all users*/
select * from dual;
select sysdate from dual;
select user from dual;

/*System is the current Admin for complete Database named as 'xe'(SID)
The database with SID as xe is created default on installation
Below query shows the current user to which connection is made*/
show user;

/* Table v$database contains all the details of the database created with SID as 'xe'
It displays information about the database from the control file*/
select * from v$database;
select user from v$database;
desc v$database;

/*
Type of tables in Oracle Database(it all seems logical once you try below queries)
1) dba_<> --- Only Admin has  access to table with 'dba' as prefix. Gives details of complete database.
2) user_<> --- To get details of current user use table with 'user' as prefix. Gives details of current user connected to.
3) all_<> --- Gives details of attributes accessible to current user from complete database attributes.*/

/*Below query shows all the users/schema in the database*/
select username from dba_users;
/*Below query shows current user/schema connected to in database*/
select username from user_users;

/*Queries to look up for all Tables,Views,Indexes,Triggers,Procedures,Functions,Queues,Queue tables,Types for the user*/

/*
1) Table queries*/
select table_name from dba_tables;
select table_name from user_tables;
select table_name from all_tables;
/*Shows the metadata and structure of a table*/
desc dba_tables;

/*
2)View Queries*/
select view_name,text from dba_views;
select view_name,text from user_views;
select view_name,text from all_views;

/*
3)Index Queries*/
select index_name,index_type,table_owner,table_name,uniqueness from dba_indexes order by index_name;
select index_name,index_type,table_owner,table_name,uniqueness from user_indexes order by index_name;
select index_name,index_type,table_owner,table_name,uniqueness from all_indexes order by index_name;

/*
4) Trigger Queries*/
select * from dba_triggers;
select * from user_triggers;
select * from all_triggers;

/*user_objects is the general table which contains information of all the objects of an schema(tables,views,indexes,procedure etc.) */
select * from user_objects order by object_type;
select * from user_objects where object_type = 'PROCEDURE';

/*
For all the Oracle db functions available refer below link
https://www.techonthenet.com/oracle/functions/
*/

/*
That's all to get you all up from your comfort couch and encourage you to explore more about OracleDB (or any DB) for better understanding as this is
the most of the most basic of OracleDB. Believe me once you understand atleast a single DB, understanding other DB's through correlation will be a 
piece of cake.
Happy Learning!
*/