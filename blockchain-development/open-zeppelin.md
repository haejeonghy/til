# OpenZeppelin

* 오픈제플린(OpenZeepelin)
* 2015년 데미안 브리너와 마누엘 아라오스가 공동설립한 블록체인 개발 회사
  * 솔리디티 기반의 스마트 컨트랙트를 개발하는 프레임워크인 오픈제플린(OpenZeppelin) 제공
  * 스마트 컨트랙트를 관리하고 운영하는 플랫폼인 제플린OS를 제공

## OpenZeppelin 라이브러리

* Remix와 Truffle을 이용하여 오픈제플린 라이브러리를 사용

### Truffle을 이용한 openzeppelin-solidity Library 활용

1. openZeppelinSample 폴더를 만들고 truffle init을 통해 트러플 기반 프로젝트 초기화를 진행

```shell
mkdir openZeppelinSample
cd openZeppelinSample
truffle init
```

2. 솔리디티 사용을 위한 openzeppelin solidity 라이브러리를 설치

```shell
npm install -E openzeppelin-solidity
```

3. Ganache에 업로드하기 위해 Ganache - Truffle 연동을 진행
4. 솔리디티 버전이 openzepellin 버전과 다르다면 truffle-config.js를 수정

```javascript
compilers : {
    solc : {
            version : "0.8.10",
    }
}
```

## ERC-20 스마트 컨트랙트 작성

* OpenZeppelin 라이브러리를 활용하여 간단한 ERC-20 컨트랙트를 작성 후 배포
1. ZeppelinTestToken.sol 파일을 작성
2. migrations 폴더 안에 2_deploy_ZeppelinTestToken.js를 작성
3. 배포를 하기전 사용할 openzeppelin/contract 경로를 추가
   1. `npm install @openzeppelin/contracts`
4. `truffle migrate`
5. 배포를 진행하여 Ganache에서 블록 생성과 Metamask를 활용한 테스트를 실시

## Remix에서 OpenZeppelin Library 사용하기

* Remix에서는 자동으로 npm 패키지를 제공한다.
* FILE EXPLORERS에서 .deps/npm 아래로 @openzeppelin을 확인 할 수 있다.
* Metamask를 이용해 배포 후 토큰이 잘 들어왔는지 테스트를 진행한다.
* github를 import 할 수 있다.
  * ERC20.sol : https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/ERC20.sol
  * IERC20.sol : https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/IERC20.sol
  * Context.sol : https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/GSN/Context.sol
  * SafeMath.sol : https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/math/SafeMath.sol
  * SimpleToken.sol : https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/examples/SimpleToken.sol
  * ERC20Detailed.sol :  https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/ERC20Detailed.sol