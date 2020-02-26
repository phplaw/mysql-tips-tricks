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
#### MySQL update with replace string
```sql
UPDATE customers SET fuel_levy = REPLACE(fuel_levy, '%', '') WHERE fuel_levy LIKE '%\%';
```

MySQL update multiple row with one query

```sql
UPDATE table_users
    SET cod_user = (case when user_role = 'student' then '622057'
                         when user_role = 'assistant' then '2913659'
                         when user_role = 'admin' then '6160230'
                         ELSE cod_user 
                    end),
        date = '12082014'
    WHERE user_role in ('student', 'assistant', 'admin') AND
          cod_office = '17389551';
          
          
          UPDATE table SET Col1 = CASE id 
                          WHEN 1 THEN 1 
                          WHEN 2 THEN 2 
                          WHEN 4 THEN 10 
                          ELSE Col1 
                        END, 
                 Col2 = CASE id 
                          WHEN 3 THEN 3 
                          WHEN 4 THEN 12 
                          ELSE Col2 
                        END
             WHERE id IN (1, 2, 3, 4);
             
             
             UPDATE people 
SET name = 
  (CASE id WHEN 1 THEN 'Karl'
           WHEN 2 THEN 'Tom'
           WHEN 3 THEN 'Mary'
   END)
WHERE id IN (1,2,3);

-- more tutorial

create table Books
   (
   BookId int,
   BookName varchar(200)
   );
   
   insert into Books values(1000,'Introduction to C');
   insert into UpdateAllDemo values(1001,'Introduction to Java');


update Books
   set BookName = (CASE BookId WHEN 1000 THEN 'C in Depth'
   when 1001 THEN 'Java in Depth'
   END)
  Where BookId IN(1000,1001);
   -- https://www.tutorialspoint.com/how-to-bulk-update-mysql-data-with-a-single-query

          
          ```
--- Add permission to user
```sql
GRANT  DELETE ON  *.* TO 'rc_developer'@'%'
```
