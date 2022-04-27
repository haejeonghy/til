# HTTP

* HyperText Transfer Protocol
* Application Layer protocol
* 클라이언트와 서버가 통신하기 위해 지키는 protocol
  * Protocol : 통신 규약
  * Request Response
  * 클라이언트가 서버에 요청을 보내면 서버는 그에 대한 응답을 보내는 구조
* Stateless
  * 무상태성
  * 상태를 가지지 않음
  * 필요에 따라 쿠키-세션, api 등 사용해서 상태 확인함
  * 서버가 클라이언트의 상태를 보존하지 않는다.
    * 서버 확장성이 높다.
    * 쉽게 서버를 바꿀 수 있다. 
    * 갑자기 클라이언트 요청이 증가해도 서버를 대거 투입할 수 있다. 
    * 클라이언트가 요청할 때 필요 데이터를 전송해야 한다. 
  * 상태 유지가 필요할 경우 쿠키, 세션, 토큰 등을 이용해 유지한다. 
  * HTTP에서는 요청을 주고 받을 때만 연결을 유지한다.
    * 응답을 주고 나면 연결을 끊는다. 
    * 최소한의 자원으로 서버 유지를 가능하게 한다.
    * TCP/IP의 경우 기본적으로 연결을 유지한다. 
      * 연결을 유지하는 모델에서는 클라이언트가 요청을 보내지 않더라도 연결을 유지해야 한다. 
        * 연결을 유지하는 서버의 자원이 계속 소모된다. 
  * 트래픽이 많지 않고 빠른 응답을 제공할 수 있는 경우 효율적이다.
    * 트래픽이 많고 큰 규모의 서비스를 운영할 때에는 비연결성은 한계를 보인다.
  * 일반적으로 초단위 이하의 빠른 속도로 응답한다. 
* Connectionless
  * 비연결성
  * 웹 브라우저로 사이트를 요청하면 많은 자원이 함께 다운로드 된다.
    * 해당 자원을 각각 보낼 때마다 연결을 끊고 다시 연결하는 것은 비효율적이다.
    * HTTP 지속 연결 persistent connections로 문제를 해결한다.
      * 연결되고 각각의 자원들을 요청한 뒤 모든 자원의 응답이 돌아온 후에 연결을 종료한다. 
  * HTTP/2, HTTP/3에서 최적화
* 단순함, 확장 가능

## HTTP 메소드 

* CRUD 각각의 행동과 일치하는 메소드의 종류가 존재한다. 
* `GET`
  * 특정 리소스의 표시를 요청한다.
  * `GET`을 사용하는 요청은 오직 데이터를 받기만 한다.
* `HEAD`
  * `GET` 메서드의 요청과 동일한 응답을 요구한다.
  * 응답 본문을 포함하지 않는다.
* `POST` : 특정 리소스에 엔티티를 제출할 때 쓰인다.
* `PUT` : 모든 현재 표시를 요청 payload로 변경한다.
* `DELETE` : 특정 리소스를 삭제한다. 
* `CONNECT` : 식별되는 서버로의 연결을 맺는다. 
* `OPTIONS` : 목적 리소스의 통신을 설정한다.
* `TRACE` : 목적 리소스의 경로를 따라 메시지 loop-back 테스트한다.
* `PATCH` : 리소스의 부분만을 수정한다.

## Http Message

* client와 server 사이에서 data가 교환되는 방식
* 직접 메세지를 작성할 필요는 거의 없다. 
  * 구성 파일, API, 기타 인터페이스에서 http message를 자동으로 완성한다. 
