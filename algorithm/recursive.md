# Recursion

* 어떤 문제를 동일한 구조의 더 작은 문제로 나누고, 작은 문제를 해결함으로써 전체 문제를 해결하는 방법이다.
* 재귀 함수 구상 순서
  1. 기존의 문제에서 출발하여 더 작은 경우를 생각하기 
  2. 같은 방식으로 문제가 더 작아지지 않을 때까지 더 작은 경우를 생각하기
  3. 문제가 간단해져서 바로 풀 수 있게 되는 순간부터 앞서 생성한 문제를 차근차근 해결하기
* 간결하고 유지 보수가 쉬운 코드를 만들 수 있다.

``` javascript
  function recursive(input1, input2, ...) {
    // Base Case : 문제를 더 이상 쪼갤 수 없는 경우 탈출한다. 
    if (문제를 더 이상 쪼갤 수 없을 경우) {
      return 단순한 문제의 해답;
    }
    // recursive Case
    // 그렇지 않은 경우
    return 더 작은 문제로 새롭게 정의된 문제
    // 예1. someValue + recursive(input1Changed, input2Changed, ...)
    // 예2. someValue * recursive(input1Changed, input2Changed, ...)
  }
```

## Tail Recursion

* 꼬리 재귀
* 재귀 호출이 끝나면 아무 일도 하지 않고 결과만 바로 반환되도록 하는 방식이다. 
* 이전 함수의 상태를 유지하지도 않고 추가 연산을 하지도 않는다. 
* 함수의 마지막에서 실행되고, return 되기 전에 값이 정해진다.
* 호출 당한 함수의 결과값이 호출하는 함수의 결과값으로 반환된다.

``` javascript
  function factorial(n, acc) {
    if(n === 1){
      return acc
    }
    return factorial(n-1, acc*n)
  }
  factorial(n, 1)
```

## Tower of Hanoi
원판 옮기기 문제

``` javascript
  function solution(n) {
    const answer = []

    function hanoi(n, from, to) {
      const by = 6 - from - to;
      if (n === 1){
        answer.push([from, to])
      } else {
        hanoi(n-1, from, by)
        answer.push([from, to])
        hanoi(n-1, by, to)
      }
    }
    hanoi(n, 1, 3)
  }
  return answer
```

