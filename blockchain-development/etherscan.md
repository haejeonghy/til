# Etherscan

* 이더리움을 위한 블록체인 탐색기, 검색, API, 분석 플랫폼
* 퍼블릭 이더리움 블록체인은 모든 주소, 트랜잭션, 블록에 대한 정보가 공개되어 있다.
  * 이더스캔은 이러한 공개된 정보를 시각화하여 보여준다.

## 트랜잭션 항목 정보

* Transaction Hash
  * 해당 트랜잭션의 ID
* Status
  * 트랜잭션의 성공 여부 (트랜잭션이 잘 기록되었는지)
* Block
  * 트랜잭션이 기록된 블록의 숫자. 
  * n Block Confirmations를 통해 트랜잭션이 채굴 된 후 블록이 얼마나 생겼는지 확인할 수 있다.
* Timestamp
  * 트랜잭션이 채굴된 시간
* From: 트랜잭션을 보낸 사람의 주소(트랜잭션을 생성한 사람의 주소)
* To: 트랜잭션을 받는 사람의 주소.
* Value: 보내는 이더의 양.
* Transaction Fee
  * 트랜잭션을 수행하는 채굴자에게 돌아가는 수수료
* Gas Price
  * 트랜잭션을 수행하는 데 소요되는 가스 당 비용 (이더 또는 gwei). 
  * Gas price가 높을 수록 채굴자가 블록에 트랜잭션을 포함시킬 확률이 높다.
* Gas Limit & Usage by Txn
  * 트랜잭션을 실행하는 데 드는 소모할 가스의 한도와 실제로 트랜잭션 수행 시 소모된 가스의 양
  * 일반적인 이더리움 트랜잭션에서는 21,000 가스를 사용한다.
* Gas Fees
  * Base Fee
    * 트랜잭션이 블록에 포함되기 위해 필요한 기본적인 가스의 양
  * Max Fee
    * 트랜잭션을 실행할 때 지불할 가스비의 최대 한도를 의미
  * Priority Fee
    * 트랜잭션을 수행하고 블록에 트랜잭션을 포함시키는 채굴자들에게 제공하는 수수료
* Burnt
  * Base Fee는 트랜잭션이 실행되면 소각된다. 이 소각된 양이 Burnt이다.
* Txn Savings Fees
  *  Max Fee에서 소각된 Base Fee와 채굴자에게 수수료로 낸 Priority Fee를 제외한 가스는 돌려받게 된다. 돌려받은 양
* Txn Type
  * 트랜잭션 타입 의미
  * 여기서는 2 (EIP-1559) 인데, 이는 런던 하드포크 이후의 트랜잭션 타입을 의미
  * 그 외에도 논스 값, 블록에서 몇번째에 기록되어 있는지 등을 확인할 수 있다.
* Input Data
  * 트랜잭션을 보낼 때 16진수 데이터를 보낼 수 있다.

## 블럭 항목 정보

* Block Height
  * 제네시스 블록으로부터 몇 번째 블록인지 나타낸다.
* Timestamp
  * 블록이 체인에 올라간 시점
* Transactions
  * 블록에 들어있는 트랜잭션의 개수. 
  * contract internal transactions는 컨트랙트 실행 결과로 생성된 트랜잭션 의미
* Mined by
  * 채굴 노드의 주소
* Block Reward
  * 블록 채굴 보상 
  * 보상은 (일반적인 채굴 보상 + 트랜잭션 수수료 - 소각된 기본 수수료)로 산정된다.
* Uncle Reward
  * 블록을 생성하여 체인에 올렸으나, 체인의 길이가 짧아 탈락한 블록
  * 이더리움에서는 이러한 엉클 블록을 만든 채굴 노드에게도 일정량의 보상을 제공한다.
* Difficulty
  * 채굴 난이도
* Total Difficulty
  * 제네시스 블록부터 해당 블록까지의 전체 채굴 난이도.
* Size
  * 블록의 사이즈. 
  * 블록의 사이즈는 gas limit으로 측정된다.
* Gas Used
  * 블록 내에서 사용된 가스의 총량과 블록에 저장된 가스의 양.
* Gas Limit
  * 블록 내 모든 트랜잭션의 Gas Limit 총량
* Base Fee Per Gas
  * Post-London Upgrade 이후, 트랜잭션이 블록에 포함되기 위한 최소한의 gas Used 승수.
* Burnt Fees
  * 트랜잭션 수수료 중 burnt fee의 총량
* Extra Data
  * 채굴 노드에 의해 블록에 포함되는 추가적인 데이터
* Hash
  * 현재 블록의 블록헤더 해시값
* Parent Hash
  * 직전 블록의 블록헤더 해시값
* StateRoot
  * 상태 트리의 루트값
* Nonce
  * 채굴 노드가 PoW를 통해 찾은 논스 값

## 계정 항목 정보

* Txn Hash
  * 트랜잭션 해시(=트랜잭션의 주소)
  * 누르면 해당 트랜잭션에 대한 정보를 확인할 수 있다.
* Method
  * 실행한 함수. 단순 송금을 한 경우 Transfer 함수가 출력됩니다.
* Block
  * 해당 트랜잭션이 담긴 블록의 숫자
* Age
  * 트랜잭션이 채굴된 시간
* From
  * 트랜잭션을 보낸 사람의 주소(트랜잭션을 생성한 사람의 주소)
* To
  * 트랜잭션을 받는 사람의 주소.
* out, in
  * 해당 계정이 이더를 송금 받은 경우 in으로 표기되며, 해당 계정이 이더를 송금한 경우에는 out으로 표기된다.
* Value
  * 보내는 이더의 양.
* Txn Fee
  * 트랜잭션 수수료