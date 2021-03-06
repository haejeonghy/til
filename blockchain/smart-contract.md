# Smart Contract

* 스마트 컨트랙트
* 블록체인 네트워크에 호스팅되고 실행되는 프로그램
* 조건을 지정해두고 해당 조건이 충족되면 미리 정해둔 계약을 이행하는 방식으로 코드 작성
* 탈중앙화 된 블록체인에서 실행하기 때문에 계약 조건이나 이행 내용을 변조하기 어렵다.
* 계약을 신뢰하기 위한 제삼자가 필요하지 않다.

## 역사

* 1994년 닉 사보(Nick Szabo)에 의해 개념이 만들어졌다.
  * 계약 조건을 실행하는 전산화된 트랜잭션 프로토콜은 일반적인 계약 조건을 만족하고 악의적이거나 우발적인 예외를 최소화하며, 신뢰할만한 중개자의 필요성을 최소화하는 것을 목표로 한다.
  * 스마트 컨트랙트는 자판기와 같다고 설명한다.
    * 일정 금액을 넣으면 자판기가 커피를 내준다.
    * 커피 제공이라는 계약이 있다.
    * 제삼자가 없다.
    * 스마트 컨트랙트를 위한 비트 골드를 제안했으나 기술적 한계로 인해 구현되지는 못했다.
* 2009년 스마트 컨트랙트를 실제로 지원하기 시작한 첫 화폐
  * 비트코인의 핵심 기술인 블록체인이 디지털이고, 위조를 방지할 수 있고, 제삼자가 필요하지 않기 때문
  * 오피코드를 사용해 화폐 거래를 위한 제한적인 스크립트만을 작성할 수 있기 때문에 프로그램 구현 시 제약이 많다. 
    * opcode
      * 비트코인에서 스마트 컨트랙트를 동작시키는 연산들의 집합
* 2015년 프로그래밍 가능한 스마트 컨트랙트를 위한 블록체인인 이더리움 등장
  * 솔리디티 solidity 를 통해 스마트 컨트랙트를 위한 코드를 작성한다.
  * EVM ethereum virtual machine 을 통해 이더리움 블록체인 위에서 코드를 실행시킬 수 있다.
  * 이더리움은 여러 개의 독립적인 스마트 컨트랙트를 동시에 실행할 수 있어서 world computer 월드 컴퓨터라고 불리기도 한다.

## 작동 방식

```solidity
if or when(이벤트 x가 실행되면) { // 조건
    액션 y를 실행하라 // 계약 이행
}
```

* 코드가 블록체인 네트워크에 올라가면 네트워크는 미리 결정된 조건이 충족되고, 검증된 경우 조건에 따른 액션을 실행한다.
  * 액션은 트랜잭션에 기록된다.
  * 완료된 트랜잭션은 블록체인에 올라간다.
  * 스마트 컨트랙트는 한 번 액션이 수행되면 되돌리거나 수정할 수 없다.
* 스마트 컨트랙트는 당사자가 스마트 컨트랙트와 상호작용하는 방법을 정의하고, 누가, 언제, 어떤 입력이 어떤 결과를 초래하는지 담고 있다.
  * 결과 값이 담겨있다는 것은 어떤 확률적인 상태(probabilistic state)가 아니라, 조건에 따른 결과가 미리 결정되어 있다는 것을 의미한다.
* 코드에 따라 계약이 실행됨을 보장하는 결정론적인 상태(deterministic state)인 다자간 디지털 계약
* 개발자라면 누구나 스마트 컨트랙트를 만들고 퍼블릭 블록체인에 배포할 수 있다.
  * 예
    * 여러 펀드 중 가장 높은 수익을 내는 펀드로 옮기는 작업을 자동화하는 수익률 집계 어플리케이션
      * 일정 시각마다 여러 펀드들 중 현재 가지고 있는 펀드보다 높은 수익률을 내고 있는 펀드가 있는 경우 조건에 부합하는지 확인하고, 그런 펀드가 있는 경우 새로운 펀드로 이동하는 액션을 취하도록 스마트 컨트랙트 코드를 작성할 수 있다.

## 장점

* 전통적인 디지털 계약의 경우 계약 당사자들이 서로를 모르는 경우가 있다.
  * 계약 당사자가 악의적인 사용자일수 있다.
  * 계약 상대에 대한 신뢰를 알 수 없기 때문에 일반적으로 은행과 같이 계약 조건을 이행하도록 강제할 수 있는 중앙화된 기관이 디지털 계약의 제삼자 역할을 한다.
    * 이런 디지털 계약은 중개자인 은행 또는 기업이 각 계약 당사자나 계약 자체에 영향을 미칠 수 있다.
      * 2008년 금융위기 당시 파생상품 중개자 역할을 했던 금융 기업들이 자신들의 이익을 위해 파생상품을 마구 만들어낸다.
