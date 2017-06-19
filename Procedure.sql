/*Stored Procedure in Oracle
In a database management system (DBMS), a stored procedure is a set of Structured Query Language (SQL) statements with 
an assigned name that's stored in the database in compiled form so that it can be shared by a number of programs. 
The use of stored procedures can be helpful in controlling access to data (end-users may enter or change data but do not write procedures),
preserving data integrity (information is entered in a consistent manner),
and improving productivity (statements in a stored procedure only need to be written one time).

Difference between Stored Procedure and Function:
1.Function is mainly used in the case where it must return a value. 
  Procedure may or may not return a value or may return more than one value using the OUT parameter.
 
2.Function can be called from SQL statements
  Procedure can not be called from the sql statements 

3.Functions are normally used for computations 
  Procedures are normally used for executing business logic. 

4.You can have DML (insert,update, delete) statements in a function. 
  But, you cannot call such a function in a SQL query.

5.Function returns 1 value only. 
  Procedure can return multiple values (max 1024). 

6.Stored Procedure: supports deferred name resolution. 
  Example while writing a stored procedure that uses table named tabl1 and tabl2 etc..but actually 
  not exists in database is allowed only in during creation but runtime throws error Function wont support deferred name resolution. 

7.Stored procedure returns always integer value by default zero. 
  Function return type could be scalar or table or table values

8.Stored procedure is precompiled execution plan where as functions are not.
 
9.A procedure may modify an object where a function can only return a value 
  The RETURN statement immediately completes the execution of a subprogram and returns control to the caller. 

General Syntax:
CREATE [OR REPLACE] PROCEDURE procedure_name
    [ (parameter [,parameter]) ]

IS
    [declaration_section]

BEGIN
    executable_section

[EXCEPTION
    exception_section]

END [procedure_name];
*/

/*Example*/
CREATE OR REPLACE Procedure UpdateCourse
   ( name_in IN varchar2 )

IS
   cnumber number;

   cursor c1 is
   SELECT course_number
    FROM courses_tbl
    WHERE course_name = name_in;

BEGIN

   open c1;
   fetch c1 into cnumber;

   if c1%notfound then
      cnumber := 9999;
   end if;

   INSERT INTO student_courses
   ( course_name,
     course_number )
   VALUES
   ( name_in,
     cnumber );

   commit;

   close c1;

EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;