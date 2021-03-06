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

// 기존 simple token에서 safeMath 라이브러리 추가
library SafeMath {
    // internal은 함수가 컨트랙트 내부에서만 사용될 수 있도록 제한
    // pure 는 함수가 상태 변수를 읽거나 쓰지 않을 때 사용
  	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
		uint256 c = a * b;
        // false를 리턴하지만 계약을 실행 시키기 전에 확인을 할 수 없다.
        // require는 계약을 실행 시키기 전에 확인을 할 수 있다.
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

contract SimpleToken is ERC20Interface {

    // 자료형 uint256에 대해서 SafeMath 라이브러리를 사용하도록 선언
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) public _allowances;

    uint256 public _totalSupply;
    string public _name;
    string public _symbol;
    uint8 public _decimals;
    uint private E18 = 1000000000000000000;

    constructor(string memory getName, string memory getSymbol) {
        _name = getName;
        _symbol = getSymbol;
        _decimals = 18;
        _totalSupply = 100000000 * E18;
        _balances[msg.sender] = _totalSupply; // 추가
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

    function transfer(address recipient, uint amount) public virtual override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint amount) external virtual override returns (bool) {
        uint256 currentAllowance = _allowances[msg.sender][spender];  
        require(_balances[msg.sender] >= amount,"ERC20: The amount to be transferred exceeds the amount of tokens held by the owner.");
        _approve(msg.sender, spender, currentAllowance, amount);
        return true;
    }

    //연산자(+, -)를 SafeMath 라이브러리 함수를 사용해 안전한 연산자로 변경할 수 있다.
   function transferFrom(address sender, address recipient, uint256 amount) external virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        emit Transfer(msg.sender, sender, recipient, amount);
        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        // 다음의 코드에서 currentAllowance.sub(amount)이 SafeMath 라이브러리 함수를 사용한 예시입니다.
        _approve(sender, msg.sender, currentAllowance, currentAllowance.sub(amount));
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balances[sender] = senderBalance.sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
    }

    function _approve(address owner, address spender, uint256 currentAmount, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        require(currentAmount == _allowances[owner][spender], "ERC20: invalid currentAmount");
        _allowances[owner][spender] = amount;  
        emit Approval(owner, spender, currentAmount, amount);
    }
}