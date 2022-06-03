
const Web3 = require("web3");
const rpcURL = "https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8";

const web3 = new Web3(rpcURL);

const account = "0xD74C244f3c9F5e05C0CA5344394F5A7247f0d1b9";

web3.eth.getBalance(account)
  .then((bal) => {
    console.log("지갑 ${account}의 잔액은... ${bal} wei 입니다.");
    return web3.utils.fromWei(bal, "ether"); // web3.utils.fromWei 를 사용해 ether 단위로 변경
  })
  .then((eth) => {
    console.log(`이더 단위로는 ${eth} ETH 입니다.`);
  });