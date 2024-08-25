// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ProjectFactory} from "../src/ProjectFactory.sol";
import {Project} from "../src/Project.sol";
import {Users} from "../src/Users.sol";
import {Test, console} from "forge-std/Test.sol";

contract ProjectFactoryTest is Test {
    ProjectFactory public projectFactory;

    function setUp() public {
        projectFactory = new ProjectFactory();
    }

    function testAddProject() public {
        address[] memory contributers = new address[](1);
        projectFactory.createProject("Name", "URI", "Topic", contributers);
        assertEq(projectFactory.totalProjects(), 1);
    }
}
