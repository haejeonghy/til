# Session

* 사용자가 인증에 성공한 상태
  * 서버가 사용자가 인증에 성공했음을 알고 있다. 
  * 클라이언트는 인증 성공을 증명할 수단을 가지고 있어야 한다. 
* 서버에선 일종의 저장소에 세션을 저장한다. in-memory 혹은 세션 스토어
* 세션이 만들어지면 각 세션을 구분할 수 있는 세션 아이디가 만들어진다.
* 클라이언트에 세션 성공을 증명할 수단으로 세션 아이디를 전달한다. 
* 웹 사이트에서 로그인을 유지하기 위한 수단으로 쿠키를 사용한다.
  * 쿠키에서는 발급한 세션 아이디를 저장한다.
  * 쿠키를 통해 유효한 세션 아이디가 서버에 전달된다.
  * 세션 스토어에 해당 세션이 존재한다면 서버는 해당 요청에 접근 가능하다고 판단한다.
  * 쿠키에 세션 아이디 정보가 없는 경우 서버는 해당 요청이 인증되지 않았음을 알려준다.
* 로그아웃
  * 서버의 세션 정보를 삭제한다.
  * 클라이언트의 쿠키를 갱신한다.
  * `set-cookie`로 세션 아이디의 키값을 무효한 값으로 갱신행 한다.