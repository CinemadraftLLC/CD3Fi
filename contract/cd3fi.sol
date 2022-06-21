// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBEP20 {
  function totalSupply() external view returns (uint256);
  function decimals() external view returns (uint8);
  function symbol() external view returns (string memory);
  function name() external view returns (string memory);
  function getOwner() external view returns (address);
  function balanceOf(address account) external view returns (uint256);
  function transfer(address recipient, uint256 amount) external returns (bool);
  function allowance(address _owner, address spender) external view returns (uint256);
  function approve(address spender, uint256 amount) external returns (bool);
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IPancakeERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);
    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;
}

interface IPancakeFactory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address  );
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);
    function createPair(address tokenA, address tokenB) external returns (address pair);
    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

interface IPancakeRouter01 {
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function factory() external pure returns (address);
    function WETH() external pure returns (address);
    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IPancakeRouter02 is IPancakeRouter01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IChildCD3Fi {
    function transferBusdToParent(address _parent, address _token , uint _amount) external returns (uint);
    function _swapCD3FiForBusd(address _parent, address _CD3FiToken, uint256 sellAmount) external;
}

abstract contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () {
        address msgSender = msg.sender;
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

library EnumerableSet {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Set type with
    // bytes32 values.
    // The Set implementation uses private functions, and user-facing
    // implementations (such as AddressSet) are just wrappers around the
    // underlying Set.
    // This means that we can only create new EnumerableSets for types that fit
    // in bytes32.

    struct Set {
        // Storage of set values
        bytes32[] _values;

        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping (bytes32 => uint256) _indexes;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            // The value is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        // We read and store the value's index to prevent multiple reads from the same storage slot
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) { // Equivalent to contains(set, value)
            // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
            // the array, and then remove the last element (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            // When the value to delete is the last one, the swap operation is unnecessary. However, since this occurs
            // so rarely, we still do the swap anyway to avoid the gas cost of adding an 'if' statement.

            bytes32 lastvalue = set._values[lastIndex];

            // Move the last value to the index where the value to delete is
            set._values[toDeleteIndex] = lastvalue;
            // Update the index for the moved value
            set._indexes[lastvalue] = valueIndex; // Replace lastvalue's index to valueIndex

            // Delete the slot where the moved value was stored
            set._values.pop();

            // Delete the index for the deleted slot
            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value] != 0;
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        require(set._values.length > index, "EnumerableSet: index out of bounds");
        return set._values[index];
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _add(set._inner, value);
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _remove(set._inner, value);
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
        return _contains(set._inner, value);
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(Bytes32Set storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {
        return _at(set._inner, index);
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(AddressSet storage set, uint256 index) internal view returns (address) {
        return address(uint160(uint256(_at(set._inner, index))));
    }

    // UintSet

    struct UintSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(UintSet storage set, uint256 value) internal view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(UintSet storage set, uint256 index) internal view returns (uint256) {
        return uint256(_at(set._inner, index));
    }
}

library SafeMath {
  /**
   * @dev Returns the addition of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `+` operator.
   *
   * Requirements:
   * - Addition cannot overflow.
   */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a, "SafeMath: addition overflow");

    return c;
  }
  

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   * - Subtraction cannot overflow.
   */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    return sub(a, b, "SafeMath: subtraction overflow");
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   * - Subtraction cannot overflow.
   */
  function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    require(b <= a, errorMessage);
    uint256 c = a - b;

    return c;
  }

  /**
   * @dev Returns the multiplication of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `*` operator.
   *
   * Requirements:
   * - Multiplication cannot overflow.
   */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");

    return c;
  }

