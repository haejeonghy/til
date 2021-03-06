# Transaction

* blockchain = block + chain
  * block = header + body
    * header = metadata
      * metadata
        * 블록이라는 데이터를 설명하는 데이터
        * 블록의 맨 윗 부분에 따로 두기 때문에 헤더라고 부른다.
        * nonce 포함
        * 이 블록이 체인 중 몇 번째 블록인지
        * 이 블록에 몇 개의 트랜잭션이 있는지
        * 이 블록을 누가 생성했는지
        * 이 블록의 크기, 총 전송량은 얼마인지
    * body = transaction list
* transaction
  * 데이터베이스 상태를 변환시키는 하나의 논리적 기능을 수행하기 위한 작업의 단위
  * ACID
  * 상호작용 및 작업 수행의 논리적 단위
  * 블록체인의 상태를 변화시키는 일련의 작업 내포
  * 블록체인 상의 모든 활동들이 트랜잭션을 통해 이루어진다.
* transaction data
  * 비트코인 거래 시 보내는 주소, 받는 주소, 금액, 수수료 등의 정보 작성 필요

## Bitcoin transaction 구조

![트랜잭션 구조](transaction-structure.png)

* 버전 번호 : 채굴자와 노드가 트랜잭션 처리에 사용할 규칙을 지정하는데 사용
  * transaction version
  * 트랜잭션 버전
  * 네트워크에서 트랜잭션의 유형을 지정하는 버전 번호
  * 버전 별로 그 구조와 규칙이 조금씩 다르다.
  * 노드는 트랜잭션을 읽을 때 버전 번호를 확인하고 트랜잭션을 어떻게 읽어야 하는지 파악할 수 있다.
* 입력 카운터 : 트랜잭션에 포함된 입력의 개수
* 입력 리스트 : 블록의 첫 트랜잭션은 코인베이스 트랜잭션. 입력 리스트에는 하나 이상의 트랜잭션 입력이 포함된다.
  * 입력
    * 지불할 돈
    * 포인터 pointer + 해제 키 unlocking key
    * pointer 포인터
      * 이전 트랜잭션 출력
    * unlocking key 해제 키
      * 포인터로 가리키고 있는 이전 출력을 해제하는 데 사용된다.
      * 거스름돈을 돌려줘야 하기 때문에 새로운 출력을 만든다.
* 출력 카운터 : 출력의 개수를 나타내는 양의 정수
* 출력 리스트 : 트랜잭션에 포함된 출력
  * 트랜잭션의 출력은 지폐를 사용하는 것과 같다.
  * 일부를 지불하고 거스름돈을 돌려받는 식
  * lock + value
    * 잠금과 값으로 구성되어 있다.
    * 기본적으로 잠겨 있으며, 입력에는 이 잠금을 해제할 수 있는 키 key가 들어있다.
    * 값 : 출력 내에 잠겨있는 비트코인 단위의 양 의미
* 로크(Lock) 시간 : 트랜잭션이 유효해지는 가장 빠른 시간을 정의하는 필드
  * 마지막 데이터는 잠금 시간으로 트랜잭션을 블록체인에 바로 포함시킬 수 있는지, 아니면 지정된 시간이 지나면 포함시킬 수 있는지를 지정한다.
* 정리
  * 출력에는 자산이 잠겨있고 입력으로 출력을 해제하여 출력에 있는 값을 꺼내 새로운 출력에 자산을 담는다.
  * 트랜잭션은 다른 곳에 잠겨있는 출력을 해제하는 입력과, 입력의 결과로 생긴 새로운 출력이 담기게 된다.
  * 트랜잭션은 이전 출력을 해제하고 새로운 출력을 만드는 추상적인 액션이다.
  * 입력에 의해 생성된 후 다른 입력에 의해 해제되지 않은 트랜잭션 출력이 UTXO 이다.

## Ethereum transaction 구조

* **Nonce** : 발신 EOA에 의해 발행되어 메시지 재사용을 방지하는데 사용되는 일련번호
  * 거래 전송 (transaction) 시 논스는 1씩 증가한다.
  * 논스는 계정에서 유일하며 동일한 논스가 존재하지 않는다. 
  * 발신 주소의 속성
  * 발신 주소의 컨텍스트 안에서만 의미를 갖는다.
  * 명시적으로 블록체인 계정 상태에 저장되지 않고 해당 주소에서 발생한 확인된 트랜잭션 건수를 세어서 동적으로 계산되는 값
  * 중복되지 않고 순차적이다.
  * 같은 논스에 여러 트랜잭션 전송이 발생하였다면 해당 논스 중 가장 높은 가스비를 지불한 트랜잭션이 처리된다.
    * **이중 지불 문제**를 방지한다. 
      * double spending
        * 원본 파일에 저장된 가치를 지불한 뒤 해당 파일을 복사하여 다른 사람에게 또 지불하는 것
    * nonce 유무 차이의 결과
  * 논스가 0인 트랜잭션 전송 후 논스가 2인 트랜잭션을 전송하면 두 번째 트랜잭션은 어떤 블록에도 포함되지 않는다.
  * 이더리움 네트워크는 누락된 논스가 나타날때까지 기다리는 동안 두 번째 논스를 멤풀에 저장한다.
    * Mempool : 아직 블록에 들어가지 않은 상태의 트랜잭션들이 어떤 공간에 있는 것
  * 논스가 1인 누락된 트랜잭션을 전송하면 두 트랜잭션이 처리가 되고 블록에 포함한다.
  * 모든 트랜잭션은 일회성이다.
    * 하나의 트랜잭션은 하나의 상태만 변화시킬 수 있다.
    * ethereum 
      * account기반 시스템으로 nonce값을 각 트랜잭션이 오직 한 번만 처리되게 하는 카운터로 사용한다.
    * bitcoin
      * UTXO(Unspent Transaction Ouputs, 미사용 트랜잭션 출력값)
      * 하나의 상태만 변화시키도록 한다.
* 가스 가격 (gas price) : 발신자가 지급하는 가스의 가격
* 가스 한도 (gas limit) : 이 트랜잭션을 위해 구입할 가스의 최대량
* 수신자 (Recipient) : 목적지 이더리움의 주소
* 값 (Value) : 목적지에 보낼 이더의 양
* 데이터 (data) : 가변 길이 바이너리 데이터 페이로드
* v, r, s : EOA의 ECDSA 디지털 서명의 세가지 구성 요소