* 스마트 컨트랙트의 장점
  * 보안
    * 스마트 컨트랙트는 분산형 블록체인 인프라 위에서 실행된다.
    * 한 번 스마트 컨트랙트 코드가 블록체인 네트워크에 올라가면 모든 노드가 스마트 컨트랙트 내용과 이행 결과를 가지게 된다.
    * 계약에 대한 중앙화된 공격 지점이 없고, 누군가에게 뇌물을 주고 계약 내용이나 결과를 변조할 위험이 없다. 
  * 신뢰성
    * 스마트 컨트랙트 로직이 조건에 부합해 계약이 이행되면 블록체인 네트워크에 있는 노드들에 의해 여러번 수행되고 검증되기 때문에 위변조가 어렵고 정확도가 높다.
  * 공평함
    * 계약 조건을 공유하고 강제하기 위해 분산화된 블록체인 네트워크를 사용하기 때문에 수수료를 가져가는 등 영리적 목적의 중개자가 필요하지 않다.
  * 효율성
    * 계약 이행을 자동화하기 때문에 계약 당사자들은 수동으로 데이터를 입력하거나, 상대방의 계약 의무 이행 여부를 검증하거나, 중개자가 계약을 집행하는지 활용할 필요가 없다.

## 비트코인 스마트 컨트랙트 한계

* UTXO
* 비트코인의 단점
  * 비트코인 거래량이 늘어날 수록 처리해야 할 트랜잭션이 많아진다.
  * 비트코인의 TPS는 트랜잭션 양과 관계없이 고정되어 있기 때문에 저장해야 할 트랜잭션이 많아질수록 트랜잭션이 처리되는 속도가 느려진다.
* 비트코인의 단점을 극복하기 위해 다양한 플랫폼과 프로젝트가 존재한다.
* 라이트닝 네트워크
  * lightning network
  * 비트코인의 성능 문제를 해결한다.
    * 트랜잭션의 내용은 블록체인 외부에 저장하고, 트랜잭션의 최종 결과만 블록체인에 올린다.
    * 트랜잭션이 블록체인 바깥에서 이루어지기 때문에 트랜잭션이 처리되기 전까지 대기 시간이 필요하지 않아 즉시 처리된다.
  * 핵심 기술
    * 다중 서명
      * multi signature
      * multi sig
      * 블록체인 외부에서 트랜잭션을 실행할 때는 계약 당사자들끼리 합의를 진행한다.
      * 트랜잭션의 결과를 체인에 기록할 때 계약 당사자들의 개인 키로 공동 계죄를 만들어 비밀 키를 생성한다.
    * 시간 잠금 계약
      * hashed timelock contract
      * 일정 시간이 지나 트랜잭션이 확정되었을 때 트랜잭션을 변경할 수 없게 하여 계약 당사자가 트랜잭션을 임의로 수정하지 못하도록 한다.
* 루드 스택
  * rootstock
  * RSK
  * 비트코인에 스마트 컨트랙트 기능을 탑재하는 사이드체인 프로젝트
    * 비트코인에서도 스마트 컨트랙트 구현이 가능하지만 기본적으로 연산에 대한 수수료가 비싸기 때문에 실질적으로 사용이 어렵다.
    * 비트코인 스크립트는 튜링 불완전하기 떄문에 사용성 측면에서 제약이 컸다.
  * 루트스탁은 2-way peg를 이용해 비트코인에 튜링 완전한 스마트 컨트랙트를 지원하는 블록체인을 쌍방향으로 연결한다.
  * 병합 채굴 merge-mining을 통해 비트코인 채굴 노드가 사이드체인 블록까지 채굴할 수 있도록 연결한다.
  * 비트코인 네트워크에서도 튜링 완전한 스마트 컨트랙트를 실행할 수 있게 되었다.
* 탭 루트
  * taproot
  * 2021년 11월 중 이루어질 비트코인 업그레이드를 의미한다.
  * 탭루트에서 슈노르 서명과 MAST 등 중요한 사항들이 포함되어 있다.
  * 슈노르 서명 방식
    * schnorr signature
    * 기존 서명 방식인 다중 서명 방식의 단점을 보완하기 위해 도입되었다.
    * 여러 개의 서명을 받는 것이 아니라 여러 개의 서명을 기반으로 한 하나의 공동 서명을 만들기 때문에 트랜잭션의 크기가 커지지 않는다.
  * 기존 다중 서명의 경우
    * 트랜잭션의 크기가 커진다.
      * 외부에서 추적하기 더 쉬워진다.
      * 이로 인해 프라이버시가 취약해진다.
      * 트랜잭션 처리에도 영향을 준다.
  * MAST
    * Merkelized Abstract Syntax Tree
    * 머클 추상화 구문트리
    * 비트코인 스크립트에서 해시 값을 추출하는 자료구조
    * 스크립트의 조건 중 필요한 부분만 먼저 검증할 수 있도록 한다.
    * MAST를 슈노르 서명과 결합시키는 경우
      * 서명을 한번만 해도 트랜잭션이 이루어질 수 있기 때문에 속도가 개선되고 효율성이 증대된다.
      * 궁극적으로 기존에 제약이 많았던 비트코인 스마트 컨트랙트의 활용성이 확장될 것으로 기대된다.

## 스마트 컨트랙트 실행 비용

