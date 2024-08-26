// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Users} from "../src/Users.sol";
import {Test, console} from "forge-std/Test.sol";

contract UsersTest is Test {
    Users users;

    function setUp() public {
        users = new Users();
    }

    function testCreateUser() public {
        users.createUser("Pawan", "pawan@gmail.com",Users.Type.PROFESSOR);
        assertEq(users.userCount(), 1);
    }
}
