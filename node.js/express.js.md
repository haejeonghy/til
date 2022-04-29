# Express.js

* Node.js 환경에서 웹 서버, API 서버 제작 시 사용되는 프레임 워크
* middleware 추가가 편리하다. 
* 자체 라우터를 제공한다. 
  * Routing : method와 URL로 분기점을 만드는 것

```javascript
// router level middleware
const router = express.Router()

// url 분기점
router.get('/lower', (req, res) =>{
  res.send(data)
})

router.post('/lower', (req, res) =>{
  // do something
})

// 20x번대의 경우 데이터 없이 응답을 보내야 text도 전달됨
res.status(205).end("Logged out successfully")
// 그 외의 경우 send() 사용함

```

## Middleware

* request에 필요한 기능을 더하거나, 문제를 걷어내는 역할
* req, res, req-res 사이클 도중 그 다음 middleware 함수에 대한 엑세스 권한을 갖는 함수
* 클라이언트에게 요청이 오고, 그 요청을 보내기 위해 응답하려는 중간에 목적에 맞게 처리를 하는 함수
* `next()`로 다음 middleware로 현재 요청 넘길 수있다. 
  * 순차적으로 처리된다. 
* middleware 유형
  * 어플리케이션 레벨 middleware
    * app.use(), app.METHOD()등 이용하여 app object instance에 바인드 시킨다. 
    * middleware를 어플리케이션 영역에서 지정한 path대로 처리 가능하게 하도록 한다. 
  * 라우터 레벨 middleware
    * router.use(), router.METHOD()등 사용하여 로드한다. 
    * 특정 root url 기점으로 기능이나 로직 별로 라우팅을 나눠서 관리할 수 있다. 
  * 오류 처리 middleware
  * 써드파티 middleware
* 수행할 수 있는 기능
  * 모든 코드를 실행
  * 요청 및 응답 오브젝트에 대한 변경을 실행
  * 요청-응답 주기를 종료
  * 스택 내의 그 다음 middleware 함수를 호출
* 사용하는 상황
  * 모든 요청에 대해 url 이나 method를 확인할 때
  * POST 요청 등에 포함된 body(payload)를 쉽게 얻어내고자 할 때
  
  ```javascript
    // body-parser middleware
    const bodyParser = require('body-parser')
    const jsonParser = bodyParser.json()
    // 생략
    app.post('/api/users', jsonParser, function (req, res) {
    // req.body에는 JSON의 형태로 payload가 담겨져 있습니다.
    })
  ```
  
  * 모든 요청/응답에 CORS 헤더를 붙여야 할 때

    ```javascript
    // cors middleware
    const cors = require('cors')
    // 생략
    app.use(cors()) // 모든 요청에 대해 CORS 허용
    ```
  
  * 요청 헤더에 사용자 인증 정보가 담겨있는지 확인할 때