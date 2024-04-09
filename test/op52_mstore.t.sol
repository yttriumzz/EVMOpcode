// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

/// @dev Save word to memory
///      mstore(offset, value)
///      1. offset: offset in the memory in bytes.
///      2. value: 32-byte value to write in the memory.
contract op52_mstore is Test {
    function testCase0000() public pure {
        uint256 offset;
        uint256 value;
        uint256 result0;
        uint256 result32;

        // 1. mstore(0, 0x11223344)
        //    0x0000000000000000000000000000000000000000000000000000000011223344
        //    0x0000000000000000000000000000000000000000000000000000000000000000
        offset = 0;
        value = 0x11223344;
        assembly {
            mstore(offset, value)
            result0 := mload(0)
            result32 := mload(32)
        }
        assertEq(result0, 0x0000000000000000000000000000000000000000000000000000000011223344);
        assertEq(result32, 0x0000000000000000000000000000000000000000000000000000000000000000);

        // 2. mstore(31, 0x55667788)
        //    0x0000000000000000000000000000000000000000000000000000000011223300
        //    0x0000000000000000000000000000000000000000000000000000005566778800
        offset = 31;
        value = 0x55667788;
        assembly {
            mstore(offset, value)
            result0 := mload(0)
            result32 := mload(32)
        }
        assertEq(result0, 0x0000000000000000000000000000000000000000000000000000000011223300);
        assertEq(result32, 0x0000000000000000000000000000000000000000000000000000005566778800);
    }
}
