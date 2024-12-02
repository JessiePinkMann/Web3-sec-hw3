// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Interfaces.sol";

contract Loops is ILoops {
    function loopFor() public pure {
        uint256 sum;
        for (uint256 i = 0; i < 20; i++) {
            sum = sum + i;
        }
    }

    function loopWhile() public pure {
        uint256 sum;
        uint256 i;
        while (i < 10) {
            sum = sum + i;
            i++;
        }
    }

    function loopDoWhile() public pure {
        uint256 sum;
        uint256 i;

        do {
            sum = sum + i;
            i++;
        } while (i < 10);
    }
}

contract LoopsOptimized is ILoops {
    function loopFor() public pure {
        uint256 sum;
        uint256 limit = 20;
        unchecked { 
            for (uint256 i = 0; i < limit; ++i) {
                sum += i;
            }
        }
    }

    function loopWhile() public pure {
        uint256 sum;
        uint256 i = 0;
        uint256 limit = 10; 
        unchecked {
            while (i < limit) {
                sum += i;
                ++i; 
            }
        }
    }

    function loopDoWhile() public pure {
        uint256 sum;
        uint256 i = 0;
        uint256 limit = 10; 
        unchecked {
            do {
                sum += i;
                ++i;
            } while (i < limit);
        }
    }
}
