# SPA

* 새로운 페이지 로딩 시 전체 페이지를 새로 불러오는 방식이다.
  * 불필요한 트래픽 발생한다.
  * 반응성이 느리다.
* 업데이트에서 필요한 데이터만 서버에서 전달받아 javascript가 html 요소 생성해서 화면에 보여주는 방식 개발
  * 장점
    * 사용자 액션에 빠르게 반응한다.
    * 트래픽 과부하 줄일 수 있다.
    * 화면 일부만 렌더링 해 더 나은 사용자 경험 제공한다.
  * 단점
    * 첫 화면 로딩 시간이 길다.
    * 검색 엔진 최적화가 좋지 않다.

## Router

* Routing : 다른 주소에 따라 다른 뷰를 보여주는 과정
* React Router 라이브러리를 사용한다. 
``` javascript
    import { BrowserRouter, Switch, Route, Link } from "react-router-dom"
```
  * `<BrowserRouter>` : 라우터 역할
  * `<Switch>`
  * `<Route>`
  * `<Link>` : 경로 변경

``` javascript
    function App () {
        return (
        {/* BrowserRouter로 감싸고 */}
        <BrowserRouter>
            <div>
                <nav>
                <ul>
                    <li>
                        {/* 이동할 경로 연결 */}
                        <Link to="/">Home</Link>
                    </li>
                    <li>
                        <Link to="/about">MyPage</Link>
                    </li>
                    <li>
                        <Link to="/dashboard">Dashboard</Link>
                    </li>
                </ul>
                </nav>
                {/* 바뀐 component 보여줄 영역 */}
                <Switch>
                    {/* 경로 설정 */}
                    <Route exact path="/">
                        {/* component 연결 */}
                        <Home />
                    </Route>
                    <Route path="/about"> 
                        <MyPage /> 
                    </Route>
                    <Route path="/dashboard">
                        <Dashboard />
                    </Route>
                </Switch>
            </div>
        </BrowserRouter>
        )
    }
    export default App;

```