const Web3 = require("web3");
const rpcURL = "https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8";

const web3 = new Web3(rpcURL);

const account = "0xD74C244f3c9F5e05C0CA5344394F5A7247f0d1b9".toLowerCase();

const startBlock = 12320140
const endBlock = 12320148

const result = []

for (let currentBlock = startBlock; currentBlock <= endBlock; currentBlock++){
    web3.eth.getTransactionCount(account,currentBlock).then(obj => {
        console.log(obj)
    })
    web3.eth.getBlock(currentBlock).then((obj) => {
        const transactions = obj.transactions
        for (let index = 0; index < transactions.length; index++) {
            web3.eth.getTransactionReceipt(transactions[index]).then((obj) => {
                if(obj.from !== null && obj.from === account || obj.to !== null && obj.to === account){
                    result.push(transactions[index])
                }
                if(currentBlock === endBlock && index === transactions.length -1){
                    console.log(result)
                }
            });
        }
    })
}