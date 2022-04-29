# Encryption

* 암호화
* 일련의 정보를 임의의 방식을 사용하여 다른 형태로 변환하고, 해당 방식에 대한 정보를 소유한 사람을 제외하고 이해할 수 없도록 알고리즘을 이용해 정보를 관리하는 과정

## Hashing

* 어떠한 문자열에 임의의 연산을 적용하여 다른 문자열로 변환하는 것
* 철칙
  * 모든 값에 대해 해시 값을 계산하는데 오래 걸리지 않아야 한다.
  * 최대한 해시 값을 피해야 하며, 모든 값은 고유한 해시 값을 가진다. 
  * 아주 작은 단위의 변경이라도 완전히 다른 해시 값을 가져야 한다. 
* SHA1, SHA256

## Salt

* 암호화 해야 하는 값에 어떤 별도의 값을 추가하여 결과를 변형하는 것
* 암호화만 한다면 해시된 결과가 늘 동일하다.
  * 해시된 값과 원래 값을 테이블로 만들어 decoding 해버리는 경우도 생긴다.
* 원본 값에 임의로 약속된 별도의 문자열(**salt**)을 추가하여 해시를 진행하면 기존 해시값과 전혀 다른 해시값이 반환되어 알고리즘이 노출되더라도 원본 값을 보호할 수 있다. 
* 주의사항
  * 유저와 패스워드 별로 유일한 값을 가져야 한다. 
  * 사용자 계정을 생성할 떄와 비밀번호를 변경할 떄마다 새로운 임의의 salt를 사용해서 해싱해야 한다. 
  * salt는 절대 재사용하지 말아야 한다.
  * db의 유저 테이블에 같이 저장되어야 한다. 