# mysql-tips-tricks
Tip &amp; Trick about MySQL
Update a field add more text to that field
```sql
UPDATE file_managed SET uri = CONCAT('public://', uri);
```

