# Ganache

* 이더리움 노드는 Geth나 Parity를 사용하여 실제 이더리움 메인(또는 테스트) 네트워크에 접속하여 블록을 모두 동기화시켜야 한다.
  * 블록을 동기화 시키는데만 해도 2-3일 정도 소요
  * 트랜잭션을 보내도 블록을 채굴하기까지 기다려야 한다.
* 스마트 컨트랙트를 개발 할 때는 가나슈(Ganache)와 같은 가상 혹은 프라이빗 네트워크 상에서 스마트 컨트랙트를 구동해보고, 테스트넷을 거쳐 메인넷에 올린다.
* TestRPC -> TestNet -> MainNet 순서로 개발 과정 진행
  * TestRPC : 가나슈를 사용해 로컬 환경에서 개발 진행
    * 가상의 이더리움 네트워크를 생성해서 스마트 컨트랙트를 실행할 수 있도록 해주는 프로그램
  * TestNet : 개발 완료 후 MainNet과 동일한 환경에서 테스트
  * MainNet : 실제 서비스에 사용할 수 있도록 배포

## 실행

* 가상의 이더리움 네트워크가 로컬에서 실행된다.
* 해당 네트워크에 접속하려면 http://127.0.0.1:7545 로 접속할 수 있다.
* 10개의 가상 계정에는 각각 100 이더의 잔액이 충전되어 있다.
* 상단 탭
  * Accounts: account들의 주소, 잔고, 트랜잭션 수
  * Blocks: block 번호, 생성시점, 사용된 가스, 포함된 트랜잭션
  * Transactions: 전체 트랜잭션
  * Contracts : 트러플(Truffle) 프로젝트에 포함된 스마트 컨트랙트
  * Events : 이벤트 리스트
  * Logs: EthereumJS VM의 로그
* metamask와 연동 가능
* Ganache-cli
  * electron으로 wrapping하는 형태로 제작
  * GUI가 필요없다면 ganache-cli을 사용할 수도 있다.
  * Truffle을 사용하여 개발/테스트 환경을 구성할 경우, truffle develop명령으로 ganache-cli 사용이 가능
  * Remix를 사용하여 개발/테스트 환경을 구성할 경우, MetaMask에서 로컬 네트워크로 연결하여 사용이 가능

## Metamask와 Ganache 연동

1. Metamask에서 네트워크를 선택하는 항목 중, '맞춤형 RPC' 항목을 선택한다.
2. 맞춤형 RPC 화면에서 네트워크 이름, 새 RPC URL, 체인 ID를 각각 입력한다.
   * 네트워크 이름 : Ganache Network
   * 새 RPC URL : http://127.0.0.1:7545
   * 체인 ID : 1337
3. 새 네트워크에 접속하여 자신의 계정이 잘 작동하는지 확인한다.

* Ganache 계정을 Metamask로 가져오기 
  * Ganache계정의 Private Key를 가져와 Metamask에 계정을 import
  1. Ganache에서 Address 옆 열쇠 버튼을 눌러 Private Key를 복사한다.
  2. MetaMask에서 계정 아이콘을 클릭하여 계정 가져오기를 선택한다.
  3. 복사해온 비공개 키를 입력한다.
  4. 계정을 가져오는데 성공한 것을 확인할 수 있다.
  
* Ganache Network에 스마트 컨트랙트 배포
1. Metamask 계정을 이용하여 Remix 계정과 연동한다.
2. ERC-20 토큰 코드를 준비한다.
3. Ganache 네트워크에 ERC-20 토큰을 배포한다.
4. Deploy후 Ganache를 확인한다.
5. Current Block이 0이였지만 하나의 블록이 생성된다.
   1. Deploy와 동시에 transaction을 Ganache 가상 네트워크에 전송했고, 채굴이 일어나서 블록이 1개 생성된다.
6. Ropsten TestNet에서 사용했던것 처럼 네트워크에서 함수를 실행 가능한 모습을 볼 수 있다.
7. Transaction을 눌러서 들어가면 방금 Deploy를 하면서 발생시킨 transaction이 들어 있다.
8. 스마트 컨트랙트가 Ganache 네트워크에 배포된 것을 확인 할 수 있다.
  
* Ganache Network에서 스마트 컨트랙트 사용
1. Metamask에서 Ganache에 배포한 토큰 주소를 이용해 토큰을 추가한다.
2. 추가된 토큰을 다른 계정으로 전송한다.
3. Ganache 네트워크는 로컬 네트워크 환경으로, 다른 네트워크에 있는 계정(페어의 계정)으로 전송이 불가능하다.
   1. Metamask에서 새로운 계정을 만들어 전송한다.
4. 다른 계정에서 토큰을 받은것을 확인 할 수 있다.
5. Ganache를 확인하면 블록이 하나 더 채굴이 되어 트랜잭션이 생긴것을 확인 할 수 있다.
6. 토큰의 개수를 balanceOf 함수로 확인한다.
   1. 상태 변수가 변하지 않는 "읽기" 명령은 채굴이 일어나지 않으며, 상태 변수가 변하는 "쓰기" 명령을 수행할 때에만 채굴이 일어나기 때문에 읽기 전용 함수에서는 채굴이 일어나지 않는다.