* 이더리움에서 가장 중요한 개념
* 이더리움에서 트랜잭션의 결과로 발생하는 모든 연산은 수수료를 요구한다.
  * gas
    * 가스
    * 트랜잭션 코드에 있는 모든 Opcode를 실행하는데 필요한 수수료를 측정하는데 사용하는 단위
  * gas price
    * 가스 값
    * 가스 당 지불하려고 하는 이더의 양 
    * 단위 gwei 사용
  * 1 이더 = 10^18 wei, 1 gwei = 10^9 wei
* 트랜잭션 송신자는 gas limit과 gas price를 트랜잭션에 지정한다.
  * gas price와 gas limit은 송신자가 트랜잭션을 실행하는데 지불하고자 하는 wei의 최대 양을 의미한다. 
  * gas limit
    * 송신자가 지불하고자 하는 가스의 최댓값
    * `gas limit - use gas - use gas = remaining gas`
* 만약 CA에 이 최대치를 지불하고도 남을 충분한 이더가 들어있다면 트랜잭션은 문제 없이 실행된다.
  * 송신자는 트랜잭션이 완료된 후 사용되지 않은 가스를 기존 비율로 환불받는다.
* 반대로 송신자가 트랜잭션을 실행할만한 충분한 가스를 제공하지 않은 경우 트랜잭션은 OOG 상태가 되며 실행이 중지된다.
  * 상태가 변경되었다면 트랜잭션이 실행 되기 이전의 상태로 돌아간다.
  * 또한 실패한 트랜잭션에 대한 기록이 남는다. 
    * 이 기록에서 어떤 트랜잭션이 시도되었고 어디에서 실패했는지 남게 된다.
  * EVM은 트랜잭션 실행이 중지되기 전까지 연산을 수행했기 때문에 연산에 사용된 가스는 환불되지 않는다.
  * 이 가스는 채굴자의 주소로 송금된다.
    * 채굴자는 연산을 수행하고 트랜잭션을 검증하는 데에 자원을 소모하기 때문에 이에 대한 보상으로 가스 수수료를 받는다.
  * 일반적으로 송신자가 지불하고자 하는 가스 가격이 높을 수록, 실제 연산에 소요되는 가스의 양이 높을 수록, 채굴자는 트랜잭션에서 수수료를 더 많이 받을 수 있다.
  * 채굴자들은 수수료를 많이 받을 수 있는 트랜잭션을 선택하려 한다.
  * 채굴자는 트랜잭션 송신자가 gas price를 어느 정도로 설정해야 할지 알려주기 위해 트랜잭션을 실행하거나 검증하는데 드는 gas price의 최솟값을 광고하기도 한다.

### 스토리지 수수료 

* 연산을 할 때뿐만 아니라 스토리지를 사용할 때도 수수료를 내야 한다. 
* 스토리지의 최종 수수료는 32 바이트 단위에 비례한다.
* 스토리지가 증가하면 모든 노드에서 이더리움 상태 데이터베이스의 크기가 커진다.
  * 저장되는 데이터의 양을 최대한 적게 유지할 수록 인센티브를 부여한다.
  * 만약 트랜잭션이 스토리지에 있는 특정 요소를 지우는 연산을 수행하면 해당 연산을 수행하는데에 필요한 수수료는 면제하고, 저장 공간을 확보했기 때문에 기존의 요소를 스토리지에 추가했을 때 지불했던 가스를 환불받는다.
  * 예
    * 스토리지에 요소 하나를 할당했을 때 100가스를 지불한다.
    * 트랜잭션에서 스토리지에 요소 하나를 할당하여 100가스를 지불한다.
    * 해당 요소를 다시 스토리지에서 제거하는 연산을 수행할 때는 제거 연산에 대한 수수료는 0 gas이다.
    * 더이상 스토리지에 자리를 차지하지 않기 때문에 할당할 때 들었던 100 gas를 환불해준다.
  
### 수수료를 지불하는 이유

* 이더리움은 비트코인과 달리 스마트 컨트랙트에서 수행되는 연선에 대해 수수료인 가스를 부과한다.
  * 이더리움 네트워크 위에서 동작하는 스마트 컨트랙트 작업들이 전체 노드에 영향을 미치기 때문에 부과한다.
* 이더리움은 튜링 완전 언어이기 때문에 반복문을 지원한다.
  * 무한 루프 문제가 일어날 수 있다.
    * 악의적인 사용자가 큰 자원을 소모하는 무한 루프 코드가 들어있는 트랜잭션을 실행시킨다면 트랜잭션은 이더리움 네트워크의 엄청난 양의 자원을 소모한다.
    * 이더리움 네트워크 전체가 멈출 수도 있다.
    * 수수료는 이러한 악의적인 공격으로부터 네트워크를 보호한다.
      * 각 연산마다 수수료를 부과하면 악의적인 사용자라도 수수료를 지불해야 하기 때문에 쉽게 무한 루프 코드를 실행시킬 수 없다.
      * 의도치 않게 무한 루프를 만든 코드를 실행시키더라도 gas limit를 설정해두면 지정해둔 가스를 다 소모하기 전에 실행을 멈출 수 있다.

## 프라이빗 블록체인의 스마트 컨트랙트

