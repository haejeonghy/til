# IPFS

* IPFS(InterPlanetary File System; 분산 파일 시스템)
* 모든 컴퓨터를 연결하고자 하는 분산된 P2P 파일 시스템
  * 다른 행성의 컴퓨터들까지 모두 연결하겠다는 IPFS팀의 비전
* IPFS Web는 기존의 HTTP Web의 문제점을 해결하고 보완한 새로운 Web

## 특징

* 중앙화된 서버 없이 노드들의 P2P 통신으로 실현한 더 빠르고 안전하고 열린 네트워크 
  * 대형 서버의 연결이 차단되면 치명적인 결과를 낳는 과거 HTTP Web과는 달리, IPFS에서는 몇몇 노드들이 연결이 끊어지더라도 생태계가 안정적으로 유지
* 고용량의 파일을 빠르고 효율적이게 전달할 수 있다.(BitSwap)
* 파일들의 중복을 알 수 있기 때문에 저장소도 효율적으로 사용할 수 있다.(Merkle DAG, contents-addressed)
* IPFS 상에 업로드된 파일의 이름은 영원히 기록되며, 만약 IPFS 상에서 지키고 싶은 파일은 원하는 만큼 지켜낼 수 있다(pinning). 
* 파일의 버전 관리(Git)가 가능하다.
* 인터넷에 원활하게 접속할 수 없는 상황이더라도 IPFS의 생태계는 유지된다.

## IPFS의 동작원리

* 각각의 파일은 여러 개의 블록으로 이루어져 있으며, 각각의 블록은 해시로 표현된 고유의 이름이 있다.
* IPFS는 모든 파일의 이름을 데이터베이스 속에 저장하며, 동일 파일의 중복을 배제하며, 각 파일의 버전 정보를 트래킹한다.
* 각 노드는 본인이 관심있는 파일만 저장소에 보관하며, 인덱싱 정보를 통해 누가 어떤 파일을 저장하고 있는지 알 수 있다.
* 네트워크에서 파일을 찾기 위해서는, 파일명을 조회하고 해당 파일을 갖고 있는 노드를 물어보면 된다.
* IPNS를 통해 모든 파일명은 인간이 읽기 쉬운 형태(DNS와 유사한 개념)로 변환할 수 있다.
* IPFS에 파일을 업로드하면, 업로드된 파일의 해시값이 산출된다.
  * 해시값은 업로드된 파일의 영구적인 이름으로 사용된다.
  * 해시값을 이용해, IPFS를 제공하는 노드의 엔드포인트를 tokenURI로써 블록체인에 저장하여 온체인 NFT를 구현할 수 있다.
* IPFS를 직접 설치하고 파일을 업로드하는 방법과, 대표적인 IPFS 노드에 파일을 업로드하는 방법
  * 어느 방법이든 IPFS에 파일을 업로드하면, 더 이상 파일을 수정할 수 없다.
  * 제공하려는 NFT의 특징에 따라 IPFS를 선택할 수도, 또는 아마존 s3 버킷과 같은 클라우드 컴퓨팅을 사용할 수도 있다.
* Remix에서 컨트랙트를 배포할 때에는 위 사진처럼 `Publish to IPFS` 체크박스가 존재
  * 이 체크박스에 체크하는 것으로, 컨트랙트를 IPFS와 함께 배포할 수도 있다.