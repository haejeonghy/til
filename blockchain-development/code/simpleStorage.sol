pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    // 데이터 저장 함수
    function set(uint x) public {
        storedData = x;
    }
    // 저장된 데이터 반환 함수
    function get() public view returns (uint){
        return storedData;
    }
}