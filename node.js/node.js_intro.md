# Node.js

* Javascript Runtime
  * Runtime : 프로그래밍 언어가 구동되는 환경
* ``` bash
   node test.js :'실행'
  ```

## NVM

* Node Version Manager
* Node.js의 다양한 버전을 쉽게 설치하고 사용할 수 있음

``` Bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash :'wget으로 설치'
nvm install --lts :'lts 버전 node.js 설치'
nvm use 버전넘버 :'원하는 버전의 node.js 사용 가능'
```

## NPM
* npm module : 이미 개발된 모듈
* package.json : npm module에 관한 정보를 담아둔 파일
* npm
  * Node Package Manager
  * 필요한 모듈을 다운로드 할 수 있는 모듈 스토어
* dependency : 프로젝트 실행에 반드시 필요한 모듈
* devDependencies : 프로젝트 개발 환경에서 필요한 모듈
``` Bash
    npm run <script 이름> :'npm 스크립트 실행'
```