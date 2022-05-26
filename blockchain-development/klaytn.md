# Klaytn

* 솔리디티는 2014년 8월 처음 제안된 이후로 계속해서 업그레이드 되고 있다.
* 솔리디티는 이더리움 외에도 이더리움 클래식, 클레이튼, 텐더민트, 헤데라 해시그래프에서도 사용되며, 각 블록체인 플랫폼마다 사용하는 솔리디티 버전은 조금씩 다르다.
* 작성한 버전을 다운그레이드 하면 문법적 차이로 에러가 발생한다.

## 클레이튼에서 사용하는 0.5 vs 이더리움에서 사용하는 0.8

|차이점	|0.5 버전	|0.8 버전	|업데이트 버전|
|------|------|------|-----|
|배열의 length 권한	|length의 값을 변경하여 스토리지에 저장된 배열의 크기를 변경할 수 있다.|	   |length는 read-only	|0.6|
|push(value) 반환값|	새로운 배열의 길이 반환|	아무것도 반환하지 않음	|0.6|
|fallback 함수	|익명 함수 형태	|fallback과 receive 키워드를 사용해 fallback 함수를 지정할 수 있다.	|0.6|
|now와 block.timestamp	|글로벌 변수 now가 블록의 생성 시간을 값으로 가진다.	|now는 deprecated되고, block.timestamp로 대체되었다.	|0.7|
|UTF-8 지원|	-	|유니코드 문자열 지원한다. 문자열 앞에 unicode 키워드를 붙여 사용할 수 있다. (ex. uincode"Hello😀")	|0.7|
|상태 변환성 키워드|	-	|pure와 view 키워드로 함수에서 일어나는 스토리지 CRUD 여부를 나타낸다.	|0.7|
|누승법(exponentiation)	|왼쪽에서부터 파싱
abc 연산은 (ab)c 순서로 수행된다.	|오른쪽에서부터 파싱
abc 연산은 a(bc) 순서로 수행된다.	|0.8|
|this, super, _	|모든 함수에서 사용 가능	|public 함수와 이벤트를 제외하고 사용 불가	|0.8|
|address 타입과 address payable 타입	|address 타입 자체로 송금 가능한 주소 값	|address 타입 자체는 송금이 불가능한 주소 타입이며, address 타입을 payable(address 타입 변수) 로 변환하여야 송금 가능한 주소값 (address type)이 됨	|0.8|
|글로벌 변수 tx.origin, msg.sender 타입	|address payable 타입	|송금이 안되는 address	|0.8|

## Klaytn Wallet

* Klaytn Wallet이라는 웹 지갑
* Klaytn Wallet에서 제공해주는 Key 파일을 통해 MyEthereWallet과 같은 방식으로 사용할 수 있다.
* Kaikas Wallet
  * 메타마스크의 클레이튼 버전
* Klaytn IDE
  * https://ide.klaytn.foundation/index.html#optimize=false&runs=200&evmVersion=london&version=soljson-v0.8.7+commit.e28d00a7.js
* Web3 지갑을 지원하지 않는다.
* Run 메뉴에서 Account 옆에있는 + 버튼을 통해 계정을 연동할 수 있다.

## Truffle 연동

* 클레이튼의 스마트 컨트랙트 또한 Truffle로 컴파일하고 배포할 수 있다.
  * https://ko.docs.klaytn.com/smart-contract/ide-and-tools/truffle
* 클레이튼에서 Truffle을 사용하기 위해서는 가나슈와 같은 역할을 하는 EN 노드를 사용해야 한다.
  * https://ko.docs.klaytn.com/getting-started/quick-start/deploy-a-smart-contract#deploying-a-smart-contract-using-truffle
* 원격 EN 노드로 배포를 하기 위해서는 truffle-hdwallet-provider-klaytn 프레임워크를 사용해야한다.
  * https://www.npmjs.com/package/truffle-hdwallet-provider-klaytn

## Baobab Network에 스마트 컨트랙트 배포하기

* Baobab Network
  * 이더리움의 Ropsten Network같이 테스트넷
  * Kaikas Wallet을 통해 바오밥 네트워크에 연동이 가능하다.
* 키스토어 파일을 이용해 Klay를 받을 수 있다.
  * Private Key를 키 내보내기를 통해 얻을 수 있다.
    * 지갑키 관리 페이지에서 지갑키 내보내기를 실행한다.
* Klaytn IDE 사용 배포

1. 테스트용 코드 작성

```solidity
pragma solidity 0.5.6;

contract Count {
    uint256 public count = 0;

    function setCount(uint256 _count) public {
      count = _count;
    }
}
```

2. KLAY를 받은 계정을 IDE에 Import하여 Baobab Network에 배포를 진행한다.
3. Deploy에 성공하면 Pending에 성공했다는 로그와 함께 우측 하단에 Deployed Contract를 발견할 수 있다.
4. SetCount 함수와 Public으로 선언된 Count 변수를 확인 할 수 있다.
5. SetCount에 숫자를 넣어 트랜잭션을 실행시켜보고, Count 변수를 불러와 같은 숫자를 잘 불러오는지 확인한다.

## KIP-7 배포

* KIP-7
  * 이더리움에 존재하는 EIP와 동일한 KIP(Klaytn Improvement Proposals)가 존재
  * Fungible Token Standard에 대한 내용
  * ERC-20을 기반으로 만들어진 내용
* 기본적인 KIP-7의 인터페이스 목록

```solidity
// KIP7 Interface
event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);
function totalSupply() external view returns (uint256);
function balanceOf(address account) external view returns (uint256);
function transfer(address recipient, uint256 amount) external returns (bool);
function allowance(address owner, address spender) external view returns (uint256);
function approve(address spender, uint256 amount) external returns (bool);
function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
function safeTransfer(address recipient, uint256 amount, bytes data) external;
// 이하 기본 ERC-20과 다른 함수들이 존재
function safeTransfer(address recipient, uint256 amount) external;
function safeTransferFrom(address sender, address recipient, uint256 amount, bytes data) external;
function safeTransferFrom(address sender, address recipient, uint256 amount) external;
```

* 클레이튼에서는 스마트 컨트랙트 개발을 위한 공식 라이브러리를 제공한다. 
  * https://github.com/klaytn/klaytn-contracts
* KIP-7에 대한 코드
  * https://github.com/klaytn/klaytn-contracts/blob/master/contracts/token/KIP7/KIP7.sol
* code/SimpleKlaytnToken.sol
1. KIR-7 코드를 Klaytn IDE에 입력
2. Deploy에 name과 symbol을 입력 후 Deploy
3. 토큰을 확인하기 위해 Kaikas Wallet에서 토큰 목록을 선택
4. 토큰 목록에서 새로운 토큰 추가를 위해 토큰 추가버튼을 선택
5. 복사한 토큰 컨트랙트 주소를 입력하고 확인
6. Baobab Network는 테스트넷이기 때문에 페어의 지갑으로 토큰을 이체할 수 있다.