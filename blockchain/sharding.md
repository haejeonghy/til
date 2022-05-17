# Sharding

* 샤딩
* 하나의 거대한 데이터베이스나 네트워크 시스템을 여러 개의 작은 조각으로 나누어 분산 저장하여 관리하는 것
* Shard
  * 샤드
  * 샤딩을 통해 나누어진 블록들의 구간(Epoch)
* 단일의 데이터를 다수의 데이터베이스로 구간별로 쪼개어 나누는 것
  * 단일의 데이터베이스에서 저장하기 너무 클 때 사용
    * 노드에 무겁게 가지고 있던 데이터를 빠르게 검증할 수 있다.
    * 트랜잭션 속도를 향상시킬 수 있다.
* 조각내다 라는 뜻
* 대용량의 데이터를 처리하기 위해 테이블을 수평 분할하여 데이터를 분산 저장하고 처리하는 것
* 블록체인에서는 전체 네트워크를 분할한 뒤 트랜잭션을 영역별로 저장
  * 이를 병렬적으로 처리하여 블록체인에 확장성을 부여하는 온체인 솔루션
* 예
  * 샤딩은 데이터 10을 조각내서 10명의 노드 개개인은 1만큼씩만 보관한다.
  * 보관 데이터가 가벼워져 거래처리 속도가 크게 향상된다.

## 등장 배경

* 블록체인 시스템의 확장성(Scalability) 문제를 해결하기 위한 방법
  * 확장성
    * 시간이 지남에 따라 생겨나는 변화를 받아들이는 능력
    * 시간이 지남에 따라 블록체인 기반 서비스는 대체로 사용자 수가 증가한다.
    * 확장성 문제
      * 더 많은 사용자가 만들어내는 트랜잭션을 블록체인 시스템으로 처리할 수 있는 능력의 문제
      * 비트코인과 이더리움의 경우 확장성 문제가 심각하여, TPS를 획기적으로 증가시키기 위한 다양한 방법 고안
        * 대표적인 기법이 샤딩
* 플라즈마, 라이덴 네트워크 등과 마찬가지로 확장성 문제를 해결하기 위해 제안된 솔루션
  * 플라즈마, 라이덴 네트워크
    * 오프체인 솔루션
      * Off-chain
      * 메인체인 바깥에 다른 시스템을 추가하여 해결하기 때문에 하드 포크가 필요 없다.
* 샤딩
  * 온체인 솔루션
    * On-chain 
    * 메인체인 자체의 프로토콜을 변경시켜서 메인체인의 성능을 향상
    * 메인 네트워크의 하드 포크 가 필수적
    * 이더리움이 PoS(지분 증명) 합의 알고리즘으로 전환할 것을 기반으로 설계

## 샤딩의 특징

* 관계형 데이터베이스에서 대량의 데이터를 처리하기 위해서 데이터를 파티셔닝하는 기술
* 파티셔닝은 DBMS 에서 지원
  * 일부 DBMS에서는 지원하지 않으며, DBMS 레벨에서 데이터를 나누는 것이 아니다.
* 데이터베이스 자체를 분할하는 방식으로 애플리케이션 레벨에서 구현
* 공개형 블록체인의 맥락에서 네트워크에 올려진 트랜잭션
  * 네트워크상의 서로 다른 노드들로 이루어진 여러 샤드(Shards)로 분할된다.
  * 각각의 노드는 들어오는 트랜잭션들의 일부만을 처리할 수 있게 된다.
  * 네트워크상에서 병렬식으로 다른 노드들에서도 똑같이 실행된다.
* 네트워크를 여러 샤드로 쪼개면 동시에 더 많은 트랜잭션을 처리하고 증명할 수 있다.
  * 네트워크가 커질수록 점점 더 많은 트랜잭션 처리가 가능하게 되는 속성
    * Horizontal Scaling
      * 병렬식 확장
* 단일의 데이터베이스에서 저장하기 너무 클 때 사용한다.
* 데이터를 구간별로 쪼개어 나눔으로써 노드에 무겁게 가지고 있던 데이터를 빠르게 검증할 수 있다.
  * 빠른 트랜잭션 속도를 가질 수 있다.

### 수평 분할(Horizontal Partitioning)

* Schema
  * 스키마
  * 같은 데이터를 두 개 이상의 테이블에 나누어 저장하는 디자인
  * 인덱스의 크기를 줄이고, 작업 동시성을 늘리기 위한 것
* 수평 분할을 한다고 했을 때는 하나의 데이터베이스 안에서 이루어지는 경우

## 장점

