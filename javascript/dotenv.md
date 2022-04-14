# dotenv

* javascript에서 환경 변수 사용하기

```bash
mkdir environment_variable
cd environment_variable
# 설치할 모듈과 이름이 같으면 안 됨
npm init # 엔터 키를 여러번 입력해 init을 마칩니다.
npm i dotenv # dotenv 모듈을 설치합니다.
```

* `dotenv` 이용해 환경 변수 접근 가능
  * `process.env` node.js 환경에서 조회하면 export로 조회했을 때와 같은 결과가 출력된다. 
* .env
  * node.js 에서 환경 변수 영구 적용
  * .env 파일을 만들어서 환경 변수 저장 가능

```javascript
const dotenv = require("dotenv");
dotenv.config();
console.log(process.env.myname);

// bash로 실행 시 .env에 저장된 myname이 출력된다.
```

* 환경변수를 이용해 민감한 정보를 저장하고 관리한다. 
* 애플리케이션을 서비스 할 때 환경마다 다른 API 키를 사용할 수 있다. 