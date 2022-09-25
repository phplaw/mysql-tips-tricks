Your database Storage Engine must be InnoDB (version 5.5 or higher) or MyISAM
```sql
SELECT * FROM table_name WHERE MATCH(col1, col2)
AGAINST('text to search' IN NATURAL LANGUAGE MODE)
```