* 필요한 데이터만 빠르게 조회할 수 있기 때문에 쿼리 자체가 가볍다.
* 오래돼서 조회가 안 되는 데이터를 클라우드에 올리거나 별도의 디스크에 저장해서 운영상의 스토리지 이득을 볼 수 있다.

## 문제점

* 블록체인 시스템의 확장성 문제를 해결하기 위해 등장한 기술
* 샤딩을 적용할 경우 한 샤드 내에서의 전송이 아닌 여러 샤드 간의 전송은 절차가 훨씬 복잡하고 느려진다.
* 여러 샤드로 쪼갤수록 인터샤드 트랜잭션은 확률적으로 많아진다.
  * 각 샤드는 자기 샤드의 데이터만 있고, 다른 샤드의 데이터는 가지고 있지 않다.
  * 샤드간 데이터를 어떻게 참조할 것인지, 어떻게 검증할 것인지 문제가 생겨서 알고리즘이 복잡해진다.
    * 이 단계에서 거래결과가 뒤집어지면(비확정적합의) 상황은 더욱 복잡해지기 때문에 확정합의가 거의 필수이다.
* 샤딩이 들어가게 되면 전체의 안정성은 보장이 된다.
  * 시간이 지나면 샤드간 불균형이 일어나 일부 샤드의 안정성이 취약해지는 문제가 발생
  * 샤드마다 트랜잭션의 빈도, 노드의 수, 밸리데이터의 비율 등에서 차이가 난다.
    * 한 번 샤드가 정해진 다음에도, 샤드의 구성원을 재배치하여 샤드간 균형을 맞추는 알고리즘이 필요하다.
    * 예상했던 것보다 전체 트래픽이 높아질 경우 처음 설정해둔 샤드의 수를 늘릴 필요가 있다.
    * 한 번 쓰여진 데이터를 해쉬나 서명으로 묶어 위변조나 조작을 하지 못하도록 만들어진 분산 원장 구조에서는 샤드를 중간에 추가하는 등의 동적 샤딩 기술을 구현하기가 매우 어렵다.
* 중앙화의 문제와 보안성의 문제
  * 보안의 문제에는 1% Attack의 문제가 생길 수 있다.
    * 100개의 샤드의 시스템에서는 오직 1%의 Hash Rate로 샤드를 지배할 수 있어 샤드 간의 커뮤니케이션이 너무 빈번하게 일어난다면
      * 커뮤니케이션으로 인한 시간 지연의 문제가 생긴다.
  * 데이터 재분배(Rebalancing Data)로는 샤딩된 DB의 물리적인 용량 한계나 성능 한계에 따라 샤드의 수를 늘리는 Scale-up 작업이 필요하다.
    * 서비스 정지 없이 Scale-up 할 수 있도록 설계 방향을 잡아야 한다.
    * Global Transaction을 사용하면 샤드 DB 간의 트랜잭션도 가능하여 XA 임에도 성능 저하의 문제가 있다.

## 확장성과 샤딩

* 확장성의 문제
  * 상용화를 위해서는 기존의 서비스(샤딩 이전)와 같이 불편함이 없어야 하기에 TPS가 빨라야 한다.
    * 정보를 처리하는데 사용자들이 오랜 시간 기다리지 않고 사용할 수 있어야 한다.
    * TPS의 비교를 통해 얼마나 짧은 시간 안에 많은 정보를 처리할 수 있느냐로 직관적이게 확인할 수 있다.
      * 수많은 블록체인 프로젝트를 비교할 때 대표적으로 TPS를 비교
      * 샤딩은 확장성의 문제를 해결해주는 한 가지의 방법
        * 노드들을 좀 더 빠르게 검증할 수 있어 빠른 트랜잭션을 통하여 좀 더 높은 TPS를 가질 수 있게 해준다.

## 데이터베이스를 나누는 방법

* Vertical Partitioning
  * 테이블별로 서버를 나누는 방식으로 구현이 간단하다.
  * 전체 시스템에 큰 변화가 필요 없다는 장점이 있고 단점으로는 각 서버의 데이터가 점점 거대해지면 추가 샤딩이 필요하다.
* Range Based Partitionging
  * 하나의 Feature가 점점 거대해지는 경우 서버를 분리하는 방식
  * 유저 별로 서버를 분리하거나, 일정 데이터라면 년도 별로 분리, 거래정보라면 우편번호를 이용한다.
  * 주의 사항으론 데이터를 나누는 방법이 예측 가능 해야 한다.
