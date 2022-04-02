# CSS

* 웹 어플리케이션에서 스타일링을 담당한다. 
* 콘텐츠의 배치와 위치, 타이포그래피를 관리한다.
* ```link``` tag를 사용하여 html 파일에 포함시킨다.
``` HTML
    <link rel="stylesheet" href="index.css" />
```

``` CSS
    /* selector */
    body {/* declaration block */
        color: red; /* declaration */
        font-size: 30px; /* property: value; */
    }
```
``` CSS
    h4 { /* h4 엘리먼트에 적용하기 */
        color: red;
    }

    #navigation-title { /* id가 navigation-title인 엘리먼트에 적용하기 */
        color: red;
    }

    .menu-item { /* class가 menu-item인 엘리먼트에 적용하기 */
        text-decoration: underline;
    }
```

## Semantic Tag
* 브라우저와 개발자 모드에게 의미를 명확하게 설명하는 태그이다.

## typography
* 색상 : ```color```
``` CSS
    .box {
    color: #155724; /* 글자 색상 */
    background-color: #d4edda; /* 배경 색상 */
    border-color: #c3e6cb; /* 테두리 색상 */
    }
```
* 글꼴 : ```font-family```
``` CSS
    .emphasize {
        font-family: "SF Pro KR", "MalgunGothic", "Verdana"; /* 쉼표로 적용 가능 */
    }
```
* 크기 : ```font-size```
``` CSS
    .title {
        font-size: 24px;
    }
```

  * 글꼴의 크기 단위
    * 절대 단위 : ```px```, ```pt```
      * 기기나 브라우저 사이즈 등 환경에 영향을 받지 않는 절대 크기로 정할 경우 ```px``` 사용
    * 상대 단위 : ```%```, ```em```, ```rem```, ```ch```, ```vw```, ```vh```
      * 일반적인 경우 ```rem``` 사용
      * 반응형 웹에서 기준점을 만들 때 사이즈 별로 css 구분해 ```px``` 사용
* 정렬 : ```text-align``` 사용
  * 유효한 값: ```left```, ```right```, ```center```, ```justify```
* 기타 속성
  * 굵기 : ```font-weight```
  * 밑줄, 가로줄: ```text-decoration```
  * 자간: ```letter-spacing```
  * 행간: ```line-height```

* 기타
  * border : 테두리
    * ```border-width``` : 테두리 두께
    * ```border-style``` : 테두리 스타일
    * ```border-color``` : 테두리 색상
  * margin : 바깥 여백
  ``` CSS
    p {
        margin: 10px 20px 30px 40px; /* top, right, bottom, left */
        margin: 10px 20px; /* top, bottom */
        margin: 10px; /* 전체 방향 */
    }
  ```
  * padding : 안쪽 여백
  ``` CSS
    p {
        padding: 10px 20px 30px 40px; /* top, right, bottom, left */
        padding: 10px 20px; /* top, bottom */
        padding: 10px; /* 전체 방향 */
    }   
  ```
  * overflow : 박스를 벗어나는 컨텐츠 처리
  ``` CSS
    p {
        height: 40px;
        overflow: auto; /* 박스 안에 스크롤 추가하여 벗어난 콘텐츠 확인 */
    }
  ```
