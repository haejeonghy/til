# Effect Hook

## Side Effect
* 함수 내에서 어떤 구현이 함수 외부에 영향을 끼치는 경우

``` javascript
let foo = 'hello';

// side effect 발생시킴
function bar() {
    // 함수 외부에 있는 변수를 변경함
  foo = 'world';
}

bar();
```

* Pure Function
  * 순수 함수
  * 함수의 입력만이 함수의 결과에 영향을 주는 함수
  * 입력으로 전달된 값을 수정하지 않는 함수

``` javascript
    function upper(str) {
        return str.toUpperCase(); // toUpperCase 메소드는 원본을 수정하지 않습니다 (Immutable)
    }

    upper('hello') // 'HELLO'
```

## Effect Hook

* 클래스 기반 구현 없이 side effect 구현 가능
* 최상위에서만 호출해야 한다. 
* react 함수 안에서 호출해야 한다. 
  
### 첫 번째 인자 : 함수

  * 해당 함수 내에서 side effect 실행
  * `useEffect`로 렌더링 되는 경우
    * 컴포넌트 생성 후 처음 화면 로딩
    * 컴포넌트에 새로운 props가 전달됨
    * 컴포넌트에 state가 바뀜
  
``` javascript
import { useEffect, useState } from "react";
import "./styles.css";

export default function App() {
  const proverbs = [
    "좌절감으로 배움을 늦추지 마라",
    "Stay hungry, Stay foolish",
    "Memento Mori",
    "Carpe diem",
    "배움에는 끝이 없다"
  ];
  // state 선언
  const [idx, setIdx] = useState(0);

// side effect 일으키는 함수 
  const handleClick = () => {
    setIdx(idx === proverbs.length - 1 ? 0 : idx + 1);
  };

  return (
    <div className="App">
      <button onClick={handleClick}>명언 제조</button>
      <Proverb saying={proverbs[idx]} />
    </div>
  );
}

function Proverb({ saying }) {
  useEffect(() => {
    document.title = saying;
  });
  return (
    <div>
      <h3>오늘의 명언</h3>
      <div>{saying}</div>
    </div>
  );
}

```

### 두 번째 인자 : 배열

* 조건을 담고 있는 배열
  * 조건 : 어떤 값의 변경이 일어날 때
  * 해당 배열에는 '어떤 값'의 목록이 들어간다. 
* 종속성 배열
  
* 배열이 빈 배열일 경우
  * `useEffect(함수, [])`
  * 컴포넌트가 처음 생성될 때에만 함수가 실행된다. 
  * 처음 외부 API를 통해 리소스를 받아오고 더이상 API 호출이 필요하지 않을 떄에 사용할 수 있다. 
* 배열을 넣지 않을 경우 
  * `useEffect(함수)`
  * 컴포넌트가 처음 생성되거나, props가 업데이트 되거나, state가 업데이트 될 때 함수가 실행된다. 

```javascript
import { useEffect, useState } from "react";
import "./styles.css";
import { getProverbs } from "./storageUtil";

export default function App() {
  const [proverbs, setProverbs] = useState([]);
  const [filter, setFilter] = useState("");
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log("언제 effect 함수가 불릴까요?");
    const result = getProverbs(filter);
    setProverbs(result);
    // 조건 들어간 filter -> 타이핑 할 때마다 변경됨
  }, [filter]);

  const handleChange = (e) => {
    setFilter(e.target.value);
  };

  const handleCounterClick = () => {
    setCount(count + 1);
  };

  return (
    <div className="App">
      필터
      <input type="text" value={filter} onChange={handleChange} />
      <ul>
        {proverbs.map((prvb, i) => (
          <Proverb saying={prvb} key={i} />
        ))}
      </ul>
      <button onClick={handleCounterClick}>카운터 값: {count}</button>
    </div>
  );
}

function Proverb({ saying }) {
  return <li>{saying}</li>;
}

```
``` javascript
// useEffect 사용하여 filter 조건이 바뀔 때마다 fetch로 서버에 데이터 호출
useEffect(() => {
  fetch(`http://서버주소/proverbs?q=${filter}`)
    .then(resp => resp.json())
    .then(result => {
      setProverbs(result);
    });
}, [filter]);
```