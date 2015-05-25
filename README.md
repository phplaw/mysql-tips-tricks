# mysql-tips-tricks
Tip &amp; Trick about MySQL
Update a field add more text to that field
```sql
UPDATE file_managed SET uri = CONCAT('public://', uri);
```

INSERT Multipal values
```sql
INSERT INTO tbl_name (a,b,c) VALUES(1,2,3),(4,5,6),(7,8,9);
```
MySQL update with replace string
```sql
UPDATE customers SET fuel_levy = REPLACE(fuel_levy, '%', '') WHERE fuel_levy LIKE '%\%';
```
