# Network

## Client Server Architecture

* 2티어 아키텍처 : client + server
* server : 리소스를 제공하는 주체
  * 백엔드 개발자 : 서버 주로 개발하는 개발자 
* client : 리소스를 사용하는 앱
  * 프론트엔드 개발자 : 클라이언트 주로 개발하는 개발자
  * 웹, 안드로이드, iOS 앱 등
* client와 server가 요청과 응답을 주고 받으며 사용자 요청을 처리한다. 
* 요청이 선행 되어야 응답이 온다. 
* database : 리소스를 저장하는 별도의 공간
  * 3티어 아키텍처 : client + server + database

## API

* Application Programming Interface
* 서버가 클라이언트에게 리소스를 잘 활용할 수 있도록 제공하는 인터페이스
* http에선 URI, URL 통해 접근할 수 있도록 한다. 

## URI, URL 

* URL
  * Uniform Resource Locator
  * 서버가 제공하는 환경에 존재하는 파일의 위치
  * scheme, hosts, url-path 포함
* URI
  * Uniform Resource Identifier
  * scheme, hosts, url-path, query, bookmark
* URL, URI 에 포함되는 정보
  * scheme
    * `file://`, `http://`, `https://` 등
    * 통신 프로토콜
  * hosts
    * `127.0.0.1`, `www.google.com` 등
    * 웹 페이지, 이미지, 동영상 등의 파일이 위치한 웹 서버, 도메인 또는 IP
  * port
    * `:80`, `:443`. `:3000` 등
    * 웹 서버에 접속하기 위한 통로
  * url-path
    * `/search`, `/Users/username/Desktop` 등
    * 웹 서버의 루트 디렉토리로부터 웹 페이지, 이미지, 동영상 등의 파일 위치까지의 경로
  * query
    * `?keyword=test` 등
    * 웹 서버에 전달하는 추가 질문

## IP

* Internet Protocol
* 인터넷 상에서 사용되는 주소 체계
* `000.000.000.000` : IPv4
* `nnnn:nnn::nnnn:nn:nnnn` : IPv6
* `localhost`, `127.0.0.1` : 현재 사용 중인 로컬 pc
* `0.0.0.0`, `255.255.255.255`
  * broadcast address 
  * 로컬 네트워크에 접속된 모든 장치와 소통하는 주소

### Port

* IP 주소가 가리키는 PC에 접속할 수 있는 통로(채널) 
* 0 ~ 65,535 까지 사용 가능하다. 
  * 0 ~ 1,024 까지는 주요 통신을 위한 규약에 따라 정해져 있다. 
  * `:22` : SSH
  * `:80` : HTTP
  * `:443` : HTTPS

## Domain

* Domain : IP 주소를 대신하여 사용하는 주소
* DNS
  * Domain Name System
  * 호스트의 도메인 이름을 IP 주소로 변환하거나 반대의 경우를 수행할 수 있도록 개발된 DB

## OSI 7계층

* 계층
  * 응용 계층
    * HTTP, DNS, SSL, SMTP, FTP
  * 표현 계층
  * 세션 계층
    * Sockets, RPC, SQL, NETBOIS
  * 전송 계층
    * **TCP**
      * **TCP**
        * 같은 계층에 속한 UDP에 비해 상대적으로 신뢰할 수 있는 프로토콜이다.
        * 연결 지향 - TCP 3 way handshake
          1. 클라이언트가 서버에 접속을 요청하는 SYN 패킷을 보낸다. 
             * SYN : Synchronize
          2. 서버는 SYN 요청을 받고 클라이언트에게 요청을 수락한다는 ACK와 SYN이 설정된 패킷을 발송하고 클라이언트가 ACK로 응답하기를 기다린다.
             * ACK : Acknowledgement 
          3. 클라이언트가 서버에게 ACK를 보내면 이후부터 연결이 성립되며 데이터를 전송할 수 있다. 
          4. 서버가 꺼져있다면 클라이언트가 SYN을 보내고 서버에서 응답을 받지 못했기 때문에 데이터를 보내지 않는다. 
          5. 현재는 ACK를 보낼 때 데이터를 함께 보내기도 한다.  
        * 데이터 전달 보증
          * 데이터 전송이 성공적으로 이루어진다면 이에 대한 응답을 돌려준다.
            * IP 패킷의 한계인 비연결성을 보완한다. 
        * 순서 보장
          * 패킷이 순서대로 도착하지 않는다면 TCP 세그먼트에 있는 정보를 토대로 다시 패킷 전송을 요청할 수 있다.
            * IP 패킷의 한계인 비신뢰성을 보완한다. 
    * UDP
      * IP 프로토콜에 PORT, 체크섬 필드 정보만 추가된 단순한 프로토콜이다.
      * 3 way handshake를 사용하지 않기 떄문에 TCP와 비교해 빠르다. 
        * 비연결지향
      * 데이터 전달 보증 X
      * 순서 보장 X
      * 신뢰성보다 연속성이 중요한 서비스에 자주 사용된다.   
    * IP 프로토콜보다 더 높은 계층에 존재하기 때문에 IP 프로토콜의 한계를 보완할 수 있다. 
  * 네트워크 계층
    * IP, ICMP
  * 데이터 링크 계층
  * 물리 계층
* 채팅 통신 예시
  1. HTTP에서 메시지를 생성한다.
  2. Socket 라이브러리릍 통해 전달된다.
     * socket : 프로그램이 네트워크에서 데이터를 송수신할 수 있도fhr 네트워크 환경에 연결할 수 있게 만들어진 연결부
  3. TCP 세그먼트를 생성한다.
  4. IP 패킷을 생성한다.
  5. TCP/IP 패킷이 LAN 카드와 같은 물리적 계층을 지나기 위해 이더넷 프레임워크에 포함되어 서버로 전송된다. 
     * TCP/IP 패킷
       * IP 패킷의 출발지 IP와 목적지 IP 정보를 보완할 수 있는 출발지 PORT, 목적지 PORT, 전송 제어, 순서, 검증 정보 등을 포함한다. 

## TCP/IP 4계층

* OSI 7계층보다 먼저 개발되었다. 
* 계층
  * 어플리케이션 계층
  * 전송 계층
  * 인터넷 계층
  * 네트워크 인터페이스 계층
