# AJAX

* Asynchronous JavaScript And XMLHttpRequest
* JavaScript, DOM, Fetch, XMLHttpRequest, HTML 등을 사용하는 웹 개발 기법
* 비동기 통신 및 렌더링
* 장점
  * server에서 html 전체를 완성해서 보내주지 않아도 된다. 
  * 브라우저에 상관 없이 사용할 수 있다. 
  * 필요한 부분만 렌더링하기 때문에 더 빠르고 더 많은 상호작용이 가능하다. 
  * 한 번에 보낼 수 있는 데이터의 크기가 작다. 
* 단점
  * 검색 엔진 수집에 불리하다. 
  * 뒤로가기 버튼이 의도한대로 동작하지 않는다. 

## Fetch

* 페이지를 이동하지 않아도 서버로부터 필요한 데이터를 받아올 수 있다. 
* 사용자가 현재 페이지에서 작업하는 동안 서버와 통신할 수 있다. 
* 필요한 데이터만 서버에서 받아와 DOM에 적용시켜 기존 페이지에서 필요한 부분만 변경할 수 있다. 

``` javascript
// Fetch를 사용
fetch('http://52.78.213.9:3000/messages')
	.then (function(response) {
		return response.json();
	})
	.then(function (json) {
		
});
```
