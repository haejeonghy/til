# Web3

* 각 사용자가 노드가 되어 탈중앙화된 분산 네트워크를 구성
* 네트워크에서 정보를 읽거나 쓸 뿐만 아니라 서비스를 제공할 수 있는 이코노미를 의미
* Web3.js
  * Web3 기반 dApp을 구축하는 다양한 기능을 제공

## 발전 과정

* Web1
  * 클라이언트(사용자)가 서버로부터 콘텐츠를 제공받는 것
  * Information Economy
    * 클라이언트가 정보를 읽기(Read)만 할 수 있었기 때문
* Web2
  * AJAX의 등장
  * 서버로부터 단순히 정보를 받기만 하는 것이 아니라, 서버와 상호작용 하면서 서버에 기록(Write)도 할 수 있게 되었다.
  * 인터넷이 정적인 성격에서 동적인 성격으로 변했다.
  * 사용자는 정보를 소비할 뿐만 아니라 생성할 수 있게 되었다.
  * 자신들이 만든 웹 어플리케이션에서 많은 사용자들을 참여시키는 플랫폼 형태의 어플리케이션이 등장
  * 구글, 페이스북, 아마존과 같은 플랫폼 기업
    * 대기업들이 만든 플랫폼을 사용하기 위해 사용자는 자신의 개인정보를 플랫폼에 제공해야 한다.
    * 기업은 플랫폼을 통해 수많은 사람들의 개인정보를 취하고, 개인 정보를 이용해 광고를 하는 등 수익을 낸다.
    * 악의적인 해커에 의해 사용자의 개인정보를 탈취당하는 문제 발생
* Web3
  * 중앙집중적인 플랫폼 이코노미를 벗어나, 모든 참여자가 플랫폼이 될 수 있는 분산형 인터넷을 의미
  * 블록체인 기술 기반 구현
    * 모든 참여자가 플랫폼이 되기 때문에 모든 데이터가 공유
    * 동시에 암호화 기술을 사용해 개인 정보를 제공하지 않고도 사용자는 신원을 식별할 수 있다.
  * 장점
    * 네트워크에 참여하는 누구나 서비스를 사용하기 위한 권한을 가지고 있다.
      * 누구도 허가를 받을 필요가 없다.
    * 특정 사용자가 서비스에 접근하지 못하도록 막거나 거부할 수 없다.
    * 결제는 자체 토큰(이더 등)을 사용한다.
    * Web3 기반 dApp은 탈중앙화 되어 있기 때문에 누군가가 게시글을 검열하는 것이 불가능하다.
    * Web3 서버는 수천 대의 노드로 구성된 분산형 네트워크이기 때문에 특정 노드가 죽어도 서비스는 계속 유지된다.
  * 특징
    * 네트워크의 한쪽에서 브로드캐스팅되는 정보는 반대편까지 도달하는 데 오랜 시간이 걸릴 수 있다.
    * 비교적 낮은 성능, 구현하기에 복잡하다.
    * 만약 참가자가 동기화할 데이터의 상태에 대해 피어가 상반된 주장을 하는 경우, 이러한 갈등 상태를 해결하기 위해 복잡한 프로토콜이 필요하다.
    * 단일 장애 지점이 없다. 많은 네트워크 참여자가 공격당해도 네트워크는 여전히 동작할 수 있다.
    * 단일한 하나의 참여자가 네트워크 수준의 결정이나 프로토콜 업그레이드 등에 최종 결정권을 갖지 못하기 때문에 합의가 매우 어렵다. 최악의 경우, 프로토콜 변경에 대한 의견 불일치로 인해 네트워크가 파괴되기도 한다.
    * 데이터가 네트워크를 통해 전파되는 경로가 다양하기 때문에 데이터를 검열하는 것은 매우 어렵다.
    * 누구나 네트워크에 참여할 수 있으며, "게이트키퍼"는 존재하지 않는다.

## Web3.js

* 이더리움 블록체인과 상호 작용하는 클라이언트를 개발하는 데 사용
* 다른 계정으로 이더를 전송하거나, 스마트 컨트랙트에서 데이터를 읽고 쓰거나, 스마트 컨트랙트를 만드는 등 다양한 액션을 수행할 수 있게 해주는 라이브러리의 집합
* 클라이언트가 이더리움 블록체인과 상호작용하는 방법
  * Web3.js는 이더리움 블록체인과 JSON RPC를 사용하여 소통
* JSON RPC
  * "Remote Procedure Call" 프로토콜의 약자
* 이더리움은 여러 노드로 구성된 P2P 네트워크
  * 블록체인에 있는 모든 데이터와 코드의 사본을 저장
