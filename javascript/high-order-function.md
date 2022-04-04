# High order function

* 고차 함수
* 함수를 인자로 받을 수 있다.
``` javascript
    function double(num) {
        return num * 2
    }
    function doubleNum(func, num) {
        return func(num)
    }
    // 함수 double을 인자로 받음
    doubleNum(double, 4)
```
* 함수의 형태로 리턴할 수 있다.
``` javascript
    function adder(added) {
        return function (num) {
            return num + added;
        }
    }
    // adder(num)의 리턴 값이 함수이기 때문에 호출 () 사용 가능
    adder(5)(3);
```
* 함수는 변수에 저장할 수 있다.
* 함수를 담은 변수를 인자로 전달 받을 수 있다.
* callback function
  * 다른 함수의 인자로 전달되는 함수이다.
  * 콜백 함수를 전달받은 고차 함수는 함수 내부에서 콜백 함수를 호출할 수 있다.
    * 조건에 따라 실행 여부를 결정할 수 있다.
* curry function : 함수를 리턴하는 함수

## 내장 고차 함수

* filter
  * 배열의 요소 중 특정 조건(함수)에 사실 만족하는 요소 걸러내는 메소드이다.
  * 특정 조건은 메소드 인자(함수 형태)로 전달된다.
  * 인자를 전달받은 함수에서 인자와 조건을 콜백함수 filter로 보내고, 조건에 맞는 인자만 걸러낸 뒤 배열 형태로 리턴한다.
  ``` javascript
      let arr = [1, 2, 3, 4];
      let result = arr.filter((el) => el % 2 === 0);
      console.log(result); // ->> [2, 4]
  ```
* map
  * 배열의 각 요소가 특정 논리(함수)에 의해 다른 요소로 지정된다.
  ``` javascript
      let arr = [1, 2, 3]
      let result = arr.map((el) => {
          return el + 1
      })
      console.log(result) // 하나씩 더한 값 리턴 [2, 3, 4]
  ```
* reduce
  * 배열의 각 요소를 순서대로 호출한 각 요소에 대해 callback 함수를 실행한 결과 누적한 값을 리턴한다.
  ``` javascript
      let arr = [1, 2, 3]
      // 배열 순회하면서 요소 전체 더하기
      let result = arr.reduce((total, val, idx, arr) => total + val, 0)
      console.log(result)
  ``` 