# Altcoin

* Alternative + Coin
* 비트코인을 개량한 암호화폐 전체
  * 비트코인은 오픈소스이기 때문에 새로운 암호화폐를 개발하기 쉽다.
  * 약 2만개 예상
  * 블록체인 기술로 작동한다.
  * 비트코인 문제 해결을 위해 비트코인 하드포크하거나 제네시스 블록에서부터 새롭게 시작하여 만든다.

## bitcoin cash

* 대표적인 알트코인
* 기존 비트코인의 블록당 저장 용량을 늘리기 위한 segwit 세그윗을 계기로 우지한 사장이 이끄는 비트메인 bitmain, 비아비티씨 viaBTC 등 중국 채굴업자들이 중심이 되어 새로 만든 암호 화폐
  * Segwit
    * 세그윗
    * Segregated Witness
    * 비트코인 블록에서 디지털 서명 부분을 분리함으로써 블록당 저장 용량을 늘리는 소프트웨어 업그레이드
    * 2017년 8월 1일 기준으로 전 세계 비트코인이 세그윗이라는 소프트포크를 진행하였다.
    * 기존 블록은 1MB에 불과하여 초당 7건, 하루 최대 60만건 거래내역만 처리할 수 있었다.
      * 비트코인 블록에서 디지털 서명 부분을 분리하여 별도로 저장함으로써 블록의 저장 용량을 늘릴 수 있었다.
    * 세그윗을 진행할 경우 중국 채굴 업자들이 사용한 에이식 부스트 asicboost 방식의 비트코인 채굴이 불가능해지기 때문에 antpool 앤트풀, viaBTC 비아비티씨 등 중국 채굴업체들을 중심으로 기존 에이식 ASIC 채굴기를 사용한 비트코인 채굴을 지속하기 위해 기존 비트 코인블록에서 분리된 암호화폐인 비트코인 캐시를 생성했다.
      * AsicBoost
        * 비트코인 채굴 속도를 약 20% 이상 높이는 방법
* SHA-256 해시 알고리즘 기반 작업 증명 방식으로 채굴한다.
* 등장배경
  * 비트코인의 트랜잭션 속도가 느리다.
    * 시간이 흐름에 따라 일정한 간격으로 생성되는 블록의 크기와 블록에 담을 수 있는 거래 내역들이 한정되어 있다.
* 비트코인 캐시는 블록의 크기를 기존에 비해 2~8배까지 확장하는 방법으로 트랜잭션 속도를 올렸다.
  * 기존의 비트코인이 가지고 있는 탈중앙화 구조를 유지하고 블록생성 주기 10분을 조정하지 않은 상태에서 트랜잭션 속도를 올릴 수 있는 효율적인 방법
* 문제점
  * 제한된 확장성
    * 기존 구조를 거의 변경하지 않아 확장성의 효과가 제한적이다.
    * 블록체인에 참여하는 노드 수가 증가하고 더 많은 트랜잭션이 나타나게 되면 거래 처리 속도는 지금의 지연상태처럼 수시간 또는 수일동안 거래가 처리되지 않을 가능성이 높다.
  * 자원의 중앙화
    * 블록을 생성하는 채굴노드의 중앙화는 탈중앙요소를 위협하는 새로운 문제로 제기된다.
    * 블록생성에 가치를 부여하고 해커들의 시도를 무력화하는 PoW 알고리즘이 자본의 집중으로 인한 채굴 권력을 분산시키지 못한다.
    * 새로운 수익을 내기 위해 자본은 집중화 되는 특성을 가지고 있다.
      * 비트코인의 경우 PoW로 채굴하기 위해 컴퓨터가 10분 정도 시간에 풀 수 있는 난이도를 가진 수학 문제를 풀도록 한다.
      * 누가 더 많은 컴퓨팅 자원을 가져다가 빨리 문제를 풀게 되면 인센티브인 코인을 소유하게 된다.
      * 컴퓨팅 자원을 누가 더 많이 확보하느냐에 따라 인센티브를 가져갈 확률이 올라간다.
        * 컴퓨팅 자원의 농장화 등장   
        * 더 많은 자본이 모여들게 된다.
        * 운영하는 주체가 채굴, 블록을 생성하는 주체로 영향력을 가지게 된다.
        * 연합하여 채굴하지 않겠다고 할 경우 심각한 손상을 초래할 수 있다.
        * P2P네트워크에서 절대자가 나타나면 P2P네트워크로서 기능을 상실한다.
        * 채굴 농장이 블록체인 채굴 컴퓨팅 파워의 51% 이상을 가지게 되면 모든 정보의 소유권을 가지게 된다.
          * 익의적인 공격 행위와 해킹을 시도하면 모든 정보를 임의로 변경할 수 있게 된다.
        * 비트코인 캐시에 경우 블록 채굴 해시 파워의 50%이상을 주요 4대 채굴농장이 점유하고 있다.
          * 탈중앙화의 형태로 보기 어렵다.
          * 특정 세력에 의해 네트워크 운명을 달리할 수 있다.
          * 사적인 이익을 추구하는 농장이 코인 정보를 조정할 수 있기 때문에 믿기 어렵다.
        * 블록체인 존재의 의미가 퇴색된다. 
    * 비트코인의 경우
      * 채굴경쟁을 위해 나타난 채굴농장의 결성 및 운영
      * 채굴조직의 이익 극대화 정책으로 인해 블록체인 네트워크상에서 권력조직이 탄생했다.
      * 채굴노드 운영하는 집단의 수익지향적 채굴정책으로 비트코인 거버넌스에 균열이 발생했다.
      * 비트코인 캐시로 체인 분기가 이루어졌다.
        * 체인이 분기될 때마다 새로운 수익지향적 권력층이 나타날 수 있다.

## Bitcoin Gold

* 비트코인 골드
* 비트코인 캐시에 대항하여 중국의 잭 리아오가 만든 암호화폐
* 2017년 비트코인의 작업증명의 단점을 보완하고자 SHA-256 해시 알고리즘을 지캐시의 이퀴해시-BTG Equihash-BTG로 변경하여 비트모인 골드가 탄생했다.
* 채굴 난이도 조정 알고리즘 Linearly Weighted Moving Average, LWMA를 통해 일반 GPU로 채굴할 수 있도록 GPU 채굴을 복원하였다.
* 2018년 51% 공격으로 약 200억 상당의 비트코인 골드를 해킹당하는 사건이 있었다.

## 시사점

* 건전한 블록체인 생태계를 만들기 위해서는 자본과 수익지향 중심적 인간의 욕망을 제어할 수 있는 기재가 생태계 시스템에 반영되어 있어야 한다.
* 관리가 필요하다.
* 불특정 다수가 암호경제적 관점에서 제어되는 블록체인의 특성 외에도 선택과 유인, 큐레이션으로 탈중앙화된 가치를 유지시키기 위한 행위가 요구된다.
* 암호경제학이 특별한 제어를 하지 않아도 문제가 발생할 수 있다.
* 올바른 방향으로 블록체인 생태계가 유지될 수 있도록 시스템이 마련되어야 한다.