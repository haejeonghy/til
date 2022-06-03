const Web3 = require("web3");
const rpcURL = "https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8";

const web3 = new Web3(rpcURL);

const blockNum = "12287565";

web3.eth.getBlock(blockNum).then((obj) => {
  console.log(obj);
});