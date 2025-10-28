pragma solidity >=0.8.0;

import {IERC20} from "./interface/IERC20.sol";

contract ERC20 is IERC20 {
    string public name = "AmentaSanctum";
    string public symbol = "AMS";
    uint8 public decimals = 18;
    uint private _totalSupply;

    mapping(address account => uint256) private _balances;
    mapping(address owner => mapping(address spender => uint256)) private _allowances;

    constructor(uint private _totalSupply) {
        _totalSupply = 10 * (10 ** uint256(decimals));
        _balances[msg.sender] = _totalSupply;
        event Transfert(address indexed from, adress indexed to, uint256 value);
    }
}
