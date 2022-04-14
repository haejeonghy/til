# DBMS Element 

## Schema

* 데이터베이스에서 데이터가 구성되는 방식과 서로 다른 엔티티 간의 관계에 대한 설명
* 데이터베이스의 청사진
  
## Entity

* 고유한 정보의 단위
* RDBMS 테이블

## Field

* entity의 특성
* 행렬의 렬(column)에 해당한다.

## Record

* 테이블에 저장된 항목.
* 행렬의 행(row)에 해당한다. 

## 테이블간의 관계

* 1:1
  * 하나의 레코드가 다른 테이블의 레코드 한 개와 연결된 경우
* 1:N
  * one to many
  * 1대 다의 관계
* N:N
  * many to many
  * join table에서 관리한다. 
* self referencing

## Key

* 테이블의 각 레코드를 구분할 수 있는 값
* 자동적으로 값이 증가한다.
* 각 레코드마다 고유한 값을 가진다.
* 기본 키 primary key
  * 해당 레코드를 구분하는 키
* 외래 키 foreign key
  * 다른 키를 참조하는 키