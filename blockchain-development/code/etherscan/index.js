const express = require('express');
const app = express();

const PORT = 8080;
const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('https://ropsten.infura.io/v3/21d3b95b8d7e4508a8d83b906f7c09a8'));


app.get('/account', async (req, res) => {
    const account = req.query.account
    await web3.eth.getBalance(account).then((balance) => {
        res.send(balance)
    }) 
})

app.get('/transaction', async (req, res) => {
    const txId = req.query.txId
    await web3.eth.getTransaction(txId).then((transaction) => {
        res.send(transaction)
    })
})

app.get('/contract', (req, res) => {
    res.send("contract 들어옴")
}) 

app.listen(PORT, function(){
	console.log("Listen on 8080 port")
});