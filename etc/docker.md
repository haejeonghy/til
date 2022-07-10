# Docker

## 컨테이너

* 물자를 싣고 내릴 때에, 선박이 입항해 있는 시간을 획기적으로 단축시켜준다
* 물자를 싣고 내릴 때 필요한 인력(분류하는 사람, 짐 옮기는 사람, 감독하는 사람)을 대폭 감소시킨다
* 리눅스 컨테이너(lxc) 등장
  * 실행 환경에 구애받지 않고 애플리케이션을 실행할 수 있다!

## 의존 관계

* 어떤 프로그램(A) 실행에 다른 프로그램(B)이 반드시 필요한 경우, "프로그램 A는 프로그램 B에 의존 관계를 가지고 있다"
* 다른 프로그램(C)를 실행할 때 다른 버전의 B가 필요한 경우 의존성이 충돌한다. 
* 컨테이너 기술은 애플리케이션을 컨테이너 내에 구성합니다. 
  * 즉, 컨테이너에서 실행 중인 애플리케이션은 어떠한 의존성도 공유하지 않고, 각자 고유의 의존성을 포함하고 있다.
* 컨테이너가 격리하고 독립적으로 소유하는 것
  * 프로세스
    * 특정 컨테이너에서 작동하는 프로세스는 기본적으로 그 컨테이너 안에서만 액세스할 수 있다.
    * 컨테이너 안에서 실행되는 프로세스는 다른 컨테이너의 프로세스에게 영향을 줄 수 없다.
  * 네트워크
    * 기본으로 컨테이너 하나에 하나의 IP 주소가 할당되어 있다.
  * 파일 시스템
    * 컨테이너 안에서 사용되는 파일 시스템은 구획화되어 있다.
    * 해당 컨테이너에서의 명령이나 파일 등의 액세스를 제한할 수 있다.

## 컨테이너 설치

* OS에 상관없이 즉시 애플리케이션 실행 환경을 만들 수 있다.
* 개발을 컨테이너 위에서 진행할 경우, 모든 개발팀이 동일한 환경 하에 개발을 진행할 수 있다.
* 배포 환경에서도 동일하게 적용될 수 있다. 
* aws ecs를 사용하면 도커 컨테이너로 애플리케이션을 배포할 수 있다. 

## 수평 확장과 배포

* 로드밸런싱 서버 증설 실행 환경의 일치
  * 동일한 애플리케이션 구성(이미지)을 바탕으로 새로운 서버에 해당 애플리케이션을 컨테이너로 실행하고, 로드 밸런서에 이 서버를 추가하면 된다. 
  * 오케스트레이션 도구

## 키워드

* 컨테이너
  * 애플리케이션이 의존성, 네트워크 환경, 파일 시스템에 구애받지 않고, 도커라는 기술 위에 실행될 수 있도록 만든 애플리케이션 상자
* 이미지
  * 애플리케이션 및 애플리케이션 구성을 함께 담아놓은 템플릿으로, 이를 이용해 즉시 컨테이너를 만들 수 있다. 
  * 이미지를 이용해 여러 개의 컨테이너를 생성할 수 있다.
  * 기본 이미지(base image)로부터 (마치 git을 사용하는 것처럼) 변경 사항을 추가/커밋해서 또 다른 이미지를 만들 수도 있다.
* 레지스트리
  * 이미지는 레지스트리에 저장된다.
  * 도커 CLI에서 이미지를 이용해 컨테이너를 생성할 때, 호스트 컴퓨터에 이미지가 존재하지 않는다면, 기본 레지스트리로부터 다운로드 받게 된다.

## VM과의 차이

* 도커는 가상머신만큼 견고한 격리성을 제공하지는 않는다.
* 도커는 OS위에 다른 OS를 실행하는 것이 아니라 가상 머신보다 좋은 성능을 낼 수 있다. 
* 도커는 컨테이너의 관점에서 개발자와 사용자 커뮤니티를 중심으로 혜택을 제공하는데 있다. 

[Docker Container Lifecycle의 간단한 도식화](docker-lifecycle.png)

## docker cli

* docker/whalesay
  * registry_account/repository_name:tag 
  * 구성
* registry
  * docker hub
  * 도커 이미지 관리
  * docker hub, private docker hub, 회사 내부용 레지스트리 등으로 나뉜다.
