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
- `git clone`
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
    - `git pull 페어리포지토리명 브랜치명`
- `push`
    - `git push 원격리포지토리명 브랜치명`
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

## branch

* 협업 시 여러 개발자가 동시에 서로 다른 작업을 할 수 있게 만들어주는 기능
* 기존의 소스 코드를 해치지 않으면서 다른 작업을 시도해보고 싶을 때 사용 가능
  * 완성한 코드를 반영해도 문제가 없다면 병합할 수 있다. 
* 다른 브랜치의 영향을 받지 않는다.
* 각각의 브랜치에서 생긴 변화가 다른 브랜치에 영향을 주지 않고 독립적으로 진행할 수 있다.
* 한 시점과 동일한 상태를 만들고 브랜치를 넘나들며 작업을 수행할 수 있다. 
* 각각의 브랜치에서 맡은 영역에 대한 작업을 진행한 뒤 작업을 진행하면 브랜치로 그 작업의 내용들이 모두 기록되기 때문에 문제가 발생했을 때 원인이 되는 작업을 찾아내거나 대책을 세우기 쉬워진다.

### 종류

* 통합 브랜치
  * Integration Branch
  * 배포될 소스 코드가 기록되는 브랜치
  * 현 main, 구 master
  * 해당 프로젝트의 모든 기능이 정상적으로 작동하는 상태의 소스코드가 담겨있다.
* 피처 브랜치
  * feature branch
  * 기능 추가, 버그 수정과 같이 단위 작업을 위한 브랜치
  * 통합 브랜치로부터 만들어내며 피처 브랜치에서 하나의 작업이 완료가 되면 다시 통합 브랜치에 병합하는 방식
  * 토픽 브랜치

### 명령어 
* 새로운 브랜치 생성 : `git branch 새로운 브랜치 이름`
* 새로운 브랜치 생성 후 해당 브랜치로 전환
  * `git switch -c 새로운 브랜치 이름`
  * `git checkout -b 새로운 브랜치 이름`
* 브랜치 목록 확인 : `git branch`
* 브랜치 목록과 각 브랜치의 최근 커밋 확인 : `git branch -v`
* 브랜치 삭제
  * `git branch -d 삭제할 브랜치 이름`
  * `git branch -D` 해당 명령어는 병합하지 않은 브랜치를 강제 삭제하는 방법입니다.
* 브랜치 전환
  * `git switch 브랜치 이름`
  * `git checkout 브랜치 이름`
* 브랜치 병합
  * master 브랜치로 dev 브랜치를 병합할 때 (master ← dev)
  * `git checkout master`
  * `git merge dev`
    * merge : 변경 내용의 이력이 모두 그대로 남아있기 때문에 이력이 복잡해진다.
    * rebase : branch base을 이동시킨다는 뜻
      * 브랜치 통합을 목적으로 하지만 특정 시점으로 브랜치가 가리키는 곳을 변경한다.
* 로그에 모든 브랜치를 그래프로 표현
  * `git log --branches --graph --decorate`
* 아직 commit 하지 않은 작업을 스택에 임시로 저장
  * `git stash`
