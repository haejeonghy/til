# Component-Driven Development

* CDD
* 부품 단위로 component를 만들어나가는 개발
  
## Storybook

* UI 개발 도구
* 각각의 component들을 따로 볼 수 있게 구성해주어 한 번에 하나의 component에서 작업할 수 있다. 
* 전체 UI를 한눈에 보고 개발할 수 있다. 
* 재사용성 확대를 위해 component를 문서화(documentation) 할 수 있다. 
  * 회사의 UI 라이브러리로 사용할 수 있다. 
  * 외부 공개용 디자인 시스템(Design System)을 개발하기 위한 기본 플랫폼으로 사용할 수 있다. 
* 자동으로 component를 시각화하여 시뮬레이션할 수 있다. 
* 테스트 및 개발 속도 향상시키는 장점이 있다. 
* 애플리케이션 의존성 걱정 없이 빌드할 수 있다. 

### 주요 기능

* UI component 카탈로그화 하기
* component 변화를 Stories로 저장하기
* 핫 모듈 재로딩과 같은 개발 툴 경험 제공하기
* 리액트 포함 다양한 뷰 레이어 지원하기

### 설치 및 세팅

```bash
# Clone the template
npx degit chromaui/intro-storybook-react-template taskbox

cd taskbox

# Install dependencies
yarn
```

```javascript
import React from "react";
import { Button } from "@storybook/react/demo";

// 기본 component
export default {
  title: "Button",
  component: Button
};

// 커스텀한 component export해 UI 목업 확인할 수 있게 함
export const Primary = () => (
  <Button>Hello Button</Button>
);

export const Secondary = () => (
 <Button>Bye Button</Button>
);
```