* Request
  * start line : request이나 response의 상태
    * http method 
      * CRUD 각각의 행동과 일치하는 메소드의 종류가 존재한다. 
    * request 대상 또는 protocol, 포트, 도메인 절대 경로가 request 컨텍스트에 작성된다. 
      * request 형식
        * `origin`
          * `?` 와 쿼리 문자열이 붙는 절대 경로
          * `POST`, `GET`, `HEAD`, `OPTIONS` 등 메소드와 함께 사용
        * `absolute`
          * 완전한 URL 형식
          * 대부분 `GET` 메소드와 함께 사용
        * `authority`
          * 도메인 이름과 포트 번호로 이루어진 url의 authority component
          * `CONNECT`와 함께 사용
        * `asterisk` : `OPTIONS`와 함께 `*` 하나로 서버 전체 표현
  * HTTP headers : request을 지정하거나, 메시지에 포함된 본문을 설명하는 헤더의 집합 
    * 대소문자 구분 없는 문자열, 콜론, 값 입력
    * General headers : 메시지 전체에 적용
    * Request headers
      * User-Agent, Accept-Type, Accept-Language 등 요청 구체화한다.
      * Referer처럼 컨텍스트를 제공하거나 If-None과 같이 조건에 따라 제약을 추가할 수 있다. 
    * Entity headers
      * Content-Length와 같은 헤더는 body에 적용된다.
      * body가 비어있는 경우, entity headers는 전송되지 않는다.
  * empty line : 헤더와 본문을 구분하는 공백 
  * body
    * request과 관련된 data나 response과 관련된 data 또는 문서를 포함한다.
    * http message 구조 마지막에 위치한다. 
    * 모든 요청에 body가 필요하지는 않다.
    * `GET`, `HEAD`, `DELETE`, `OPTIONS` 처럼 서버에 리소스 요청하는 경우에는 body가 필요하지 않다. 
    * `Post`, `put` 같은 일부 요청은 데이터 업데이트하기 위해 사용한다. 
    * Single-resource bodies(단일-리소스 본문) : 헤더 두 개(Content-Type과 Content-Length)로 정의된 단일 파일로 구성된다. 
    * Multiple-resource bodies(다중-리소스 본문) : 여러 파트로 구성된 본문에서는 각 파트마다 다른 정보를 지닌다. 
* Response
  * Status line
      * 응답의 첫 줄
      * 현재 프로토콜 버전 http/1.1 포함
      * 상태코드 (요청의 결과)
      * 상태 텍스트 (상태 코드에 대한 설명
      * `HTTP/1.1 404 Not Found.`
  * Headers
      * 요청 헤더와 동일한 구조
      * 대소문자 구분 없는 문자열, 콜론, 값 입력
      * General headers : 메시지 전체에 적용된다.
      * Response headers : Vary, Accept-Ranges와 같이 상태 줄에 넣기에는 공간이 부족했던 추가 정보를 제공한다.
      * Entity headers : Content-Length와 같은 헤더는 body에 적용된다. body가 비어있는 경우, entity headers는 전송되지 않는다.
  * Body
      * 모든 응답에 body가 필요하지는 않는다.
      * Single-resource bodies(단일-리소스 본문) :
          * 길이가 알려진 단일-리소스 본문은 두 개의 헤더(Content-Type, Content-Length)로 정의한다. 
          * 길이를 모르는 단일 파일로 구성된 단일-리소스 본문은 Transfer-Encoding이 chunked 로 설정되어 있다.
          * 파일은 chunk로 나뉘어 인코딩된다.
      * Multiple-resource bodies(다중-리소스 본문) : 서로 다른 정보를 담고 있는 body이다.

## Response Code

* `1xx` hold on
* `2xx` here you go
* `3xx` go away
* `4xx` you screwed up
* `5xx` I screwed up

## HTTP 역사

* TCP 기반
  * HTTP/1.1
  * HTTP/2
* UDP 기반
  * HTTP/3

## HTTP 구조

### body

* message body를 통해 표현 데이터를 전달한다.
  * 표현 
    * 요청이나 응답에서 전달할 실제 데이터
    * 표현 헤더 
      * 표현 데이터를 해석할 수 있는 정보를 제공한다. 
        * 데이터 유형 (html, json), 데이터 길이, 압축 정보 등
* payload 
  * 데이터를 실어 나르는 부분