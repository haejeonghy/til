const express =require('express');
const app = express();
const port = 8080;
const Web3 = require('web3');
const Contract = require('web3-eth-contract');

function getWeb3() { 
    const web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:7545'));
    return web3;
}

async function getAccounts() {
    try {
        const accounts = await getWeb3().eth.getAccounts(); 
        console.log(accounts);
        return accounts;
    } catch (e) {
        console.log(e);
        return e;
    }
}

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
        const address = '0xa2A75B428631704600BA8de9d815f5Bc672EB825';
        Contract.setProvider('http://0.0.0.0:7545');
        const contract = new Contract(abi, address);
        const result = await contract.methods.renderHelloWorld().call();
        console.log(result);
        return result;
    } catch(e) {
        console.log(e);
        return e;
    }
}

app.get('/helloworld', (req, res) => {
    helloWorld().then((result) => {
        res.send(result);
    })
})

app.get('/', (req, res) => {
    getAccounts().then((accounts) => {
        res.send(accounts);
    })
});
app.listen(port, () => {
	console.log('Listening...');
});

async function getGasPrice() {
    try {
        const gasPrice = await getWeb3().eth.getGasPrice();
        console.log(gasPrice);
        return gasPrice;
    } catch (e) {
        console.log(e);
        return e;
    }
}

app.get('/gasprice', (req, res) => {
    getGasPrice().then((gasPrice) => {
        res.send(gasPrice);
    })
})

async function getBlock() {
    try {
        const getBlock = await getWeb3().eth.getBlock("latest");
        console.log(getBlock);
        return getBlock;
    } catch (e) {
        console.log(e);
        return e;
    }
}

app.get('/getblock', (req, res) => {
    getBlock().then((getBlock) => {
        res.send(getBlock);
    })
})