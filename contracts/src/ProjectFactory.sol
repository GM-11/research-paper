// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "./Project.sol";

contract ProjectFactory {
    mapping(uint256 => address) projects;
    uint256 public totalProjects;

    event ProjectCreated(address indexed);

    function createProject(
        string calldata name,
        string calldata paperUri,
        string calldata topic,
        address[] calldata contributers
    ) external {
        address newProject = address(
            new Project(name, paperUri, topic, msg.sender, contributers)
        );
        unchecked {
            projects[totalProjects++] = newProject;
        }
        emit ProjectCreated(newProject);
    }

    function getAllProjects() external view returns (address[] memory) {
        address[] memory allProjects = new address[](totalProjects);
        uint _total = totalProjects;
        for (uint256 i = 0; i < _total; ) {
            unchecked {
                allProjects[i] = projects[i];
                ++i;
            }
        }
        return allProjects;
    }
}
