# MongoDB CRUD

## CREATE

* 모든 도큐먼트는 `_id` 필드를 기본값을 반드시 가지고 있어야 한다. 
  * 각 도큐먼트를 구별하는 역할을 한다. 
  * 내부의 필드와 값이 똑같아도 `_id` 값이 다르면 서로 다른 도큐먼트로 간주한다.  
  * `_id` 값을 명시하지 않아도 자동으로 추가된다.

```javascript
    // 하나의 도큐먼트 컬렉션에 넣기
    db.collection_name.insert({

    })
     // 하나의 도큐먼트 컬렉션에 넣기
    db.collection_name.insert([
        {},
        {},
        {}
    ])
```

* 여러 개의 도큐먼트를 삽입할 때 주어진 도큐먼트 배열의 인덱스 순서로 작업이 실행된다. 
  * `"ordered":false` : 순서에 상관 없이 고유한 `_id`를 가진 도큐먼트는 모두 컬렉션에 삽입된다. 
* 존재하지 않는 컬렉션에 도큐먼트를 삽입하는 경우 동시에 컬렉션이 만들어진다. 

## READ

```sql
    -- 데이터베이스 리스트 확인하기
    show dbs

    -- 사용할 데이터베이스 선택하기
    use 데이터베이스명

    -- 데이터베이스 내부의 컬렉션 목록 확인하기
    show collections
```

```javascript
    // 도큐먼트 찾기
    db.collection_name.find({
        // 조건 넣기 여러 개 가능
        "state":"NY"
        , "city":"ALBANY"
    })

    // 전체 데이터 조회하기
    db.collection_name.find()
    // 도큐먼트 구조와 각각의 필드, 값의 쌍을 읽기 편하게 해줌
    db.collection_name.find().pretty()
    // 컬렉션 안 모든 데이터 수가 출력된다.
    db.collection_name.find().count()
    // 무작위 데이터 1개만 가져오기
    db.collection_name.findOne()
    // find 실행해서 얻어낸 결과의 집합
    cursor.pretty() 

```

## UPDATE

```javascript
    // 기준에 맞는 첫 번쨰 도큐먼트만 업데이트 됨
    db.collection_name.updateOne(
        // 업데이트 할 도큐먼트를 결정하는 조건
        {"city":"ALPINE"}
        //$inc MQL 수정
            // 존재하지 않는 필드에 값 추가할 경우 필드가 생성됨
            // pop 필드 값 100으로 변경하기
        , {"$set":{"pop":100}}
    )
                                //업데이트할 도큐먼트 결정하는 조건
    db.collection_name.updateOne({"student_id":250},
        // $push 연산자 //scores : 서브 도큐먼트를 삽입할 배열 타입의 값을 가지고 있는 필드
            // type: 추가할 서브 도큐먼트
        {"$push":{"scores":{"type":"extra credit", "score":100}}}    
    )

    // 쿼리문에 일치하는 모든 도큐먼트를 업데이트 함
    db.collection_name.updateMany(
        // 업데이트 할 도큐먼트를 결정하는 조건
        {"city":"ALPINE"}
        //$inc MQL 업데이트 연산자 
            // pop 필드 10씩 증가시키기
        , {"$inc":{"pop":10}}
    )

```

## DELETE

```javascript
    // 주어진 기준에 맞는 다수의 도큐먼트 중 첫 번째 도큐먼트 하나를 삭제한다. 
    // 조건에 해당되는 도큐먼트가 많을 수 있으니 _id로 삭제하는 것이 바람직하다. 
    db.collection_name.deleteOne({"_id":1})
    // 기준을 충족하는 도큐먼트가 많을 경우에는 deleteMany를 사용하여 다수의 도큐먼트를 삭제한다. 
    db.collection_name.deleteMany({조건})
    // 컬렉션 삭제
    db.collection_name.drop()
```