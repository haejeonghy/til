# Token-base Authentication

* 토큰 기반 인증
* 클라이언트에 인증 정보를 보관하는 방법
* 토큰은 유저 정보를 암호화한 상태로 담을 수 있고, 암호화했기 때문에 클라이언트에 담을 수 있다. 
* 장점
  * Statelessness & Scalability
    * 무상태성 & 확장성
    * 서버가 클라이언트에 대한 정보를 저장할 필요가 없다.
    * 클라이언트가 새로운 요청을 보낼 때마다 토큰을 헤더에 포함시켜 사용할 수 있다.
    * 서버를 여러 개 사용하는 서비스에서 유용하다.
  * 안전하다.
    * 암호화 한 토큰을 사용하고 암호화 키를 노출할 필요가 없기 때문에 안전하다.
  * 어디서나 생성 가능하다.
    * 토큰을 확인하는 서버가 토큰을 만들 필요는 없다. 
    * 토큰 생성용 서버를 만들거나, 다른 앱에서 만든 토큰을 사용할 수 있다.
  * 권한 부여에 용이하다.
    * 토큰의 payload에 어떤 정보에 접근 가능한지 정할 수 있다. 

## JWT

* JSON Web Token
* 클라이언트가 처음 인증을 받게 될 때 access, refresh token을 받는다.
* 권한 부여에 유용하다.
  * A앱이 B앱과 연동되어 정보를 읽어와야 할 경우 B앱에서 로그인하고 발급받은 JWT을 A앱에서 사용할 수 있다.
* Access Token
  * 보호해야 하는 정보에 접근할 수 있는 권한 부여에 사용된다. 
  * 권한은 부여에 사용된다.
  * 보안을 위해 유효기간이 짧다.
* Refresh Token
  * access token 유효 기관이 만료되면 refresh token으로 새 access token을 발급받는다. 
    * 새로 발급받아도 유저가 로그인을 다시 할 필요는 없다. 
  * access token에 비해 유효기간이 길지만 보안을 위해 사용하지 않는 경우가 많다.

### JWT 구조

* `aaaaaa.bbbbbb.cccccc`
  * `aaaaaa` header
    * 어떤 종류의 토큰인지, 암호화할지 적혀있다.

    ```json
        {
            "alg": "HS256",
            "typ": "JWT"
        }
        // 이 객체를 base 64형태로 인코딩하면 JWT의 첫 번째 부분이 완성된다.
    ```

  * `bbbbbb` payload
    * 정보가 담겨있다.
    * 어떤 정보에 접근 가능한지 권한을 담을 수 있다.
    * 사용자의 유저 정보 등 필요한 데이터는 여기서 암호화한다.
    * 민감한 정보는 담지 않는 것이 좋다. 

    ```json
        {
            "sub": "someInformation",
            "name": "phillip",
            "iat": 151623391
        }
         // 이 객체를 base 64형태로 인코딩하면 JWT의 두 번째 부분이 완성된다.
    ```

  * `cccccc` signature
    * header와 payload를 인코딩하여 완성하면 salt를 사용하여 암호화한다.
    * `HMACSHA256(base64UrlEncode(header) + '.' + base64UrlEncode(payload), secret);`
      * HMAC SHA256으로 암호화 할 경우

### JWT 토큰 사용

```javascript
  // jsonwebtoken 라이브러리 사용하여 토큰 생성
  const jwt = require('jsonwebtoken');
  const token = jwt.sign(토큰에_담을_값, ACCESS_SECRET, { 옵션1: 값, 옵션2: 값, ... });

  // jsonwebtoken 라이브러리 사용하여 토큰 해석
  const jwt = require('jsonwebtoken');
  const authorization = req.headers['authorization'];
  // 왜 authorization.split을 사용하는지, 왜 1번째 인덱스의 값을 얻는지 console.log를
  // 사용해 확인해보세요!
  const token = authorization.split(' ')[1];
  const data = jwt.verify(token, ACCESS_SECRET);
```


## 토큰 기반 인증 절차

1. 클라이언트가 서버에 아이디/비밀번호를 담아 로그인 요청을 보낸다.
2. 아이디/비밀번호가 일치하는지 확인하고, 클라이언트에게 보낼 암호화된 토큰을 생성한다.
   1. access/refresh 토큰을 모두 생성한다.
   2. 토큰에 담길 정보(payload)는 유저를 식별할 정보, 권한이 부여된 카테고리(사진, 연락처, 기타등등)이 될 수 있다.
   3. 두 종류의 토큰이 같은 정보를 담을 필요는 없다.
3. 토큰을 클라이언트에게 보내주면, 클라이언트는 토큰을 저장한다.
   1. 저장하는 위치는 local storage, cookie, react의 state 등 다양하다.
4. 클라이언트가 HTTP 헤더(authorization 헤더)에 토큰을 담아 보낸다.
   1. bearer authentication을 이용한다.
5. 서버는 토큰을 해독하여 유효한 토큰이라는 판단이 될 경우, 클라이언트의 요청을 처리한 후 응답을 보내준다.