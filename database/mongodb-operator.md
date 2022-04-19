# MongoDB Operator

## Comparison Operators
  
* 비교 연산자
* `$eq`
  * equal to
  * 지정된 값이 서로 같은지 확인하기
  * 연산자가 지정되어 있지 않은 경우 기본 연산자로 사용된다.
* `$ne`
  * not equal to
  * 지정된 값이 서로 같지 않은지 확인하기
* `$gt`
  * greater than
  * 주어진 값보다 큰 지 비교하기
* `$lt`
  * less than
  * 주어진 값보다 작은 지 비교하기
* `$gte`
  * greater than or equal to
  * 크거나 동일한지 비교하기
* `$lte`
  * less than or equal to
  * 작거나 동일한지 비교하기

```javascript
    // 사용 양식
    { field : { operator : value } }
    // trip duration이 70초 이내인 값 찾기
    {"tripduration": {"$lte":70}}
    // 쉘에서 검색하기
    db.collection_name.find({ field : { operator : value } })
```

## Logic Operators

* 논리 연산자
* `$and`
  * 지정된 모든 쿼리절을 충족하는 도큐먼트를 반환한다.

```javascript
    // $and는 기본으로 사용되기 때문에 생략 가능하다. 
    {sector: "true", result:"warning"}
    {$and: [{sector:"true"}, {result:"warning"}]}

    {total_employee: {"$gt": 25}}, {total_employee:{"$lt":100}}
    // 결합이 가능하다. 
    // 위의 조건과 아래의 조건은 같다
    {total_employee:{"$gt":25, "$lt":100}}

    {"$or":[{dst_airport:"ICN"}, {src_airport:"ICN"}]}
    {"$or":[{airplane:"CR2"}, {airplane:"A81"}]}
    // 동일한 연산자를 두 번 이상 포함해야 할 때는 $and를 명시한다
    {"$and":[{"$or":[{dst_airport:"ICN"}, {src_airport:"ICN"}]}, {"$or":[{airplane:"CR2"}, {airplane:"A81"}]}]}

```

* `$or`
  * 쿼리절 중 하나라도 일치하는 도큐먼트가 있다면 해당 도큐먼트를 반환한다. 
* `$nor`
  * 주어진 모든 절과 일치하지 않는 도큐먼트를 반환한다.

```javascript
    // $and, $or, $nor 의 경우
    {<operator>:[{statement1}, {statement2}, ...]}
```

* `$not`
  * 조건을 만족하지 않는 모든 도큐먼트를 반환한다. 

```javascript
    // 뒤에 오는 조건을 부정하기 때문에 배열 구문이 필요하지 않다. 
    {$not:{statement}}
```

## Expressive Query Operator

* 표현 연산자
* 다양성을 가지고 있음
* Aggregation Expression
  * 집계 표현식 사용할 수 있음
  * `{$expr:{expression}}`
* 변수와 조건문을 사용할 수 있다.
* 같은 도큐먼트 내 필드들을 서로 비교할 수 있다. 
* 해당 값이 어떤 필드와 같아야 하는지 지정하지 않고도 자체적으로 동일한 도큐먼트 내에서 값을 비교할 수 있다. 
  
```javascript
    // qty의 값이 stock의 값보다 큰 도큐먼트 찾기
    db.inventory.find( { $expr: { $gt: ["$qty", "$stock"]}})
```

## Array Operators

* 배열 연산자
* `$push` 
  * 배열의 마지막 위치에 엘리먼트를 넣는다.
  * 배열이 아닌 필드에 사용했을 경우 필드의 타입을 배열로 바꾼다.
* `$all`
  * 배열 필드에 지정한 요소가 있는 모든 도큐먼트를 반환한다.
  * 배열 요소의 순서와 상관없이 지정된 요소가 포함된 모든 도큐먼트를 찾을 수 있다. 
* `$size` 
  * 배열의 길이에 따라 결과 커서를 제한한다. 
  * 정해진 갯수의 요소가 포함된 결과만 반환된다. 
* `{<array field>:<array>}`
  * 지정된 배열 필드에 요소와 순서가 정확히 일치하는 배열을 가진 도큐먼트를 찾는다. 
* `{<array field>:<string>}`
  * 지정된 배열 필드에 문자열로 주어진 요소가 포함된 모든 도큐먼트를 찾는다.
* projection
  * 데이터베이스에서 조건에 해당하는 도큐먼트를 찾고 특정 필드만 결과에 포함한다. 
  * `{"$size":20, "$all":[]}, {필드1:값1, 필드2:값2}`
    * 필드1, 필드2 값만 결과 커서에 포함된다. 
    * 필드의 값을 0과 1을 사용해 결과에서 표시하거나 표시하지 않을 수 있다.
    * `{"$size":20, "$all":[]}, {필드1:1, 필드2:0}` 
      * 지정된 필드1과 `_id`필드만 가져온다.
      * 지정된 필드2를 제외한 모든 필드가 표시된다.
* `$elemMatch` 첫 번쨰 인자에서 쓰이는 경우
  * 쿼리에 해당하는 도큐먼트를 찾은 뒤 projection 한다. 
  * 지정한 배열 필드가 도큐먼트에 존재하고 서브 도큐먼트 필드가 조건에 맞는 요소가 있는 경우에만 해당 필드를 결과에 포함시킨다. 
* `$elemMatch` 두 번째 인자에서 쓰이는 경우
  * 쿼리에 프로젝션이 없으므로 결과에 각 도큐먼트의 모든 필드가 포함된다. 
  * 지정된 기준과 일치하는 요소가 하나 이상 있는 배열 요소만 프로젝션 한다. 
* `$regex`
  * 정규직 연산자
  * 일치시키려는 문자열을 지정할 수 있다. 

## sub-document query

* dot notation
  * `document_name.type`
    * document_name의 type 필드에 접근할 수 있다. 
  * 서브 도큐먼트의 필드 이름은 최상위 필드 뒤 점으로 구분되며 전체 내용이 따옴표로 묶여있다. 
  * 점으로 객체를 구분해 데이터베이스에서 컬렉션으로 이동한다.
  * 값으로 도큐먼트가 있는 필드가 있고, 해당 필드의 값으로 또 도큐먼트가 있는 경우에도 점 표기법을 사용하여 해당 계층에서 도큐먼트 자체가 아닌 필드의 값을 가져올 수 있다. 
  * 배열에서 점 표기법을 사용하려면 요소의 위치를 지정해야 한다. 