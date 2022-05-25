// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

interface ERC20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address spender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Transfer(address indexed spender, address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 oldAmount, uint256 amount);
}

library SafeMath {
  	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
		uint256 c = a * b;
		assert(a == 0 || c / a == b);
		return c;
  	}

  	function div(uint256 a, uint256 b) internal pure returns (uint256) {
	    uint256 c = a / b;
		return c;
  	}

  	function sub(uint256 a, uint256 b) internal pure returns (uint256) {
		assert(b <= a);
		return a - b;
  	}

  	function add(uint256 a, uint256 b) internal pure returns (uint256) {
		uint256 c = a + b;
		assert(c >= a);
		return c;
	}
}

// 특정 함수를 관리자만 사용할 수 있도록 설정하는 OwnerHelper 함수
/* 
abstract contract
contract의 구현된 기능과 interface의 추상화 기능 모두를 포함
실제 contract에서 사용하지 않는다면 추상으로 표시되어 사용되지 않는다.

*/
abstract contract OwnerHelper {
  	address private _owner;

    // 관리자가 변경되었을때 이전 관리자의 주소와 새로운 관리자의 주소 로그를 남긴다.
  	event OwnershipTransferred(address indexed preOwner, address indexed nextOwner);
    // 함수 실행 이전에 함수를 실행시키는 사람이 관리자인지 확인
  	modifier onlyOwner {
		require(msg.sender == _owner, "OwnerHelper: caller is not owner");
		_;
  	}

  	constructor() {
            _owner = msg.sender;
  	}

    function owner() public view virtual returns (address) {
           return _owner;
       }

  	function transferOwnership(address newOwner) onlyOwner public {
            require(newOwner != _owner);
            require(newOwner != address(0x0));
            address preOwner = _owner;
    	    _owner = newOwner;
    	    emit OwnershipTransferred(preOwner, newOwner);
  	}
}

contract SimpleToken is ERC20Interface, OwnerHelper {
    using SafeMath for uint256;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) public _allowances;

    uint256 public _totalSupply;
    string public _name;
    string public _symbol;
    uint8 public _decimals;
    bool public _tokenLock; // 토큰의 전체 락에 대한 처리
    mapping (address => bool) public _personalTokenLock;

    constructor(string memory getName, string memory getSymbol) {
        _name = getName;
        _symbol = getSymbol;
        _decimals = 18;
        _totalSupply = 100000000e18;
        _balances[msg.sender] = _totalSupply;
        _tokenLock = true;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view virtual override returns (uint256) {
        return _balances[account];
    }

    // 검사 추가, 보내는 사람과 받는 사람 중 락이 걸려있다면 토큰은 이동이 불가능
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(isTokenLock(sender, recipient) == false, "TokenLock: invalid token transfer");
        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balances[sender] = senderBalance.sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
    }

    // 전체 락과, 보내는 사람의 락, 받는 사람의 락을 검사하여 락이 걸려 있는지 확인
    function isTokenLock(address from, address to) public view returns (bool lock) {
        lock = false;

        if(_tokenLock == true)
        {
             lock = true;
        }

        if(_personalTokenLock[from] == true || _personalTokenLock[to] == true) {
             lock = true;
        }
    }

    // 다음의 코드에서 함수로 전달되는 파라미터 브라켓 뒤에 오는 onlyOwner가 예시입니다.
    function removeTokenLock() onlyOwner public {
        require(_tokenLock == true);
        _tokenLock = false;
    }

    // 다음의 코드에서 함수로 전달되는 파라미터 브라켓 뒤에 오는 onlyOwner가 예시입니다.
    function removePersonalTokenLock(address _who) onlyOwner public {
        require(_personalTokenLock[_who] == true);
        _personalTokenLock[_who] = false;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        emit Transfer(msg.sender, sender, recipient, amount);
        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, msg.sender, currentAllowance, currentAllowance - amount);
        return true;
    }

    function _approve(address owner, address spender, uint256 currentAmount, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        require(currentAmount == _allowances[owner][spender], "ERC20: invalid currentAmount");
        _allowances[owner][spender] = amount;  
        emit Approval(owner, spender, currentAmount, amount);
    }

    function transfer(address recipient, uint amount) public virtual override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external virtual override returns (bool) {
        uint256 currentAllowance = _allowances[msg.sender][spender];  
        require(_balances[msg.sender] >= amount,"ERC20: The amount to be transferred exceeds the amount of tokens held by the owner.");
        // 내부 함수인 _approve를 호출
        _approve(msg.sender, spender, currentAllowance, amount);
        return true;
    }

    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }
}