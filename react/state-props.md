# State

- 살면서 변할 수 있는 값이다.
- component의 사용 중 component 내부에서 변환하는 값이다.
  
```javascript
// import로 불러오기
import React, { useState } from "react";
import "./styles.css";

function CheckboxExample() {

    // isChecked, setIsChecked -> useState 리턴값 구조 분해할당 변수
    // [state 저장 변수, state 갱신 함수] = useState(상태 초기 값)

    const [isChecked, setIsChecked] = useState(false);
    // 윗 코드를 풀어 쓰면 이런 내용임
    const stateHookArray = useState(false);
    isChecked = stateHookArray[0]
    setIsChecked = stateHookArray[1] 이랑 같음

    // onchange로 이벤트 받을 때마다 state 변경함
    const handleChecked = (event) => {
        setIsChecked(event.target.checked);
    };

    return (

    <div className="App">
        <input type="checkbox" checked={isChecked} onChange={handleChecked} />
        {/*저장된 값 사용하기 삼항 연산자 / 새로 렌더링함 */}
        <span>{isChecked ? "Checked!!" : "Unchecked"}</span>
    </div>
    );
}

export default CheckboxExample;
```

- `setState`로만 변경 가능하다.
- react component는 state가 변경되면 새롭게 호출되고 리렌더링된다.
- controlled component
    - react가 state 통제할 수 있는 component

# Props

- component의 속성이다.
- 웹 어플리케이션에서 해당 component가 가진 속성이다.
- 변하지 않는 값이다.
- 부모 component(상위 component)로부터 전달받은 값이다.
- 리액트 component는 javascript 함수와 클래스로 props를 함수의 전달 인자처럼 전달 받아 이를 기반으로 화면에 어떻게 표시되는지 기술하는 리액트 엘리먼트 반환한다.
    - component가 최초 렌더링 될 때 화면에 출력하고자 하는 데이터를 담은 초기값으로 사용 가능하다.
- 객체 형태이다.
- 읽기 전용이므로 함부로 변경할 수 없다. 
- 사용 방법
  1. component에 전달하고자 하는 값과 속성 정의
  2. Props 이용하여 정의된 값과 속성 전달
  3. 전달받은 props 렌더링

```javascript
function Parent() {
	return (
		<div className="parent">
			<h1>I'm the parent</h1>
			<Child />
		</div>
	);
};

// 함수에 인자 전달하듯 component에서 전달받음
function Child(props) {
	return (
		<div className="child">
		// 키와 밸류 전달받듯 받아서 dot donation으로 접근하기 렌더링
			<p>{props.text}</p>
		</div>
	);
};

// 값 할당
<Child attribute={value} />
// text 속성 선언, 문자열 값 할당
<Child text={"I'm the eldest child"} /> //여는 태그, 닫는 태그로도 전달 가능

function Parent() {
	return (
	<div className="parent">
		<h1>I'm the parent</h1>
		<Child>I'm the eldest child</Child>
	</div>
	);
};

function Child(props) {
	return (
	<div className="child">
		// 여러개 전달해도 됨 렌더링
		<p>{props.children}</p>
	</div>
	);
};
```

## react로 사고하기

1. UI를 component 계층 구조로 만들기
   1. 단일 책임 원칙 : 하나의 component는 하나의 일만 한다. 
2. react를 정적인 버전으로 만들기
   1. `props`를 이용하여 데이터를 넘겨준다.
3. UI state에 대한 최소한의 표현 나타내기
4. state가 어디 있어야 할지 찾기
5. 역방향 데이터 흐름 추가하기

### 상태 위치에 따른 구분

* 로컬
  * 특정 component 안에서만 관리되는 상태
  * 다른 component와 데이터를 공유하지 않는 폼 상태 
* 전역
* 프로덕트 전체 혹은 여러 component에서 관리되는 상태 
* 지양하는게 좋지만 경우에 따라 필요하다. 
* 한 곳에서만 상태를 업데이트하고 서로 다른 출처에서 가져오는 것을 지양한다. 
* 동일한 데이터는 항상 같은 곳에서 데이터를 가지고 와야한다. 
  * 신뢰할 수 있는 단일 출처 single source of truth 
  * 데이터 무결성 : 데이터 정확성 보장 위해 데이터 변경이나 수정시 제한 두어 안정성 저해하는 요소 막고 데이터 상태들 항상 옳게 유지하는 것
* 사용 예: 라이트/다크모드, 국제화, undo/redo

### 상태 관리 툴

* react context
* redux
* mobx
* 상태 관리 라이브러리
  * 전역 상태 저장소를 제공한다. 
  * props drilling 문제를 해결한다.
    * props drilling : 해당 데이터를 사용하지 않는 중간 노드도 하위 component에 데이터를 전달하기 위해 props를 만들어 자식 component로 넘겨줘야 했다. 
  * 반드시 상태 라이브러리를 써야 하는 것은 아니다. 