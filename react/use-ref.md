# useRef

* DOM element 주소 값 활용해야 하는 경우 react만 가지고 작성하기 어렵다. 
* 이 경우 useRef 사용하여 DOM 노드, element, react component 주소 값 참조할 수 있다. 
* useRef는 기본 특징인 선언적 프로그래밍 원칙과 배치되기 때문에 남용은 부적절하다. 
* useRef 사용하는 예외적인 경우
  * focus
  * text selection
  * media playback
  * 에니메이션 적용
  * d3.js, greensock 등 DOM 기반 라이브러리 활용

```javascript
const 주소값을_담는_그릇 = useRef(참조자료형)
// 이제 주소값을_담는_그릇 변수에 어떤 주소값이든 담을 수 있습니다.
return (
    <div>
    {/*주소 값은 re-render 되더라도 바뀌지 않는다. */}
      <input ref={주소값을_담는_그릇} type="text" />
        {/* React에서 사용 가능한 ref라는 속성에 주소값을_담는_그릇을 값으로 할당하면*/}
        {/* 주소값을_담는_그릇 변수에는 input DOM 엘리먼트의 주소가 담깁니다. */}
        {/* 향후 다른 component에서 input DOM 엘리먼트를 활용할 수 있습니다. */}
    </div>
  );s
```