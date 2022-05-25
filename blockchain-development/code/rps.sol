//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*

두 명의 플레이어가 가위바위보 게임을 진행하고, 이긴 경우 두 참여자의 베팅 금액을 모두 가져간다. 
1. 방장(originator)가 createRoom을 호출한다.
- 방장은 인자로 자신이 낼 가위/바위/보 값과 베팅 금액을 넘겨준다.
- createRoom은 새로운 방을 만들고, 방의 번호를 리턴한다.
2. 참가자(taker)는 joinRoom을 호출한다.
- 참가자는 인자로 참여할 방 번호, 자신이 낼 가위/바위/보 값과 베팅 금액을 넘겨준다.
- joinRoom은 참가자를 방에 참여시킨다.
- joinRoom은 방장과 참가자의 가위/바위/보 값을 확인하고 해당 방의 승자를 설정한다.
3. 방장 또는 참가자가 payout 함수를 호출한다.
- 인자로 게임을 끝낼 방 번호를 넘겨준다.
- 게임의 결과에 따라 베팅 금액을 송금한다.

컨트랙트에 있는 금액을 송금하기 위해서는 솔리디티에 내장되어 있는 transfer 함수를 사용한다.
ADDRESS.transfer(value)  // ADDRESS로 value 만큼 송금한다.
*/
contract RPS {
    
    //해당 컨트랙트가 송금을 진행하기 위해 생성자 함수에 payable 키워드를 사용해 송금이 가능하다는 것을 명시
    constructor () payable {}
    
    /*
    event GameCreated(address originator, uint256 originator_bet);
    event GameJoined(address originator, address taker, uint256 originator_bet, uint256 taker_bet);
    event OriginatorWin(address originator, address taker, uint256 betAmount);
    event TakerWin(address originator, address taker, uint256 betAmount);
   */
   
   // 가위바위보 값에 대한 enum 이외의 경우 열외
   // enum Hands의 각 값은 순서에 따라 0부터 숫자가 매겨진다.
   // 0, 1, 2
    enum Hand {
        rock, paper, scissors 
    }
    
    // 플레이어의 이김, 짐, 비김, 대기중 상태
    enum PlayerStatus{
        STATUS_WIN, STATUS_LOSE, STATUS_TIE, STATUS_PENDING
    }
    
    // 게임의 상태
    // 시작 안함, 시작함, 끝남, 에러
    enum GameStatus {
        STATUS_NOT_STARTED, STATUS_STARTED, STATUS_COMPLETE, STATUS_ERROR
    }
    
    // player structure
    struct Player {
        Hand hand;
        address payable addr; // 주소
        PlayerStatus playerStatus; // 사용자의 현 상태
        uint256 playerBetAmount; // 베팅 금액
    }
    
    // 게임 구조체
    struct Game {
        uint256 betAmount; // 총 배팅 금액
        GameStatus gameStatus; // 게임의 현 상태
        Player originator; // 방장 정보
        Player taker; // 참여자 정보
    }
    
    // rooms[0], rooms[1] 형식으로 접근할 수 있으며, 각 요소는 Game 구조체 형식
    mapping(uint => Game) rooms; 
    // rooms의 키 값, 방이 생성될 때마다 1씩 올라간다.
    uint roomLen = 0;
    
    // 실행되기 전에는 방장이 낸 가위/바위/보 값이 올바른 값인지 확인해야 한다.
    modifier isValidHand (Hand _hand) {
        require((_hand  == Hand.rock) || (_hand  == Hand.paper) || (_hand == Hand.scissors));
        _;
    }
    
    // payout 을 실행하기 전 해당 함수를 실행하는 주체가 방장 또는 참가자인지 확인하는 함수 제어자
    //  방 번호와 함수를 호출한 사용자의 주소를 받는다.
    // 사용자의 주소가 방장 또는 참가자의 주소와 일치하는 지 확인한다.
    modifier isPlayer (uint roomNum, address sender) {
        require(sender == rooms[roomNum].originator.addr || sender == rooms[roomNum].taker.addr);
        _;
    }
    
    // 가위바위보 게임을 하기 위한 방을 만든다.
    // 방장은 자신이 낼 값을 인자로 보내고 배팅 금액은 msg.value로 설정한다.
    // msg는 솔리디티에 정의된 글로벌 변수
    // msg.value 함수를 사용할 떄 입력받지만 함수 내에서는 파라미터로 설정할 필요가 없다.
    // 베팅금액을 설정하기 때문에 payable 키워드를 사용
    // 게임을 만들고 나면, 해당 게임의 방 번호를 반환
    function createRoom (Hand _hand) public payable isValidHand(_hand) returns (uint roomNum) {
        // Game 구조체의 인스턴스 생성
        rooms[roomLen] = Game({
            betAmount: msg.value, // 방장만 있기 때문에 방장의 베팅 금액을 넣는다.
            gameStatus: GameStatus.STATUS_NOT_STARTED, // 작하지 않은 상태이기 때문에 GameStatus.STATUS_NOT_STARTED 값을 넣는다.
            originator: Player({ // Player 구조체의 인스턴스를 만들어, 방장의 정보를 넣어준다.
                hand: _hand,
                addr: payable(msg.sender),
                playerStatus: PlayerStatus.STATUS_PENDING,
                playerBetAmount: msg.value
            }),
            taker: Player({ // Player 구조체 형식의 데이터로 초기화되어야 하기 때문에 addr에는 방장의 주소를, hand는 Hand.rock으로 할당한다.
                hand: Hand.rock,
                addr: payable(msg.sender),  
                playerStatus: PlayerStatus.STATUS_PENDING,
                playerBetAmount: 0
            })
        });
        roomNum = roomLen;
        roomLen = roomLen+1; // 다음에 만들어질 게임을 위해 roomLen의 값을 1 올려준다.
        
        
       // Emit gameCreated(msg.sender, msg.value);
    }
    
    // 만들어진 방에 참가한다.
    // 참가자는 참가할 방 번호와 자신이 낼 가위/바위/보 값을 인자로 보내고, 베팅 금액은 msg.value로 설정한다.
    function joinRoom(uint roomNum, Hand _hand) public payable isValidHand( _hand) {
       // Emit gameJoined(game.originator.addr, msg.sender, game.betAmount, msg.value);
        
        rooms[roomNum].taker = Player({
            hand: _hand,
            addr: payable(msg.sender),
            playerStatus: PlayerStatus.STATUS_PENDING,
            playerBetAmount: msg.value // 참가자가 참여하면서 게임의 베팅 금액이 추가되었기 때문에, Game 인스턴스의 betAmount 역시 변경한다.
        });
        rooms[roomNum].betAmount = rooms[roomNum].betAmount + msg.value;
        compareHands(roomNum); // 게임 결과 업데이트 함수 호출
    }
    
    // 게임을 마찬다. 게임의 결과에 따라 베팅 금액을 송금
    function payout(uint roomNum) public payable isPlayer(roomNum, msg.sender) {
        if (rooms[roomNum].originator.playerStatus == PlayerStatus.STATUS_TIE && rooms[roomNum].taker.playerStatus == PlayerStatus.STATUS_TIE) {
            rooms[roomNum].originator.addr.transfer(rooms[roomNum].originator.playerBetAmount);
            rooms[roomNum].taker.addr.transfer(rooms[roomNum].taker.playerBetAmount);
        } else {
            if (rooms[roomNum].originator.playerStatus == PlayerStatus.STATUS_WIN) {
                rooms[roomNum].originator.addr.transfer(rooms[roomNum].betAmount);
            } else if (rooms[roomNum].taker.playerStatus == PlayerStatus.STATUS_WIN) {
                rooms[roomNum].taker.addr.transfer(rooms[roomNum].betAmount);
            } else {
                rooms[roomNum].originator.addr.transfer(rooms[roomNum].originator.playerBetAmount);
                rooms[roomNum].taker.addr.transfer(rooms[roomNum].taker.playerBetAmount);
            }
        }
         rooms[roomNum].gameStatus = GameStatus.STATUS_COMPLETE; // 게임이 종료되었으므로 게임 상태 변경
    }
    
    // 게임 결과를 업데이트한다.
    // joinRoom 함수가 끝나는 시점에서, 방장과 참가자가 모두 가위바위보 값을 냈기 때문에 게임의 승패를 확인할 수 있다.
    // 게임의 결과에 따라 게임의 상태와 참여자들의 상태를 업데이트하는 함수 
    // 게임의 결과는 joinRoom이 완료된 시점에서 확인할 수 있기 때문에 joinRoom 함수의 맨 마지막에 compareHands 함수를 호출한다.
    function compareHands(uint roomNum) private{
        uint8 originator = uint8(rooms[roomNum].originator.hand);
        uint8 taker = uint8(rooms[roomNum].taker.hand);
        
        // 게임을 본격적으로 비교하기 때문에, 게임의 상태를 GameStatus.STATUS_STARTED로 변경한다.
        rooms[roomNum].gameStatus = GameStatus.STATUS_STARTED;
        
        // 가위바위보 값에 따라, 방장과 참가자의 playerStatus를 설정
        if (taker == originator){ //draw 비긴 경우
            rooms[roomNum].originator.playerStatus = PlayerStatus.STATUS_TIE;
            rooms[roomNum].taker.playerStatus = PlayerStatus.STATUS_TIE;
            
        }
        else if ((taker +1) % 3 == originator) { // originator wins 방장이 이긴 경우
            rooms[roomNum].originator.playerStatus = PlayerStatus.STATUS_WIN;
            rooms[roomNum].taker.playerStatus = PlayerStatus.STATUS_LOSE;
        }
        else if ((originator + 1)%3 == taker){ // 참가자가 이긴 경우
            rooms[roomNum].originator.playerStatus = PlayerStatus.STATUS_LOSE;
            rooms[roomNum].taker.playerStatus = PlayerStatus.STATUS_WIN;
        } else {
            rooms[roomNum].gameStatus = GameStatus.STATUS_ERROR;
        }
       
    }
}