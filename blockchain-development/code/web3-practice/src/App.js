import {useState, useEffect} from 'react'
import Web3 from 'web3' 
import erc721Abi from './erc721Abi'
import TokenList from "./components/TokenList";

function App() {
  const [web3, setWeb3] = useState()
  const [account, setAccount] = useState('')
  // ntf 주소
  const [newErc721addr, setErc721addr] = useState()
  const [erc721list, setErc721list] = useState([])
  const addNewErc721Token = async () => {
    const tokenContract = await new web3.eth.Contract(erc721Abi, newErc721addr);
    const name = await tokenContract.methods.name().call();
    const symbol = await tokenContract.methods.symbol().call();
    const totalSupply = await tokenContract.methods.totalSupply().call();

      console.log("name", name)
      console.log("symbol", symbol)
      console.log("totalSupply", totalSupply)

      let arr = []
      for (let i = 1; i <= totalSupply; i++) {
        arr.push(i)
      }
      for(let tokenId of arr) {
        let tokenOwner = await tokenContract.methods.ownerOf(tokenId).call()
        if(String(tokenOwner).toLocaleLowerCase() === account) {
          let tokenURI = await tokenContract.methods.tokenURI(tokenId).call()
          setErc721list((prevState) => {
            return [...prevState, {name, symbol, tokenId, tokenURI}]
          })
        }
      }
      console.log("arr", arr)
    }
  const connectWallet = async () => {
    const accounts = await window.ethereum.request({
        method: "eth_requestAccounts",
    });

    setAccount(accounts[0]);
};
  useEffect(() => {
    if(typeof window.ethereum !== 'undefined') {
      try {
        const web = new Web3(window.ethereum)
        setWeb3(web)
      } catch (err) {
        console.log(err)
      }
    }
  }, []);
  return (
    <div className="App">
      <button 
        className='metaConnect'
        onClick={() => {
          connectWallet()
        }}>연동
      </button>
      <div className='userInfo'>주소: {account}</div>
      <div className="newErc721">
        <input type="text"
        onChange={(e) => {
          setErc721addr(e.target.value)
        }}/>
        <button onClick={() => addNewErc721Token()}>add new erc732</button>
      </div>
      <TokenList erc721list={erc721list}/>
    </div>
  );
}

export default App;