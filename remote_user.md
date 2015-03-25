Sometime, we need allow user to connect from remote host, so in this case, 
we have to create new user for this kind of connection. Here the way to do that: 
```sql
SELECT User,Host FROM mysql.user;
DROP USER 'root'@'%';
-- ALLOW access to all db with password from any host
GRANT ALL ON *.* to remoteroot@'%' IDENTIFIED BY 'user_pasword';
-- allow with only localhost
GRANT ALL ON *.* to remoteroot@'localhost' IDENTIFIED BY 'user_pasword';
DROP USER 'remoteroot'@'localhost';
-- allo connnect to foo db with an ip address for user bar
GRANT ALL ON foo.* TO bar@'192.168.0.1' IDENTIFIED BY 'PASSWORD';
REVOKE GRANT OPTION ON foo.* FROM bar@'192.168.0.1';
```
Notice: If drop unexists user, mysql will cause an error like this:

```
ERROR 1396 (HY000): Operation DROP USER failed for 'testuser'@'localhost'
```

```sql


GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' 
    IDENTIFIED BY 'YOUR_PASS' 
    WITH GRANT OPTION;
FLUSH PRIVILEGES;  

-- *.* = DB.TABLE you can restrict user to specific database and specific table.

-- 'root'@'%' you can change root with any user you created and % is to allow all IP. You can restrict it by changing %.168.1.1 etc too.

```
We need to restart mysql to see effect
```sudo service mysql restart```
```bash
mysql> CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost'
    ->     WITH GRANT OPTION;
mysql> CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%'
    ->     WITH GRANT OPTION;
mysql> CREATE USER 'admin'@'localhost';
mysql> GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
mysql> CREATE USER 'dummy'@'localhost';
```



    The accounts created by these statements have the following properties:

    Two of the accounts have a user name of monty and a password of some_pass. Both accounts are superuser accounts with full privileges to do anything. The 'monty'@'localhost' account can be used only when connecting from the local host. The 'monty'@'%' account uses the '%' wildcard for the host part, so it can be used to connect from any host.

    It is necessary to have both accounts for monty to be able to connect from anywhere as monty. Without the localhost account, the anonymous-user account for localhost that is created by mysql_install_db would take precedence when monty connects from the local host. As a result, monty would be treated as an anonymous user. The reason for this is that the anonymous-user account has a more specific Host column value than the 'monty'@'%' account and thus comes earlier in the user table sort order. (user table sorting is discussed in Section 6.2.4, “Access Control, Stage 1: Connection Verification”.)

source: http://stackoverflow.com/questions/10236000/allow-all-remote-connections-mysql
