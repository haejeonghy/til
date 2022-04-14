# SQL basics

## 기본 문법

* Select
* Where
  
```sql
SELECT 특성_1, 특성_2
FROM 테이블_이름
-- 특정 값과 비슷한 값들 필터링 하는 경우 LIKE 사용
WHERE 특성_2 LIKE "%특정 문자열%"

SELECT 특성_1, 특성_2
FROM 테이블_이름
-- 리스트의 값과 일치하는 데이터를 필터링하는 경우 IN 사용
WHERE 특성_2 IN ("특정값_1", "특정값_2")
```

* And, Or, Not
* Order By

```sql
SELECT *
FROM 테이블_이름
-- 돌려받는 데이터 정렬하는 기준
ORDER BY 특성_1

SELECT *
FROM 테이블_이름
-- 돌려받는 데이터 내림차순으로 정렬
ORDER BY 특성_1 DESC
```

* Limit

```sql
SELECT *
FROM 테이블_이름
-- 출력할 데이터의 갯수 정하기
LIMIT 200
```

* Distinct

```sql
SELECT
  DISTINCT
  -- 특성1, 특성2, 특성3 기준으로 유니크한 값 선택
    특성_1
    ,특성_2
    ,특성_3
FROM 테이블_이름
```

* Insert Into
* Null Values
* Update
* Delete
* Count
* Like
* Wildcards
* Aliases
* Joins
  * Inner Join

    ```sql
    SELECT *
    FROM 테이블_1
    -- 둘 이상의 테이블을 공통된 부분을 기준으로 연결
    JOIN 테이블_2 ON 테이블_1.특성_A = 테이블_2.특성_B
    ```

  * Left Join
  * Right Join
  * Group By

## 데이터베이스 관련 용어

* SQL Create DB

```sql
-- db 생성 
CREATE DATABASE 데이터베이스_이름;
```

* SQL USE

```sql
-- db 사용하겠다는 명령 전달
USE 데이터베이스_이름;
```
* SQL Drop DB
* SQL Create Table

```sql
-- user table 생성
CREATE TABLE user (
    -- id 자동 증가
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255),
  email varchar(255)
);
```

* SQL Drop Table
* SQL Alter Table
* SQL Describe Table

```sql
-- table 정보 확인
DESCRIBE user;
```

* SQL Not Null
* SQL Unique
* SQL Primary Key
* SQL Foreign Key
* SQL Default
* SQL Auto Increment
* SQL Dates