  /**
   * @dev Returns the integer division of two unsigned integers. Reverts on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return div(a, b, "SafeMath: division by zero");
  }

  /**
   * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    // Solidity only automatically asserts when dividing by 0
    require(b > 0, errorMessage);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * Reverts when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    return mod(a, b, "SafeMath: modulo by zero");
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * Reverts with custom message when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    require(b != 0, errorMessage);
    return a % b;
  }
}

contract CD3Fi is IBEP20, Ownable {

    using Address for address;
    using EnumerableSet for EnumerableSet.AddressSet;
    using SafeMath for uint256;

    event TaxedTransfer(address indexed from, address indexed to, uint tax, uint dTax, uint busdTax, uint cd3fiTax, uint marketTax, uint burnTax, uint getBusdRTax, uint getBusdMTax);
    event FeelessTransfer(address indexed from, address indexed to, uint value);
    event ExcludedTransfer(bool isContractTransfer, bool isLiquidityTransfer, bool isExcluded, bool isBuy, bool isSell);
    event DistributeBusdReward(uint busdReward, uint marketFee, uint stableAmount);
    event BuyBackToken(uint time, uint buyAmount, uint liquidityRate);
     
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    EnumerableSet.AddressSet private _excluded; //address added isn't charged buy/sell/dynamic tax fee (i.e. admin wallets moving tokens around)
    EnumerableSet.AddressSet private excludeFromReward; //address added doesn't receive any rewards (i.e. contracts, dead address, etc.)
    // EnumerableSet.AddressSet private includeInReward;

    string private constant _name = 'CinemaDraft Decentralized Finance Token';
    string private constant _symbol = 'CD3Fi';
    uint8 private constant _decimals = 6;
    uint256 public _totalSupply= 80 * 10**6 * 10**_decimals;//equals 10000
    uint256 public constant _maxSupply= 80 * 10**6 * 10**_decimals;//equals 80M    

    uint8 private _liquidityTax;
    uint8 private _buyTax;
    uint8 private _sellTax;

    address[] private _tokenHolders;   

    address public constant TeamWallet=0x559802d253BEC01f2817cAC19722cA51Da854D7d;
    //TODO: Change to Mainnet
    //TestNet
    address private constant PancakeRouter = 0xCc7aDc94F3D80127849D2b41b6439b7CF1eB4Ae0;    
    //0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3;
    //MainNet
    // address private constant PancakeRouter=0x10ED43C718714eb63d5aA57B78B54704E256024E;
    //TODO: Change to Mainnet
    //Testnet BUSD
    address tokenToClaim=0x91B0558556a2617F5eAc91a8f12C6641Baf95DB3;
    address busdToken = tokenToClaim;
    // address usdtToken = 0xe07346fcF970D6F573C3795a723a14710Acd762d;
    //MainNet BUSD
    // address tokenToClaim=0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
    //wBNB
    // address tBNB = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;
    // market dex address
    address marketAddress = 0x49E001149004C7Ce37EAA651Dae367C67Af88d72;
    //child contract is for swap function _to address. It will return swap result to this token contract(parent contract)
    address _childContract = 0xa5B027388Ee880bD08Fe2609F63f8cA3127FeB4A;

    address private _pancakePairAddress; 
    IPancakeRouter02 private  _pancakeRouter;

    struct TaxData {
        uint256 _taxAmount; // tax amount
        uint256 CD3FiAmountForBusdReward;  // CD3Fi token amount for busd rewards to all token holders
        uint256 CD3FiAmountForStabilityFund;  // CD3Fi token amount for liquidity stability
        uint256 CD3FiAmountForReflection;   // CD3Fi token amount for reflection when buy and sell
        uint256 CD3FiAmountForBurn;      // CD3Fi token amount for burn
        uint256 dynamicTaxAmount;
        uint256 CD3FiAmountForMarketingFee;
        uint256 swapTaxAmountIn;
    }

    struct RewardData {
        uint256 marketingFundBalance;
        uint256 busdRewardBalance;      
    }
    
    //Locks the swap if already swapping
    bool private _isSwappingState = false;

    modifier lockTheSwap {
        _isSwappingState = true;
        _;        
        _isSwappingState = false;
    }


    //modifier for functions only the team can call
    modifier onlyTeam() {
        require(_isTeam(msg.sender), "Caller not in Team");
        _;
    }
    //Checks if address is in Team, is needed to give Team access even if contract is renounced
    //Team doesn't have access to critical Functions that could turn this into a Rugpull(Exept liquidity unlocks)
    function _isTeam(address addr) private view returns (bool){
        return addr==owner()||addr==TeamWallet;
    }

    constructor () {

        _balances[msg.sender] = _totalSupply;

        // Pancake Router
        _pancakeRouter = IPancakeRouter02(PancakeRouter);
        //Creates a Pancake Pair        
        _pancakePairAddress = IPancakeFactory(_pancakeRouter.factory()).createPair(address(this), _pancakeRouter.WETH());
        // _pancakePairAddress = IPancakeFactory(_pancakeRouter.factory()).createPair(address(this), tBNB);
        // _addToken(address(this),_totalSupply);
        emit Transfer(address(0), address(this), _totalSupply);

        _buyTax=15;
        _sellTax=18;

        _liquidityTax=75;

        //Team wallet and deployer are excluded from Taxes
        _excluded.add(msg.sender);
        _excluded.add(TeamWallet);
        excludeFromReward.add(address(this));
        _tokenHolders.push(owner());
    }

    //transfer function, every transfer runs through this function
    function _transfer(address sender, address recipient, uint256 amount) private{
        require(sender != address(0), "Transfer from zero");
        require(recipient != address(0), "Transfer to zero");
        
        //Manually Excluded adresses are transfering tax and lock free
        bool isExcluded = (_excluded.contains(sender) || _excluded.contains(recipient));

        //Transactions from and to the contract are always tax and lock free
        bool isContractTransfer=(sender==address(this) || recipient==address(this));
        bool isChildContractTransfer = sender==address(_childContract) || recipient==address(_childContract);
        //transfers between PancakeRouter and PancakePair are tax and lock free
        address pancakeRouter=address(_pancakeRouter);
        bool isLiquidityTransfer = ((sender == _pancakePairAddress && recipient == pancakeRouter) 
        || (recipient == _pancakePairAddress && sender == pancakeRouter));        
        // bool isLiquidityTransfer = sender == _pancakePairAddress||recipient == _pancakePairAddress;        

        //differentiate between buy/sell/transfer to apply different taxes/restrictions
        // bool isSell = recipient==_pancakePairAddress || recipient == pancakeRouter;
        // bool isBuy = sender==_pancakePairAddress || sender == pancakeRouter;        
        bool isSell = isContract(recipient);
        bool isBuy = isContract(sender);        
        bool isTrade = !isSell&&!isBuy;

        //Pick transfer        
        if(isContractTransfer || isChildContractTransfer || isLiquidityTransfer || isExcluded || isTrade){            
            _feelessTransfer(sender, recipient, amount);            
        }
        else{ 
            //once trading is enabled, it can't be turned off again
            // require(tradingEnabled,"trading not yet enabled");
            _taxedTransfer(sender,recipient,amount,isBuy,isSell);                  
        }

        emit ExcludedTransfer(isContractTransfer, isLiquidityTransfer, isExcluded, isBuy, isSell);
    }

    //taxed transfer
    function _taxedTransfer(address sender, address recipient, uint256 amount, bool isBuy, bool isSell) internal{
        TaxData memory _taxData;
        RewardData memory rewardData;
        uint256 tranferCD3FiAmount;                     
        if(isBuy){
            _taxData._taxAmount = amount.mul(_buyTax).div(100);   //   15% as tax fee
            _taxData.CD3FiAmountForBusdReward = amount.mul(3).div(100);  // 3% tax for busd reward
            _taxData.CD3FiAmountForStabilityFund = amount.mul(5).div(100); // 5% tax for stable Fund
            _taxData.CD3FiAmountForReflection = amount.mul(3).div(100);  // 3% tax for Reflection
            _taxData.CD3FiAmountForBurn = amount.mul(4).div(100);   // 4% tax for burn CD3Fi token            
            _taxData.swapTaxAmountIn = _taxData.CD3FiAmountForBusdReward.add(_taxData.CD3FiAmountForStabilityFund); //                         

            tranferCD3FiAmount = amount.sub(_taxData._taxAmount);            
            // add token new holder            
            _transferCD3Fi(sender, recipient, tranferCD3FiAmount);  // transfer CD3Fi token from sender except tax amount
            _distributeCD3FiRewardToAllHolders(sender, _taxData.CD3FiAmountForReflection);      //distribute CD3Fi token to all token holders            
            _transferCD3Fi(sender, address(_childContract), _taxData.swapTaxAmountIn);  //transfer CD3Fi tax amount for busd token to child contract.            
            _taxData.CD3FiAmountForBurn = _taxData._taxAmount.sub(_taxData.CD3FiAmountForReflection.add(_taxData.swapTaxAmountIn));
            _burnFrom(sender, _taxData.CD3FiAmountForBurn);            //  burn CD3Fi token
            rewardData.marketingFundBalance = 0;
            rewardData.busdRewardBalance = _getBusdAmountsOutForCD3Fi(_taxData.CD3FiAmountForBusdReward);    // set busdRewardBalance    
            if(!_isSwappingState) {
                childSwapCD3FiForBusd(rewardData.busdRewardBalance, rewardData.marketingFundBalance);
            }            
        }
        else if(isSell){
            _taxData._taxAmount = amount.mul(_sellTax).div(100);
            _taxData.CD3FiAmountForBusdReward = amount.mul(3).div(100);
            _taxData.CD3FiAmountForStabilityFund = amount.mul(5).div(100);
            _taxData.CD3FiAmountForReflection = amount.mul(3).div(100);
            _taxData.CD3FiAmountForBurn = amount.mul(4).div(100);
            _taxData.CD3FiAmountForMarketingFee = amount.mul(3).div(100);
            _taxData.dynamicTaxAmount = _dynamicTaxAmount(amount, recipient);  // dynamic tax amount regarding the liquidity changing rate.            
            
            _taxData.CD3FiAmountForBusdReward += _taxData.dynamicTaxAmount.div(4);
            _taxData.CD3FiAmountForStabilityFund += _taxData.dynamicTaxAmount.div(4);
            _taxData.CD3FiAmountForReflection += _taxData.dynamicTaxAmount.div(4);
            _taxData.CD3FiAmountForBurn += _taxData.dynamicTaxAmount.div(4);
            // _taxData.CD3FiAmountForBurn = _taxData._taxAmount.add(_taxData.dynamicTaxAmount).sub(_taxData.CD3FiAmountForReflection.add( _taxData.swapTaxAmountIn)); 
            _taxData.swapTaxAmountIn = _taxData.CD3FiAmountForBusdReward.add(_taxData.CD3FiAmountForMarketingFee.add(_taxData.CD3FiAmountForStabilityFund));   
            
            tranferCD3FiAmount = amount.sub(_taxData._taxAmount.add(_taxData.dynamicTaxAmount));            

            _transferCD3Fi(sender, recipient, tranferCD3FiAmount);  // transfer CD3Fi token from sender except tax amount            
            
            _distributeCD3FiRewardToAllHolders(sender, _taxData.CD3FiAmountForReflection);      //distribute CD3Fi token to all token holders            
            _transferCD3Fi(sender, address(_childContract), _taxData.swapTaxAmountIn);  //transfer CD3Fi tax amount for busd token to child contract.                        
            _burnFrom(sender, _taxData.CD3FiAmountForBurn);            //  burn CD3Fi token
            rewardData.busdRewardBalance = _getBusdAmountsOutForCD3Fi(_taxData.CD3FiAmountForBusdReward);    // set busdRewardBalance    
            rewardData.marketingFundBalance = _getBusdAmountsOutForCD3Fi(_taxData.CD3FiAmountForMarketingFee);            
            if(!_isSwappingState) {
                childSwapCD3FiForBusd(rewardData.busdRewardBalance, rewardData.marketingFundBalance);
            }  

        } else { // transfer
            _feelessTransfer(sender, recipient, amount);     
        }

        if(!isContract(recipient)&&_isNewTokenHolder(recipient)) {
                _tokenHolders.push(recipient);
        }  

        // emit TaxedTransfer(sender, recipient, _taxData._taxAmount, , isSell);
        emit TaxedTransfer(sender, recipient, _taxData._taxAmount, _taxData.dynamicTaxAmount, _taxData.CD3FiAmountForBusdReward, _taxData.CD3FiAmountForReflection, _taxData.CD3FiAmountForMarketingFee, _taxData.CD3FiAmountForBurn, rewardData.busdRewardBalance, rewardData.marketingFundBalance);
    }    

    // swap all CD3Fi token to busd in child CD3Fi contract and return it to this contract. This function should be called as soon as CD3Fi token swap is done.
    function childSwapCD3FiForBusd(uint256 busdRewardAmount, uint256 marketingFeeAmount) lockTheSwap private {            
            uint256 swapAmountIn = _balances[address(_childContract)];  // total CD3Fi amount
            IChildCD3Fi(address(_childContract))._swapCD3FiForBusd(address(this), address(this), swapAmountIn);  // swap CD3Fi to Busd
            _distributeBusdRewardToAllHolders(busdRewardAmount);    // distribute busdrewards amount to all token holders.
            if(marketingFeeAmount > 0) { IBEP20(address(busdToken)).transfer(marketAddress , marketingFeeAmount); }  // send marketing fund amount when this token sell
            uint256 stableFundBalance = IBEP20(address(busdToken)).balanceOf(address(this));  // set current stable busd amount in this contract.        
                
        emit DistributeBusdReward(busdRewardAmount, marketingFeeAmount, stableFundBalance);
    }
    // transfer without any fee
    function _feelessTransfer(address sender, address recipient, uint256 amount) private {        
        _transferCD3Fi(sender, recipient, amount);
        emit FeelessTransfer(sender, recipient, amount);
    }       

    // swap between CD3Fi and Busd   Buy busd and sell CD3Fi in here.
    function _swapCD3FiForBusd(uint256 sellAmount, uint256 amountOut) lockTheSwap private returns (uint256){        
        require(
            _balances[address(this)] >= sellAmount,
            "Insufficient CD3Fi balance"
        );
        _approve(address(this), PancakeRouter, _totalSupply);    
        require(
            _allowances[address(this)][PancakeRouter] >= sellAmount,
            "Exceeds approve amount"
        );          

        address[] memory path = new address[](3);

        path[0] = address(this);   
        path[1] = address(busdToken);

        _pancakeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            sellAmount,
            0,
            path,
            payable(_childContract),
            block.timestamp + 36000
        );                
        uint256 childCD3FiBusdBalance = IBEP20(address(busdToken)).balanceOf(address(_childContract));
        uint256 amountFromChild = amountOut;
        if(childCD3FiBusdBalance <= amountOut) {
            amountFromChild = childCD3FiBusdBalance;
        }
        IChildCD3Fi(address(_childContract)).transferBusdToParent(address(this), busdToken, amountFromChild);

        return amountFromChild;        
    }

    // swap   sell busd to buy cd3fi token
    function _swapBusdForCD3Fi(uint256 sellAmount, uint256 amountOut) lockTheSwap private returns (uint256) {        
        require(
            IBEP20(address(busdToken)).balanceOf(address(this)) >= sellAmount,
            "Insufficient Busd balance"
        );        
        IBEP20(address(busdToken)).approve(address(_pancakeRouter), sellAmount); //approve busd token for this and pancake router        
        
        address[] memory path = new address[](2);
        path[0] = busdToken;
        path[1] = address(this);

        _pancakeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            sellAmount,
            0,
            path,
            address(_childContract),
            block.timestamp + 36000
        );        

        uint256 childCD3FiBalance = IBEP20(address(busdToken)).balanceOf(address(_childContract));
        uint256 amountCD3FiFromChild = amountOut;
        if(childCD3FiBalance <= amountOut) {
            amountCD3FiFromChild = childCD3FiBalance;
        }
        IChildCD3Fi(address(_childContract)).transferBusdToParent(address(this), address(busdToken), amountCD3FiFromChild);                

        return amountCD3FiFromChild;
    }

    // check CD3Fi token holder 
    function _isNewTokenHolder(address holder) private view returns (bool) {
        for(uint index = 0; index < _tokenHolders.length; index++) {
            if(holder == _tokenHolders[index]) {
                return false;
            }
        }
        return true;
    }

    // function checkContract(address addr) public view returns (bool) {
    //     bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;                                                                                             
    //     bytes32 codehash;
    //     assembly {
    //         codehash := extcodehash(addr)
    //     }
    //     return (codehash == 0x0 && codehash == accountHash);
    // }

    function isContract(address addr) public view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }

    function _transferCD3Fi(address sender, address recipient, uint256 transferAmount) internal {
        require(transferAmount > 0, 'transfer amount should be bigger than 0');
        require(
            IBEP20(address(this)).balanceOf(sender) >= transferAmount,
            'Insufficient CD3Fi Balance'
        );
        _balances[sender] = _balances[sender].sub(transferAmount);
        _balances[recipient] = _balances[recipient].add(transferAmount);
        emit Transfer(sender, recipient, transferAmount);
    }

    function _distributeCD3FiRewardToAllHolders(address sender, uint256 distributeAmount) private {
        for(uint index = 0; index < _tokenHolders.length; index++) {
            if(!excludeFromReward.contains(_tokenHolders[index])) {
            uint256 holderCD3FiBalance = IBEP20(address(this)).balanceOf(_tokenHolders[index]);
            uint256 distributeTokenAmount = distributeAmount.mul(holderCD3FiBalance).div(_totalSupply);
            address recipient = _tokenHolders[index];
            _transferCD3Fi(sender, recipient, distributeTokenAmount);
            }
        }
    }    

    function _distributeBusdRewardToAllHolders(uint256 distributeAmount) private {
        for(uint index = 0; index < _tokenHolders.length; index++) {            
            if(!excludeFromReward.contains(_tokenHolders[index])) {
            uint256 holderCD3FiBalance = IBEP20(address(this)).balanceOf(_tokenHolders[index]);
            uint256 distributeTokenAmount = distributeAmount.mul(holderCD3FiBalance).div(_totalSupply);
            IBEP20(address(busdToken)).transfer(_tokenHolders[index], distributeTokenAmount);
            }
        }
    }

    function _dynamicTaxAmount(uint256 amountToSell, address recipient) private view returns (uint256) {        
        uint256 reserveCD3Fi = IBEP20(address(this)).balanceOf(recipient);                        
        uint256 taxForDeltaLiquidity = 0;
        if(amountToSell > reserveCD3Fi) {
            return taxForDeltaLiquidity = 0;
        } else {
            uint256 deltaLiquidity = amountToSell.mul(100).div(reserveCD3Fi);
            taxForDeltaLiquidity = amountToSell.mul(deltaLiquidity.mul(10)).div(100);
            return taxForDeltaLiquidity;
        }        
    }

    function _getBusdAmountsOutForCD3Fi(uint256 _CD3FiAmount) private view returns (uint256) {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = address(busdToken);        
        uint256[] memory busdOutAmount = _pancakeRouter.getAmountsOut(_CD3FiAmount, path);
        return busdOutAmount[1];
    }

    function _getCD3FiAmountsOutForBusd(uint256 _busdAmount) private view returns (uint256) {
        address[] memory path = new address[](2);
        path[0] = address(busdToken);        
        path[1] = address(this);        
        uint256[] memory CD3FiOutAmount = _pancakeRouter.getAmountsOut(_busdAmount, path);
        return CD3FiOutAmount[1];
    }

    function _checkPancakeDexLiquidity(uint256 _stabilityCD3FiLiquidity) external view returns (bool, uint256) {
        
        require(_stabilityCD3FiLiquidity > 0, "Incorrect Stablidity amount.");

        uint256 currentReserveCD3Fi;
        uint256 deltaLiquidity;
        bool liquidityRiskState = false;
        
            currentReserveCD3Fi = _balances[address(_pancakePairAddress)];   
            
           if(currentReserveCD3Fi > _stabilityCD3FiLiquidity){
                deltaLiquidity = (currentReserveCD3Fi - _stabilityCD3FiLiquidity) * 100 / _stabilityCD3FiLiquidity;
                if(deltaLiquidity >= 5) {
                    liquidityRiskState = true;
                }
           }      
        return (liquidityRiskState, deltaLiquidity);
    }

    function supplyBusdForStable(uint256 liquidityRating) onlyOwner external {
        uint256 boughtCD3FiAmount = _buyBackStabilityFund(liquidityRating);
        _distributeCD3FiRewardToAllHolders(address(this), boughtCD3FiAmount);
    }

    function _buyBackStabilityFund(uint256 deltaLiquidity) private returns (uint256) {        
        uint256 stabilityFundBusd = IBEP20(busdToken).balanceOf(address(this));
        uint256 buyBackBusdAmount = stabilityFundBusd.mul(deltaLiquidity).div(100);
        uint256 amountOutCD3Fi = _getCD3FiAmountsOutForBusd(buyBackBusdAmount);
        uint256 buyBackCD3FiAmount = _swapBusdForCD3Fi(buyBackBusdAmount, amountOutCD3Fi);        

        emit BuyBackToken(block.timestamp, buyBackCD3FiAmount, deltaLiquidity);
        return buyBackCD3FiAmount;        
    }

    function addExcludeFromReward(address _excludedAddress) onlyOwner external returns(bool) {
        excludeFromReward.add(_excludedAddress);
        return excludeFromReward.contains(_excludedAddress);
    }

    function setExcludedFromFee(address _excludedFromFee) onlyOwner external returns(bool) {
        _excluded.add(_excludedFromFee);
        return _excluded.contains(_excludedFromFee);
    }

    function setIncludeInReward(address _includeInReward) onlyOwner external returns(bool) {
        excludeFromReward.remove(_includeInReward);        
        return !_excluded.remove(_includeInReward);
    }

    function withdrawStabilityFund(uint amount) external onlyOwner returns(uint) {
        require(
            IBEP20(busdToken).balanceOf(address(this)) >= amount,
            "Insufficient Fund"
        );

        IBEP20(busdToken).transfer(msg.sender, amount);        
        return amount;
    }

 
    receive() external payable {}
    fallback() external payable {}

    // IBEP20
    function getOwner() external view override returns (address) {
        return owner();
    }

    function name() external pure override returns (string memory) {
        return _name;
    }

    function symbol() external pure override returns (string memory) {
        return _symbol;
    }

    function decimals() external pure override returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address _owner, address spender) external view override returns (uint256) {
        return _allowances[_owner][spender];
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "Approve from zero");
        require(spender != address(0), "Approve to zero");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "Transfer > allowance");

        _approve(sender, msg.sender, currentAllowance - amount);
        return true;
    }

    // IBEP20 - Helpers

    function increaseAllowance(address spender, uint256 addedValue) external returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) external returns (bool) {
        uint256 currentAllowance = _allowances[msg.sender][spender];
        require(currentAllowance >= subtractedValue, "<0 allowance");

        _approve(msg.sender, spender, currentAllowance - subtractedValue);
        return true;
    }

    function _msgSender() internal view returns (address payable) {
        return payable(msg.sender);
    }


      /**
   * @dev Creates `amount` tokens and assigns them to `msg.sender`, increasing
   * the total supply.
   *
   * Requirements
   *
   * - `msg.sender` must be the token owner
   */
  function mint(uint256 amount) private onlyOwner returns (bool) {
    require(
        _totalSupply.add(amount) <= _maxSupply,
        "Exceeds max supply."
    );
    _mint(_msgSender(), amount);
    return true;
  }

    function _mint(address account, uint256 amount) internal {
    require(account != address(0), "BEP20: mint to the zero address");

    _totalSupply = _totalSupply.add(amount);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }

        
  /**
   * @dev Destroys `amount` tokens from `account`, reducing the
   * total supply.
   *
   * Emits a {Transfer} event with `to` set to the zero address.
   *
   * Requirements
   *
   * - `account` cannot be the zero address.
   * - `account` must have at least `amount` tokens.
   */
  function _burn(address account, uint256 amount) internal {
    require(account != address(0), "BEP20: burn from the zero address");

    _balances[account] = _balances[account].sub(amount, "BEP20: burn amount exceeds balance");
    _totalSupply = _totalSupply.sub(amount);
    emit Transfer(account, address(0), amount);
  }

      /**
   * @dev Destroys `amount` tokens from `account`.`amount` is then deducted
   * from the caller's allowance.
   *
   * See {_burn} and {_approve}.
   */
  function _burnFrom(address account, uint256 amount) internal {
    // _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "BEP20: burn amount exceeds allowance"));
    _burn(account, amount);    
  }
}