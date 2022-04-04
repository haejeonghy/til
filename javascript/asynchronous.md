# Asynchronous

* synchronous (동기적)
  * 작업의 완료 시점과 다른 작업의 시작 시점이 같을 때를 의미한다. 
  * blocking : 하나의 작업이 끝날 때까지 이어지는 작업을 막는 것
* asynchronous (비동기적)
  * non-blocking : 작업의 완료 시점과 다른 작업의 시작 시점이 다름
  * 비동기로 작동되어야 효율적인 작업의 예
    * 백그라운드 실행, 로딩 창 띄우기 등
    * 서버로 데이터 요청, 응답 기다리는 작업
      * fetch, ajax 등
    * 큰 용량 파일 로딩하는 작업
    * DOM element 이벤트 핸들러, 페이지 로딩
    * 타이머 api
  
## Caller 함수

* 함수 내부에서 콜백 함수를 호출할 수 있다. 
* 조건에 따라 실행 여부를 결정할 수 있다. 
    * 특정 작업 종료 후에 실행되는 경우가 많다. 

## Closure

* 함수와 그 함수가 선언 됐을 때의 렉시컬 환경과의 조합
  * lexical scoping : scope는 함수를 호출할 때가 아니라 함수를 어디에 선언하였는지에 따라 결정된다. 
  
``` javascript
    function outerFunc() {
        var x = 10;
        var innerFunc = function () { 
            // innerFunc는 자신을 포함하고 있는 외부 함수 outerFunc의 변수 x에 접근할 수 있다. 
            console.log(x); 
            };
        innerFunc();
    }

    outerFunc(); // 10
```

* 자신을 포함하고 있는 외부 함수보다 내부 함수가 더 오래 유지되는 경우, 외부 함수 밖에서 내부 함수가 호출되더라도 외부 함수의 지역 변수에 접근할 수 있는 함수이다. 

``` javascript
    function outerFunc() {
        var x = 10;
        var innerFunc = function () { 
            console.log(x); 
            };
        return innerFunc;
    }

    /**
     *  함수 outerFunc를 호출하면 내부 함수 innerFunc가 반환된다.
     *  그리고 함수 outerFunc의 실행 컨텍스트는 소멸한다.
     */
    var inner = outerFunc();
    inner(); // 10
```

## Callback

* 다른 함수의 전달 인자로 넘겨주는 함수이다.  
- 파라미터를 넘겨받는 함수는 콜백 함수를 필요에 따라 동기적으로 즉시 실행할 수도 있고 아니면 나중에 비동기적으로 실행할 수 있다.
  - 순서를 제어할 수 있다
* Callback in action
  - 반복 실행하는 함수
  - Iterator
  - Event handler
* 함수 자체를 연결해야 하지 함수 실행을 연결하면 안 된다.
``` javascript
    const a = foo() // 함수의 실행임
```

## Promise

* callback 핸들링, 체인 관리
* `then()` 사용하여 다음에 할 작업을 연쇄 실행 할 수 있다. 
* `resolve()` 사용하여 다음 작업으로 넘어간다. 
* 에러 발생 시 `reject()` 를 사용하여 핸들링한다. 

``` javascript
var p1 = new Promise(function(resolve, reject) {
  resolve("성공!");
  // 또는
  // reject("오류!");
});

p1.then(function(value) { //resolve()
  console.log(value); // 성공!
}, function(reason) { // reject()
  console.log(reason); // 오류!
});

```

## Async(), await

* await
  * 동기적인 프로그래밍처럼 쓸 수 있게 한다. 
  * async() 함수라고 넣어줘야 쓸 수 있다. 

```javascript
    async function name([param[, param[, ... param]]]) {
        statements
    }
```
```javascript
function resolveAfter2Seconds() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('resolved');
    }, 2000);
  });
}
// async로 명시
async function asyncCall() {
  console.log('calling');
  // 순차적 실행 await
  const result = await resolveAfter2Seconds();
  console.log(result);
  // expected output: "resolved"
}

asyncCall();

```