* private blockchain
* 원장에 접근할 수 있는 허가형 permissioned 블록체인
* 네트워크 내에서 초대된 사용자만이 네트워크에 참여한다.
* 프라이빗 블록체인은 채굴 과정과 합의 알고리즘에 대한 권한을 중앙 기관이 개발하고 유지한다.
* 중앙 기관은 네트워크에 참여할 수 있는 사용자를 결정한다.
* 특징
  * 높은 효율성
    * 네트워크에 소수의 허가된 노드만이 접근할 수 있다.
    * 각 노드가 특정한 목적을 가지고 작업을 하는 경우가 많다.
    * 노드가 추가적인 자원을 사용해 플랫폼을 느리게 하는 경우는 거의 없다.
  * 완전한 개인 정보 보안
    * 프라이빗 블록체인 플랫폼은 개인정보 보안 문제에 집중하는 경향이 있다.
      * 기업은 개인정보와 같은 민감한 정보를 자주 다루기 때문
  * 불법적 활동 제한
    * 프라이빗 블록체인은 네트워크에 접근하기 전 중앙기관으로부터 인증을 거쳐야한다.
      * 공격자가 쉽게 네트워크에 접근할 수 없다.
    * 네트워크 노드가 시스템에 침입한 경우 해당 침입자를 네트워크에서 제거할 수 있다.

## 스마트 컨트랙트 활용 서비스

* DeFi
  * 금융 상품
  * 디파이
  * decentralized finance
  * 스마트 컨트랙트를 활용해 금융 시장, 옵션, 스테이블 코인, 거래소, 자산 관리 등 전통적인 금융 상품과 서비스를 재창조하고, 여러 서비스를 결합하여 새로운 금융 원형을 만들어내는 어플리케이션
  * 사용자의 자금을 에스크로에 보관하고, 미리 정해진 조건에 따라 사용자간에 분배할 수 있도록 해야 한다.
  * 예
    * Aave는 스마트 컨트랙트를 사용하여 무허가 및 탈중앙화된 방식으로 대출과 차입을 용이하게 한다.
    * 자산 가격을 활용해 사용자의 차입자를 결정하고 대출의 담보가 부족하는 일 등으로 청산 대상인지 파악해 분산형 대출 시장을 제공한다. 
* 게임과 NFT
  * 블록체인 기반 게임은 게임 내 액션의 변조 방지를 위해 스마트 컨트랙트를 사용한다.
  * 예
    * 사용자가 유동성 풀에 자금을 투자한 다음 이자가 발생하면 금융시장으로 이동하는 pool together
      * 미리 정해진 기간이 지나면 게임의 종료되고 스앚에게는 모든 이자가 무작위로 지급되고 다른 사용자들은 예치금을 인출할 수 있다.
      * 한정된 NFT는 공정한 배포 모델을 가질 수 있고, RPG게임은 무작위성을 사용하여 예츠갛ㄹ 수 없는 전리품 드롭을 할 수 있어 모든 사용자가 희귀한 디지털 자산을 얻을 수 있는 공정한 기회를 가질 수 있다.
* DAO
  * decentralized autonomous organization
  * 컴퓨터 프로그램으로 인코딩되고, 조직 구성원들이 통제하고, 중앙 정부의 영향을 받지 않는 규칙들로 구성된 탈중앙화 자율조직
  * 영리 및 비영리 기업을 조직하기 위한 새로운 분산형 비즈니스 모델
  * 조직의 규칙은 코드에 내장되어 있기 때문에 관리자가 필요하지 않다.
    * 관료제나 계층적 구조가 없다.
  * 2016년 6월, the DAO가 해커들에게 360만개 이더를 탈취당한 사건 발생
    * 이더리움에서 하드 포크가 일어나 이더리움과 이더리움 클래식이 나뉘게 되었다.
* ICO
  * initial coin offering
  * 기업 공개(IPO)와 비슷한 개념
  * 새로운 암호화폐를 만들기 위해 투자자들에게 투자금을 받고 그 댓가로 코인을 나눠주는 것
  * 투자자들은 기업이 성공하여 코인에 대한 수요가 증가하고 코인 시세가 오를 것을 기대하고 참여한다.
  * 기업은 ICO로 초기 개발 자금을 모아 사업을 성장시켜 코인의 수요를 높이기 위해 노력한다.
* bridge
  * 브릿지
  * 토큰이나 임의의 데이터를 하나의 체인에서 다른 체인으로 전송할 수 있게 하는 역할 의미
  * 서로 다른 프로토콜, 규칙, 거버넌스 모델을 가질 수 있다.
  * 브릿지는 양쪽에서 안전하게 상호 운용할 수 있는 호환 가능한 방법 제공

## 스마트 컨트랙트 활용 사례

* 일정한 형식의 반복적인 계약이 많은 경우
  * 보험업에서 특정 조건을 만족시키면 계약에 대한 보상금이 지급되도록 스마트 컨트랙트를 작성하여 조건 성취 시 자동으로 보험금을 지불하도록 한다.
  * AXA와 Fizzy의 여행 보험 상품
  * B3i Blockchain Insurance Industry Initiative 는 블록체인 기술을 연구하고 보험업계에 적용할 수 있는 표준을 개발한다. 
    * 2017년 컨프런스에서 스마트 컨트랙트를 사용한 보험 계약 관리 시스템 프로토타입을 런칭하기도 한다.
