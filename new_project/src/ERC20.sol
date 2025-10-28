pragma solidity >=0.8.0;

import {IERC20} from "./interface/IERC20.sol";

contract ERC20 is IERC20 {
    string public name = "AmentaSanctum";
    string public symbol = "AMS";
    uint8 public decimals = 18;
    uint private _totalSupply;

    mapping(address account => uint256) private _balances;
    mapping(address owner => mapping(address spender => uint256)) private _allowances;

    constructor(uint private _totalSupply,uint private _balance) {
        _totalSupply = 10 * (10 ** uint256(decimals));
        _balances[msg.sender] = _totalSupply;
        emit Transfert(address indexed from, adress indexed to, uint256 value);
    }
        
        
    function totalSupply() external view override returns (uint256);

    /// @notice Returns the amount of tokens owned by `account`.
    function balanceOf(address account) external view override returns (uint256);

    /// @notice Moves `amount` tokens from the caller's account to `to`.
    function transfer(address to, uint256 amount) external returns (bool);

    /// @notice Returns the remaining number of tokens that `spender` is allowed
    /// to spend on behalf of `owner`
    function allowance(address owner, address spender) external view returns (uint256);

    /// @notice Sets `amount` as the allowance of `spender` over the caller's tokens.
    /// @dev Be aware of front-running risks: https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice Moves `amount` tokens from `from` to `to` using the allowance mechanism.
    /// `amount` is then deducted from the caller's allowance.
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    /// @notice Returns the name of the token.
    function name() external view returns (string memory);

    /// @notice Returns the symbol of the token.
    function symbol() external view returns (string memory);

    /// @notice Returns the decimals places of the token.
    function decimals() external view returns (uint8);
}
