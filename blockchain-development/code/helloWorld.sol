// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract HelloWorld {
        // 함수가 실행되는 동안 greeting 변수를 사용할 수 있습니다.
        // 함수가 끝까지 실행되면 greeting 변수의 값을 반환합니다.
        // 스토리지를 읽거나 쓰지 않기 때문에 pure 키워드를 추가한다.
    function renderHelloWorld () public pure returns (string memory greeting) {
        greeting = "Hello World!"; 
    }
}