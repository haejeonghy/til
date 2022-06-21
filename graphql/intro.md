# intro

* 쿼리 언어

## BEFORE GRAPHQL

* What is an API?
  * api
    * application programming interface
      * interface
        * 무언가와 상호작용하는 방법
        * 사용자에게 노출된 버튼
        * 무엇이든 상호작용할 수 있다.
        * 앱, 서버 등 개발자가 노출시킨 커맨드
        * 리모콘의 버튼 
* What is REST?
  * 통신이 URL로 이루어진다.
  * URL을 통해 리소스나 리소스 목록을 얻는다. 
  * URL을 노출시켜야 한다. 
  * 조직화 되어있고 간단하다. 
  * 예측가능한 것이 많다. 사람들이 사용하는 컨벤션이 유사하다. 
* REST + HTTP
  * API URL에 동사 넣지 않기 
  * http 메소드로 하기
    * get
      * give me
    * post
      * make something
  * 메소드 + URL 로 많은 걸 할 수 있다. 

## Welcome to GRAPH QL

* 다운로드 하는 게 아니다. 
* 사양
* 사람들이 원하는대로 구현할 수 있게 하는 언어. 
* rest api 문제 해결을 위해 등장했다. 
  * Over-fetching
    * rest api로 요청하면 필요 이상으로 너무 많은 데이터를 받는다. 
    * 데이터 전송이 느려질 수 있다.
  * under-fetching
    * 필요한 정보보다 적게 받는 것
    * 필요한 정보를 얻기 위해 여러번 API를 요청해야 한다. 
    * 하나의 url이 주는 것보다 많은 데이터가 필요하다.
* graphql으로는 필요한 데이터를 요청한다. 
  * 그냥 데이터를 다 받는게 아니다. 
* 필요한 데이터를 한 번 리퀘스트 해서 받을 수 있다. 
* graphiql 
* query root
  * 받을 수 있는 데이터를 공개한다. 
  * url과 유사하다.

## GraphQL 만들기

* apollo server
  * node.js server 같지만 graphql을 이해한다. 
  * 구현하기 위해서는 실제 서버가 필요하다. 
* 설치
* /code/tweetql
  * npm init -y
    * node repository 초기화
  * npm i apollo-server graphql
  * npm i nodemon -d
  * touch server.js
  * touch .gitignore
  * git init . 
  * package.json 수정
  ```json
  "scripts": {
      "dev": "nodemon server.js"
  },
  ```
  ```json
      "type":"module"
  ```
  * npm run dev
  * server.js 수정
* _1_server.js 참조
  * query type
    * data type을 설명해줘야 한다.
    * 사용자가 쓸 수 있는 쿼리, 리턴해주는 값 등
    * schema 
      * shape of model
    * npm run dev로 apollo 스튜디오 실행
  * Scalar and Root Types
    * graphql에 데이터 유형을 만들어줘야돈다.
    * shape를 설명해야 한다.
* _2_server.js
  * !를 붙이면 null을 허용하지 않는다.
* _3_server.js
  * resolver

## documentation

* apollo studio에서 schema 확인 가능
  * schema를 상세하게 설명할 수 있다. 

```
이렇게 넣어서 주석 달 수 있다.
"""
    Tweet에 대한 설명이 있다
    """
```

## Migrating from REST to GraphQL

* 이식하기