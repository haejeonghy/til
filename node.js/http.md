# Node.js HTTP

## createServer

```javascript
const http = require('http');

// 서버로 오는 http 요청 마다 전달된 함수가 한 번씩 호출됨
const server = http.createServer((request, response) => {
  // 여기서 작업이 진행됩니다!
});

const { method, url } = request;
const userAgent = headers['user-agent'];
```

## request body

```javascript
let body = [];
request.on('data', (chunk) => {
  body.push(chunk);
}).on('end', () => {
  body = Buffer.concat(body).toString();
  // 여기서 `body`에 전체 요청 바디가 문자열로 담겨있습니다.
});

// 에러처리
request.on('error', (err) => {
  // 여기서 `stderr`에 오류 메시지와 스택 트레이스를 출력합니다.
  console.error(err.stack);
});
```

## set header

```javascript
response.setHeader('Content-Type', 'application/json');
response.setHeader('X-Powered-By', 'bacon');
// 명시적 헤더 데이터 전송
response.writeHead(200, {
  'Content-Type': 'application/json',
  'X-Powered-By': 'bacon'
});
```

## set response body
```javascript
response.write('<html>');
response.write('<body>');
response.write('<h1>Hello, World!</h1>');
response.write('</body>');
response.write('</html>');
response.end();

// 윗 예제 아랫줄처럼 간단하게 end()로 쓸 수 있음
response.end('<html><body><h1>Hello, World!</h1></body></html>');
```