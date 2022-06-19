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
```js
import NavBar from "../components/NavBar";
import Head from "next/head"
import Header from "../components/Header";

export default function Home() {
    return (
        <div>
            {/* html header에 들어가는 부분 */}
            <Header/>
            <NavBar/>
            <h1>Hi</h1>
        </div>
    )
}

```

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

```js
import Link from "next/link";
import {useRouter} from "next/router"
// import styles from './NavBar.module.css'
export default function NavBar() {
    const router = useRouter()

    return (
        <nav>
            {/* <nav className={styles.nav}> */}
            <Link href="/">
                    {/* <a className={`${styles.link} ${router.pathname === '/'? styles.active:''}`}>Home</a>> */}
            </Link>
            <Link href="/about"><a>About</a></Link>
            <style jsx>{`
                    nav {
                        background-color:yellow
                    }`
                }
            </style>
        </nav>
    )

}

```

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
```js
import Layout from "../components/Layout";

export default function App({Component, pageProps}) {
    // 사용자가 작성한 리턴에 추가로 다른 컴포넌트를 렌덩힌다.
    return <Layout><Component {...pageProps}/></Layout>
}
```

## Patterns

* `/components/Layout.js`

```js
// children -> component를 다른 component에 넣을 때 사용
export default function Layout({children}) {
    return 
    <>
        <NavBar/>
        <div>{children}</div>
    </>
}
```
```js
// _app.js
import Layout from "../components/Layout";

export default function App({Component, pageProps}) {
    // 사용자가 작성한 리턴에 추가로 다른 컴포넌트를 렌덩힌다.
    return <Layout><Component {...pageProps}/></Layout>
}
```
* 이런 패턴을 많이 사용한다. 
* Layout에 component style을 적용한다. 
* `/components/Header.js`
  * `import Head from "next/head"` 
  * 엘리먼트 추가용 내장 컴포넌트 노출
* Header를 공통으로 사용하기 위해 컴포넌트로 분리하고 사용하기
  * props로 데이터 전달 가능
```js
import Head from "next/head"
export default function Header({title}) {
    return (
        <Head>
            <title>{title} | Next Movies</title>
        </Head>
    )
}
```

## Fetching Data 

* `/public/`
  * 아이콘 이미지 같은 걸 여기서 관리한다. 
* `/next/image`
  * 사용하여 이미지 태그 사용 가능
* Next.js 사용해서 API 키를 숨길 수 있다. 
  * API KEY 를 숨기지 않고 사용하면 다른 사람들이 발견할 수 있다.

```js
//index.js
import NavBar from "../components/NavBar";
import Head from "next/head"
import Header from "../components/Header";
import useState from 'react' // useState를 사용하지 않으면 임포트할 필요 없음


const API_KEY - "apikey"
const [movies, setMovies] = useState()

export default function Home() {

useEffect(() => {

  async () => {
    const { results } = await (
      await fetch (
        await fetch(`https://api.themoviedb.org/3/movie/popular?apiKey=${API_KEY}`)
      ).json()
      console.log(results) // 필요한 데이터만 맵핑할 수 있음
      setMovies(results)
    )
  }
}, [])

