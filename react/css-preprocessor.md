# CSS Preprocessor

* CSS 전처리기
* CSS 구조화 하는 방법에 대한 연구
  * CSS를 작성하는 일관된 패턴의 필요성이 증가했다. 
  * 다양한 사이즈의 디스플레이 등장으로 CSS가 복잡해졌다.
  * CSS의 문제점을 변수, 함수, 상속 등의 프로그래밍 개념을 활용하여 해결할 수 있다. 
* CSS가 구조적으로 작성될 수 있게 도움을 주는 도구
  * 각 CSS 전처리기에 맞는 컴파일러를 사용해야 한다. 
  * 컴파일을 하면 실제로 사용하는 CSS 문서로 변환된다. 
  * CSS 파일을 몇 개의 작은 파일로 분리할 수 있다. 

## SASS 

* Syntactically Awesome Style Sheets
* CSS 확장 스크립팅 언어
  * CSS를 만들어주는 언어
  * javascript처럼 특정 속성의 값을 변수로 선언하여 필요한 곳에 선언된 변수를 적용할 수 있다. 
  * 반복되는 코드를 한 번의 선언으로 여러 곳에서 재사용할 수 있도록 해준다. 
* SCSS 코드를 읽어서 전처리 후 컴파일 해 전역 CSS 번들 파일을 만들어주는 preprocessor역할
* **스타일이 겹치는 문제 해결 목적 계층 구조 만들어내고 -> 용량이 지나치게 커짐**

## CSS 방법론

* 방법론 공통 지향점
  * 코드의 재사용
  * 코드의 간결화(유지 보수 용이)
  * 코드의 확장성
  * 코드의 예측성(클래스 명으로 의미 예측)
* 협업 중시

### BEM

* 대표적인 CSS 방법론
* `Block`, `Element`, `Modifier` 구분해 클래스명을 작성한다. 
  * `Block` : 전체를 감싸고 있는 block 요소
  * `Element` : 블럭이 포함하고 있는 한 조각
  * `Modifier` : 블럭 또는 요소의 속성
  * 각각 -와 __로 구분한다. `.header(block)__navigator(element)--navi-text(modifier)`  
  * BEM 방식 이름 재사용할 수 있게 해 HTML/CSS/SASS 파일에서 일관된 코딩 구조 만들어준다. 
* 단점
  * 클래스명 선택자가 장황해진다.
  * 마크업이 불필요하게 커진다.
  * 재사용하려고 할 떄마다 UI component를 명시적으로 확장해야 한다. 
  * 언어 로직 상에 캡슐화 개념이 없다.
  
## Styled Component

* 대표적인 CSS-in-JS
  * CSS의 component 영역으로 불러들이기 위해 등장했다. 
* 기능적(functional) 혹은 상태를 가진 component들로 부터 UI를 완전히 분리해서 사용할 수 있는 단순한 패턴을 제공한다. 
* react component 기반 개발 환경에서 CSS의 성능 향상을 위해 탄생했다. 
* 기존 CSS문법으로도 스타일 속성이 추가된 react component를 만들 수 있다. 
* 설치

```bash
# installation
# with npm
$ npm install --save styled-components

# with yarn 
$ yarn add styled-components
```

```json
// package.json에 추가
{
  "resolutions": {
    "styled-components": "^5"
  }
}
```

* 예시

```javascript
// javascript 변수 처럼 button을 만들고 스타일 속성을 정의함 
// back-ticks(``)
const Button = styled.a`
  display: inline-block;
  border-radius: 3px;
  padding: 0.5rem 0;
  margin: 0.5rem 1rem;
  width: 11rem;
`;
```

* **특징**
  * Automatic critical CSS
    * 화면에 어떤 component가 렌더링 되었는지 추적해서 해당하는 component에 대한 스타일을 자동으로 삽입한다. 
    * 코드를 적절히 분배해 놓으면 사용자가 어플리케이션을 사용할 때 최소한의 코드만으로 화면이 띄워지도록 할 수 있다.
  * No class name bugs
    * 스스로 유니크한 `className` 을 생성합니다.
    * className 의 중복이나 오타로 인한 버그를 줄여준다.
  * Easier deletion of CSS
    * 모든 스타일 속성이 특정 component와 연결되어 있기 때문에 만약 component를 더 이상 사용하지 않아 삭제할 경우 이에 대한 스타일 속성도 함께 삭제된다.
  * Simple dynamic styling
    * `className`을 일일이 수동으로 관리할 필요 없이 React 의 props 나 전역 속성을 기반으로 component에 스타일 속성을 부여하기 때문에 간단하고 직관적이다.
  * Painless maintenance
    * component에 스타일을 상속하는 속성을 찾아 다른 CSS 파일들을 검색하지 않아도 되기 때문에 코드의 크기가 커지더라도 유지보수가 어렵지 않다.
  * Automatic vendor prefixing
    * 개별 component마다 기존의 CSS 를 이용하여 스타일 속성을 정의하면 된다.
  * Tagged template literals ES6 문법 이용
    * component를 만들 때 해당 문법을 사용하여 component 스타일 속성을 정의하면 별도의 css 파일 없이도 스타일 속성을 가진 component를 만들 수 있다. 
  
    ```javascript
    import styled from "styled-components";

    // <h1> 태그를 렌더링 할 title component를 만듭니다.
    const Title = styled.h1`
      font-size: 1.5em;
      text-align: center;
      color: palevioletred;
    `;

    // <section> 태그를 렌더링 할 Wrapper component를 만듭니다.
    const Wrapper = styled.section`
      padding: 4em;
      background: papayawhip;
    `;

    export default function App() {
      // 일반적으로 component를 사용하는 것처럼 Title과 Wrapper를 사용하시면 됩니다!
      return (
        <Wrapper>
          <Title>Hello World!</Title>
        </Wrapper>
      );
    }

    ```
  * Adapting based on props & Extending Styles
    * 스타일 속성을 지닌 component를 정의할 때 함수를 전달하고 그 안에서 props를 사용할 수도 있다. 
    * 해당 component는 props로 전달된 속성을 우선 적용하고, 전달되는 속성이 없다면 기본으로 설정된 속성을 적용한다. 

    ```javascript
    // Button component
    ...
      // background, color 속성 props 전달 여부에 따라 컬러값 정의한다. 
      background: ${(props) => (props.primary ? "palevioletred" : "white")};
      color: ${(props) => (props.primary ? "white" : "palevioletred")};
    ...

    // App component
    ...
      <Button>Normal</Button>
      <Button primary>Primary</Button>
    ...

    // 기존의 Button component에 Tomato component만을 위한 새로운 속성 추가
    const Tomato = styled(Button)`
      color: tomato;
      border-color: tomato;
    `;
    ```