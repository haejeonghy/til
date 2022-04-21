# OAuth 2.0

* 인증을 위한 표준 프로토콜
* 보안된 리소스에 엑세스하기 위해 client에게 권한을 제공하는 프로세스를 단순화한다.
* 장점
  * 사용자가 기억해야 할 아이디와 패스워드가 적다. 
  * 로그인 한 번으로 여러 서비스를 이용할 수 있다.
  * 민감한 개인정보를 다루지 않고도 유저를 확인할 수 있다.

## OAuth 용어

* Resource Owner
  * 액세스 중인 리소스의 유저
  * 예) facebook 로그인으로 다른 앱에 로그인하려는 유저 
* Client
  * Resource owner를 대신하여 보호된 리소스에 액세스하는 응용프로그램 
  * client는 server, 데스크탑, 모바일 또는 기타 장치에서 호스팅할 수 있다.
  * 예) facebook 로그인을 지원하는 앱
* Resource server
  * client의 요청을 수락하고 응답할 수 있는 server
  * 예) 다른 앱에 로그인할 수 있게 지원하는 facebook
* Authorization server
  * Resource server가 액세스 토큰을 발급받는 server 
  * 즉 client 및 리소스 소유자를 성공적으로 인증한 후 액세스 토큰을 발급하는 server
  * 예) 다른 앱에서 facebook 정보에 접근할 수 있도록 토큰을 발급하는 facebook
* Authorization grant
  * client가 액세스 토큰을 얻을 때 사용하는 자격 증명 유형
* Authorization code
  * access token을 발급받기 전에 필요한 code
  * client ID로 이 code를 받아온 후, client secret과 code를 이용해 Access token 을 받아온다.
* Access token
  * 보호된 리소스에 액세스하는 데 사용되는 credentials
  * Authorization code와 client secret을 이용해 받아온 이 Access token으로 이제 resource server에 접근할 수 있다.
* Scope
  * 토큰의 권한 정의
  * 주어진 액세스 토큰을 사용하여 액세스할 수 있는 리소스의 범위
  * 예) 다른 앱에서 사용할 수 있는 facebook 프로필 사진
* Grant type
  * client가 엑세스 토큰을 얻는 방법
  * 특정 용도에 최적화 되어있다.
  * 종류
    * **Authorization Code Grant Type**
      * 가장 일반적으로 사용되는 유형
      * 유저가 승인을 한 후에 인증 server에서 access token을 받기 위해 사용된다.
      * 먼저 authorization code를 받아 access token과 교환한다.
      * 보안성을 강화하기 위해 authorization code절차를 거친다.
        * client에서 client-secret을 공유하고 access token을 가지고 오는 것은 탈취될 위험이 있다.
        * client에서는 authorization code만 받아오고 server에서 access token 요청을 진행한다. 
      * 순서
        1. resource owner가 client로 접근
        2. client가 resource owner를 authorization server로 redirect
        3. client가 resource owner의 엑세스 권한 부여 요청
        4. authorization server에서 client에게 authorization code 제공
        5. client가 authorization server에게 authorization code를 access token으로 교환
        6. client가 access token을 통해 resource server에 저장된 resource에 엑세스 가능
        7. client가 access token과 함께 resource server로 api 요청을 보냄
        8. resource server가 client에게 client가 요청한 resource를 전달
    * Implicit Grant Type
    * Client Credentials Grant Type
    * Resource Owner Credentials Grant Type
    * **Refresh Token Grant Type**
      * 일정 기간 유효 시간이 지나서 만료된 엑세스 토큰을 편리하게 다시 받아오기 위해 사용하는 방법
      * access token보다 refresh token의 유효 시간이 대체로 조금 더 길게 설정한다.
      * server마다 refresh token 정책이 다르기 때문에 사용하고자 하는 server의 정책을 확인해야 한다. 
      * 순서
        1. resource owner가 client로 접근
        2. resource owner의 access token 만료 시 refresh token으로 access token 재발급 필요
        3. client가 authorization server로 refresh token 전달, access token 재발급 요청
        4. authorization server가 client로 새 access token 전달
        5. client가 access token 사용하여 resource server의 resource 접근 가능 

## OAuth flow

1. client가 OAuth로 Authorization code를 요청한다.
2. OAuth에서 redirect uri 를 통해 Authorization code를 부여한다. 
3. client에서 server로 Authorization code를 전달한다.
4. server에서 OAuth로 Authorization code를 보내서 Access token을 요청한다.
5. OAuth에서 server로 Access token을 부여한다.
6. server에서 client로 Access token을 전달한다.
7. client가 


