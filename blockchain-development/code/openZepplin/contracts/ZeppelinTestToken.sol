// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

//import를 통해 라이브러리에 존재하는 ERC20.sol 파일을 가져와서 사용할 수 있다.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ZeppelinTestToken is ERC20 {
    constructor() ERC20("ZeppelinTestToken", "ZTT") {
          _mint(msg.sender, 100000000e18);
    }

}