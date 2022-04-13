# Redux

* javascript 라이브러리
* react 없이도 사용할 수 있다. 
* 컴포넌트와 state를 분리하는 패턴을 위해 사용된다. 
  * component와 state가 합쳐지면 state를 주고받을 때 해당 state를 사용하지 않는 노드도 props로 전달해야 한다.
  * state 관리가 복잡해진다. 

## Redux 3대 원칙

* Single Source of truth
  * 동일한 데이터는 한 곳에서만 가져온다. 
  * state를 저장하는 store는 하나이다. 
* State is read-only
  * action 객체를 통해 state를 변경할 수 있다. 
* Changes are made with pure functions
  * 순수 함수로만 변경이 가능하다. 

## Redux 구성

* action -> dispatch -> state
* store
  * 상태가 관리되는 하나의 공간
  * component는 store에 접근해서 state를 가져올 수 있다. 

```javascript
// reducer 연결
const store = createStore(rootReducer);
```

* action
  * store에게 state 데이터를 운반해준다. 
  * type 지정 필수
  * payload 데이터를 포함한다. 

```javascript
// type 필수, payload 선택
{ type: ‘ADD_TO_CART’, payload: request }
```

* reducer
  * 현재 state와 action을 이용해 다음 상태를 만들어낸다. 
  * immutability 불변성을 지켜야 한다. 
    * Object.assign 이용해 새로운 객체를 만들어 리턴하는 방식

```javascript
// 현재 state와 action 이용해 새로운 state 만들어내는 순수 함수
const itemReducer = (state = initialState, action) => {
  switch (action.type) {
    case ADD_TO_CART:
      return Object.assign({}, state, {
        cartItems: [...state.cartItems, action.payload]
      })
    default:
      return state;
  }
}
```

## 장점

* 상태 예측이 가능하다. 
* 유지보수가 쉽다.
* 디버깅에 유리하다.
* 테스트를 붙이기 쉽다. 

https://www.robinwieruch.de/react-redux-tutorial/

https://facebook.github.io/flux/docs/in-depth-overview/

https://redux.js.org/faq/immutable-data

## Redux Hooks

* `useSelector()`
  * component와 state 연결
  * component에서 useSelector 사용하여 store state 접근할 수 있다. 
  * 전달 인자로 콜백 함수를 받는다.
    * 콜백 함수의 전달 인자로 state 값이 들어간다. 
* `useDispatch()`
  * action 객체를 reducer로 전달해준다. 

## redux-thunk

* redux 비동기 작업 처리
* 비동기 액션 생산자
  * 상태에 따라 동기 액션 생산자를 호출한다. 
    * 상태 : 비동기 요청 시작/완료/실패 포함
  * reducer로 연결되지 않고 직접 dispatcher를 통해 store로 새로운 상태를 보내준당.
  * 함수 dispatch 할 때는 해당 함수에서 dispatch와 getState를 파라미터로 받아와야 한다. 
    * thunk : 이 함수를 만드는 함수  