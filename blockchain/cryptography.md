# cryptography

* 암호학
* 신원 확인이나 블록체인의 형태, 송금, 과정, 서명 등 대부분의 기능에 암호 기술이 사용된다.
  * 암호학에 대한 기초적인 이해가 매우 중요
* 안전한 의사소통을 위한 암호화/복호화 과학으로
* 현대의 암호 해독과 블록체인을 가능하게 하는 중요한 요소 중 하나

## 역사

* 군사 정보를 보호 목적
  * 스파르타
    * 스키테일(Skytale)이라는 암호화 방식을 사용
    * 전쟁을 나갈때 군대와 본국 사람들이 동일한 굵기의 원통형 막대
    * 비밀리에 메시지를 보내야 하는 일이 생기는 경우 양피지를 막대에 돌돌 감아 메시지를 작성
    * 양피지를 받는 사람 역시 양피지를 막대에 돌돌 감아 메시지를 해석
    * 양피지를 중간에 탈취당하더라도 비슷한 굵기의 원통형 막대가 없는 이상 해독할 수 없다.
* 고대
  * 원시 암호화 기술은 고대에서부터 존재
  * 대부분의 초기 문명들은 이미 암호학을 사용해온 것으로 알려져 있다.
  * 약 3,900만년 전
    * 암호학이 사용된 가장 오래된 예시
    * 이집트 귀족 크놈호테프 2세(Khnumhotep II)의 무덤에서 발견
      * 문학적 요소로써 사용된 기법에 가깝다.
  * 약 3,500년 전
    * 민감한 정보를 보호하기 위해 사용된 암호화의 가장 오래된 예시
    * 소포타미아 서기들이 진흙판에 사용된 도자기 유약을 감추기 위해 쓰인 암호술
  * 기원전 100년 경
    * 카이사르 암호
    * 고대에 가장 발달한 암호화 방식
    * 알파벳과 같은 문자를 숫자나 다른 문자로 치환하여 작성하는 방식
    * 원본 문자를 어떤 문자로 치환하였는지 알고 있으면 쉽게 해독할 수 있다.
    * 해독하지 못하면 매우 어려워진다.
* 중세 시대와 르네상스
  * 암호와 암호를 해독하는 과학인 암호해독학은 암호학이라는 고대의 과학을 따라잡기 시작
  * 800년 경
    * 아랍 수학자 알 킨디(Al-Kindi)는 빈도 해석이라고 알려진 기술을 개발
      * 기호 대체 암호를 쉽게 해독할 수 있게 만들었다.
    * 암호화된 메시지를 해독하려는 사람들은 체계적인 방법으로 암호에 접근할 수 있게 되었다.
    * 암호학이 발전하기 시작했다.
  * 1465년
    * 레오네 알베르티(Leone Alberti)는 다중문자 암호(Polyalphabetic cipher)를 개발
      * 알 킨디의 빈도 해석에 대한 해결책
      * 다중문자 암호에서는 두 개의 디스크를 이용해 하나의 알파벳을 전혀 다른 알파벳으로 만들어 암호화
      * 다중문자 암호는 하나의 알파벳이 어떤 알파벳으로 변하였는지 모른다면 복호화할 수 없다.
        * 빈도해석 기술을 무력화
* 근대
  * 1790년대 
    * 토마스 제퍼슨은 제퍼슨 디스크(Jefferson disk)라고 불리는 암호 시스템을 만들었다.
      * 제퍼슨 디스크
        * 26개의 바퀴를 이용해 알파벳을 다른 알파벳을 치환하는 방식
        * 발명된 당시에는 실제로 사용되지 않았다.
        * 100년 뒤 2차 세계대전에서 실제로 구현되어 사용
  * 세계 2차대전
    * 에니그마 장치가 발명
    * 제퍼슨 디스크처럼 바퀴를 사용하여 암호화를 했으며, 동일한 에니그마 장치가 없으면 해독이 불가능했다.
    * 초창기 컴퓨터 기술은 에니그마 암호를 해독하기 위해 개발
      * 에니그마 장치 해독은 연합국 승리의 결정적인 원인 중 하나
* 컴퓨터 시대
  * 컴퓨터의 발달로 수학적 암호화가 발달하기 시작했으며, 컴퓨터 시스템의 표준화
  * 1990년대
    * 양자암호학이 등장
    * 오늘날의 수학적 암호화를 제공하는 보안 수준에서 한 단계 더 향상시키고자 했다.
  * 암호 기술은 암호 화폐를 구현할 때도 사용
    * 암호 화페에는 해시 함수, 공개 키 암호화, 디지털 서명과 같은 다양한 암호화 기술을 사용
    * 블록체인에 저장된 데이터의 일관성을 보호하고 거래를 인증하는 데 사용
  * 타원곡선 전자서명 알고리즘(Elliptical Curve Digital Signature Algorithm, ECDSA)
    * 블록체인에 기록된 자산을 정당한 소유주만이 사용할 수 있도록 보장

## 다양한 암호화 기술

