# HTTPS

* Hyper Text Transfer Protocol Secure Socket layer 
  * HTTP over SSL(TLS), HTTP over Secure
  * HTTP + Secure
* HTTP 프로토콜 내용을 SSL, TLS 알고리즘을 이용해 암호화하여 보안성이 추가됐다.
* HTTPS는 데이터를 암호화하기 때문에 유출되더라도 정보는 안전하다.
* 클라이언트에선 데이터 제공자가 제공해준 데이터를 사용해야 한다. 
  * 요청 및 응답을 가로채는 중간자 공격에 취약하다. 
    * 중간자 공격 : 클라이언트와 서버 사이에서 공격자가 서로의 요청, 응답의 데이터를 탈취 및 변조하여 다시 전송하는 공격
    * 중간자 공격을 당하게 되면 다른 도메인에서 데이터를 받은 클라이언트는 데이터를 제공한 도메인과 전달받은 내용의 도메인을 비교하여 '중간자 공격'이 존재하는지 아닌지 확인할 수 있다. 
    * 공격으로 추가 데이터도 변조할 수 있으므로 데이터를 암호화 시켜야 한다. 
      * 복호화 하기 전까진 어떤 내용인지 알 수 없다. 

## 인증서

* 인증서에서 해당 인증서를 발급한 CA 정보를 확인하고 인증된 CA가 발급한 인증서가 아니라면 경고한다. 
* 데이터를 제공한 서버가 정말 데이터를 보낸 서버인지 인증하고 확인한다. 
* 데이터 제공자의 신원을 보장한다.
* 도메인에 종속된다.
* 요청되면 서버는 인증서와 함께 응답을 전송한다.
* 클라이언트는 인증서에 작성된 도메인과 응답 객체의 도메인을 비교하여 확인한다.
* 제 3자 공격 등 중간에 정보가 유출되면 도메인이 변경돼 클라이언트에서 확인할 수 있다.

## CA

* Certificate Authority
* 인증서를 발급하는 공인된 기관
* 자격이 계속 유지되는 것이 아니라 박탈당할 수도 있다. 

## 비대칭 키 암호화

* 전혀 다른 키로 암호화, 복호화가 가능하다. 
* A키로 암호화 하면 B키로만 복호화가 가능하다. 
* 모든 통신에 대해 공개키 방식을 사용하는 건 아니다. 
* 매번 사용하기엔 연산이 복잡한 알고리즘이기 때문에 통신의 초창키에서만 사용한다. 
* 통신 과정
  1. Hand Shake - 클라이언트에서 요청
  2. Hand Shake - 서버에서 공개키, 인증서 정보 전달
  3. 비밀 키 생성 - 클라이언트에서 키 제작용 랜덤 스트링 전송
  4. 비밀 키 생성 - 서버에서 키 제작용 랜덤 스트링 전송
  5. 상호 키 검증 - 세션 키로 암호화 된 메세지 전달
  6. 상호 키 검증 - 세션 키로 암호화 된 메시지 전달
  7. HTTPS 연결 성립

## 인증서 발급

```bash
    # mkcert 설치하기
    brew install mkcert
    # 로컬을 인증된 발급 기관으로 추가하기
    mkcert -install
    # 로컬 환경에 대한 인증서 만들기
    mkcert -key-file key.pem -cert-file cert.pem localhost 127.0.0.1 ::1
    # 인증서, 해당 키 위치 확인하기
    mkcert -CAROOT

```

```javascript
    const https = require('https');
    const fs = require('fs');

    // 인증서 파일 https 서버에 적용하기 
    https
    .createServer(
        {
        key: fs.readFileSync(__dirname + '/key.pem', 'utf-8'),
        cert: fs.readFileSync(__dirname + '/cert.pem', 'utf-8'),
        },
        function (req, res) {
        res.write('Congrats! You made https server now :)');
        res.end();
        }
    )
    .listen(3001);
```

```javascript
    const https = require('https');
    const fs = require('fs');
    const express = require('express');

    const app = express();

    https
    .createServer(
        {
        key: fs.readFileSync(__dirname + '/key.pem', 'utf-8'),
        cert: fs.readFileSync(__dirname + '/cert.pem', 'utf-8'),
        },
        // express사용 시 express middleware로 변경하기
        app.use('/', (req, res) => {
        res.send('Congrats! You made https server now :)');
        })
    )
    .listen(3001);
```