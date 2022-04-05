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