* Key or Hash Based Partitioning
  * 엔티티를 해쉬함수에 넣어서 나오는 값을 이용해서 서버를 정하는 방식
  * 해쉬결과 데이터가 균등하게 분포되도록 해쉬 함수를 정하는 게 중요하다.
  * 서버의 수를 늘리기 위해 해쉬함수를 변경하는 작업이 정말 비싼 작업이라는 단점이 있다.
* Directory Based Partitioning
  * 파티셔닝 메커니즘을 제공하는 추상화된 서비스를 만드는 것
  * 샤드 키를 look-up 할 수 있으면 되므로, 구현은 DB와 CACM을 적절히 조합해서 만든다.

## 샤딩 체인 동작 방식

* Proposer가 되고 싶은 네트워크 참여자는 SMC 를 통해 Balance를 예치한다.
* Collator가 되고 싶은 네트워크 참여자는 SMC를 통해 Deposit을 예치한다.
* Collator들은 주기적으로 SMC Status를 확인해서, 자신이 Collator에 선정되었는지 여부를 확인한다.
* Collator들은 SMC에 의해 각 샤드 체인에 Pseudo-Random하게 배정되고, Look Ahead Period 동안에 해당 샤드의 이전 기록들을 다운받으면 선택된 Proposal을 제안한 Proposer로부터 Proposal Bid를 받는다.
* Proposer는 트랜잭션을 담은 Proposal을 Collator에게 제출하는데, Proposal은 아직 검증되지 않은 Collation을 의미하며, 선택된 Proposal을 제출한 Proposer는 트랜잭션 발송자로부터 트랜잭션 Fee를 받는다.
* Collator들은 해당 Proposal에 속한 트랜잭션들이 Valid 한지를 검증하는 투표를 한다.
표에서 2/3 이상의 Collator들이 Proposal에 포함된 트랜잭션이 Valid 하다고 찬성할 경우, 해당 Proposal은 유효한 Collation이 된다.

## 주요 용어

* Collation
  * 샤드 체인에서 메인 체인의 블록과 같은 역할
  * 크게 Collation Header와 트랜잭션 목록으로 구성된다.
* Collation Header
  * Collation을 구성하는 정보를 담고 있다.
  * Proposer의 Sign을 거쳐 메인 체인에 제출한다.
  * 트랜잭션 목록은 Collation에 담긴 트랜잭션들의 목록이다.
* Proposer
  * 제안자라는 뜻으로 트랜잭션들을 모아 Proposal을 만들고 Collator에게 제출한다. 
  * Proposal은 검증되지 않은 Collation이다.
* Collator
  * Proposer가 제출한 Proposal을 검증한다. 
  * Period마다 한 샤드에는 여러 Collator들이 배정되는데 이들은 해당 Period에 진입하기 일정 기간 이전에 무작위로 선정된다.
* Executor(샤딩 Phase 3에 등장)
  * Collation header를 메인체인의 SMC (Sharding Manager Contract)에 전달하고, 샤드 체인의 실제 State가 변경된다.
* Period
  * 메인 체인에서 샤드 체인의 Collation Header를 제출받는 주기
  * 단위는 메인 체인에서의 블록의 개수로 PERIOD_LENGTH = 5라면 5개의 블록이 생성되는 것이 1 Period이다.
* Look Ahead Period
  * Collator는 샤드 체인에서 Collation을 검증하기 이전에 SMC에 의해 Pseudo-Random 하게 배정된다.
  * 'Look Ahead Period'는 Collator가 몇 Period에 앞서서 어떤 샤드 체인에 배정되는지를 나타낸다.
  * LOOKAHEAD_PERIODS = 4이면 4 Period 이전에 Collator는 샤드 체인에 배정되므로 Collator는 사전에 자신이 배정된 샤드 체인의 State 정보를 다운받는 시간을 확보할 수 있다.
* Sharking Manager Contract (SMC)
  * SMC는 샤드 체인에서 가장 중요한 역할을 하는 스마트 컨트랙트
  * SMC는 메인 체인과 샤드 체인을 연결하며, Collator, Proposer, Collation Tree를 관리하며, 샤드 체인이 메인체인에 참여하기 위해서는 SMC의 역할이 필수적이다.

## 이더리움에 샤딩 적용

### 이더리움 샤딩

* 이더리움 샤딩은 메인 체인이 처리해야 할 블록들을 조각내어 샤드(Shard)라고 불리는 오프 체인(Off-chain)에 할당한다.
  * 오프 체인들은 주어진 조각에 대해서만 유효성을 검증한다.
