// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "../contracts/Adoption.sol";
// These files are dynamically created at test time
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddress.Adoption());
    //id of the pet that we will use for testing
    uint256 expectedId = 5;
    address expectedAdopter = address(this);

    //testing the adopt function
    function testUsercanAdoptapet() public {
        uint256 returnedId = adoption.adopt(expectedId);
        Assert.equal(
            returnedId,
            expectedId,
            "Adoption of expected pet should match what is returned"
        );
    }

    // retirieval of single pet owner - test
    function testGetAdoptedAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(
            adopter,
            expectedAdopter,
            "Owner of the expected pet should be this contract"
        );
    }

    // retriving of all pet owners - test
    function testGetAdopterAddressByPetIdInArray() public {
        // store adopters in memory instead of storage
        address[10] memory adopters = adoption.getAdopters();
        Assert.equal(
            adopters[expectedPetId],
            expectedAdopter,
            "Owner of the expected pet should be this contract"
        );
    }
}
