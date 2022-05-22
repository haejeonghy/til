# Geth를 사용해 스마트 컨트랙트 빌드하기

## 배포

1. 코드를 디렉토리에 저장
2. 배포할 스마트 컨트랙트 코드를 solc를 사용해 컴파일
   1. `solc --abi --bin simpleStorage.sol`
      1. ABI와 바이트코드가 출력
3. geth console 실행 `geth console 2> /dev/null --ropsten`
4. `simpleAbi` 변수 선언하여 ABI로 초기화
   1. `var simpleAbi = [{"inputs":[],"name":"get","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"x","type":"uint256"}],"name":"set","outputs":[],"stateMutability":"nonpayable","type":"function"}]`
5. `simpleBytecode` 변수 선언하여 바이트 코드로 초기화
   1. `var simpleBytecode = "0x608060405234801561001057600080fd5b50610150806100206000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c806360fe47b11461003b5780636d4ce63c14610057575b600080fd5b610055600480360381019061005091906100c3565b610075565b005b61005f61007f565b60405161006c91906100ff565b60405180910390f35b8060008190555050565b60008054905090565b600080fd5b6000819050919050565b6100a08161008d565b81146100ab57600080fd5b50565b6000813590506100bd81610097565b92915050565b6000602082840312156100d9576100d8610088565b5b60006100e7848285016100ae565b91505092915050565b6100f98161008d565b82525050565b600060208201905061011460008301846100f0565b9291505056fea2646970667358221220fadebbf066e452e596e8ed6919b77a5c29bb3411855cb717f43b45eab7c2c7c664736f6c634300080a0033"`
6. `eth.contract()` 사용하여 ABI 설정
   1. `var simpleContract = eth.contract(simpleAbi)`
7. 컨트랙트 배포에 가스가 필요하기 때문에 컨트랙트 배포할 계정의 락 해제
   1. `personal.unlockAccount(eth.accounts[0]);`
   2. `true` 반환되면 정상적으로 락이 풀린것이다.
8. 배포 시작
   1. `var contractObj = simpleContract.new({from: eth.accounts[0], data: simpleBytecode, gas: 2000000});`
      * from : 컨트랙트를 배포할 계정
      * data : 컨트랙트 바이트코드
      * gas : 계정에서 소비할 가스
9. contractObj의 `transactionHash`를 etherscan에서 저회하면 배포된 것을 확인할 수 있다.