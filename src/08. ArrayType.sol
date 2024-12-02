// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract ArrayType is IArrayType {
    uint256[] array;

    function initArray() public {
        for (uint256 i; i < 200; ++i) {
            array.push(i);
        }
    }
}

contract ArrayTypeOptimized is IArrayType {
    uint256[] array;

    function initArray() public {
        assembly {
            let arraySlot := array.slot
            sstore(arraySlot, 200)

            mstore(0x0, arraySlot)
            let dataSlot := keccak256(0x0, 0x20)
            
            for { let i := 0 } lt(i, 200) { i := add(i, 1) } {
                sstore(add(dataSlot, i), i)
            }
        }
    }
}
