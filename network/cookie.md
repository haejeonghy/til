# Cookie

* 서버에서 클라이언트에 데이터를 저장하는 방법
* 서버에서 cookie를 이용하여 클라이언트의 데이터를 가져올 수 있다. 
* 클라이언트에서 서버로 쿠리를 전송할 수 있다. 
* 데이터를 저장한 이후 아무때나 데이터로 가져올 수 없다. 
* 데이터를 저장한 이후 특정 조건들이 만족하는 경우에만 다시 가져올 수 있다.
* 장기간 보존해야 하는 정보 저장에 적합하다.

## Cookie Options

* Domain
  * `www.google.com`등 서버에 접속할 수 있는 주소
  * cookie 옵션에서 domain은 포트, 서브 domain 정보, 세부 경로를 포함하지 않는다.
    * 서브 domain : domain 앞에 추가로 작성되는 부분
  * cookie 옵션에서 domain 정보가 존재한다면 클라이언트에선 cookie의 domain 옵션과 서버의 domain이 일치해야지만 cookie를 전송할 수 있다. 
* Path
  * 세부 경로
  * 서버가 라우팅할 때 사용하는 경로
  * 설정된 path를 모두 만족하는 경우 path가 추가로 더 존재하더라도 cookie를 서버에 전송할 수 있다. 
* MaxAge, Expires
  * cookie가 유효한 기간을 정하는 옵션
  * MaxAge
    * 앞으로 몇 초 동안 cookie가 유효한지 설정하는 옵션
  * Expires
    * 언제까지 유효한지 Date를 지정하는 옵션
    * 클라이언트의 시간을 기준으로 한다. 
  * 지정된 시간, 날짜를 초과하게 되면 cookie는 자동으로 파괴된다.
  * 옵션이 지정되지 않을 경우 브라우저의 탭을 닫아야 cookie가 제거된다. 
* Secure
  * cookie를 전송해야 할 때 사용하는 프로토콜에 따른 cookie 전송 여부를 결정한다. 
  * 해당 옵션 값이 `true`인 경우 https 프로토콜을 사용하여 통신하는 경우에만 cookie를 전송할 수 있다. 
* HttpOnly
  * 자바스크립트에서 브라우저의 cookie에 접근 여부를 결정한다. 
  * 해당 옵션이 `true`로 설정된 경우 자바스크립트에서 cookie에 접근이 불가능하다. 
  * 명시하지 않는 경우 기본 `false`로 지정되어 있다. 
  * 이 옵션이 `false`인 경우 자바스크립트에서 cookie에 접근이 가능하므로 XSS 공격에 취약하다. 
* SameSite
  * Cross-Origin 요청을 받은 경우 요청에서 사용한 메소드와 해당 옵션의 조합으로 서버의 cookie 전송 여부를 결정하게 된다. 
  * CSRF 공격을 막는데 효과적이다. 
    * CSRF
      1. 유저가 웹에 로그인한다.
      2. 웹에서 유저에게 유효한 토큰을 할당한다. 
      3. 해커가 웹의 요청으로 가장한 위조된 요청을 보낸다. 
      4. 유저가 해커의 링크를 클릭하면 웹에 위조된 요청이 보내진다. 
      5. 위조된 요청은 이전에 할당된 유저의 유효한 토컨을 통해 은행에서 실행된다. 
  * SameSite 옵션
    * Lax : Cross-Origin 요청이면 GET 메소드에 대해서만 cookie를 전송할 수 있다. 
    * Strict : Cross-Origin이 아닌 `same-site`인 경우에만 cookie를 전송할 수 있다. 
      * `same-site` : 요청을 보낸 origin과 서버의 domain이 같은 경우
    * None : 항상 cookie를 보내줄 수 있다.  
      * Secure option 설정이 필요하다.
  * 옵션을 지정하고 서버에서 클라이언트로 cookie를 처음 전송하게 되면 헤더에 `Set-Cookie`라는 프로퍼티에 cookie를 담아 cookie를 전송한다.
  * 이후 cookie를 전송하게 된다면 클라이언트에서 헤더에 `Cookie` 프로퍼티에 cookie를 담아 서버에 cookie를 전송하게 된다.

## cookie를 이용한 상태 유지

* 서버는 클라이언트에 인증 정보를 담은 cookie를 전송하고, 클라이언트에서 전달받은 cookie를 요청과 같이 전송하여 stateless한 인터넷 연결을 stateful하게 유지할 수 있다. 
* 기본적으로 cookie는 오랜 시간 동안 유지될 수 있고, 자바스크립트를 이용해서 cookie에 접근할 수 있기 때문에 cookie에 민감한 정보를 담는 것은 위험하다. 
* 인증 정보를 탈취하여 서버에 요청을 보낸다면 서버는 인증된 유저의 요청으로 취급하기 때문에 개인 유저 정보 같은 민감한 정보에 접근이 가능하다. 