* repository
  * 레지스트리 내 도커 이미지가 저장되는 공간
  * github repository와 유사
* tag
  * 해당 이미지를 설명하는 버전 정보 주로 입력
  * 다른 것을 지정하지 않는다면 latest 태그 붙인 이미지를 가져온다.
* docker/whalesay:latest
  * docker hub 레지스트리에서
  * docker 유저가 등록한 whalesay 이미지 혹은 레포지토리에서
  * latest 태그를 가진 이미지

`docker image pull docker/whalesay:latest` : docker/whalesay의 최신 이미지를 받아오기
```shell
❯ docker image ls ## 이미지 리스트 출력
REPOSITORY               TAG       IMAGE ID       CREATED        SIZE
docker/getting-started   latest    157095baba98   2 months ago   27.4MB
docker/whalesay          latest    6b362a9f73eb   7 years ago    247MB
```
```shell
❯ docker container run --name whalesay docker/whalesay:latest cowsay boo ## 받아온 이미지를 whalesay 이름으로 실행
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
 _____ 
< boo >
 ----- 
    \
     \
      \     
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
        \    \        __/             
          \____\______/   
```
```shell
❯ docker container ps -a ## 모든 컨테이너 리스트 출력 
CONTAINER ID   IMAGE                    COMMAND                  CREATED              STATUS                           PORTS                NAMES
55b3ba14319e   docker/whalesay:latest   "cowsay boo"             About a minute ago   Exited (0) About a minute ago                         whalesay
b8b8312f5668   docker/getting-started   "/docker-entrypoint.…"   16 hours ago         Exited (255) About an hour ago   0.0.0.0:80->80/tcp   lucid_babbage
```
```shell
❯ docker rm whalesay ## 이름이 whalesay인 컨테이너 삭제
whalesay
```
```shell
❯ docker image rm docker/whalesay ## docker/whalesay 이미지 지우기
Untagged: docker/whalesay:latest
Untagged: docker/whalesay@sha256:178598e51a26abbc958b8a2e48825c90bc22e641de3d31e18aaf55f3258ba93b
Deleted: sha256:6b362a9f73eb8c33b48c95f4fcce1b6637fc25646728cf7fb0679b2da273c3f4
Deleted: sha256:34dd66b3cb4467517d0c5c7dbe320b84539fbb58bc21702d2f749a5c932b3a38
Deleted: sha256:52f57e48814ed1bb08a651ef7f91f191db3680212a96b7f318bff0904fed2e65
Deleted: sha256:72915b616c0db6345e52a2c536de38e29208d945889eecef01d0fef0ed207ce8
Deleted: sha256:4ee0c1e90444c9b56880381aff6455f149c92c9a29c3774919632ded4f728d6b
Deleted: sha256:86ac1c0970bf5ea1bf482edb0ba83dbc88fefb1ac431d3020f134691d749d9a6
Deleted: sha256:5c4ac45a28f91f851b66af332a452cba25bd74a811f7e3884ed8723570ad6bc8
Deleted: sha256:088f9eb16f16713e449903f7edb4016084de8234d73a45b1882cf29b1f753a5a
Deleted: sha256:799115b9fdd1511e8af8a8a3c8b450d81aa842bbf3c9f88e9126d264b232c598
Deleted: sha256:3549adbf614379d5c33ef0c5c6486a0d3f577ba3341f573be91b4ba1d8c60ce4
Deleted: sha256:1154ba695078d29ea6c4e1adb55c463959cd77509adf09710e2315827d66271a
```

* 사용해야 하는 프로그램이 도커 이미지에 모두 구성되어 있지 않은 경우
  * 웹 서버는 도커 컨테이너로 실행한다. 
  * 웹 서버를 구성하는 파일은 직접 만들거나 가져온 파일 구성
  * 장점
    * 서버에 문제가 생기는 것을 호스트와 별개로 파악할 수 있다. 
    * 문제가 생긴 서버를 끄고, 공장 초기화를 하듯 도커 이미지로 서버를 재구동할 수 있다.
* CP
  * 호스트와 컨테이너 사이에 파일을 복사
* Volume
  * 호스트와 컨테이너 사이에 공간을 마운트 Mount
    * Mount : 저장 공간을 다른 장치에서 접근할 수 있도록 경로를 허용해 하나의 저장 공간을 이용하는 것처럼 보이게 하는 작업