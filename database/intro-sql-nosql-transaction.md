# Database

* in-memory
  * 서버 프로그램이 실행중일 때, 변수에 값을 할당하여 저장하는 것
  * client에 저장하는 경우가 많다. 
  * 종료하면 data가 날아간다. 
* File I/O
  * 원하는 data만 가져올 수 없다. 
  * 모든 data를 가져온 뒤 서버에서 필터링해야 한다. 
* Database
  * data에 특화된 서버
  * data 관리를 위한 여러 기능들을 가지고 있다. 

## SQL

* Structured Query Language
* RDBMS 기반
* database 용 프로그래밍 언어
* 행(row), 열(column)로 구성된 table에 data가 저장된다.
* 구조화 된 Query 언어
  * Query
    * 질의문
    * 저장되어 있는 정보 중 원하는 정보를 필터링 하기 위한 질문
* data가 구조화된 table을 사용하는 database에서 활용할 수 있다.
* schema가 뚜렷하게 보인다. 
  * table 간의 관계를 직관적으로 파악할 수 있다. 
* MySQL, Oracle, SQLite, PostgresSQL, MariaDB
* SQL 기반 RDBMS를 사용하는 케이스
  * database의 ACID 성질을 준수해야 하는 경우
    * 전자상거래 비롯 금융 서비스를 위한 소프트웨어에서는 반드시 ACID 성질을 준수해야 해서 일반적으로 RDBMS를 사용한다.
  * data가 구조적이고 일관적인 경우 

## NoSQL

* 비관계형 데이터베이스 기반
* data의 구조가 고정되어있지 않은 database
* table을 사용하지 않고 다른 형태로 저장한다. 
* schema에 따라 data를 읽어온다.
  * schema on read
  * 읽어올 때에만 data schema가 사용된다.
  * data를 입력하는 방식에 따라 data를 읽어올 때 영향을 미친다.
* NoSQL 기반 database 구성
  * key-value 타입
    * key-value 쌍으로 나타내는 data를 배열의 형태로 저장한다. 
      * key : 속성 이름
      * value : 속성에 연결된 data 값
    * redis, dynamo 등
  * 문서형 database
    * data를 table이 아닌 문서처럼 저장하는 database
    * JSON과 유사한 형식의 data를 문서화하여 저장한다. 
    * 각각의 문서는 하나의 속성에 대한 data를 가지고 있고, 컬렉션이라고 하는 그룹으로 묶어서 관리한다. 
    * MongoDB 등
  * Wide-Column database
    * database의 열에 대한 data를 집중적으로 관리하는 database
    * 각 열에는 key-value 형태로 data가 저장된다. 
    * 컬럼 패밀리 column families라고 하는 열의 집합체 단위로 data를 처리할 수 있다. 
    * 하나의 행에 많은 열을 포함할 수 있어서 유연성이 높다. 
    * Cassandra, HBase
  * 그래프 database
    * 노드에 속성별로 data를 저장한다. 
    * 각 노드간 관계는 선으로 표현한다.
    * Neo4J, InfiniteGraph
* NoSQL 기반 database를 사용하는 케이스
  * data 구조가 거의 없는, 대용량의 data를 저장하는 경우
  * 클라우드 컴퓨팅 및 저장공간을 최대한 활용하는 경우
    * 소프트웨어 database의 확장성이 중요한 경우 쉽게 확장할 수 있는 NoSQL database를 사용하는 것이 좋다.
  * 빠르게 서비스를 구축하는 과정에서 data 구조를 자주 업데이트 하는 경우
    * schema를 미리 준비할 필요가 없어 유리하다. 
    * 프로토타입을 빠르게 출시해야 하는 경우에 해당한다.

## SQL 기반 database와 NoSQL database 차이점

* data 저장 storage
  * NoSQL 
    * key-value, document, wide-column, graph 방식으로 data를 저장한다. 
  * RDBMS
    * SQL 이용하여 data를 table에 저장한다. 
    * 미리 작성된 schema를 기반으로 정해진 형식에 맞게 data를 저장한다.
