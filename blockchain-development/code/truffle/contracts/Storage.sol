// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
  uint val;

  function set(uint x) public {
    val = x;
  }

  function get() public view returns (uint) {
    return val;
  }
}