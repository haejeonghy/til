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

- setState로만 변경 가능하다.
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