# DOM

* Document Object Model
* html 요소를 Javascript Object 처럼 조작할 수 있는 Model
* html 파일의 `body` 태그 마지막에 `script` 태그로 삽입하여 조작
- `createDocumentFragment()`
    ```javascript
    // DOM 트리를 빌드하기 위해 DOM 노드를 추가할 수 있는 새 빈 공간
    // 다른 노드를 담는 임시 컨테이너 역할을 하는 특수 목적의 노드
        // 가상의 노드 객체로 메모리상에서만 존재하는 비문서 템플릿
    var fragment = document.createDocumentFragment(); 
    ```
- `<template>` 태그
  ```HTML
    // 추가되거나 복사될 수 있는 html 요소 정의할 때 사용
    // 페이지가 로드될 때 바로 렌더링되지 않고 나중에 해당 콘텐츠 복제한 후 보이도록 할 수 있음
    <template>
        <h3>모나리자</h3>
        <img src="/examples/images/img_monalisa.png" alt="모나리자">
    </template>
  ```

## CRUD
``` Javascript
    // 새로운 element 생성하여 변수에 할당
    const tweetDiv = document.createElement('div')
    // append 메소드 사용하여 body에 넣기
    document.body.append(tweetDiv)
    // querySelector 사용하여 element 조회
    const oneTweet = document.querySelector('.tweet')
    // 클래스가 tweet인 element 전부 찾기
    const tweets = document.querySelectorAll('.tweet')
    // element에 클래스 추가
    oneTweet.classList.add('tweet')
    // append했던 element 삭제
    oneTweet.remove()
```

## event

- 사용자 입력을 트리거로 발생한 이벤트 정보 담은 객체
- `onclick`, `onkeyup`, `onscroll` 등
- 이벤트 지정, `addEventListener` 차이
    - `onclick`
        - 이벤트를 걸어줄 때마다 기존의 이벤트 덮어씌워짐
    - `addEventListener`
        - 하나의 요소에 클릭 이벤트 누적해서 걸어줄 수 있음
- 이벤트 종류
    - `onsubmit`
        - 사용자가 데이터를 전송했을 때 발생하는 이벤트 핸들러
    - `onchange`
        - 변화가 생겼을 때 작동하는 이벤트
    - `onmouseover`
        - 요소에 마우스 커스를 올리면 작동하는 이벤트
    - `onkeyup`
        - 키보드 입력 시 동작 시점에 따라 발생하는 키보드 이벤트
- `event.preventDefault`
    - 어떤 이벤트를 명시적으로 처리하지 않은 경우 해당 이벤트에 대한 사용자 에이전트 기본 동작 실행하지 않도록 지정

## etc

- `element`, `node` 차이
    - `node` : 태그 노드, 텍스트 노드 전체
    - `element` : 텍스트 노드 제외 흔히 생각하는 태그만 해당
- `children`, `childNodes` 차이
    - `children` : 현재 요소의 자식 요소가 포함된 HTML collection 반환
        - 비 요소 노드 전부 제외
    - `childNodes` : 자식 노드에 직접 접근
        - 주석 노드 같은 비 요소 노드 포함
- `remove`, `removeChild` 차이
    - `remove` : 노드를 메모리에서 삭제하고 종료
    - `removeChild` : 메모리에 해당 노드는 그대로 존재하지만 부모 노드와의 부모-자식 관계를 끊어 DOM 트리에서 해제
- `appendChild()`
    - 지정된 부모 노드의 자식 목록 끝에 노드를 추가한다.
    - 주어진 자식이 문서의 기존 노드에 대한 참조일 경우 현재 위치에서 새 위치로 이동한다.
- `offSetTop` API
    - js 요소의 위치 구하기
    - 부모의 포지셔닝 정책에 따라 절대좌표 혹은 상대좌표가 나온다.
    - 부모 요소 안의 자식 요소의 상대 위치 구할 때 사용.
- `offSetWidth` API
    - 엘리먼트의 전체 크기 구할 때 사용
    - 엘리먼트의 패딩, 보더, 스크롤바 사이즈 포함한 값 리턴
- 유사배열
    - node나 else 처럼 `[]` 사용했지만 배열이 아닌 경우
    - 유사 배열의 경우 배열 메서드 사용할 수 없음
    - 유사배열을 배열로 바꾸기
    ```Javascript
        Array.from(document.querySelectorAll('#list > .item'))
        Array.slice(document.querySelectorAll('#list > .item'))
    ```