* 원격자 간 계약 체결이 필요한 경우
  * 집이나 자동차를 공유하는 경우 계약 조건을 정하고 이에 따라 금전을 지급하거나 서비스를 제공하도록 한다.
    * 집을 일정 시간 빌리는 경우 스마트 컨트랙트에 비용을 지불하면 자동으로 집 문이 열려 사용 가능하도록 한다.
    * 자동차 렌탈 서비스
      * docusign, visa 가 개발한 자동차 렌탈 서비스 + 스마트 컨트랙트
* 제품의 유통 추적이 필요한 경우
  * 유통에 참여하는 당사자들(생산자, 공급자, 운영자, 배급업체, 유통업체, 규제당국, 소비자 등)이 유통 물품에 대한 정보를 확인하고 계약 조건이 만족되면 스마트 컨트랙트 상에서 대금을 지불한다.
  * 물류 유통의 경우
    * wells fargo, brighann cotton, the commonwealth bank of australia 스마트 컨트랙트와 IoT를 결합하여 솜 거래 및 유통을 자동화한다.
    * 스마트 컨트랙트를 통해 거래를 체결하고 GPS를 통해 솜의 유통 현황을 추적한다.
    * 물건이 최종 목적지에 도착을 하게 되면 그 사실을 관련 업체들에게 통지하고 스마트 컨트랙트가 자동으로 실행되어 거래업체에 돈을 지불한다.
* 저작권 등
  * binded 온라인 저작권 소유증명서 발급 서비스

## 스마트 컨트랙트가 저장되는 위치

![스마트 컨트랙트 모형도](smart-contract-design.png)

* 스마트 컨트랙트를 만드는 순서
  1. 스마트 컨트랙트 코딩: 구현하고자 하는 내용을 솔리디티나 다른 언어로 코딩합니다.
  2. 구현한 소스 코드를 컴파일: 컴파일 결과 EVM 바이트 코드가 생성됩니다.
  3. 스마트 컨트랙트 배포:
    스마트 컨트랙트를 배포한다는 것은 컴파일된 EVM 코드를 하나의 트랜잭션 처럼 블록에 추가시켜 블록체인에 등록시키는 작업입니다.
    소스 컴파일 -> EVM 바이트 코드 -> 구체적인 작업은 ABI 취득 -> ABI로부터 컨트랙트 객체 생성 -> 트랜잭션 생성하여 블록에 추가
    마이너가 해당 블록을 채굴하게 되면 블록체인에 포함됨.
  * 스마트 컨트랙트가 블록체인에 올라가면 블록체인 상의 모든 노드는 해당 스마트 컨트랙트의 바이트 코드를 가지고 있게 된다.
    * 각 노드, 이더리움 클라이언트는 해당 스마트 컨트랙트를 자신의 EVM에서 실행시킬 수 있다.
    * 한 노드에서 스마트 컨트랙트의 내용을 변경시키는 명령은 트랜잭션을 발생시켜 내용 변경이 이루어져, 다른 모드 노드가 컨트랙트에 접근하면 바뀐 내용을 얻게된다.
* 스마트 컨트랙트 코드 예시
  * 공용 변수에 값을 변경하고 읽는 기능을 수행할 수 있다.

  ```solidity
  pragma solidity ^0.4.8; // (1) 버전 프라그마
  // (2) 계약 선언
  contract HelloWorld {
  // (3) 상태 변수 선언
  string public greeting;
  // (4) 생성자
  function HelloWorld(string _greeting) {
    greeting = _greeting;
  }
  // (5) 메서드 선언
  function setGreeting(string _greeting) {
    greeting = _greeting;
  }
  function say() constant returns (string) {
    return greeting;
  }
  }
  ```

* 소스 코드 컴파일
  * 솔리티티 컴파일러로 컴파일 하면 EVM 바이트 코드가 생성된다.
  * 컴파일은 Remix나 Geth의 Solidity 컴파일러로 할 수 있다.
  * 컴파일 된 부분이 코드블록에 배포된다.
