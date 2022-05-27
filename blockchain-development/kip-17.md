# KIP-17

* 클레이튼 네트워크에서 사용되는 NFT
* Klaytn IDE
  * https://ide.klaytn.foundation/index.html#optimize=false&runs=200&evmVersion=london&version=soljson-v0.8.7+commit.e28d00a7.js
  * Klaytn IDE는 Remix 0.7.7 버전에서 분기
  * 현재 Remix에서 사용할 수 있는 일부 기능을 사용하지 못한다.
  * 
* KIP-17
  * https://kips.klaytn.foundation/KIPs/kip-17
* **전체 코드**
  * https://gist.github.com/QuePark/1833690b813545e9a794e6cb55e7a46b
* 클레이튼 기반의 스마트 컨트랙트를 생성하기 위해서는 KIP를 사용해야 한다.
* ERC-721과 같은 내용을 담고 있는 KIP는 KIP-17이다.
* ERC-721에는 Identity를 검증하는 ERC-165가 포함되어 있다.
* KIP에서는 KIP-13으로 Identity를 검증한다.

## 코드 수정

* ERC-721의 코드를 가져와서, 다음과 같이 수정
* `KIP17Full` 은 `KIP17`, `KIP17Enumerable`, `KIP17Metadata`를 상속
* 수정된 이 코드만으로는 Klaytn IDE를 통해 배포할 수 없다.
* MyNFTs의 부모 객체를 모두 작성하여야 문제없이 동작할 수 있다.
* Klaytn IDE에서는 한 페이지에서 코드를 구현한다.
* Klaytn 기반의 스마트 컨트랙트는 KIP를 사용한다.
* code/kip17/MyNFTs.sol

## Klatytn IDE에서 KIP-17 배포하기

1. Compile에서 컴파일을 진행
2. Start to compile 버튼을 눌러 컴파일을 진행하고 기다린다.
   1. EVM version을 확인한다.
3. Run 탭을 선택하고, Account를 연결
4. Klaytn IDE에서 지갑을 연결하려면, 개인키 또는 Keystore 파일이 필요
5. Run 탭에서 Deploy 버튼 위의 드랍다운을 클릭하고, 배포하려는 컨트랙트를 선택
6. 배포하려는 컨트랙트를 선택하고, Deploy 버튼을 눌러 배포
7. 배포가 완료되면, 하단의 콘솔에서 확인할 수 있다.
8. 화면 오른쪽에서 배포된 컨트랙트(Deployed Contracts)를 확인할 수 있다.
9.  코드로 작성한 mintNFT 를 실행
10. ownerOf 를 실행하여, NFT 발행이 잘 이뤄졌는지 확인할 수 있다.

## Truffle로 KIP-17 배포하기

* 로컬 환경에서 Truffle을 이용해 KIP-17을 배포한다.
* 클레이튼은 이더리움을 포크한 네트워크이기 때문에, Truffle과 Ganache 같은 이더리움 기반의 스마트 컨트랙트 개발 환경을 그대로 사용할 수 있다.
* Ganache는 이더리움 개발환경을 제공하기 때문에, 클레이튼 기반의 스마트 컨트랙트를 테스트하더라도 표시되는 코인의 단위는 항성 ETH이다.
* code/kip17
1. truffle-config.js 를 열고, 네트워크 설정을 편집
2. 바오밥 네트워크를 등록하기 위해, 다음과 명령어로 npm package를 두 가지 설치

```shell
# truffle-hdwallet-provider-klaytn과 dotenv를 설치
npm install truffle-hdwallet-provider-klaytn dotenv --save-dev
```

3. `truffle-config.js` 파일에서 다음과 같이 `development` 주석을 제거
4. `development`를 구분하기 좋게 `ganache` 로 변경
5. `baobab` 을 추가
6. `.env` 파일을 생성하고, 배포에 사용할 지갑의 개인키를 입력
   1. `PRIVATE_KEY="YOUR_PRIVATE_KEY_HERE"`
7. `truffle-config.js` 파일로 돌아와서, 다음과 같이 수정

```javascript
const HDWalletProvider = require('truffle-hdwallet-provider-klaytn');
require('dotenv').config();
const { PRIVATE_KEY } = process.env;
const URL = 'https://api.baobab.klaytn.net:8651';

module.exports = {
	networks: {
		ganache: {
			host: '127.0.0.1', // Localhost (default: none)
			port: 8545, // Standard Ethereum port (default: none)
			network_id: '*', // Any network (default: none)
		},
		baobab: {
			provider: new HDWalletProvider(PRIVATE_KEY, URL),
			network_id: 1001,
			gas: 20000000,
			gasPrice: 25000000000,
		},
	}
};
```

8. `contracts` 폴더 아래에 `MyNFTs.sol` 파일을 생성하고, 코드 붙여넣기
9. migration/1_initial_migration.js 파일 편집

```javascript
const Migrations = artifacts.require('Migrations');
const MyNFTs = artifacts.require('MyNFTs.sol'); // MyNFTs.sol 파일 추가

module.exports = function (deployer) {
	deployer.deploy(Migrations);
	deployer.deploy(MyNFTs); // MyNFTs를 배포에 추가
};
```

10. `ganache-cli` 를 실행
11. `truffle migrate --compile-all --network ganache` 입력하여 Ganache에 컨트랙트를 배포
12. 배포를 마쳤으면, 배포된 컨트랙트와 연결하여 NFT를 발행
13. 배포된 컨트랙트와 연결하기 위해, Truffle console을 실행합니다. 프롬프트에 다음의 명령어를 입력
    1. `truffle console --network ganache`
14. Truffle 콘솔이 실행되면, 배포된 컨트랙트의 인스턴스를 요청
15. 새로운 NFT를 민팅

```shell
i = await MyNFTs.deployed()
i.name()
# MyNFTS
i.mintNFT("1", { from: accounts[0] })
# result
i.ownerOf(1)
# address of accounts[0]
```

16. 바오밥 테스트 네트워크에, 생성한 컨트랙트를 배포
17. 네트워크를 baobab으로 연결
    1. `truffle migrate --compile-all --network baobab`
18. 배포가 완료되면 Truffle 콘솔을 실행
    1. `truffle console --network baobab`
19. Truffle 콘솔에서 다음과 같이 인스턴스를 실행하면, 앞서 진행한 대로 NFT를 발행해볼 수 있다.

```shell
i = await MyNFTs.deployed()
i.name()
# MyNFTS
i.mintNFT("1", { from: accounts[0] })
# result
i.ownerOf(1)
# address of accounts[0]
```

20. 테스트넷에 배포할 때에는 이미 ownership이 설정되어 있다.
21. `.env` 파일에 입력한 개인키에 대응되는 지갑주소가 오너이다. 
22. Truffle 콘솔을 이용해 네트워크에 접속할 때에도, `truffle-config.js` 파일에 설정한 값을 사용
    1. 오너의 지갑주소로 콘솔에 접속
    2. mintNFT 함수를 실행하기 위해 지갑 주소를 선택할 필요가 없다.