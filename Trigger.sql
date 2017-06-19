/*Triggers
A trigger is a special kind of stored procedure that automatically executes when an event occurs in the database server. 
DML triggers execute when a user tries to modify data through a data manipulation language (DML) event. 
DML events are INSERT, UPDATE, or DELETE statements on a table or view.
Based on the above 3 DML triggers are classified as
1)Before Insert
2)After Insert
3)Before Update
4)After Update
5)Before Delete
6)After Delete

General Syntax of a Trigger
CREATE [ OR REPLACE ] TRIGGER trigger_name
BEFORE/AFTER INSERT/UPDATE/DELETE
   ON table_name
   [ FOR EACH ROW ]

DECLARE
   -- variable declarations

BEGIN
   -- trigger code

EXCEPTION
   WHEN ...
   -- exception handling

END;
/
NOTE: A trigger is always created 'ON A TABLE'

Restrictions:
You can not create a BEFORE trigger on a view.
You can update the :NEW values.
You can not update the :OLD values.
*/

/*Example of a BEFORE INSERT TRIGGER*/
CREATE TABLE orders
( order_id number(5),
  quantity number(4),
  cost_per_item number(6,2),
  total_cost number(8,2),
  create_date date,
  created_by varchar2(10)
);


CREATE OR REPLACE TRIGGER orders_before_insert
BEFORE INSERT
   ON orders
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing INSERT into table
   SELECT user INTO v_username
   FROM dual;

   -- Update create_date field to current system date
   :new.create_date := sysdate;

   -- Update created_by field to the username of the person performing the INSERT
   :new.created_by := v_username;

END;

/ ------------>>>> /*It is a kind of delimiter for the Trigger procedure*/