return (
        <div>
            {/* html header에 들어가는 부분 */}
            <Header/>
            <NavBar/>
            <h1>Hi</h1>
            {!movies && <h4>loading...</h4>}
            {movie?.map(return movie components)}
        </div>
    )
}
```

## Redirect and Rewrite

* API Key를 숨겨서 사용해야 한다. 
* 크롬 inspector에서 api key가 드러난다.
* `next.config.js`
  
```js
//next.config.js
async redirects() {
  return [
    {
      source: "/contact".
      destination: "/form"
      permanent: false // 영구적 여부
    }
  ]
}
```
* 적용하려면 재시작해야 한다. 
  * contract로 가면 form으로 리다이렉트된다.
* 패턴 매칭 가능

```js
//next.config.js
async redirects() {
  return [
    {
      source: "/old-blog/:path", // 예전 주소에서 새 주소로 리다이렉트 가능
      destination: "/new-blog/:path",
      permanent: false // 영구적 여부
    }
  ]
}
```

* rewrite()
  * 유저를 리다이렉트 시키지만 URL은 유지된다.
```js
//next.config.js
async rewrite() {
  return [
    {
      source: "/api/movies/", // source 주소로 입력하면 사용자가 apikey를 볼 수 없다.
      destination: `https://api/movies${apikey}`,
      permanent: false // 영구적 여부
    }
  ]
}
```
* dotenv env로 키 관리할 수 있다.
  * config에서도 env로 가져와서 노출되지 않을 수 있다.

## Server Side Rendering

* reload할 때 page를 HTML 형태로 프리렌더링한다.
  * html이 초기 상태이다.
  * Loading 같은 걸 넣을 수 있다.
* 사용자들이 로딩을 넣는 게 싫을 경우 API가 모두 로딩된 후에 화면을 랜더링할 수 있다.

```js
//index.js
// 이 이름을 사용해야 한다.
export async function getServerSideProps() {
  // server에서만 작동한다 sever side only
  // API KEY를 여기서 사용하면 백엔드에서만 사용하기 때문에 클라이언트에서 노출되지 않는다. 
  const {result} = await (await fetch(`/api/movies`)).json()
  return {
    props: { // 원하는 데이터를 넣을 수 있다
      results, 
    }
  }
}
// 서버에서 요청한 데이터를 다 받은 다음에 Home으로 전달한다
export default function Home({result}){

}
```

* 데이터가 유효할 때만 화면을 보여준다.
  * 데이터를 불러오기 전에는 빈 화면만 보인다.

## Dynamic Routes

* URL에 데이터 넣기
  * /movie/123 등
* Next.js 에는 라우터가 없다. 
  * /movies/all/
    * /pages/movies/all.js 파일을 만든다.
    * localhost://movies/all 로 접속하면 이 페이지로 이동한다.
    * /movies url을 사용하고 싶다면
      * index.js에 넣어준다. 
      * /pages/movies/index.js 를 만든다. 
      * 중첩 라우터와 유사하다.
* parameter를 만들 때
  * /movies/[id].js 파일을 만든다.
  * /movie/123 등의 URL로 접속할 때 나오는 페이지이다. 

## Details

```js
<Link  key={movie.id} href={`/movies/${movie.id}'}>
``` 
* router hook

```js
const router = useRouter();
// 자동으로 리다이렉트 할 수 있도록 제공
const onClick = (id) => {
  // 외부 URL의 경우 router.push를 사용할 필요가 없다. window.location 사용이 적절하다. 
  router.push(`/movies/${id}`)
  // 두 번째 방식
  router.push({
    pathname:`/movies/${id}`
    query: {
      titles: {`potato`} // 데이터를 전달할 수 있다. id를 숨길 수 있다. 
    }
  }
  , `movies/${id}`)
}
<div onClick={() => onClick(movie.id)}></div>
```

## Catch All

* /movies/[...id].js 으로 이름 변경하면
  * 다른 파라미터를 받으면서 파일에 접근할 수 있다. 
  * query가 스트링이 아닌 Array로 들어간다.
  
```js

const router = useRouter();
// 자동으로 리다이렉트 할 수 있도록 제공
const onClick = (id) => {
  // 외부 URL의 경우 router.push를 사용할 필요가 없다. window.location 사용이 적절하다. 
  router.push(`/movies/${title}/${id}`)
}
<Link href={`/movies/${movie.original_title}/${movie.id}`}>
</Link>
```
```js
//detail page
import {useRouter} from 'next/router'

export default function detail () {
  const router = useRouter()
  const [title, id] = router.query.param;
  return (
    <div>
      <h4>{router.query.title || "loading" }</h4>
    </div>
  )
}
```
```js
// [...params].js

export default function Detail({params}){
  const [title, id] = params || []
  return (
    <div>
      <h4>{title}</h4>
    </div>
  )
}

export function getServerSideProps({{params: []}}){
  return {
    props: {
      params
    }
  }
}
```

## 404 Page

* /pages/404.js 만들어서 커스텀