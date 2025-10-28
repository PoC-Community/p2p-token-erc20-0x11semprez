pragma solidity >=0.8.0;

import "./interface/IERC20.sol";

contract ERC20 {
    string public name = "AmentaSanctum";
    string public symbol = "AMS";
    uint private decimals = 10;
    uint public _totalSupply;
}
