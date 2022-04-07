# SSR

* Server Side Rendering
* 웹 페이지를 서버에서 렌더링한다. 
* SEO(Search Engine Optimization) 가 우선일 경우 사용한다. 
* 웹 페이지가 사용자와 상호작용이 적은 경우 사용한다. 
  
# CSR

* Client Side Rendering
* 웹 페이지를 클라이언트에서 렌더링한다. 
* SEO가 우선 순위가 아닌 경우 사용한다. 
* 사용자와 상호작용이 많은 경우 사용한다. 

# CORS

* Cross Origin Resource Sharing
* 원래는 보안상 이유로 막혀있었다. 
* 처음 전송되는 리소스의 도메인과 다른 도메인으로부터 리소스가 요청될 경우 다른 도메인의 선택된 자원에 접근할 수 있는 권한 부여하도록 브라우저에 알려준다. 
* Fetch api, xml http request, 웹폰트, 이미지 추출 css shapes, 캔버스 이미지/비디오 프레임
* youtube, github 등 다른 사이트에 있는 리소스 보여줄 필요가 생겼다.
* 교차 출처 리소스 공유 표준은 http 헤더 추가하면서 동작한다. 
* 정확히 어떤 것이 실패했는지 알아내려면 브라우저 콘솔로 확인한다. 

* 모든 도메인을 허용한다. 
* 메소드는 `GET`, `POST`, `PUT`, `DELETE`, `OPTIONS`만 허용한다. 
  * `OPTIONS` : 서버에서 allow하는 조건들을 다 맞추고 있는지 사전에 서버에 확인하는 요청
* 헤더에는 `content-type`, `accept`만 쓸 수 있다. 
* preflight request는 10초까지만 허용된다. 