* Web3.js는 네트워크에 있는 데이터를 읽거나 써야 할 때 JSON RPC를 사용해 하나의 이더리움 노드에게 요청
* 웹 클라이언트에서 웹 서버에게 데이터를 요청하기 위해 XMLHttpRequest를 사용하는 것과 같다.
* 이더리움에서는 클라이언트가 JSON RPC라는 정해진 형식에 맞춰서 이더리움 노드에 데이터를 요청
* Web3.js 모듈
  * web3-eth: 이더리움 블록체인과 스마트 컨트랙트 모듈
  * web3-shh: P2P 커뮤니케이션과 브로드캐스트를 위한 위스퍼 프로토콜 모듈
  * web3-bzz: 탈중앙화 파일 스토리지를 위한 스왐 프로토콜 모듈
  * web3-utils: dApp 개발자를 위한 유용한 헬퍼 함수들을 모아둔 모듈
* `window.ethereum` - 공급자 객체
  * EIP-1139에서 지정한 이더리움 공급자 객체
    * EIP-1139를 통해, 메타마스크와 같은 지갑 소프트웨어는 웹 페이지에 자바스크립트 객체 형태로 자신의 API를 노출
    * "공급자(provider)"
    * 이전에는 각 지갑 소프트웨어들이 자신의 API를 브라우저에 공급자 객체 형태로 표현
      * 각 지갑마다 공급자 객체를 구현하는 인터페이스나 동작이 조금씩 달랐기 때문에, 브라우저에서 이 공급자 객체들이 충돌
      * EIP-1139는 이더리움 공급자 API를 통일하여 지갑 간 상호 운용이 가능하게 했다.
  * 크롬 개발자 콘솔 창에 `window.ethereum` 을 입력하면 다음과 같이 공급자 객체가 출력되는 것을 확인할 수 있다.

## Web3.js로 이더리움 네트워크로부터 데이터 읽기

* Web3.js 설치 및 공급자 연결하기

1. web3js_practice 폴더를 생성하고, 해당 디렉토리에서 npm으로 초기화
   1. `npm init`
2. Web3.js를 사용하기 위해서는 npm에서 web3.js 라이브러리를 설치해야 한다.
   1. `npm install web3`
3. 내 지갑 주소에 있는 이더 잔액을 조회하는 코드
   1. getBalance.js 파일을 생성

```javascript
// getBalance.js

const Web3 = require('web3');
const rpcURL = "https://ropsten.infura.io/v3/{PROJECT_ID}";  // 원격 이더리움 노드에 접속할 수 있는 주소 - Infura에서 받은 ropsten 네트워크 엔드포인트

const web3 = new Web3(rpcURL); // web3 객체 생성, 이더리움 노드의 공급자

const account = "자신의 지갑 주소";

web3.eth.getBalance(account)
  .then((bal) => {
    console.log("지갑 ${account}의 잔액은... ${bal} wei 입니다.");
    return web3.utils.fromWei(bal, "ether"); // web3.utils.fromWei 를 사용해 ether 단위로 변경
  })
  .then((eth) => {
    console.log(`이더 단위로는 ${eth} ETH 입니다.`);
  });
```

* 트랜잭션 조회하기 - getTransaction, getTransactionReceipt
  * web3.eth.getTransaction 은 트랜잭션 해시를 인자로 받고, 해당 트랜잭션에 대한 정보를 Promise 형태로 리턴

1. getTransaction.js 파일 생성

```javascript
const Web3 = require("web3");
const rpcURL = "{Infura Ropsten 네트워크 엔드포인트}";

const web3 = new Web3(rpcURL);

const txId = "{자신이 만든 트랜잭션의 해시값}";

web3.eth.getTransaction(txId)
	.then((obj) => {
	  console.log(obj);
	});
```

* 블록 조회하기 - getBlock
  * 블록숫자를 인자로 받고, 블록에 대한 정보를 Promise 형태로 반환

1. getBlock.js 파일을 생성

## 서버에서 Web3.js 라이브러리 사용하기

1. 프로젝트를 위한 폴더 `beb-sprint-web3js`를 생성 후, 터미널에서 `npm init` 명령어를 통해 노드 프로젝트를 시작

```shell
mkdir beb-sprint-web3js
cd beb-sprint-web3js
npm init
```

2. npm을 통해 `express`와 `web3`를 설치

```shell
npm install express
npm install web3
```

3. 프로젝트에 `index.js` 파일을 만들어 다음 내용을 입력

```js
const express =require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
	res.send('Hello Node.js!');
});
app.listen(port, () => {
	console.log('Listening...');
});
```

