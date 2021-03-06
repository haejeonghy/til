# Finality, CAP

* 완결성
  * 트랜잭션이 발생하고 되돌릴 수 없다. 
  * 현금 거래, 신용카드 거래에서 달성하는 즉각적인 완결성
* 블록체인에서 완결성
  * 블록체인에 커밋되면 잘 구성된 모든 불록이 취소되지 않는다는 확인
  * 사용자는 거래할 때 거래가 완료되면 거래를 임의로 변경하거나 되돌릴 수 없다는 확신
  * 블록체인 합의 프로토콜 설계에서 완결성이 중요하다.
  * 나카모토 합의 기반 시스템에서 51% 공격과 이기적 채굴은 블록 취소 가능성을 허용하여 시스템의 안전을 위협한다.
    * 확률적 완결성을 제공하는 반면 다른 프로토콜은 절대적 완결성을 보장할 수 있다.

## Types of Finality

* Probabilistic finality
  * 확률적 완결성
  * 체인기반 프로토콜이 제공하는 완결성 유형
  * 트랜잭션이 포함된 블록이 체인 깊숙이 가라앉을수록 트랜잭션이 되돌리지 않을 확률이 높아진다.
  * 블록이 깊을수록 해당 블록을 포함하는 포크가 가장 긴 체인일 가능성이 높다.
  * 트랜잭션이 되돌릴 가능성이 매우 낮은지 확인하기 위해 해당 트랜잭션을 수행하기 전에 비트코인 블록체인 깊이가 6블록이 될 때까지의 시간, 대략 1시간을 기다려야 한다. 
* Absolute Finality
  * 절대적 완결성
  * PBFT 기반 프로토콜(예 tendermint)에서 제공하는 완결성 유형
  * 트랜잭션이 블록에 포함되고 브록체인에 추가되면 즉시 완료된 것으로 간주한다.
  * 리더가 블록을 제안하고 검징인 위원회의 충분한 비율이 블록을 승인해야 커밋된다.
* Economic Finality
  * 경제적 완결성
  * 이 블록을 되돌리는 경우에 대한 금전적 비용이 많이 드는지 판단한다.
  * 슬래싱 매커니즘을 사용하는 지분 증명 기반 시스템 (예 casper FFG, tendermint)에서 스테이커가 두 블록에 이중 서명하면 전체 지분이 삭감되어 완결성을 해치는 데 막대한 비용이 소요된다.
  * 예
    * 100명의 스테이커가 있는 네트워크
    * 각각이 100만 달러를 스테이킹했다면 총 스테이크 금액은 1억 달러이다
    * B와 B'와 같이 동일한 높이에 두 개의 블록이 제안되고 스테이커의 66%가 B에 투표하고 66%가 B'에 투표하면 최소 33%의 스테이커가 악의적이었다고 판단할 수 있다.
      * 최소 3300만달러의 손실

## CAP 정리

* CAP Theorem
* 절대적 완결성이 확률적 완결성보다 더 바람직한 것으로 보이지만 확률적 선호 체인을 선택하는 것이 더 나을 수 있는 근본적인 절충점이 있다. 
* 확률론 완결성과 BFT기반 완결성간의 절충할 때 Eric Brewer의 CAP 정리를 사용하는 것이 유용하다.
* CAP 정리에 따르면 파티션의 경우 분산 시스템은 일관성이나 가용성 중 하나만 보존할 수 있다.
* 일관성 유지 시스템은 시스템의 정지보다는 부정확한 거래를 통해 가용성을 택할 것이다.
* 가용성 우선 시스템은 부정확한 거래를 허용하더라도 보존 시스템은 계속된다.
* 일관성 우선 시스템은 BFT 완결성을 제공하는 한편 가용성 우선 시스템으 확률적 완결성을 제공한다.
* 지불할 때 사용자는 확률적으로 최종 체인이 제공하는 가용성을 찾는 경우가 많다.
  * 많은 DAG 기반 프로토콜이 지불 지원에 초점을 맞추고 있다.
* 많은 블록체인이 단순 지불 이상을 제공하여 분산화를 지원한다.
* 스마트 컨트랙트에 기반한 애플리케이션 같은 dApp은 완결성과 관련하여 다양한 선호도를 가질 수 있다.
* 가용성이 피룡한 dApp은 일부 부정확성에 관계 없이 항상 통과할 수 있다면 더 좋을 것이다.
* 확률적으로 최종 체인을 선호하는 반면 일관성을 선호하는 dAPpp은 부정확한 트랜잭션이 진행되는 대신에 전채 애플리케이션이 중지되는 것이 바람직하며 절대적이 최종 체인을 선호한다.
* 완결성은 사용자 경험에 근본적으로 영향을 미친다.

## Finality in PoS Consensus