* SHA
  * Secure Hash Algorithm의 약자
  * 해시함수를 이용해 만든 해시 암호화 알고리즘의 모음
  * 미 국가보안국(NSA)에서 1993년 처음으로 설계하였으며, 
  * 미국 국립표준기술연구소(NIST)에서 발전시켜 오늘날 미국의 국가표준
  * 종류
    * SHA-0, SHA-1, SHA-2, SHA-3 등
    * SHA-0과 SHA-1
      * 충돌이 감지되어 더이상 사용되지 않는다.
    * SHA-2
      * 오늘날 가장 많이 사용되는 함수군
      * SHA-224, SHA-256, SHA-384, SHA-512
  * 목적
    * 데이터의 위변조가 불가능함을 보장하는 무결성
    * 실제 비트코인이나 이더리움에서 블록헤더, 디지털 서명, 공개 키에서는 데이터 무결성을 위해 SHA를 사용한다.
* ECDSA
  * ECDSA(Elliptic Curve Digital Signature Algorithm; 타원곡선 디지털서명 알고리즘)
  * 공개키 방식 중 하나인 ECC(Elliptic Curve Cryptography; 타원곡선암호)에 디지털 서명 방식을 접목한 알고리즘
    * 디지털 서명에서는 수신자가 송신자의 공개 키를 사용해 메시지를 검증하기 위해서는 디지털 서명을 필요로 한다. 
    * 디지털 서명은 비밀 키로만 생성 가능해야 한다.
    * 수신자가 트랜잭션에 작성된 디지털 서명과 송신자의 공개키를 통해 송신자의 디지털 서명인지 판별할 수 있어야 한다. 
    * ECC는 타원곡선으로 수학적으로 연결된 비밀키와 공개키 한 쌍을 생성하고, 비밀키로 암호화한 디지털 서명을 공개 키로 복호화 할 수 있다.
* HMAC
  * Hash-based Message Authentication Code의 약자
  * 대칭 키 암호 방식을 사용하여 디지털 서명을 구현한다. 
  * 송신자와 수신자가 단일 키를 공유하고, 해당 단일 키와 원본 데이터를 해싱한 값과 원본 데이터를 함께 트랜잭션으로 보내 데이터의 무결성을 증명한다.
  * HMAC 디지털 서명 공식 : `HMAC 트랜잭션 = Hash(원본 데이터, 단일 키) + Message`
  * HMAC에서는 단일 키와 원본데이터로 만든 해시값이 서명의 역할을 한다.
    * 공개 키 암호 방식에서는 개인 키로 원본데이터의 해시값을 서명하고, 공개 키로 이를 복호화하여 원본 데이터와 비교한다.
* PKI
  * PKI(Public Key Infrastructure, 공개 키 인프라)
  * 디지털 인증서와 공개 키를 생성, 관리, 배포, 사용, 저장 및 해지하는 데 필요한 일련의 하드웨어, 소프트웨어, 정책, 프로세스와 절차의 집합
  * 대규모 사용자 집단에서 디지털 서명 및 암호화와 같은 기술을 사용할 수 있는 기반이다.
  * PKI의 목적은 데이터를 안전하게 전송하는 것이며, 이를 위해 시스템 및 리소스 접근 권한, 데이터 보호, 트랜잭션 무결성 및 진위성, 기밀성을 보장한다.
  * 공개 키 암호 방식을 사용하여 웹 서버, 임베디드 시스템, 서로 연결된 장치, 비즈니스 프로세스를 실행하는 소프트웨어 간에 데이터를 안전하게 교환할 수 있도록 한다.  
  * 단순 보안 이메일, 웹 트래픽 뿐만 아니라 여러 개의 복잡한 생태계 내의 다양한 어플리케이션, 사용자, 장치를 지원하고 있습니다. 
  * 정부 및 산업 데이터 보안에 대한 규제가 점점 엄격해지고 있기 때문에, 정부기관과 기업들은 신뢰를 보장하기 위해 조직적인 PKI를 구성하고자 노력하고 있다.
* 슈노르 서명
  * 일반적인 디지털 서명에서는 공개 키, 서명할 메시지 및 서명이 포함되어 있다.
    * 공개 키의 소유자가 주어진 메시지에 서명했음을 보여준다. 
      * 멀티시그 주소에서 송금을 하는 등 여러 이해당사자가 하나의 메시지에 서명을 하기 원하는 경우, 각 이해당사자는 하나의 메시지에 서명과 공개 키를 포함해야 한다. 
      * 만약 3명의 당사자가 동일한 메시지에 서명하기 원하는 경우, 3개의 공개키와 3개의 서명이 포함될 것이다. 
      * 각 노드는 서명을 검증하는 과정을 3번 수행해야 하고, 블록은 3개의 공개키와 3개의 서명을 저장해야 하기 때문에 자리를 많이 차지하고 있다.
  * 키 집합(Key Aggregation)을 사용한다. 
    * 서명을 하는 당사자의 공개 키들을 결합하여 단일한 하나의 공개 키를 구성한다. 
    * 각 당사자의 개인 키를 사용하여 해당 메시지에 서명을 할 수 있다. 또한 
    * 당사자들의 서명을 결합하여 합쳐진 단일 공개 키에 유효한 단일 서명을 구성할 수 있다
    * 검증 노드가 당사자들이 모두 메시지에 서명했는지 확인할 때는 단일 서명과 단일 공개키로 확인할 수 있다.
  * 당사자들의 정보를 하나로 통합하기 때문에 개인 정보 보호에 유리하다.
    * 블록에 들어가는 멀티시그 공개 키들과 서명들의 크기를 일반적인 블록 크기 정도로 줄인다. 
    * 블록 공간을 매우 절약하고, 검증의 속도를 빠르게 할 수 있다.


