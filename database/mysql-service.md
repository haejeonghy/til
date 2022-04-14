# MySQL service

* 설치

```bash
brew install mysql
brew info mysql
```

* 시작

```bash
brew services start mysql
```

* 접속
  
```bash
# p password
mysql -u root -p
```
```sql
-- root 사용자의 비밀번호를 yourPassword로 변경하는 명령어
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourPassword'; 
```

* 종료

```bash
# MySQL 서비스 종료
brew services stop mysql
```

* 삭제

```bash
# Brew로 삭제, Clean up
brew remove mysql
brew cleanup

# 남아있는 mysql 정보 삭제
sudo rm -rf /usr/local/var/mysql
# M1 사용자는 추가적으로 sudo rm -rf /opt/local/var/mysql)
sudo rm -rf /usr/local/mysql
# M1 사용자는 추가적으로 sudo rm -rf /opt/local/mysql)
sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/MySq
```