# Remix

* Remix IDE는 웹 브라우저에서 동작하는 IDE
* 로컬 컴퓨터에 저장되어 있는 소스 코드 파일 또는 폴더를 Remix IDE와 로컬호스트에서 웹소켓 통신으로 연결한다.
* Remix IDE에서 연결된 파일 또는 폴더가 변경될 경우, 로컬 컴퓨터에도 자동으로 저장된다.

## 설치

1. `npm init`
2. `npm install -g @remix-project/remixd`
3. `remixd -s <remixd_practice 폴더의 절대경로> --remix-ide https://remix.ethereum.org`
4. `connect to localhost` 선택하여 연결

## MetaMask 연결

1. `Deploy & run transactions` 탭 선택
2. `ENVIRONMENT`에서 `Injected Web3` 선택