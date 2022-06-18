# Intro

* Next.js는 실제 제품 단계 수준 프로페셔널 react.js 어플리케이션 빌드에 도움을 준다.
  
## install & run 

```shell
❯ npx create-next-app@latest {project name} -- 최신 버전
```

```shell
❯ npm run dev

> nextjs-intro@0.1.0 dev
> next dev

ready - started server on 0.0.0.0:3000, url: http://localhost:3000
wait  - compiling...
event - compiled client and server successfully in 843 ms (125 modules)
```

## Library vs Framework

`/pages/index.js`

* `index` 파일에 들어간 내용이 home에서 나타난다.
* `Library`
  * 개발자가 라이브러리르 불러와서 코드를 작성한다.
  * 원하는대로 코드를 작성하고 사용하고 싶을 때 사용할 수 있다.
* `Framework`
  * 개발자가 작성한 코드를 불러온다.
  * 코드를 적절한 위치에 작성하면 동작하게 한다.
* `create-react-app` 의 경우
  * 프로젝트를 만들면 `index.js` 파일이 자동으로 만들어진다.
  * 항상 App component가 자동으로 만들어진다.
* `create-next-app` 의 경우
  * `routes` 등을 지정할 수 없다.
  * `/pages` 에서 만들기만 할 수 있다.
  * `/pages/about.js` 파일을 만들면 `localhost:3000/about` 으로 접속했을 때 작성한 파일을 볼 수 있다. 

## Pages 

* 파일의 이름으로 URL을 만든다.
* router, routes, component import, render 등등 필요 없다.
* 파일 이름이 중요하다. 
  * 컴포넌트 이름은 중요하지 않다. 
* default export는 꼭 작성해야 한다.
* return 으로 jsx 컴포넌트 리턴 할 수 있다.
  * import 불필요

## Static Pre Rendering

* Next에서는 페이지들이 static 으로 미리 생성된다.
* `create-react-app`의 경우
  * client-side render 하는 앱
  * 브라우저가 모든 UI를 만든다
  * HTML 소스 코드 안에 들어가지 않는다.
  * client-side javascript가 페이지를 만든다.
  * 인터넷 연결 환경이 좋지 않으면 빈 화면이 나온다.
* `next.js`
  * 실제 HTML이 소스코드에 나타난다.
  * 유저 인터넷 연결 환경이 좋지 않아도 HTML을 볼 수 있다.
  * 로딩할 때 script를 로딩하는데 
  * hydration
    * react.js를 프론트엔드 안에서 실행하는 것
  * javascript를 해제하더라도 html은 로딩된다. 
  * 구글과 같은 검색엔진에 좋다.
  * 사용자가 기다리는 시간이 줄어든다. 

## Routing

`/components/NavBar.js`

* anchor tag를 이동하는데 사용하지 말라는 에러가 뜬다.
  * Next.js에 이미 a tag가 존재한다.
  * a href 로 이동하면 전체가 새로고침 된다.
  * 느려질 수 있다.

```jsx
    <nav>
        <Link href="/"><a>Home</a></Link>
        <Link href="/about"><a style={{color:"red"}}>About</a></Link>
    </nav>
```

* Link를 사용하면 더 빠르고 새로고침도 되지 않는다.
* Link를 통해 props를 전달할 수 있다.
* `const router = useRouter()`
  * location에 대한 정보를 얻을 수 있다. 
  * location 조건에 따라 다른 이벤트를 실행할 수 있다. 

## CSS Modules

`/components/NavBar.module.css`

* css 스타일을 적용하는 방법은 많다.
  * style={{}} 등
* module.css 를 사용하는 방법이 있다. 
* `import styles from './NavBar.module.css'` css 모듈
* className을 추가해줄 때 자바 스크립트 오브젝트 프로퍼티로 적용하게 한다.
* 여러 개의 스타일을 적용할 땐 하나의 문자열처럼 이어붙여서 만든다.
  * ` <a className={`${style.link} ${router.pathname === '/'? style.active:''}`}>Home</a></Link>`
  * 배열을 만들고 `join()`을 사용하여 문자열로 만들 수 있다.

## Styles.JSX

`/components/NavBar.js`

* css 파일을 따로 만들지 않고 component 파일에서 만들어 사용한다. 
* import를 하지 않아도 되고, 파일을 분리하지 않아도 된다.

```jsx
<style jsx>{`
        nav {
            background-color:yellow
        }`
    }
</style>
```
* className으로 적용할 수 있다. 
* 다른 컴포넌트에서 같은 이름을 사용하더라도 `<style jsx>` 태그가 들어간 컴포넌트에서만 적용된다. 

## Custom App

* 전역 style을 적용해야 할 때 `styled jsx`에 global props를 추가할 수 있다.
  * 다른 페이지로 넘어가면 적용이 안 된다. 
* App Component, App Page
  * 커스텀하려면 `_app.js` 파일을 만들어야 한다. 
  * Next.js에서는 다른 파일을 렌더링하기 전에 `_app.js` 파일을 확인한다. 
  * ` <div><Component {...pageProps}/></div>`
    * 사용자가 `/pages/`하단에 만든 컴포넌트를 props로 전달하여 랜더링한다.
    * `<style jsx>`를 사용하여 글로벌 스타일 적용을 할 수 있다. 
* 커스텀 App 컴포넌트에서는 모든 Global style을 import 할 수 있다. 