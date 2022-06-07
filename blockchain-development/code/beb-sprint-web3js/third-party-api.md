# Third-party Api Service

## Infura

* https://infura.io/
* 원격 이더리움 노드를 통해 이더리움 네트워크에 접근할 수 있게 해주는 서비스
* RPC URL과 API Key를 제공
  * 직접 이더리움 네트워크에 접근하여 블록을 동기화하지 않아도 네트워크에 접근할 수 있다.
  * Geth나 Parity를 사용하면 이더리움 블록체인에서 블록을 동기화해야 하기 때문에 많은 데이터를 다운로드 받아야 한다.
* 프로젝트 디테일
* Project ID: API Key
* Project Secret: 프로젝트의 비밀 키
* Endpoints: 
  * 원격 이더리움 노드를 통해 이더리움 네트워크에 접속할 수 있는 URL
  * `https://{network_name}.infura.io/v3/{API_Key}`
* curl 사용하여 상호작용 가능
* 원격 이더리움 노드를 통해 특정 계정 주소의 잔액을 확인하는 요청

```bash
curl https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8 \
 -X POST \
 -H "Content-type: application/json" \
 -d '{"jsonrpc": "2.0", "method": "eth_getBalance", "params": ["0xD74C244f3c9F5e05C0CA5344394F5A7247f0d1b9", "latest"], "id":1}'

# {"jsonrpc":"2.0","id":1,"result":"0x33718baf9020ff40d"}%    
# result -> 잔액을 wei 단위로 표시
```

### Infura를 사용하여 ropsten test 하기

```js

async function helloWorld() {
    try {
        const abi = 
        [
            {
                "inputs": [],
                "name": "renderHelloWorld",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "greeting",
                        "type": "string"
                    }
                ],
                "stateMutability": "pure",
                "type": "function"
            }
        ];
        // const address = '0xa2A75B428631704600BA8de9d815f5Bc672EB825'; // 컨트랙트 주소
        // Contract.setProvider('http://0.0.0.0:7545'); // 로컬 가나슈

        const address = "0x7F324F3080163808D934a9517666c663617C014B";
        Contract.setProvider('https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8'); // infura 사용하여 ropsten 테스트 가능
        const contract = new Contract(abi, address);
        const result = await contract.methods.renderHelloWorld().call();
        console.log(result);
        return result;
    } catch(e) {
        console.log(e);
        return e;
    }
}
```

## Etherscan api 사용하기 

* key 생성하여 토큰으로 조회 가능
  * 계좌 잔액 조회

```
curl https://api-ropsten.etherscan.io/api?module=account&action=balance&address=YourAddress&tag=latest&apikey=YourApiKeyToken

> {"status":"1","message":"OK","result":"69310023173799024508"}%    
```

