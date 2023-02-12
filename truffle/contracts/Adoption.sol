// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Adoption {
    address[16] public adopters;

    function adopt(uint256 petId) public returns (uint256) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }

    // view mean that we don't change anything in the contract, it just a getter
    // memory mean that the variable is stored in a temporary space
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