* 샤드들이 각자 할당된 조각들의 검증을 모두 끝내면 다시 묶어 이러한 개념을 통해 블록을 검증하는 데 걸리는 시간을 단축한다.
* 이더리움의 블록 생성 속도는 13초 이상 걸린다.
* 샤딩이 도입된다면 약 2초에서 8초 사이에 생성된다.
* 샤드별로 Merkel Patricia Tree를 만들고 그 샤드의 Root들로 만들어진 Merkel Patricia Tree의 Root만을 블록체인에 올리는 것
* 모든 Miner가 모든 트랜잭션을 실행할 필요 없이 샤드별로 Miner를 분산 시켜 실행할 수 있기 때문에 전체 실행 속도가 올라간다.

### 이더리움 샤딩의 문제점

* 난수 생성
  * 난수를 사용하여 검증자를 샤드에 배정하는데, 공격자가 난수를 예측하거나 조작할 수 있어, 샤딩 보안에 문제가 생긴다.
* 빠른 샤드 전환
  * 샤드에 대한 공격 성공 가능성을 줄이려면 검증자를 빠르게 전환해야 하는데 이전부터 Look Ahead Time을 두어 검증자가 자신이 맡을 샤드블록를 미리 동기화시키고, 미리 동기화하기 위해서는 동기화할 자료를 줄여서 빠르게 검증자를 준비할 수 있는 Stateless Client를 제안한다. 
  * Stateless Client는 블록 헤더만을 저장하지만 블록헤더 만을 저장하기 때문에 거래에 대한 검증은 불가능하여 거래 검증을 하려면 거래를 만들 때, 검증에 필요한 Witness를 첨부해야 한다.
* 자료 가용성 (Data Availability)
  * 모두가 Stateless Client라면 블록의 내용을 손실할 수 있기 때문에 누군가는 State를 저장하고 있도록 적절한 보상과 검증 (Proof of Custody)가 필요하다. 
  * Fisherman 딜레마는 Erasure Coding으로 해결했다.
  * 극복했다고 함. (HA 기준)
* 검증 자간 효율적인 통신
  * 샤드 배정이 자주 바뀌는 상황에서 샤드 검증자들끼리의 효율적인 P2P 통신은 필수적이며, libs 2p의 Flood Sub과 Gossip Sub가 사용된다.
* 샤드 간 비동기 통신
  * 거래 당사자나 스마트 계약이 여러 샤드에 나누어져 있다면 샤드 간의 통신(Cross-Shard Communication)이 필요하지만 여러 단계를 거치게 되어 시간이 오래 걸리므로 결국 메인 체인에 무리를 주게 되고 이렇게 샤드 간 통신이 너무 자주 일어난다면 샤딩의 장점은 사라진다. 
  * 이에 이더리움은 Cross Link를 가지고 메인체인의 무리를 덜고, Yanking으로 필요한 스마트 계약을 현재 샤드로 가져와 샤드 간의 통신을 줄이고자 현재 지연상태 전이(Delayed State Transition)을 통한 샤드 간의 비동기 통신도 구상 중이라고 한다.

## 샤딩의 활용

* Zilliqa
  * 질리카
  * 싱가포르의 신슈 동 이 개발한 암호화폐
  * 샤딩 기술을 활용함으로써 트랜잭션 처리 속도를 획기적으로 향상
  * 네트워크 샤딩(Network Sharding), 트랜잭션 샤딩(Transaction Sharding), 연산 샤딩(Computational Sharding) 등 다양한 형태 구성
    * 네트워크 샤딩
      * 네트워크 샤딩은 질리카 채굴 네트워크를 샤드(Shard)라는 작은 노드 그룹으로 나눌 수 있는 메커니즘
      * 질리카를 확장할 수 있는 도구로서, 이 샤딩을 활용하게 되면 초당 수천 건의 트랜잭션 처리가 가능
* 샤딩은 블록체인 확장성에 대한 하나의 해결책
  * 네트워크가 블록의 유효성을 검증하는 방식을 바꿈으로써 처리량의 증대
  * 모든 온체인(On-chain) 확장성 솔루션 가운데 샤딩을 특별하게 만드는 핵심적인 특징은 병렬식 확장성(Horizontal Scaling)이다.
    * 채굴 네트워크가 확장할수록 처리량이 증가하면, 샤딩의 이 독특한 특성은 블록체인의 빠른 채택을 촉진하는 이상적인 촉매제가 될 수 있다.
* 샤드
* 데이터베이스 샤딩
* 네트워크 샤딩
* 스테이트 샤딩
* 동적 샤딩
* 알고리즘 샤딩
* 적응형 상태 샤딩
* 체인샤딩
* 트랜잭션 샤딩