* Schema
  * SQL
    * 고정된 형식의 schema가 필요하다.
    * 처리하려는 data 속성 별로 Column에 대한 정보를 미리 정해두어야 한다.
    * schema는 나중에 변경할 수 있지만 database 전체를 수정하거나 오프라인으로 전환할 필요가 있다.
  * NoSQL
    * 동적으로 schema의 형태를 관리할 수 있다.
    * 행을 추가할 때 즉시 새로운 열을 추가할 수 있다. 
    * 개별 속성에 대해 모든 열에 대한 data를 반드시 입력하지 않아도 된다.
* Querying
  * RDBMS에서는 table의 형식과 table간의 관계에 맞춰 data를 요청해야 한다.
    * SQL과 같이 구조화 된 쿼리 언어를 사용한다.
  * NoSQL은 data 그룹 자체를 조회하는데 초점을 둔다.
    * 구조화되지 않은 쿼리 언어로도 data 요청이 가능하다.
    * UnQL UnStructured Query Language
* Scalability 확장성
  * SQL 기반 RDBMS는 수직적으로 확장한다. 
    * database가 구축된 하드웨어 성능을 많이 이용하기 때문에 비용이 많이 든다.
    * 여러 서버에 걸쳐 database의 관계를 정의할 수 있지만 복잡하고 시간이 많이 소모된다.
  * NoSQL 기반 database는 수평적으로 확장한다.
    * 값싼 서버 증설, 클라우드 서비스 이용하는 확장이다.
    * NoSQL database를 위한 서버를 추가적으로 구축하면 많은 트래픽을 편리하게 처리할 수 있다. 
    * 범용 하드웨어, 클라우드 기반의 인스턴스에 NoSQL database를 호스팅할 수 있어서 상대적으로 비용이 저렴하다. 


## Transaction

* 여러 개의 작업을 하나로 묶은 실행 유닛
* 하나의 특정 작업으로 시작을 해 묶여있는 작업을 모두 완료해야 정상적으로 종료한다. 
* 여러 작업 중에서 하나라도 실패하면 모든 작업을 실패한 것으로 판단한다. 
* 미완료된 작업없이 모든 작업을 성공해야 한다. 
  
### ACID
  
  * database 내에서 일어나는 하나의 트랜잭션의 안전성을 보장하기 위해 필요한 성질
  * **Atomicity**
    * 원자성
    * 하나의 트랜잭션에 속해있는 모든 작업이 전부 성공하거나 전부 실패해서 결과를 예측할 수 있어야 한다. 
    * 특정 쿼리를 실행했는데 부분적으로 실패하는 부분이 있다면 전부 실패하도록 구현된다. 
  * **Consistency**
    * 일관성
    * 하나의 트랜잭션 이전과 이후 database의 상태는 이전과 같이 유효해야 한다. 
    * database의 제약이나 규칙을 만족해야 한다. 
    * database의 유효한 상태는 다를 수 있지만 data 상태에 대한 일관성은 변하지 않아야 한다. 
  * **Isolation**
    * 격리성, 고립성
    * 모든 트랜잭션은 다른 트랜잭션으로부터 독립해야 한다. 
    * 각 트랜잭션은 철저히 독립적이기 때문에 다른 트랜잭션의 작업 내용을 알 수 없다. 
    * 트랜잭션이 동시에 실행될 때와 연속으로 실행될 때의 database 상태가 동일해야 한다. 
  * **Durability**
    * 지속성
    * 하나의 트랜잭션이 성공적으로 수행되었다면 해당 트랜잭션에 대한 로그가 남아야 한다. 
    * 런타임 오류나 시스템 오류가 발생하더라도 해당 기록은 영구적이어야 한다. 
    * 로그로 기록하기 전에 종료가 된다면 해당 트랜잭션은 실패로 돌아간다. 