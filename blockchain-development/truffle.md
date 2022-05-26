# Truffle

* truffle 프레임워크는 스마트 컨트랙트(solidity) 개발시 개발, 배포 및 테스트 환경을 제공한다.
* node.js에서 동작을 하며 npm 으로 설치를 할수 있다.
* 요구사항
  * NodeJS 5.0 이상
  * 윈도우, 리눅스, Mac OS X
  * JSON RPC API 를 지원하는 이더리움 클라이언트

## 설치

* `npm install -g truffle`
* 설치 후 truffle을 실행하면 명령어를 확인 할 수 있다.

## Truffle 프로젝트 생성

```shell
mkdir sample
cd sample
truffle init
```

## 프로젝트 구조

* contracts: solidity로 개발된 스마튼 컨트랙트 소스 파일 폴더
* contracts/Migrations.sol: 배포를 도와주는 solidity 파일 (삭제하면 안 됨)
* migrations: 배포를위한 스크립트 파일 폴더
* migrations/1_initial_migration.js: Migrations.sol 을 배포하는 스크립트
* test: 개발된 컨트랙트를 테스트 하기 위한 폴더
* truffle-config.js: truffle 설정 파일

## Truffle Develop

* truffle에서 기본으로 제공하는 이더리움 클라이언트
* 실행
  * `truffle develop`
  * JSON-RPC용(http://127.0.0.1:9545/) 서비스 제공
  * Ganache와 같은 역할을 하는 이더리움 클라이언트
* MetaMask에 계정을 연동하여 사용 가능하다.
* 컴파일
  * `truffle(develop)> compile`
  * 명령어 실행시 프로젝트 루트 폴더에 /build 폴더가 생성이 되며 contracts 폴더 아래에 있는 solidity 파일이 json 형태로 변경되어 생성된다.
* 스마트 컨트랙트 배포
  * `truffle(develop)> migrate`
  * 명령어 실행시 /build 폴더에 생성된 파일을 서버에 배포된다.
* 스마트 컨트랙트 테스트
  * `truffle(develop)> test`
  * 명령어 실행시 /test 폴더에 있는 .js , .sol 파일을 실행하여 테스트를 수행
    * **solidity 파일로 테스트 파일을 생성시에 파일명은 contract 명과 일치 하게 하며, contract name은 Test~ 로 시작하고, 함수명도 test~ 로 시작해야 한다.**

## Truffle과 Ganache 연동

* 설정파일만 간단히 수정하여 Ganache와 연동 가능
* truffle-config.js 파일을 간단히 수정

```javascript
module.exports = {
    networks: {
        development: {
            host: "127.0.0.1",
            port: 7545,
            network_id: "5777,
        },
    },
}
```

* `truffle networks`
  * truffle networks 확인을 진행
  * development 네트워크가 기본으로 등록된 것을 확인할 수 있다.
* `truffle migrate`
  * 개발을 진행했던 파일을 그대로 Ganache 네트워크에 업데이트