# HTML

* HyperText Markup Language
* 웹 페이지를 구성하는 마크업 언어이다.
* Tag들의 집합으로 구성된다.
    - tag : 부등호로 묶인 HTML의 기본 구성 요소이다. 
* open tag와 close tag로 구성된다. 
    - self closing tag
``` HTML
    <img src=""/>
```
* 트리 구조 구성

## 가장 많이 쓰이는 태그
* div : 한 줄을 차지
``` HTML
<div></div>
```
* span : 컨텐츠 크기만큼 공간을 차지 
``` HTML
<span></span>     
```
* img : 이미지를 삽입
``` HTML
<img src="image.jpeg"/>
```
* a : 링크를 삽입 
``` HTML
<a href="https://www.google.com"></a>
```
  * ```target="_blank"``` 속성 추가하여 새 탭에서 웹 페이지 열기 
* ul & ol & li : 하위 항목을 갖는 리스트 
``` HTML  
    <ul>
        <li>example 1</li>
        <li>example 2</li>
        <li>example 3</li>
    </ul>
    <ol>
        <li>example 1</li>
        <li>example 2</li>
        <li>example 3</li>
    </ol>
```
  * ```ul``` : unordered list
  * ```ol``` : ordered list
* input : 데이터 입력 태그
``` HTMl
    <input type="text" value=""/>
```
  * ```type``` 속성으로 구분 가능
    * ```checkbox``` : 여러 개의 선택지 중에서 다수를 선택하는 컨트롤
    * ```radio``` : 여러 개의 선택지 중에서 하나만 선택하는 컨트롤
    * ```password``` : 값이 가려진 한줄 텍스트 필드
    * ```email``` : email 유효성 검증 기능 제공
    * ```date``` : 날짜 선택
    * ```datetime-local``` : 날짜와 시간 지정 
    * ```file``` : 파일 지정 컨트롤
    * ```hidden``` : 보이지 않지만 값을 서버로 전송하는 타입
    * ```text``` : 한 줄의 텍스트 필드
    * ```url``` : url 유효성 검증 기능 제공
* textarea : 멀티라인 일반 텍스트 편집 컨트롤
``` HTML
    <textarea>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed finibus nisl. Suspendisse euismod ullamcorper quam. 
        Nam vel vulputate elit. Praesent a posuere nulla, nec ornare odio. Nunc et neque tortor. 
        Vivamus dui lorem, dignissim at congue et, laoreet in neque. 
        Praesent sit amet felis et metus commodo faucibus. Nunc varius vel eros sit amet placerat. 
        Phasellus in sapien leo.
    </textarea>
```
* button : 클릭 가능한 버튼
``` HTML
    <button></button>
```
  * 추가 가능한 특성
    * ```autofocus``` : 페이지 로드 후 포커스 위치 여부 선택
    * ```disabled``` : 클릭 방지

## block vs inline, inline-block
* block : 줄바꿈이 되는 박스
  * ```<div>```, ```<p>```
* inline : 크기 지정을 할 수 없는 박스
  * width, height 속성이 적용되지 않는다.
  * ```<span>```
* inline-block : inline인 동시에 block의 특성을 가지는 박스
  * 줄바꿈이 일어나지 않는다.
  * 글자가 차지하는 만큼 너비를 가진다.
  * width, height를 사용 가능하다. 