4. `package.json` 파일에서 `scripts` 항목에 `start`를 추가

```json
"scripts": {
	"start": "node index.js",
	"test": "echo \"Error: no test specified\" && exit 1"
},
```

5. `npm start` 로 서버 실행
6. http://localhost:8080/ 에 접속하여 서버가 잘 동작하는지 확인
7. 가나슈(Ganache)를 실행 후 자신의 RPC SERVER를 확인
8. `index.js`에 가나슈 계정 가져오기

```js
const express =require('express');
const app = express();
const port = 8080;
const Web3 = require('web3');

function getWeb3() { 
    const web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:7545'));
    return web3;
}

async function getAccounts() {
    try {
        const accounts = await getWeb3().eth.getAccounts(); 
        console.log(accounts);
        return accounts;
    } catch (e) {
        console.log(e);
        return e;
    }
}

app.get('/', (req, res) => {
    getAccounts().then((accounts) => {
        res.send(accounts);
    })
});
app.listen(port, () => {
	console.log('Listening...');
});
```

9. http://localhost:8080 으로 접속하면 Account에 관한 계정 정보를 웹과 콘솔에서 확인

## Web3 라이브러리

* web3.eth, web3.eth.subscribe: 노드 관련 라이브러리
* web3.eth.Contract, web3.eth.abi: 컨트랙트 관련 라이브러리
* web3.eth.accounts: 계정, 지갑 관련 라이브러리
* web3.eth.personal: 트랜잭션 관련 라이브러리
* web3.*.net: 이더리움이 아닌 다른 블록체인 네트워크를 추가하여 사용하는 경우
* web3.utils: 암호화 등 유틸 라이브러리
* web3.eth.ens: ENS 상호 작용 라이브러리
  * ENS
    * Ethereum Name Service
    * 숫자와 알파벳으로 이뤄진 이더리움 지갑 주소를 '사람이 읽을 수 있는 이름(Human-readable names)' 형태로 바꿔주는 서비스
* web3.eth.Iban
  * 이더리움 주소를 IBAN 및 BBAN으로 변환
  * IBAN
    * International Bank Account Number
    * 수취 계좌 고유 번호
  * BBAN
    * Basic Bank Account Number
    * 국제 자금 이전을 위해 사용될 때 IBAN의 마지막 부분

### 라이브러리 함수

* web3.eth.getGasPrice()
  * 가스비 확인 함수
  * 블록체인 서비스를 제공할 때는 네트워크 사용량에 따라 변화하는 가스비를 책정해야 한다.
  * 가스비를 잘못 책정하는 경우, 트랜잭션을 실행하다가 가스비가 부족해지면 트랜잭션이 revert 되는 문제가 발생한다.
  * 적절한 가스비를 계산해야 트랜잭션을 펜딩할 수 있다.

```js
async function getGasPrice() {
    try {
        const gasPrice = await getWeb3().eth.getGasPrice();
        console.log(gasPrice);
        return gasPrice;
    } catch (e) {
        console.log(e);
        return e;
    }
}

app.get('/gasprice', (req, res) => {
    getGasPrice().then((gasPrice) => {
        res.send(gasPrice);
    })
})
```

* web3.eth.getBlock(blockHashOrBlockNumber)
  * 블록 정보를 가져오기 위한 함수
  * 인자로는 블록의 해시값이나 블록 숫자를 넣을 수 있다.
    * String, Number, BN, BigNumber 타입으로 넣어야 한다.
    * String 타입으로 값을 넣을 때는 `"earliest"`, `"latest"` , `"pending"` 를 사용하여 제네시스 블록, 최신 블록, 펜딩 상태인 블록을 넣을 수 있다.

```js
async function getBlock() {
    try {
        const getBlock = await getWeb3().eth.getBlock("latest");
        console.log(getBlock);
        return getBlock;
    } catch (e) {
        console.log(e);
        return e;
    }
}

app.get('/getblock', (req, res) => {
    getBlock().then((getBlock) => {
        res.send(getBlock);
    })
})
```

## Coingecko

* 암호화폐의 시가총액과 시세를 제공
* 실시간 가격, 거래량, 과거 데이터, 컨트랙트 정보와 같은 다양한 데이터를 API 형태로 제공
  * https://api.coingecko.com/api/v3/coins/ethereum/
    * 이더리움 정보를 받아오는 API 엔드포인트
    * usd, krw 등 가격 정보
    * 실제 사용되는 가스비를 price로 계산하여 얼마가 드는지 확인하는 API를 개발하는 등, dApp 개발에 활용할 수 있다.