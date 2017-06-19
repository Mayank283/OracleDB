# OracleDb
Get an idea of what is Oracle Db. (Warning: Not a place to learn SQL queries)

/*This blog is for internal understanding of the Oracle Db and not for SQL queries(many other database like mySql,Postgre sql etc.
could be learnt by following the same method).
It is recommended to install Oracle 11g Express edition and Oracle Sql developer(Client for Oracle DB)in your personal computer 
before you start. Oracle 11g Express edition is easy to download and install by just making an account on oracle site. Hope you get through it so let's start.

What is Oracle Db server and Oracle db Client?
Sometimes referred to as database management systems (DBMS), database software tools are primarily used for storing, modifying, extracting, and 
searching for information within a database having some relation with each other(reference to Set topic of Mathematics). 
And anything that provides this service is called a Database server(mysql,mongodb,Postgre sql,oracle etc.) while a software that provides easy 
to handle GUI client for these servers is called a Database client.(Mysql workbench,PgAdmin,Oracle Sql developer etc.)
So Oracle database server is nothing but one of those many database servers available.

Characterstics of oracle Database server(Specific to Oracle DB only):

1.It is composed of PL/SQL procedures and Data dictionary(Analogus to Windows,Program files,Users etc that are required for the Windows OS to work). 
So installation time an Oracle 11g takes is for copying these PL/SQL procedures and Data dictionaries and database engine
which are required for Oracle Db to work.

2.In oracleDb terms Database and Instance are one and the same thing(Strict Warning: Don't Confuse with these terms).
So when you say 'Create Database' command in Oracle you actually mean to create another instance/Database of Oracle Db(Analogus to Third Party OS installation)and hence all the PL/SQL procedure and data dictionary(which are installed automatically on clicking the install button) will need to be installed again for this second instance/database to run.But this command is more specific to Linux and oracle db admins who need to install Oracle DB using CLI on Linux Servers(Encourage you to try this command on sql developer after OracleDb and Client are installed and look for the error).

3.On successful installation each instance/Database has its own unique SID(Service ID by default is 'xe'. Hey! that stands for Express Edition)and a service name('xe' by default but configurable).
These are required while making connection to the database users in SQL Developer client.Other properties are host,port(1521 by default)
Check these out by clicking 'Create new connection' in SQL Developer client.

4.One important thing to notice in OracleDb is that 'User and Schema' are again same thing(Google it and you will be dazzled).
So when you create a user (Create User command)with all the privelleged roles you actually are creating a schema with the same name.
So do not confuse with these terms again in your life but true only in Oracle world(And I bet you even many years
experienced IT professional commit this mistake so an easy point for you to say 'LOL').
Other Database may create some difference between these two(Ex. Mysql) so better check on these for other database servers.

5.So what if anyone asks what does an schema actually is? Simply answer, it is composed of(Sounds like Chemistry!) Tables,Views,Indexes,Triggers,Procedures,Functions etc(All these together are called as Objects of schema).

6.The User/Schema named 'SYSTEM' is by default an 'Admin' to your instance/database with SID 'xe'(just like first user created is an admin on first time installation of Windows) and he has all the privileges to do anything on your database.There is another user named 'SYS' but you have to connect to it with role(find more about roles by exploring connection properties) as 'SYSDBA' to get complete access to the database.

I believe this much information is sufficient to get the gist of what we are delving into. Now we can get into basic commands and some tables of the OracleDb which are useful for everyone and learning about them logically will leave little chance to forget these commands.
So let's get started with the 'System.sql' script file in the repository.
