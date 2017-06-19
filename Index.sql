/*Indexing (source: techonthenet.com)
An index is a performance-tuning method of allowing faster retrieval of records. 
An index creates an entry for each value that appears in the indexed columns. By default, Oracle creates B-tree indexes.

General syntax to create index
CREATE [UNIQUE] INDEX index_name
  ON table_name (column1, column2, ... column_n)
  [ COMPUTE STATISTICS ];
  
[UNIQUE]
It indicates that the combination of values in the indexed columns must be unique.
[COMPUTE STATISTICS]
It tells Oracle to collect statistics during the creation of the index. 
The statistics are then used by the optimizer to choose a "plan of execution" when SQL statements are executed
*/
/*Example*/

CREATE INDEX supplier_idx
  ON supplier (supplier_name, city)
  COMPUTE STATISTICS;