* 스마트 컨트랙트 배포
  * 컴파일된 바이트 코드를 블록체인에 배포하는 절차
  * Remix로 소스 코드를 컴파일하면, 바이트 코드와 ABI도 자동으로 얻을 수 있다.
  * Geth를 사용한다면, 바이트 코드와 ABI를 일일이 생성해야 한다.
  * ABI 얻기
    * Geth 콘솔에서 `eth.contract` 함수를 이용하면 ABI로 부터 스마트 컨트랙트 객체를 만들 수 있다.
    * 이 단계는 일반적 코딩에서 클래스를 정의한 것과 유사하다.
    * 실제 스마트 컨트랙트의 주소가 생성된게 아니다.
    * Geth console에서 스마트 컨트랙트 객체 생성 예시 보기

    ```
    sourceCompiledContract= eth.contract(contractAbiDefinition)
    {
    abi: [{
      constant: true,
      inputs: [],
      name: "say",
      outputs: [{...}],
      payable: false,
      stateMutability: "view",
      type: "function"
    }, {
      constant: false,
      inputs: [{...}],
      name: "setGreeting",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function"
    }, {
      constant: true,
      inputs: [],
      name: "greeting",
      outputs: [{...}],
      payable: false,
      stateMutability: "view",
      type: "function"
    }, {
      inputs: [{...}],
      payable: false,
      stateMutability: "nonpayable",
      type: "constructor"
    }],
    eth: {
      accounts: ["0x9751574414138b22986eb80ce2713cd2f5508c5c", "0xe37aa5cd578bb1ac568298e5621e11b8a8a113eb", "0xc94593e5164b6f4b5a2f9f0165c1b520858438de", "0x7a1809177f225053ed413743d7321fba8413a7b5"],
      blockNumber: 1179,
      coinbase: "0x9751574414138b22986eb80ce2713cd2f5508c5c",
      compile: {
      lll: function(),
      serpent: function(),
      solidity: function()
    },
      defaultAccount: undefined,
      defaultBlock: "latest",
      gasPrice: 20000000000,
      hashrate: 131062,
      mining: true,
      pendingTransactions: [],
      syncing: false,
      call: function(),
      contract: function(abi),
      estimateGas: function(),
      filter: function(fil, callback),
      getAccounts: function(callback),
      getBalance: function(),
      getBlock: function(),
      getBlockNumber: function(callback),
      getBlockTransactionCount: function(),
      getBlockUncleCount: function(),
      getCode: function(),
      getCoinbase: function(callback),
      getCompilers: function(),
      getGasPrice: function(callback),
      getHashrate: function(callback),
      getMining: function(callback),
      getNatSpec: function(),
      getPendingTransactions: function(callback),
      getRawTransaction: function(),
      getRawTransactionFromBlock: function(),
      getStorageAt: function(),
      getSyncing: function(callback),
      getTransaction: function(),
      getTransactionCount: function(),
      getTransactionFromBlock: function(),
      getTransactionReceipt: function(),
      getUncle: function(),
      getWork: function(),
      iban: function(iban),
      icapNamereg: function(),
      isSyncing: function(callback),
      namereg: function(),
      resend: function(),
      sendIBANTransaction: function(),
      sendRawTransaction: function(),
      sendTransaction: function(),
      sign: function(),
      signTransaction: function(),
      submitTransaction: function(),
      submitWork: function()
    },
    at: function(address, callback),
    getData: function(),
    new: function()
    }
    ```

  * 생성한 스마트 컨트랙트 객체를 실제로 블록 내용에 포함시키고, 채굴되어 블록체인에 포함되도록 하는 과정
    * 이 과정이 종료되어야 비로소, 생성한 컨트랙트에 접근할 수 있는 주소가 생성된다.
    * 생성한 스마트 컨트랙스 객체(객체라고 하지만 클래스와 같이 아직 실제 데이터에 접근할 수 있는 데이터가 없는 상태)로부터 하나의 인스턴스를 만든다.
      * 스마트 컨트랙트 최초 배포시에만 생성자에 입력될 매개변수를 넣어준다.
        `_greeting="Hello, World"`
      * 매개변수와 함께, 스마트 컨트랙트를 하나의 트랙잭션처럼 생성한다.
      * 트랜잭션의 송신자, 바이트 코드, 사용될 예상 Gas양을 같이 입력한다.
      * Geth console에서 스마트 컨트랙트 배포 예시

      ```
      > contract= sourceCompiledContract.new( _greeting, {from:eth.accounts[0], data:sourceCompiled['/tmp/geth-compile-solidity602335484:HelloWorld'].code gas:'4700000'})
      {
      abi: [{
        constant: true,
        inputs: [],
        name: "say",
        outputs: [{...}],
        payable: false,
        stateMutability: "view",
        type: "function"
      }, {
        constant: false,
        inputs: [{...}],
        name: "setGreeting",
        outputs: [],
        payable: false,
        stateMutability: "nonpayable",
        type: "function"
      }, {
        constant: true,
        inputs: [],
        name: "greeting",
        outputs: [{...}],
        payable: false,
        stateMutability: "view",
        type: "function"
      }, {
        inputs: [{...}],
        payable: false,
        stateMutability: "nonpayable",
        type: "constructor"
      }],
      address: undefined,
      transactionHash: "0x99ddfd763478ce7a0d328fbc67f3c10fec377efa18a8e9c41f61321feb836cd1"
      }
      ```
