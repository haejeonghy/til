# Timer API

## setTimeout(callback, millisecond)

* 일정 시간 후에 함수를 실행한다. 
* 임의의 타이머 ID를 리턴한다. 

``` javascript
    setTimeout(function () {
    console.log('1초 후 실행');
    }, 1000);
```

## clearTimeout(timerId)

* setTimeout을 취소한다. 

``` javascript
    const timer = setTimeout(function () {
    console.log('1초 후 실행');
    }, 1000);
    clearTimeout(timer)
```

## setInterval(callback, millisecond)

* 일정 시간의 간격을 가지고 함수를 반복적으로 실행한다. 
* 임의의 타이머 ID를 리턴한다. 

``` javascript
    setInterval(function () {
    console.log('1초마다 실행');
    }, 1000);
```

## clearInterval(timerId)

* 반복 실행 중인 타이머를 종료한다. 
``` javascript
    const timer = setInterval(function () {
    console.log('1초마다 실행');
    }, 1000);
    clearInterval(timer);
```
