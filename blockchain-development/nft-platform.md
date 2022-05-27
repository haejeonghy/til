# NFT Platform

## OpenSea

* 미술(Art), 음악(Music), 도메인 이름(Domain Names), 가상 세계(Virtual Worlds), 트레이딩 카드(Trading Cards) 등 다양한 형태의 NFT가 거래되고 있다.
* 대표적인 카테고리는 미술(Art)
* 하나하나의 콜렉션이 전부 하나의 스마트 컨트랙트로 구성
* ERC-721에서 스마트 컨트랙트의 이름과 심볼을 설정할 수 있다.
  * 이름은 콜렉션의 이름이, 이 심볼은 콜렉션의 심볼이 된다.
* 오픈씨에서는 스마트 컨트랙트의 오너를, 콜렉션의 오너로 자동으로 등록한다.
  * 스마트 컨트랙트의 오너 지갑으로 오픈씨에 로그인하면, 자신의 콜렉션을 수정할 수 있다.
* 오픈씨에서는 이더리움(ETH) 또는 폴리곤(MATIC) 기반의 콜렉션 생성을 지원
* 오픈씨는 이더리움 기반으로 시작된 마켓 앱
  * 오픈씨는 이더리움을 포크해 만들어진 클레이튼도 지원
* 오픈씨에서 제공하는 이더리움과 직접적으로 소통할 수 없다.
  * 클레이튼 기반의 스마트 컨트랙트를 개발하면, 오픈씨에서도 확인할 수 있다.
  * 오너 설정을 한다면, 위 그림처럼 설명이나 SNS 정보를 자유롭게 관리할 수 있다.
* 결제와 경매를 위해 Wrapped Coin을 사용
* ETH는 WETH, KLAY는 WKLAY의 형태로 같은 가치를 지닌 토큰을 생성해 거래
* 클레이튼과 이더리움, 폴리곤은 각각 별도의 체인
  * 서로 다른 네트워크이기 때문에 각각의 네트워크에서 생성된 NFT는 각각의 네트워크 안에서만 거래할 수 있다.
    * 클레이튼 기반의 NFT는 반드시 클레이튼 지갑(카이카스)으로만 거래할 수 있다.
  * 폴리곤 기반의 NFT는 폴리곤 네트워크에서 사용할 수 있다.
    * 폴리곤(MATIC)은 이더리움 체인에도 존재하고 있다.
    * 이더리움 네트워크의 폴리곤을 사용하면, 거래 수수료를 이더리움으로 납부한다.
      * 이더리움은 수수료가 상대적으로 비싸다.
      * 오픈씨에서 폴리곤으로 거래를 할 때에는, 항상 메타마스크의 네트워크를 폴리곤 네트워크로 변경해야 한다.
* MATIC Network 설정
  * 네트워크 이름(Network Name) : Matic Mainnet
  * NEW RPC URL(NewRPCURL) :https://rpc-mainnet.matic.network
  * ChainID : 137
  * Symbol : MATIC
  * 익스플로러 URL 차단 : https://explorer.matic.network
* 오리지널 컬렉션 선택하고 NFT 구매 가능
* 오픈씨에서 NFT 구매하기
  * OpenSea에 로그인합니다. Kaikas 지갑을 통해서 로그인할 수 있다.
  * 구매하려는 프로젝트를 검색하고, Buy Now 를 선택한다.
  * 나타나는 팝업의 체크박스를 통해 규칙에 동의하고, 다음 화면에서 버튼을 누른 후 실행되는 지갑의 팝업창에서, 디지털 서명을 승인
  * WKLAY가 없다면 오픈씨에서 거래할 때 사용하는 WKLAY(Wrapped Klay)로, 거래에 필요한 만큼의 클레이튼을 환전
  * 디지털 서명을 통해 거래를 승인
  * account로 이동하면, 구매한 NFT를 확인할 수 있다.
* 오픈씨에서 NFT 판매하기
  * account에서 판매하려는 NFT를 클릭하고, NFT 상세 페이지의 우측 상단에 위치한 Sell 버튼 클릭
  * 판매하려는 가격을 입력하고, Complete Listing 버튼을 누른다. 이렇게 판매를 등록하는 과정을 리스팅이라고 표현한다.
  * 나타나는 팝업의 순서에서 디지털 서명을 진행하여 NFT의 소유권을 증명한다.

## Crypto Kitty

* 다마고치와 비슷한 게임
* 이더리움을 지불하고 고양이 캐릭터를 생성
* 가지고 있는 고양이 캐릭터가 많으며, 두 개의 고양이를 교배하여 새로운 고양이 캐릭터를 생성할 수 있다.
* 모든 고양이는 NFT로 발행
* NFT의 특성을 유지하기 위해, 크립토키티의 모든 고양이는 중복되지 않는다.
* 더 많은 사람들이 더 희귀한 고양이 캐릭터를 가지려고 노력한다.
* 팬덤의 영향력으로 인해, 더 많은 사람들이 더 희귀한 고양이 캐릭터를 거래했다.

## Minting 플랫폼

* 개발자 또는 프로젝트의 관리자가 작품을 직접 민팅해두지 않고, 민팅할 수 있는 총 수량만 제한한 채 컨트랙트를 발행할 수 있다.
* 자체 웹 페이지를 구축하고 서버와 통신한 다음, 개인이 직접 NFT를 민팅할 수 있게 하기도 한다.
  * 웹 민팅
* 오픈씨는 이더리움과 폴리곤 기반의 NFT를 몇 가지 메타데이터와 이미지 파일만으로 발행할 수 있다.
* 웹사이트를 제공하고, 거래소를 생성하는 경우도 있다.
  * Terra 기반의 randomearth.io는 거래소 기능과 함께, NFT 프로젝트의 웹 민팅을 도와준다.
  * 람들이 NFT를 발행하면, 웹 애플리케이션에 연결한 지갑 주소로 NFT를 발행하고 그 대가로 지정된 암호화폐 또는 토큰을 지불한다.
    *  Terra 기반의 최초 NFT, Galatic Punks는 초기 사용자를 대상으로 3 $Luna에 1개의 NFT를 발행할 수 있도록 조치를 취했다.
* 수많은 NFT 거래소가 생겨나고 있다.