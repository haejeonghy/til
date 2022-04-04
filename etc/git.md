# GIT

- 분산형 버전 관리 시스템
    - 이전에 작성한 내용을 보존해주는 시스템이다.
    - 변경 이력을 보존한다. 
- Github, gitlab, bitbucket 등 여러가지 원격 저장소 이용해서 백업, 협업이 가능하다. 
    - git repository 관리하는 클라우드 기반 서비스이다.
    - 생성된 리포지토리를 백업할 수 있다. 
    - 오픈 소스에 contribute 할 수 있다. 
  
## 용어
  - 스냅샷 : 특정 시점에 생성된 백업 복사본
  - 커밋 : 스냅샷 만들기
  - 리포지토리 : git으로 관리되는 폴더
      - remote repository
          - 원격 저장소
          - 작업한 코드 공유할 때 원격 저장소에 업로드해 함께 공유한다.
      - local repository
          - 작업은 자기 컴퓨터에서 한다.
          - 원격 저장소의 소스코드 받아올 수 있다.
  - `fork` : 외부 원격 저장소 코드를 내 원격 저장소로 가지고 오는 작업
  - `clone` : 원격 저장소 코드를 수정하기 위해 내 로컬로 받아오는 작업
  - `push` : 로컬 리포지토리에 기록해둔 커밋을 원격 리포지토리로 업로드
  - `pull request` : 내가 제안한 변경사항에 대한 반영 여부 요청
  - `pull` : 원격 저장소에서 변경사항이 있을 때 내 로컬로 가져오는 작업

## config

```bash
# --global : 홈에 저장
$ git config --global user.name "나의 사용자 이름"
$ git config --global user.email "내 이메일 주소"
```

## SSH

- https로 깃 사용할 때 토큰 발행 접속해야 한다.
- secure shell 줄임말
    - 보안 강화된 shell 접속
- cli 환경에서 다른 pc에 접속하거나 요청할 때 사용한다.
- 비대칭키로 사용자 인증한다.
    - 키 생성 필요
    - 비대칭키로 구성된다.

```bash
$ ssh-keygen # 키 생성

# ~/.ssh./ 에 id_rsa, id_rsa.pub 생성

# ssh 키 페어
# id_rsa.pub 공개키
# id_rsa 비밀키 개인키
# 공개키 복사

$ cat ~/.ssh/id_rsa.pub

# 공개키 등록 이후에는 ssh 클론 가능
$ git clone git@github.com:codestates/im-sprint-simple-git-workflow.git
```
    
## Gh

- oauth 인증 과정에 사용한다.
- brew 로 설치한다.

```bash
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git Operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser
```

## 명령어

- `fork`
- `clone`
- `status` : 현재 상태 보기
- `restore` : 처음 포크 받았을 때 상태로 되돌리기
- `add` : 파일 staging area로 옮기기
- `commit`
    - `m` ‘커밋 메세지’ 로 커밋 기록 남기기
- `reset`
    - `git reset HEAD^`
        - 바로 직전 커밋 취소
- `log`
    - `git log`
    - 커밋 로그 확인
- `pull`
    - `git pull` 페어리포지토리명 브랜치명
- `push`
    - `git push` 원격리포지토리명 브랜치명
- `init`
- `remote add`
    - `git remote add 페어리포지토리명 원격리포지토리주소`
- `remote -v`
- `committed`
- `modified`
- `staged`
- 충돌 해결
- Git Repository의 commit되지 않은 변경 사항을 취소할 수 있다.
    - `reset HEAD <file>`
    - `checkout -- <file>`