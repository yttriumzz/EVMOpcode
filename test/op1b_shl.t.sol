// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

/// @dev Left shift operation
///      shl(shift, value)
///      note: the shifted value. If shift is bigger than 255, returns 0.
///      1. shift: number of bits to shift to the left.
///      2. value: 32 bytes to shift.
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
