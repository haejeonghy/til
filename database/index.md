# Index

* 색인
* 찾고자 하는 대상의 목록을 따로 만들어 검색할 수 있다. 
* 쿼리 속도가 느려지는 경우 해결할 수 있다.
* 특수한 자료 구조로 나열되어 있다. 
* 다중 인덱스를 만들어 자주 검색하는 값을 빠르게 불러올 수 있다. 

## MongoDB index

* `createIndex`
  * 파라미터로 인덱스를 적용할 필드를 전달한다.
  * `db.collection_name.createIndex({<필드명>:1, <필드명>: -1})`
    * 값을 1로 지정하면 오름차순으로 정렬한다.
    * 값을 -1로 지정하면 내림차순으로 정렬한다.
    * 필드 명이 2개 이상이면 다중 인덱스이다.
  * `db.collection_name.createIndex({<필드명>:1}, {<속성 property>:true})`
    * 두 번째 파라미터로 속성을 추가할 수 있다. 
    * 적용 가능한 속성
      * Unique : 단 한 개의 값만 존재할 수 있는 속성
      * Partial
        * 도큐먼트의 조건을 정해 일부 도큐먼트에만 인덱스를 적용한다.
        * 필요한 부분에만 인덱스를 사용하여 효율적으로 쿼리할 수 있다. 
        * `db.restaurants.createIndex({"cuisine":1, "name":1},  {partialFilterExpression:{ rating: {$gt:4}}})`
          * restaurants 컬렉션에 cuisine, name 필드를 사용하여 다중 인덱스를 생성한다. 
      * TTL
        * Time to Live
        * Date 타입, Date 배열 타입의 필드에 적용 가능하다. 
        * 특정 시간이 지난 후 도큐먼트를 컬렉션에서 삭제한다. 
        * `db.eventlog.createIndex( { "lastModifiedDate": 1 }, { expireAfterSeconds: 3600 } )`
          * lastModifiedDate와 3600초 이상 차이가 나면 도큐먼트를 컬렉션에서 제거한다. 
* `getIndexes`
  * 생성된 인덱스를 조회할 때 사용한다
  * `db.collection_name.getIndexes()`
* `dropIndex`
  * 생성된 인덱스를 삭제한다. 
  * `db.collection_name.dropIndex(name)`, `db.collection_name.dropIndex({<field>:1})`
  * `db.collection_name.dropIndexes()` : 전체 인덱스 삭제