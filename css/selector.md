# CSS selector

- selector : 특정 요소들을 선택하여 스타일을 적용할 수 있게 해준다.    
    ```css
    h1 { }
    div { }
    ```
- 전체 selector : HTML 페이지 내부의 모든 태그를 선택한다.    
    ```css
    * { }
    ```
- tag selector
    ```css
    section, h1 { } /* 쉼표로 여러 선택자 구분해서 연결 */
    ```
- id selector
    ```css
    #only { }
    ```
- class selector
    ```css
    .widget { }
    .center { }
    ```
- attribute selector
    ```css
    a[href] { } /* href 속성이 포함된 a 태그 선택 */
    p[id="only"] { } /* id 값이 정확하게 only인 p 태그 선택 */
    p[class~="out"] { } /* class 속성 값에 out이 포함되는 p 태그 선택 */ 
    p[class|="out"] { } /* class 속성 값이 정확하게 out 이거나 out 으로 시작되는 p 태그 선택 */ 
    section[id^="sect"] { } /* id 값이 sect로 시작하는 section 태그 선택 */
    div[class$="2"] { } /* class 값이 2로 끝나는 div 태그 선택 */
    div[class*="w"] { } /* class 값에 w가 포함되는 div 태그 선택 */
    ```
- 후손 selector : 부모 요소에 포함된 모든 하위 요소에 스타일 적용한다.
    ```css
    header h1 {}
    ```
- 자식 selector : 부모의 바로 아래 자식 요소에만 적용한다.
    ```css
    header > p { }
    ```
- 인접 형제 selector
    - E+F : E 요소를 뒤따르는 F 요소 선택한다.
    ```css
    section + p { }
    ```
- 형제 selector
    - E~F : E 요소가 F 앞에 존재할 때만 선택한다.
    ```css
    section ~ p { }
    ```
- 가상 클래스 : 웹 문서 소스에는 실제로 존재하지 않지만 필요에 의해 임의로 가상의 선택자 지정하여 사용하는 selector 이다.
    ```css
    a:link { } /* 방문하지 않은 링크 a 선택 */
    a:visited { } /* 방문한 링크 a 선택 */
    a:hover { } /* a 마우스가 올라가 있는 동안 a 선택 */
    a:active { } /* a 요소에 마우스 클릭 또는 키보드 엔터가 눌린 동안 a 선택 */
    a:focus { } /* a 요소에 포커스가 머물러 있는 동안 a 선택 */
    ```
- 요소 상태 selector
    ```css
    input:checked + span { } /* 선택된 폼 컨트롤 선택 */
    input:enabled + span { } /* 사용 가능한 폼 컨트롤 선택 */
    input:disabled + span { } /* 사용 불가능한 폼 컨트롤 선택 */ 
    ```
- 구조 가상 클래스 selector 
    ```css
    p:first-child { } /* 첫 번째 등장하는 요소 선택 */
    ul > li:last-child { } /* 마지막에 등장하는 요소 선택 */ 
    ul > li:nth-child(2n) { } /* 앞으로부터 지정된 순서와 일치하는 요소 선택 */
    section > p:nth-child(2n+1) { }
    ul > li:first-child { }
    li:last-child { }
    div > div:nth-child(4) { }
    div:nth-last-child(2) { }
    section > p:nth-last-child(2n + 1) { }
    p:first-of-type { } /* p 요소 중 첫 번째 요소 선택 */
    div:last-of-type { } /* div 요소 중 마지막 요소 선택 */
    ul:nth-of-type(2) { }
    p:nth-last-of-type(1) { }
    ```
- 부정 selector
    ```css
    input:not([type="password"]) { } /* not 조건이 아닌 요소 선택*/
    div:not(:nth-of-type(2)) { } 
    ```
- 정합성 확인 selector
    ```css
    input[type="text"]:valid { } /* 정합성 검증 성공한 요소 선택 */
    input[type="text"]:invalid { } /* 정합성 검증 실패한 요소 선택 */
    ```
- `:` 와 `::` 차이
    - `:` 가상 클래스 의미한다.
        - `:hover`, `:active`, `:focus` 등등
        - html 문서의 일부를 dom 트리 구조와 상관없는 방법으로 선택할 때 사용한다.
    - `::` 가상 요소
        - 문서에 나타난 것 이외에 추가로 정의된 dom 트리의 추상화 레이어
        - `::after`, `::before`, `::first-letter` 등
        - `::` 사용 권고