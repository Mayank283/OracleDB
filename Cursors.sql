/*CURSORS (Source: techonthenet.com)
In Oracle, a cursor is a mechanism by which you can assign a name to a 'SELECT statement' and manipulate the information 
within that SQL statement.
Steps of successfully utilizing the cursor:
1)Declare a Cursor: CURSOR <Cursor_name> IS <Select Statement>
2)OPEN Statement: Open <Cursor_name>
3)FETCH Statement: fetch <Cursor_name> into <Variable(Can also have datatype as %Rowtype)>
4)CLOSE Statement: Close <Cursor_name>

Cursor Attributes (%ISOPEN,%FOUND, %NOTFOUND,%ROWCOUNT)
SELECT FOR UPDATE Statement
WHERE CURRENT OF Statement
*/
/*Example:*/
CREATE OR REPLACE Function FindCourse
   ( name_in IN varchar2 )
   RETURN number
IS
   cnumber number;/*Declaration of a variable*/

   CURSOR c1 /*Declaring a Cursor;Always on a Select Statement as it is used to fetch records
            (Analogus to Resultset in JDBC)*/
   IS
     SELECT course_number
     FROM courses_tbl
     WHERE course_name = name_in;

BEGIN

   open c1;
   fetch c1 into cnumber;

   if c1%notfound then
      cnumber := 9999;
   end if;

   close c1;

RETURN cnumber;

END;