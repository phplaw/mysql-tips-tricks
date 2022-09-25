```sql
SELECT * FROM table_name WHERE MATCH(col1, col2)
AGAINST('text to search' IN NATURAL LANGUAGE MODE)
```
