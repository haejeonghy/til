# React

* 프론트엔드 개발을 위한 javascript 오픈 소스 라이브러리
* 특징
  * **선언형**
    * html/css/js를 하나의 파일에서 작성한다.
    * jsx를 활용하여 직관적으로, 명시적으로 작성한다.
  * **component 기반**
    * 하나의 기능 구현을 위해 여러 종류의 코드를 묶은 것
    * 서로 독립적이고 재사용 가능하기 때문에 기능 자체에 집중하여 개발할 수 있다.
  * **범용성**
    * Learn once, Write Anywhere
    * javascript 프로젝트 어디에서든 유연하게 사용 가능하다.
    * react-native로 모바일 개발 가능하다.

## Create React App

* React SPA : 쉽고 빠르게 개발할 수 있도록 만들어진 툴 체인
``` bash
    npx create-react-app 프로젝트명
```

## JSX

* 하나의 element에 모든 element가 포함된다.
* class 사용 시 `className`으로 표기한다.
* 내부에서 javascript 사용 시 중괄호 이용한다.
```jsx
    function App() {
        const name = 'harry potter'
        return (
            <div>
                Hello, {name}
            </div>
        )
    }
```
* react element는 대문자로 시작해야 한다.
  * 사용자 정의 component
  * 소문자로 시작하면 일반 html element로 인식한다.
* 조건부 렌더링은 삼항연산자 이용한다.
```jsx
    <div>
        {
            (1 === 1) ? (<p>yes</p>) : (<p>no</p>)   
        }
    </div>
```
* 여러 개의 html element 표시할 때 `map()` 사용한다.
``` jsx
    const content = posts.map((post) => 
    // 반드시 element에 key 속성 추가
        <div key={post.id}>
            <h3>{post.title}</h3>
            <p>{post.content}</p>
        </div>
    );
```

## 구성 

* index.js
  * 메인 프로그램
  * 여기에서 HTML 템플릿 및 JavaScript의 컴포넌트를 조합하여 렌더링하고 실제 표시한다.
* App.js
  * 컴포넌트를 정의하는 프로그램이다. 
  * 실제로 화면에 표시되는 내용 등은 여기에서 정의된다.
* index.html
  * 메인 프로그램인 index.js에 대응되는 것으로, HTML 템플릿 파일이다. 
  * 이 파일이 직접 표시되는 것은 아니고, index.js에 의해 일어 와서 렌더링된 결과가 표시된다. (index.html 이름을 바꿀시 오류발생)