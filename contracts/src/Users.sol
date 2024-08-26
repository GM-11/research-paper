// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Users {
    enum Type {
        PROFESSOR,
        STUDENT
    }
    struct UserType {
        address walletAddress;
        string name;
        string email;
        Type userType;
    }

    mapping(address => UserType) public users;
    address[] private userAddresses;
    uint256 public userCount;

    event UserCreated(
        address indexed walletAddress,
        string name,
        Type userType
    );

    function createUser(
        string calldata _name,
        string calldata _email,
        Type _userType
    ) external {
        users[msg.sender] = UserType(msg.sender, _name, _email, _userType);
        userAddresses.push(msg.sender);
        unchecked {
            ++userCount;
        }
        emit UserCreated(msg.sender, _name, _userType);
    }

    function getUser(
        address _walletAddress
    ) external view returns (UserType memory) {
        return users[_walletAddress];
    }

    function getAllUsers() external view returns (UserType[] memory) {
        UserType[] memory _users = new UserType[](userCount);
        for (uint256 i = 0; i < userCount; ) {
            unchecked {
                _users[i] = users[userAddresses[i]];
                ++i;
            }
        }
        return _users;
    }
}