* 채굴
  * 스마트 컨트랙트 배포 예시의 마지막에는, `address: undefined` 라는 부분을 볼 수 있다.
  * 트랜잭션이 채굴을 통해 블록체인에 등록되지 않았기 때문에, 컨트랙트의 주소값이 비어있는 상태
  * 마이너가 트랜잭션이 포함된 블록을 채굴하게 되면 비로소 스마트 컨트랙트 주소가 생성된다.

  ```
    address: "0x6f9c338bb987f1baf619697784c9457b9afa119c",
    transactionHash: "0x99ddfd763478ce7a0d328fbc67f3c10fec377efa18a8e9c41f61321feb836cd1",
    allEvents: function(),
    greeting: function(),
    say: function(),
    setGreeting: function()
  ```

  * `address: "0x6f9c338bb987f1baf619697784c9457b9afa119c"`
    * 생성한 스마트 컨트랙트의 주소값
  * `transactionHash: "0x99ddfd763478ce7a0d328fbc67f3c10fec377efa18a8e9c41f61321feb836cd1"`
    * 생성한 트랜잭션의 해시값
    * Geth 콘솔에서 확인할 수 있다.
  * 트랜잭션 해시와 스마트 컨트랙트의 주소값은 전혀 다른 값이다.
  * 일반적인 송금과는 달리, 트랜잭션의 input:에 값이 있다.
    * 스마트 컨트랙트 소스 코드를 컴파일한 바이트 코드
    * 일반적인 거래에서는 바이트 코드가 필요없기 때문에 `input: 0x` 로 나타낸다.
  * 수신자가 없다.
    * 송신자만 있고, 수신자는 없다.
    * 스마트 컨트랙트는 이것을 생성한 송신자가 특정 수신을 지정하지 않고 자신이 생성한계약 코드를 블록체인에 올린 것이기 때문이다.
* 스마트 컨트랙트 접근 및 사용
  * 앞서 생성한 스마트 컨트랙트가 블록체인에 올라갔으니, 이제 스마트 컨트랙트 주소를 이용하여 정보를 읽고 쓰고 할 수 있다.
  * geth 콘솔에서 새로운 컨트랙트 객체를 만드는데 이 때는 기존에 존재하는 컨트랙트의 주소를 이용한다.
  * 앞에서 생성한 스마트 컨트랙트의 주소값을 이용하여 contract2라는 객체를 만든다.
  * contract2를 이용하여 스마트 컨트랙트의 공유 변수 값을 바꿀 수 있다.

  ```
  > contract2.setGreeting.sendTransaction( "Hello, Ethereum", {from:eth.accounts[0], gas:1000000})
  "0xa6b71f81b5d6d5c71248afb0e89f34aa2e0e52f98e353899bf80166b072fed36"
  ```

  * contract2를 통해서 스마트 컨트랙트의 공유 변수 값을 바꾸는 것도 하나의 트랙잭션을 생성한다.
    * 위 명령의 결과로 트랜잭션 "0xa6b71f81b5d6d5c71248afb0e89f34aa2e0e52f98e353899bf80166b072fed36" 새롭게 생성되었다.
      * 이 트랙잭션이 포함된 블록이 채굴되면, 스마트 컨트랙트의 공유 변수 값이 바뀌게 된다.
  * contract, contract2에서 공유 변수를 접근해 보면, 변경된 값이 동일하게 읽을 수 있다.
    * 복수의 사용자가 각각 스마트 컨트랙트 객체를 만들고 해당 스마트 컨트랙트에 접근하여 값을 변경하거나 읽어 올 수 있다.
    * 스마트 컨트랙트에 쓰는 것는 것은 트랜잭션을 발생시키지만, 값을 읽어 오는 것은 별도의 트랙잭션이 발생하지 않는다.
    * 공유 변수 값을 읽기만 하는 경우는 트랜잭션이 발생하지 않는다.
    * 읽는 작업은 거래라고 보기 어렵기 때문이다.

    ```
    > contract.say.call()
    "Hello, Ethereum"
    > contract.setGreeting.sendTransaction( "Hello, Bitcoin", {from:eth.accounts[0], gas:1000000})
    "0xe3878aa2689efc199f1159eb8c839882206405c5fb9d3c5eebfbe719a6b49d44"
    ```
  * 스마트 컨트랙트가 블록체인에 올라가면 블록체인 상의 모든 노드는 해당 스마트 컨트랙트의 바이트 코드를 가지고 있게 된다.
  * 각 노드, 이더리움 클라이언트는 해당 스마트 컨트랙트를 자신의 EVM에서 실행시킬 수 있다.
  * 한 노드에서 스마트 컨트랙트의 내용을 변경시키는 명령은 트랜잭션을 발생시키고 내용 변경이 이루어진다.
  * 다른 모드 노드가 컨트랙트에 접근하면 바뀐 내용을 얻게 된다.

![Smart contract model diagram](smart-contract-model-diagram.png)

## 스마트 컨트랙트 호출

* 이더리움
  * 스마트 컨트랙트 실행 
    * 새로운 스마트 컨트랙트를 생성
    * 특정 스마트 컨트랙트상의 함수를 실행
    * 이더를 전송하는 방식 중의 하나로 실행
    * 사용자 어카운트(EOA)에 의해서 발생한 트랜잭션이나 다른 컨트랙트에 의해서만 실행
  * 모든 트랜잭션을 실행할 때 해당 트랜잭션의 실행 비용을 지급하도록 규정
    * 무한반복같은 악의적인 코드를 막고, 데이타의 무결성를 지키기 위해
      * 디도스 공격 같은 무한 실행 공격처럼, 악의적인 의도로 컨트랙트를 실행하는 걸 방지
    * 모든 트랜잭션의 기본 실행 비용은 21,000 가스
  * 트랜잭션 실행 비용에는 발송자 어카운트 주소에 대한 ECDSA를 위한 비용과, 트랜잭션 저장을 위한 스토리지 비용, 네트워크 대역폭 비용이 포함된다.
