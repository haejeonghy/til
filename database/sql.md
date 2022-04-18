# SQL basics

## 기본 문법

* Select
  * select 조건 실행 순서
    1. FROM
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SELECT
    6. ORDER BY 
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

-- 특정 값이 서브쿼리에 있는지, 없는지 확인할 수 있다.
WHERE 특성_2 NOT IN (SELECT 특성_1 FROM 테이블_이름2)
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
* Sum

```sql
-- 레코드 합 리턴한다.
SELECT InvoiceId, SUM(UnitPrice)
FROM invoice_items
GROUP BY InvoiceId;
```

* Avg

```sql
-- 레코드의 평균 값을 계산한다.
SELECT TrackId, AVG(UnitPrice)
FROM invoice_items
GROUP BY TrackId;
```

* Max, Min

```sql
-- 각각 레코드의 최대값과 최소값을 리턴한다. 
SELECT CustomerId, MAX(Total), MIN(Total)
FROM invoices
GROUP BY CustomerId
```

* Count

```sql
-- 레코드 갯수 헤아릴 때 사용한다. 
SELECT *, COUNT(*) FROM customers
GROUP BY State;
```

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

```sql
SELECT * FROM customers
-- 그룹으로 묶어서 조회한다.
GROUP BY State;
```

  * having 

```sql
SELECT CustomerId, AVG(Total)
FROM invoices
GROUP BY CustomerId
-- group by로 조회된 결과 피털링
HAVING AVG(Total) > 6.00
```

* Case

```sql
-- 조건에 따라 다른 결과를 받을 수 있다. 
SELECT CASE
    -- when으로 분리
			WHEN CustomerId <= 25 THEN 'GROUP 1'
			WHEN CustomerId <= 50 THEN 'GROUP 2'
			ELSE 'GROUP 3'
		END
	FROM customers
```

* Exists

```sql
SELECT EmployeeId
FROM employees e
-- 조회하려는 값이 존재하는지 확인
-- 조회하려는 값이 존재한다면 true, 아니면 false를 리턴한다.
WHERE EXISTS (
	SELECT 1
	FROM customers c
	WHERE c.SupportRepId = e.EmployeeId
	)
ORDER BY EmployeeId
```

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

## SQL 종류

* Data Definition Language
  * 데이터 정의 언어
  * `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
* Data Manipulation Language
  * 데이터베이스에 데이터 저장 관련 언어
  * `SELECT`, `INSERT`, `DELETE`, `UPDATE`
* Data Control Language
  * 데이터베이스 접근 권한 관련 언어
  * `COMMIT`, `ROLLBACK`, `GRANT`, `REVOKE`
* Data Query Language
  * 정해진 스키마 내에서 쿼리할 수 있는 언어
  * `SELECT`
* Transaction Control Language
  * DML 거친 데이터의 변경 사항 수정 가능한 언어
  * `COMMIT`, `ROLLBACk`