* 하나의 매개변수(여기서는 완결성 보장)를 고려하는 것이 아니라 채택할 것을 결정할 때 프로토콜을 전체적으로 검토하는 것이 중요하다. 
* tendermint
  * 절대적인 완성도를 달성한다.
  * 2/3 이상의 사전 투표와 사전 커밋을 모두 받는 블록이 완료된다.
  * 이 프로세스는 1/3개 이상의 검증인이 응답하지 않는 한 무한정 계속된다.
    * 이 경우 네트워크가 중단된다.
  * 가용성보다 일관성을 선호한다.
  * PoS 슬래싱 규칙이 tendermint에 적용되면 프로토콜은 경제적 완결성을 달성한다.
* thunderella
  * thunderella의 빠른 경로가 절대적인 완결성을 제공한다.
  * 공증된 공백이 없는 최대 트랜잭션 시퀀스는 완전히 확인된 출력으로 간주된다.
  * 빠른 경로 위원회의 3/4이 정직하고 온라인이고 제안자가 정직하면 유효한 거래가 즉시 확인된다.
  * 빠른 경로 확인은 전체 완결성과는 다르다.
    * 낙관적 완결성이다.
  * 거래는 체인 기반 또는 BFT 기반이 될 수 있는 기본 블록체인에 기록되면 완전히 완료된다.
  * thunderella는 빠른 경로가 실패하는 경우 기본 블록체인으로 폴백하므로 가용성을 우선시한다.
* algorand
  * 확률적 완결성을 달성한다.
  * 공격자가 프로토콜의 금전적 가치의 3분의 1미만을 제어하는 한 알고랜드는 각 블록에 대한 최종 합의에 도달하는 강력한 동기화로 프로토콜이 작동하도록 하여 호크 가능성이 무시할 수 있음을 보장할 수 있다.
  * 약한 동기화에서 algorand는 포크할 수 있지만 BA를 사용하여 선택할 포크에 동의한다.
  * 알고랜드의 트랜잭션은 프로토콜이 강력한 동기화 상태로 돌아올 때 최종적으로 완료된다.
  * 일관성을 희생하기보다 비생산적인 진행을 생성하는 빈 블록을 생성하는 것을 선호하여 가용성보다 일관성을 우선시한다.
* Dfinity
  * 확률적 완결성을 달성한다.
  * 체인의 블록 가중치가 증가함에 따라 완결 가능성이 증가한다.
  * 각 라운드 r에 더이상 공증된 블록이 수신되지 않을 수 있는 시간이 있다고 가정한다.
  * 이 제외 시간에 공증된 블록에 라운드 r을 넘어 해결할 수 있는 모든 체인 팁이 이미 포함되어 있다는 것을 알고 있기 때문에 라운드 r을 마무리할 수 있다.
  * 정상 작동 아래로 거의 인스턴트 최종의 보증이 있다.
  * 라운드에서 R, 모든 트랜잭션은 라운드 블록에 포함된 R2번의 확인과 네트워크 전파 지연 후 관찰자에게 최종이다.
  * Dfinity 네트워크가 분할되는 경우 임의의 비컨이 자동으로 일시 중지되도록 하여 네트워크의 절반이 계속되는 것을 허용하지 않는다는 점에서 일관성을 우선시한다.
* Ouroboros Genesis
  * genesis는 체인 선택 규칙에 따라 확률적 완결성을 달성할 수 있다.
  * 규칙은 짧은 범위(최대 K 블록, 여기서 k는 보안 매개변수)의 경우 가장 긴 체인을 따른다.
  * 긴 범위(k 블록 이상)의 경우 전체 시간 규칙을 사용하는 것
  * 포크가 발생한 직후 현재 체인 이후에 체인의 밀도가 높은 것을 선택한다.
* Casper FFG
  * Casper FFG는 체인 기반 시스템에 절대적/경제적 완결성을 부여하는 것을 목표로 한다.
  * 지분에 따라 가중치가 부여된 위원회의 2/3 초과가 블록에 서명할 때 달성된다.
  * Casper FFG는 적이 기본 블록체인의 제안 매커니즘을 제어하더라도 충돌되는 체크포인트를 완료하지 않도록 구축되었다.
  * FFG는 안전을 제공하고 제안 매커니즘은 활성을 제공하기 때문에 공격자는 합의를 지연시켜 Casper가 미래 체크포인트를 완료하는 것을 막을 수 있다.
  * FFG는 2/3 과반수의 검증인이 동의하지 않으면 체크포인트 종료를 허용하지 않는다는 점에서 일관성을 우선시한다.
  * 그렇지 않으면 완료가 발생하지 않는다.
  * FFG는 또한 슬래싱 매커니즘을 통해 경제적 완결성을 허용한다.
* Casper TFG
  * TFG는 내결함성 임계값이 서로 다른 유효성 검사기에서 절대적 완결성을 달성한다.
  * 프로토콜은 비동기식으로 안전하고 BFT이므로 검증자가 서로 다른 내결함성 임계값을 가질 수 있다.
* 되돌력진 블록은 수백만 또는 달러의 손실을 초래하거나 분산 응용 프로그램의 기본 작업에 영향을 줄 수 있다.
* 완결성을 이해하는 것이 강력한 블록체인 플랫폼을 구축하고 애플리케이션을 개발할 플랫폼을 선택하는데 모두 중요하다. 