// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

/// @dev shl(shift, value)
///      value << shift: the shifted value. If shift is bigger than 255, returns 0.
contract op1b_shl is Test {
    function testCase0000() public pure {
        uint256 shift = 4;
        uint256 value = 0xf; // 0xf = 0b1111
        uint256 result;

        assembly {
            result := shl(shift, value)
        }

        assertEq(result, 0xf0); // 0xf0 = 0b11110000
    }
}
