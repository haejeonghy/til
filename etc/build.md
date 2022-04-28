# Build

* bundling
  * 고도화된 클라이언트 웹 앱은 수많은 모듈로 이뤄져있다.
    * 정적 웹페이지 + AJAX 하여 SPA로 변모했다.
    * 웹 페이지 구석 요소를 각 파일로 분리하는 모듈화
    * 클라이언트 기술의 발전으로 단일 파일로 페이지, javascript 만드는 작업이 고도화 됐다.
  * 이 모듈들을 하나로 묶어주는 작업
* software build
  * bundling 중 브라우저에서 자체적으로 해석이 불가능한 보조 기술들을 브라우저가 해석할 수 있도록 만들어주는 작업
  * 소스코드를 실행 가능한 결과물로 변환하는 작업
  * 정적 파일들로 결과가 만들어져야 한다.
    * `npm build` 사용하여 모듈을 정적인 파일로 만든다.
  * 인터넷 상에 배포하기 위해서는 정적 파일을 호스팅하는 서비스에 결과물을 업로드하여 사용한다.

## 주요 빌드 툴

* React 프로젝트 생성 툴
  * Create React App
    * `react-scripts` 모듈 사용
  * Next.js
    * `next` 모듈 사용
* 빌드 툴
  * webpack: 모듈 번들러
  * babel: TypeScript, JSX 등과 같이 브라우저가 지원하지 않는 언어를 JavaScript로 바꿔주는 컴파일러
  * ESLint: 자바스크립트 Code convention 및 문법 검사기
  * Sass, less: CSS Preprocessor