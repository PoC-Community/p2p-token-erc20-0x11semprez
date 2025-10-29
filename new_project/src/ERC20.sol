pragma solidity >=0.8.0;

import {IERC20} from "./interface/IERC20.sol";

contract ERC20 is IERC20 {
    string public name = "fre ";
    string public symbol = "rettr";
    uint8 public decimals = 18;
    uint private _totalSupply;

    mapping(address account => uint256) private _balances;
    mapping(address owner => mapping(address spender => uint256)) private _allowances;

    constructor(uint initialSupply) {
        _totalSupply = initialSupply * 10 ** uint256(decimals);
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender,_totalSupply);
    }
        
        
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }


    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function _transfer(address from, address to, uint256 value) private returns (bool) {
        if (from == address(0)) {
            revert("Invalid Provider");
        }
        if (to = address(0)) {
            revert("Invalid Sender");
        }
        if (_balances[from] < value) {
            revert("Insuffisant found");

        }

        _balances[from] -= value;
        _balances[to] += value;
        emit Transfer(from, to, value);
    }
        
    
    function transfer(address to, uint256 value) public override returns (bool){
        _transfer(msg.sender, to, value);
        return true;
    }


    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }


    function approve(address spender, uint256 value) external returns (bool) {
        if (spender == address(0)) {
            revert ("Invalide Spender");
        }

        _allowances[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;

    }


    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        if (_allowances[from][msg.sender] < value) {
            revert ("Insufficient allowance");
        }

        _allowances[from][msg.sender] -= value;
        _transfer(from, to, value);(from, to ,value);
        return true;  
    }


    function name() public view override returns (string memory) {
        return name;
    }

    function symbol() public view override returns (string memory) {
        return symbol;
    }

}
