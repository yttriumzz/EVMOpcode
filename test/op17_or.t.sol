// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract op17_or is Test {
    function testCase0000() public pure {
        uint256 a = 0x00ff;
        uint256 b = 0xff00;
        uint256 result;

        assembly {
            result := or(a, b)
        }

        assertEq(result, 0xffff);
    }
}
