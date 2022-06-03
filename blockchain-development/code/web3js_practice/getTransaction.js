const Web3 = require("web3");
const rpcURL = "https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8";

const web3 = new Web3(rpcURL);

const txId = "0x32ae7d1f71110758264f69f1758c594501973a68a3fa060e8c00a258aad2823c";

web3.eth.getTransaction(txId)
	.then((obj) => {
	  console.log(obj);
	});