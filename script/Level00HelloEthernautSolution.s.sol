// SPDX-License-Identifier: MIT
// forge script script/Level01HelloEthernautSolution.s.sol -vvvv --broadcast
// broadcast 옵션을 넣우져면 로컬에 fork해서만 실행하는게 아니라 실제 네트워크에 적용한다.
pragma solidity ^0.8.0;

import "../src/Level00HelloEthernaut.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level01HelloEthernautSolution is Script {
    Instance public helloethernautInstance = Instance(0xb4f5990A5a68f0E4B154fe9137b97eb9aF1b11E1);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        string memory password = helloethernautInstance.password();

        console.log("password: ", password);        
        helloethernautInstance.authenticate(password);

        console.log("Cleared: ", helloethernautInstance.getCleared());
        vm.stopBroadcast();
    }
}