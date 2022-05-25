// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Storage.sol";

contract TestSimpleStorage {
    function testSimpleStorage() public {
            SimpleStorage ss = new SimpleStorage();

            uint expected = 4;
            ss.set(expected);
            Assert.equal(ss.get(), expected, "value equal test");
            
    }
}