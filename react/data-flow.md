# REACT Data flow

* **one-way data flow**  
* 컴포넌트는 props를 이용해 데이터를 argument 혹은 attribute처럼 전달받을 수 있다. 
* 부모 컴포넌트가 데이터를 전달하는 주체가 된다. 
  * 데이터 흐름이 하향식이다. 
* 자식 컴포넌트는 props를 통해 전달받은 데이터가 어디서 왔는지 알지 못한다. 
* 하나의 상태를 기반으로 두 컴포넌트가 영향을 받는다면 공통 소유 컴포넌트를 찾아 그 곳에 상태를 위치해야 한다. 

## Lifting state up

* 상위 컴포넌트의 상태가 하위 컴포넌트에 의해 변하는 경우
* state 끌어올리기 
* 상위 컴포넌트의 '상태를 변경하는 함수'를 하위 컴포넌트로 전달하고, 이 함수를 하위 컴포넌트가 실행하는 방법으로 해결한다. 

``` javascript

function ParentComponent() {
  const [value, setValue] = useState("날 바꿔줘!");

// 하위 컴포넌트로 전달할 값
  const handleChangeValue = (newValue) => {
    setValue(newValue);
  };

  return (
    <div>
      <div>값은 {value} 입니다</div>
      <ChildComponent handleButtonClick={handleChangeValue}  />
    </div>
  );

  // ...생략...
}

function ChildComponent({ handleButtonClick }) {
  const handleClick = () => {
    handleButtonClick('넘겨줄게 자식이 원하는 값')
    // handleChangeValue 실행됨
  }

  return (
    <button onClick={handleClick}>값 변경</button>
  )
}

```

[State와 생명주기](https://ko.reactjs.org/docs/state-and-lifecycle.html)
[React로 생각하기](https://ko.reactjs.org/docs/thinking-in-react.html)
