// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// Interface는 사용할 함수의 형태를 선언
//  실제 함수의 내용은 Contract에서 사용
interface ERC20Interface {
    // ERC-20에서 사용하는 함수들의 형태를 선언
    // function (<parameter types>) {internal | external | public | private} [pure | constant | view | payable] [(modifiers)] [returns (<return types>)]
    // parameter types 함수에서 받아올 매개변수를 타입과 함께 선언
    /* 
    Visibility Keyword (internal, external, public, private)
        internal
            internal은 Smart contract의 interface로 비공개한다
            계약서(Contract)의 해당 내용을 비공개한다는 의미
            계약서의 내부에서만 사용하는 함수
            상태변수(state variable)는 internal이 기본값
            아무것도 적용하지 않았다면 자동적으로 internal
            계약서 자신과 상속받은 계약서만 사용 할 수 있다.
        external
            Smart contract의 interface로 공개한다 
            계약서(Contract)의 해당 내용을 공개한다는 의미
            계약서의 외부에서 사용하는 함수라는 것을 표시
            상태변수(state variable)는 external일수 없다.
            계약서 내부에서 사용할 경우 this를 사용해서 접근해야 한다.
        public
            공개함수
            공개 기능은 계약 인터페이스의 일부이며 내부적으로 또는 메시지를 통해 호출할 수 있다.
            공개 상태 변수의 경우 자동 getter 함수가 생성된다.
        private
            비공개함수
            계약서 내부에서도 자신만 사용하는 함수라는것을 표시
            상태변수와 함수 모두 파생된 계약이 아닌 정의된 계약에서만 볼 수 있다.
    */
    /* 
    함수의 동작 관련
        pure
            storage에서 변수를 읽어오거나 쓰지 않는 함수임을 명시
        constant, view
             상태를 변경하지 않는 함수임을 명시
        payable
            입금을 받을 수 있는 함수임을 명시
    */
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address spender, address recipient, uint256 amount) external returns (bool);

    // event : 이더리움에서 제공하는 로그
    // transfer : 토큰이 이동할 때마다 로그 남기기
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Transfer(address indexed spender, address indexed from, address indexed to, uint256 amount);
    // approve 함수가 실행 될 때 로그 남기기
    event Approval(address indexed owner, address indexed spender, uint256 oldAmount, uint256 amount);
}

// SimpleToken 컨트랙트가 ERC20Interface 함수를 사용할 수 있다고 선언
// SimpleToken 안에서 ERC20Interface에 선언된 함수와 이벤트를 사용할 수 있다.
/* 
ERC-20에서는 토큰의 owner가 직접 토큰을 다른 사람에게 전송할 수도 있지만, 토큰을 양도할 만큼 등록해두고, 필요할 때 제삼자를 통해 토큰을 양도할 수 있다.
직접 토큰을 다른 사람에게 전송할 때는 transfer 함수를 사용하고, 토큰을 등록하는 방식을 사용하는 경우, approve, allowance, transferFrom 함수를 사용한다.
*/
contract SimpleToken is ERC20Interface {
    /* 
    KEY : OWNER의 address
    VALUE : ( KEY : SPENDER의 address , VALUE : 맡겨둔 TOKEN의 개
    */
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
        _totalSupply = 100000000 * E18; // 토큰 잔액 적용
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

    // 해당 스마트 컨트랙트 기반 ERC-20 토큰의 총 발행량 확인
    function totalSupply() external view virtual override returns (uint256) {
        return _totalSupply;
    }
    // owner가 가지고 있는 토큰의 보유량 확인
    // 매핑된 값인 _balanceOf에서 입력한 address인 account가 가지고있는 토큰의 수를 리턴
    function balanceOf(address account) external view virtual override returns (uint256) {
        return _balances[account];
    }

    // 토큰을 전송
    // 내부 함수인 _transfer를 호출합니다. 호출이 정상적으로 완료되었을 경우 Transfer event를 발생시킨다.
    function transfer(address recipient, uint amount) public virtual override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // owner가 spender에게 양도 설정한 토큰의 양을 확인
    // OWNER와 EXCHANGE값을 입력 해서 몇개가 등록 되어있는지 확인 할 수 있다.
    // 입력한 두개의 주소값에 대한 _allowances값, 다시말해 owner가 spender에게 토큰을 등록한 양을 반환
    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    // spender 에게 value 만큼의 토큰을 인출할 권리를 부여. 이 함수를 이용할 때는 반드시 Approval 이벤트 함수를 호출해야 함
    // 지갑의 주인이 토큰을 EXCHANGE에 자신이 가진 토큰의 수보다 적은 수량을 거래 가능 하도록 맡길 수 있
    // spender 가 당신의 계정으로부터 amount 한도 하에서 여러 번 출금하는 것을 허용한다.
    // 여러번 호출하면 단순히 허용량을 amount로 재설정한다.
    function approve(address spender, uint amount) external virtual override returns (bool) {
        uint256 currentAllowance = _allowances[msg.sender][spender];  
        require(_balances[msg.sender] >= amount,"ERC20: The amount to be transferred exceeds the amount of tokens held by the owner.");
        // 내부 함수인 _approve를 호출
        _approve(msg.sender, spender, currentAllowance, amount);
        return true;
    }

    // spender가 거래 가능하도록 양도 받은 토큰을 전송
    // EXCHANGE가 BUYER가 구매 신청해놓은 금액에 대해 OWNER가 맡겨둔 토큰을 판매한다.
    // 양도를 수행하는 거래 대행자(msg.sender)가 sender가 허락해준 값만큼 상대방(recipient)에게 토큰을 이동
    function transferFrom(address sender, address recipient, uint256 amount) external virtual override returns (bool) {
        // 이동을 위해 _transfer 함수를 실행
        // 양도를 하는 sender의 잔고를 amount만큼 줄이고, recipient의 잔고를 amount만큼 늘린다.
        _transfer(sender, recipient, amount);
        emit Transfer(msg.sender, sender, recipient, amount);
        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        // _transfer함수 실행이 완료되고, require를 모두 통과한다면 currentAllowance를 체크하여 _approve 함수를 실행
        _approve(sender, msg.sender, currentAllowance, currentAllowance - amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        // 보내는 사람의 주소가 잘못되었는지 체크
        require(sender != address(0), "ERC20: transfer from the zero address");
        // 받는 사람의 주소가 잘못되었는지 체크
        require(recipient != address(0), "ERC20: transfer to the zero address");
        uint256 senderBalance = _balances[sender];
        // transfer 함수를 실행한 사람(sender)이 가진 토큰(senderBalance)이 신청한 값(amount)보다 많은 토큰을 가지고 있는지 체크
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        // 세 조건을 충족하는 경우, 실행한 사람(sender)이 가진 토큰의 지갑에서 토큰을 개수만큼 빼고, 받을 사람(recipient)의 토큰 지갑에 개수만큼 더해준다.
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;
    }

    function _approve(address owner, address spender, uint256 currentAmount, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        require(currentAmount == _allowances[owner][spender], "ERC20: invalid currentAmount");
        // _approve에서는 내가 토큰을 양도할 상대방(spender)에게 양도할 값(amount)를 allowances에 기록한다.
        _allowances[owner][spender] = amount;  
        emit Approval(owner, spender, currentAmount, amount);
    }
}