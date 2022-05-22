# EVM

## 설치

```bash
> brew update
> brew tap ethereum/ethereum
> brew install solidity
```

## 실행

```solidity
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    // 데이터 저장 함수
    function set(uint x) public {
        storedData = x;
    }
    // 저장된 데이터 반환 함수
    function get() public view returns (uint){
        return storedData;
    }
}
```

```bash
# solc --bin {컴파일할 sol파일 이름} 은 솔리디티 파일을 이진 형식으로 컴파일하는 명령어
# --optimize 옵션은 컴파일 전, 작성한 솔리디티 코드가 약 200회 실행된다고 가정했을 때를 기준으로 컨트랙트를 최적화한다.
solc --optimize --bin simpleStorage.sol 

# 작성한 solidity 컴파일한 결과값 -> EVM은 이 코드를 실행한다.
======= simpleStorage.sol:SimpleStorage =======
Binary:
6080604052348015600f57600080fd5b5060ac8061001e6000396000f3fe6080604052348015600f57600080fd5b506004361060325760003560e01c806360fe47b11460375780636d4ce63c146049575b600080fd5b60476042366004605e565b600055565b005b60005460405190815260200160405180910390f35b600060208284031215606f57600080fd5b503591905056fea2646970667358221220c0c1b12b5e9b8c357afd5a6a2d3b46e506235554487a6d83f5f1f894c7c1da0164736f6c634300080e0033
```

## solc를 사용해 ABI 생성하기

* 스마트 컨트랙트 코드에 대한 설명이 담긴 JSON 형식의 인터페이스
  * 이더리움 네트워크에 있는 각 노드들은 지갑을 통해 상호작용한다.
    * 이 때 JSON-RPC 형식의 데이터로 상호작용한다.
    * 이 상호작용을 위한 데이터
* 스마트 컨트랙트 코드에 있는 함수에 대해 정의한다.
* 컨트랙트에 있는 함수에 어떤 인자를 넣어야 하는지 포함한다.
* 어떤 데이터가 반환되는지 포함한다.
* 노드가 컨트랙트를 실행하기 위해 어떤 작업을 수행해야 하는지 알려준다.

```bash
solc --abi simpleStorage.sol

# 컨트랙트 내 함수에 대한 정보가 객체 형태로 들어있다.
======= simpleStorage.sol:SimpleStorage =======
Contract JSON ABI
[{"inputs":[],"name":"get","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"x","type":"uint256"}],"name":"set","outputs":[],"stateMutability":"nonpayable","type":"function"}]
```

## 이더리움에서 스마트 컨트랙트가 배포되는 과정

* geth, parity
  * 이더리움에서 노드로 참여할 수 있게 해주는 클라이언트
  * 접속한 사용자 노드가 이더리움 네트워크와 상호작용 할 수 있게 해준다.
  * 이더리움 상에 컨트랙트 계정을 생성하는 것과 같다.
* solidity를 사용하여 .sol 파일을 생성한다.
  * EVM에서 파일을 이해할 수 있도록 바이트 코드로 컴파일한다.
  * ABI, 16진수 바이트 코드 생성
  * ABI 
    * Application Binary Interface
      * 컴파일 된 파일의 함수에 대한 정보를 객체 형태로 저장한다.
* 메타마스크와 같은 이더리움 프로바이더를 사용해서 배포할 수 있다.
  * 메타마스크
    * 메타마스크는 크롬 브라우저에서 분산화된 어플래케이션 혹은 dapp에서 사용하는 이더리움에 접근할 수 있도록 하는 익스텐션이다.
    * 모든 웹사이트의 자바스크립트 컨텍스트에 이더리움 web3 api를 주입하여 dapp이 블록체인으로부터 데이터를 읽어들일 수 있도록 한다.
    * 메타마스크는 유저가 계정을 관리할 수 있도록 하여 dapp이 블록체인에 트랜잭션을 보내고 기록하려고 할 때 유저가 트랜잭션을 수락하거나 거절하기 전에 트랜잭션 내용을 확인하도록 안전한 인터페이스를 제공한다.
  * 지갑의 역할을 한다.  
  * 이더리움 프로바이더를 사용하면 디앱이 이더리움 네트워크에 올라갈 수 있다.
  * web3전역 변수에 이더리움 프로바이더를 제공한다.
  * 메타마스크의 노드를 통해 이더리움 노드와 상호작용할 수 있다.
* Alchemy, infura 등