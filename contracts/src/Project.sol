// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "./Utils.sol";

contract Project {
    struct Funding {
        uint256 amount;
        address funder;
    }

    string public name;
    string public paperUri;
    string public topic;

    address public immutable owner;

    address[] public contributers;

    mapping(uint256 => Funding) fundings;
    uint256 public totalFundings;

    event FundingReceived(uint256 amount, address indexed funder);
    event AmountWithdrawn(uint256 amount);

    constructor(
        string memory _name,
        string memory _paperUri,
        string memory _topic,
        address _owner,
        address[] memory _contributers
    ) {
        name = _name;
        paperUri = _paperUri;
        owner = _owner;
        topic = _topic;
        contributers = _contributers;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can withdraw");
        _;
    }
    modifier sufficientBalance(uint256 _amount) {
        require(address(this).balance >= _amount, "Insufficient balance");
        _;
    }

    receive() external payable {}

    fallback() external payable {}

    function fund() external payable {
        require(msg.value > 0, "Value must be more than 0");
        (bool sent, ) = (payable(address(this))).call{value: msg.value}("");

        require(sent, "Failed to send funds");

        unchecked {
            fundings[totalFundings++] = Funding(msg.value, msg.sender);
        }

        emit FundingReceived(msg.value, msg.sender);
    }

    // function addMentor(
    //     string calldata mentorName,
    //     address mentorAddress
    // ) external payable {
    //     require(
    //         msg.value > Utils.MIN_FEE_FOR_MENTOR,
    //         "Value must be more than 0"
    //     );
    //     // send value to contract
    //     (bool sentAmount, ) = payable(address(this)).call{
    //         value: msg.value - Utils.MIN_FEE_FOR_MENTOR
    //     }("");
    //     require(sentAmount, "Transactions Failed");

    //     // send value to relayer
    //     (bool sentFee, ) = payable(Utils.RELAYER).call{
    //         value: Utils.MIN_FEE_FOR_MENTOR
    //     }("");
    //     require(sentFee, "Transactions Failed");

    // }

    function withdrawAmount(
        uint256 amount
    ) external onlyOwner sufficientBalance(amount) {
        (bool sent, ) = payable(owner).call{value: amount}("");
        require(sent, "Withdraw Failed");
        emit AmountWithdrawn(amount);
    }

    // function getAllMentors() external view returns (Mentor[] memory) {
    //     Mentor[] memory _m = new Mentor[](totalMentors);

    //     uint _total = totalMentors;
    //     for (uint256 i = 0; i < _total; ) {
    //         unchecked {
    //             _m[i] = mentors[i];
    //             ++i;
    //         }
    //     }

    //     return _m;
    // }
}