* 메시지 구조체
  * 스마트 컨트랙트간의 호출은 메시지라는 특별한 구조체를 사용하여 호출된다.
  * 메시지는 외부 어카운트(EOA)가 아니라 컨트랙트 어카운트(CA)에 의해서만 생성된다.
  * 함수 호출시에 다른 컨트랙트로 전달된다.
  * 메시지는 트랜잭션과는 달리 EVM 내부에서만 존재하기 때문에 가스 비용이 발생하지 않는다.
  * Message 구조

  ```
  type Message struct {
    to         *common.Address // 메시지 수신처
    from       common.Address // 메시지 발신처
    nonce      uint64 // 거래 실행시 수행되도록 허용된 최대 트랜잭션 수행횟수
    amount     *big.Int // 메시지와 함께 전달되는 이더(wei 단위)
    gasLimit   uint64 // 트랜잭션 수행시 소비될 총 가스량에 대한 추정치
    gasPrice   *big.Int // 가스 가격
    data       []byte // 매개변수 전달시 사용되는 데이타 필드(Optional)
    checkNonce bool
  }
  ```

  * 메시지는 EVM내에서 컨트랙트를 실행하기 위해서 Call , CallCode , DelegateCall , StaticCall 등이 호출될때에 생성된다.
    * Call 코드들은 공통적으로 컨트랙트 주소를 매개변수로 전달받아 이를 실행하고 처리한다.

  ```
  contract D {
    uint public n;
    address public sender;
    function callSetN(address _e, uint _n) {
      _e.call(bytes4(sha3("setN(uint256)")), _n); // E's storage is set, D is not modified 
    }
    function callcodeSetN(address _e, uint _n) {
      _e.callcode(bytes4(sha3("setN(uint256)")), _n); // D's storage is set, E is not modified 
    }
    function delegatecallSetN(address _e, uint _n) {
      _e.delegatecall(bytes4(sha3("setN(uint256)")), _n); // D's storage is set, E is not modified 
    }
  }
  contract E {
    uint public n;
    address public sender;
    function setN(uint _n) {
      n = _n;
      sender = msg.sender;
      // msg.sender is D if invoked by D's callcodeSetN. None of E's storage is updated
      // msg.sender is C if invoked by C.foo(). None of E's storage is updated
      // the value of "this" is D, when invoked by either D's callcodeSetN or C.foo()
    }
  }
  contract C {
      function foo(D _d, E _e, uint _n) {
          _d.delegatecallSetN(_e, _n);
      }
  }
  ```

  * 스마트 컨트랙트는 Solidity 언어로 프로그래밍한다.
  * Solidity 언어로 프로그래밍된 스마트 컨트랙트는 컴파일러(solc)에 의해 바이트 코드로 컴파일된다.
  * 컴파일된 바이트코드는 블록에 포함되어, EVM(Ethereum Virtual Machine)에 의해 실행된다.
  * Solidity 언어 프로그래밍 스마트 컨트랙트 → 컴파일러(solc)에 의해 바이트 코드로 컴파일 → 블록에 포함 → EVM에 의해 실행

* EVM
  * Ethereum Virtual Machine
  * 이더리움 스마트 컨트랙트의 바이트 코드를 실행하는 32바이트 스택 기반의 실행환경
  * 스택의 최대 크기는 1024바이트
  * 이더리움의 각 노드는 EVM을 포함하고 있으며, EVM을 통해 바이트 코드를 OP코드로 변환하고 스택기반으로 각각의 OP코드를 실행한다.
    * Opcode
      * 수행할 연산자의 명령어를 표시하며, ‘Operation Code’를 줄여 OP Code라 부른다.
  * 휘발성, 비휘발성 메모리로 구성되어 있으며, 여기에 바이트 배열 형태로 스택의 항목들을 저장
    * 비휘발성 메모리(Non-Volatile)
      * storage : 상태(state)가 저장
      * code : 스마트 컨트랙트의 컴파일된 바이트 코드가 저장
    * 휘발성 메모리(Volatile)
      * stack : OP 코드를 실행하기위한 스택영역
      * args : 컨트랙트 호출시에 넘어오는 인자를 저장
      * memory : Word 단위로 아이템을 저장하는 바이트 배열
* EVM 동작 예시
  * 1+2 를 계산하는 바이트 코드(6001600201)를 가지고 EVM의 동작을 알아본다.
  * 바이트 코드(6001600201)를 치환하여 OP 코드로 분리하면 0x60, 0x01, 0x60, 0x02, 0x01이 된다.
    * 0x60 : PUSH OPCODE
    * 0x01, 0x02 : 값 1, 2
    * 0x01 : ADD OPCODE
  * EVM의 스택에 1,2를 Push하고 Add 연산을 수행하라는 의미
  * EVM 도구를 사용하여 위의 바이트코드를 실행할경우
    * 결과값 3이 스택에 넣어지는것을 확인할수 있다.
    * OP코드표상으로 PUSH, ADD 연산의 Gas 비용은 3임을 확인할 수 있다.
    * 해당 연산이 수행시에 3 Gas가 사용됨을 확인할 수 있다.