# OpenSea

* 미술(Art), 음악(Music), 도메인 이름(Domain Names), 가상 세계(Virtual Worlds), 트레이딩 카드(Trading Cards) 등 다양한 형태의 NFT가 거래되고 있다.
* 대표적인 카테고리는 미술(Art)
* 하나하나의 콜렉션이 전부 하나의 스마트 컨트랙트로 구성
* ERC-721에서 스마트 컨트랙트의 이름과 심볼을 설정할 수 있다.
  * 이름은 콜렉션의 이름이, 이 심볼은 콜렉션의 심볼이 된다.
* 오픈씨에서는 스마트 컨트랙트의 오너를, 콜렉션의 오너로 자동으로 등록한다.
  * 스마트 컨트랙트의 오너 지갑으로 오픈씨에 로그인하면, 자신의 콜렉션을 수정할 수 있다.
* 오픈씨에서는 이더리움(ETH) 또는 폴리곤(MATIC) 기반의 콜렉션 생성을 지원
* 오픈씨는 이더리움 기반으로 시작된 마켓 앱
  * 오픈씨는 이더리움을 포크해 만들어진 클레이튼도 지원
* 오픈씨에서 제공하는 이더리움과 직접적으로 소통할 수 없다.
  * 클레이튼 기반의 스마트 컨트랙트를 개발하면, 오픈씨에서도 확인할 수 있다.
  * 오너 설정을 한다면, 위 그림처럼 설명이나 SNS 정보를 자유롭게 관리할 수 있다.
* 결제와 경매를 위해 Wrapped Coin을 사용
* ETH는 WETH, KLAY는 WKLAY의 형태로 같은 가치를 지닌 토큰을 생성해 거래
* 클레이튼과 이더리움, 폴리곤은 각각 별도의 체인
  * 서로 다른 네트워크이기 때문에 각각의 네트워크에서 생성된 NFT는 각각의 네트워크 안에서만 거래할 수 있다.
    * 클레이튼 기반의 NFT는 반드시 클레이튼 지갑(카이카스)으로만 거래할 수 있다.
  * 폴리곤 기반의 NFT는 폴리곤 네트워크에서 사용할 수 있다.
    * 폴리곤(MATIC)은 이더리움 체인에도 존재하고 있다.
    * 이더리움 네트워크의 폴리곤을 사용하면, 거래 수수료를 이더리움으로 납부한다.
      * 이더리움은 수수료가 상대적으로 비싸다.
      * 오픈씨에서 폴리곤으로 거래를 할 때에는, 항상 메타마스크의 네트워크를 폴리곤 네트워크로 변경해야 한다.
* MATIC Network 설정
  * 네트워크 이름(Network Name) : Matic Mainnet
  * NEW RPC URL(NewRPCURL) :https://rpc-mainnet.matic.network
  * ChainID : 137
  * Symbol : MATIC
  * 익스플로러 URL 차단 : https://explorer.matic.network
* 오리지널 컬렉션 선택하고 NFT 구매 가능
* 오픈씨에서 NFT 구매하기
  * OpenSea에 로그인합니다. Kaikas 지갑을 통해서 로그인할 수 있다.
  * 구매하려는 프로젝트를 검색하고, Buy Now 를 선택한다.
  * 나타나는 팝업의 체크박스를 통해 규칙에 동의하고, 다음 화면에서 버튼을 누른 후 실행되는 지갑의 팝업창에서, 디지털 서명을 승인
  * WKLAY가 없다면 오픈씨에서 거래할 때 사용하는 WKLAY(Wrapped Klay)로, 거래에 필요한 만큼의 클레이튼을 환전
  * 디지털 서명을 통해 거래를 승인
  * account로 이동하면, 구매한 NFT를 확인할 수 있다.
* 오픈씨에서 NFT 판매하기
  * account에서 판매하려는 NFT를 클릭하고, NFT 상세 페이지의 우측 상단에 위치한 Sell 버튼 클릭
  * 판매하려는 가격을 입력하고, Complete Listing 버튼을 누른다. 이렇게 판매를 등록하는 과정을 리스팅이라고 표현한다.
  * 나타나는 팝업의 순서에서 디지털 서명을 진행하여 NFT의 소유권을 증명한다.

## NFT 발행

1. 로컬환경 또는 웹 클라이언트 등을 이용하여 NFT 발행 트랜잭션을 컨트랙트에 전달
2. 트랜잭션을 실행하며, 컨트랙트에 기재된 tokenURI와 발행될 tokenId 에 따라 Heroku에 저장된 토큰의 메타데이터를 NFT에 기록
3. OpenSea에서 연결된 지갑과 이더리움 네트워크에 주기적으로 RPC 콜을 보내어 새롭게 생성된 NFT 컨트랙트 또는 NFT에 대한 데이터를 수집합니다. (daemon을 이용해 주기적으로 이더리움 네트워크에서 ERC-721, ERC-1155 컨트랙트를 조회합니다.)
4. 새롭게 발행된 NFT의 메타데이터를 수집하기 위해 이더리움 네트워크에 RPC 콜을 보냅니다.
5. NFT에 기록된 데이터를 서버가 수집합니다.
6. NFT에 기록된 메타데이터를 기반으로 Heroku로 데이터를 요청하여 JSON 데이터와 이미지 등을 수집합니다.
7. 불러온 데이터와 이미지 등을 데이터베이스에 저장합니다.
8. 데이터베이스에 저장된 데이터를 기반으로 웹 사이트에 보여줍니다.

## opensea smart contract

* code/web3-practice 참조

```js
pragma solidity ^0.5.0;

import "./ERC721Tradable.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title Creature
 * Creature - a contract for my non-fungible creatures.
 */
// open zeppelin erc-721 계약 상속
contract Creature is TradeableERC721Token {
  constructor(address _proxyRegistryAddress) TradeableERC721Token("Creature", "OSC", _proxyRegistryAddress) public {  }

  function baseTokenURI() public view returns (string memory) {
    return "https://opensea-creatures-api.herokuapp.com/api/creature/";
  }
}
```
```json
// tokenURIuri
// nft가 어떤 내용을 보여줄지에 대한 내용
{
  "name": "Herbie Starbelly",
  "description": "Friendly OpenSea Creature that enjoys long swims in the ocean.",
  "image": "https://storage.googleapis.com/opensea-prod.appspot.com/creature/50.png",
  "attributes": [...]
}
```
```js
// 계약에서 메타데이터를 찾을 수 있는 URI 반환
function tokenURI(uint256 _tokenId) public view returns (string) {
    return Strings.strConcat(
        baseTokenURI(),
        Strings.uint2str(_tokenId)
    );
  }
```
```js
//ERCLootBox.sol
// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title ERCLootBox
 *
 * ERCLootBox - a tradeable loot box of ERC.
 */
contract ERCLootBox is ERC20 {
    address factoryAddress;
    // new erclootbox 선언
    // address 값 받아와서 저장 가능
    constructor(address _factoryAddress) 
	  ERC20("ERCLootBox", "ELB")
    {
        factoryAddress = _factoryAddress;
        _mint(msg.sender, 100000000e18);
    }
}
```
```js
 // SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ERCLootBox.sol";

contract ERCFactory is ERC20, Ownable {
    address public lootBoxERCAddress;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        lootBoxERCAddress = address(
            new ERCLootBox(address(this))
        );
    }
}
```
```js
//Creature.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";

/**
 * @title Creature
 * Creature - a contract for my non-fungible creatures.
 */
contract Creature is ERC721Tradable {
    constructor(address _proxyRegistryAddress)
        ERC721Tradable("Creature", "OSC", _proxyRegistryAddress)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://creatures-api.opensea.io/api/creature/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }
}
```
```js
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";
import "./Creature.sol";
import "./IFactoryERC721.sol";

/**
 * @title CreatureLootBox
 *
 * CreatureLootBox - a tradeable loot box of Creatures.
 */
contract CreatureLootBox is ERC721Tradable {
    uint256 NUM_CREATURES_PER_BOX = 3;
    uint256 OPTION_ID = 0;
    address factoryAddress;

    constructor(address _proxyRegistryAddress, address _factoryAddress)
        ERC721Tradable("CreatureLootBox", "LOOTBOX", _proxyRegistryAddress)
    {
        factoryAddress = _factoryAddress;
    }

    function unpack(uint256 _tokenId) public {
        require(ownerOf(_tokenId) == _msgSender());

        // Insert custom logic for configuring the item here.
        for (uint256 i = 0; i < NUM_CREATURES_PER_BOX; i++) {
            // Mint the ERC721 item(s).
            FactoryERC721 factory = FactoryERC721(factoryAddress);
            factory.mint(OPTION_ID, _msgSender());
        }

        // Burn the presale item.
        _burn(_tokenId);
    }

    function baseTokenURI() override public pure returns (string memory) {
        return "https://creatures-api.opensea.io/api/box/";
    }

    function itemsPerLootbox() public view returns (uint256) {
        return NUM_CREATURES_PER_BOX;
    }
}
```
```js
//CreatureFactory.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./IFactoryERC721.sol";
import "./Creature.sol";
import "./CreatureLootBox.sol";

contract CreatureFactory is FactoryERC721, Ownable {
    using Strings for string;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    address public proxyRegistryAddress;
    address public nftAddress;
    address public lootBoxNftAddress;
    string public baseURI = "https://creatures-api.opensea.io/api/factory/";

    /*
     * Enforce the existence of only 100 OpenSea creatures.
     */
    uint256 CREATURE_SUPPLY = 100;

    /*
     * Three different options for minting Creatures (basic, premium, and gold).
     */
    uint256 NUM_OPTIONS = 3;
    uint256 SINGLE_CREATURE_OPTION = 0;
    uint256 MULTIPLE_CREATURE_OPTION = 1;
    uint256 LOOTBOX_OPTION = 2;
    uint256 NUM_CREATURES_IN_MULTIPLE_CREATURE_OPTION = 4;

    constructor(address _proxyRegistryAddress, address _nftAddress) {
        proxyRegistryAddress = _proxyRegistryAddress;
        nftAddress = _nftAddress;
        lootBoxNftAddress = address(
            new CreatureLootBox(_proxyRegistryAddress, address(this))
        );

        fireTransferEvents(address(0), owner());
    }

    function name() override external pure returns (string memory) {
        return "OpenSeaCreature Item Sale";
    }

    function symbol() override external pure returns (string memory) {
        return "CPF";
    }

    function supportsFactoryInterface() override public pure returns (bool) {
        return true;
    }

    function numOptions() override public view returns (uint256) {
        return NUM_OPTIONS;
    }

    function transferOwnership(address newOwner) override public onlyOwner {
        address _prevOwner = owner();
        super.transferOwnership(newOwner);
        fireTransferEvents(_prevOwner, newOwner);
    }

    function fireTransferEvents(address _from, address _to) private {
        for (uint256 i = 0; i < NUM_OPTIONS; i++) {
            emit Transfer(_from, _to, i);
        }
    }

    function mint(uint256 _optionId, address _toAddress) override public {
        // Must be sent from the owner proxy or owner.
        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        assert(
            address(proxyRegistry.proxies(owner())) == _msgSender() ||
                owner() == _msgSender() ||
                _msgSender() == lootBoxNftAddress
        );
        require(canMint(_optionId));

        Creature openSeaCreature = Creature(nftAddress);
        if (_optionId == SINGLE_CREATURE_OPTION) {
            openSeaCreature.mintTo(_toAddress);
        } else if (_optionId == MULTIPLE_CREATURE_OPTION) {
            for (
                uint256 i = 0;
                i < NUM_CREATURES_IN_MULTIPLE_CREATURE_OPTION;
                i++
            ) {
                openSeaCreature.mintTo(_toAddress);
            }
        } else if (_optionId == LOOTBOX_OPTION) {
            CreatureLootBox openSeaCreatureLootBox = CreatureLootBox(
                lootBoxNftAddress
            );
            openSeaCreatureLootBox.mintTo(_toAddress);
        }
    }

    function canMint(uint256 _optionId) override public view returns (bool) {
        if (_optionId >= NUM_OPTIONS) {
            return false;
        }

        Creature openSeaCreature = Creature(nftAddress);
        uint256 creatureSupply = openSeaCreature.totalSupply();

        uint256 numItemsAllocated = 0;
        if (_optionId == SINGLE_CREATURE_OPTION) {
            numItemsAllocated = 1;
        } else if (_optionId == MULTIPLE_CREATURE_OPTION) {
            numItemsAllocated = NUM_CREATURES_IN_MULTIPLE_CREATURE_OPTION;
        } else if (_optionId == LOOTBOX_OPTION) {
            CreatureLootBox openSeaCreatureLootBox = CreatureLootBox(
                lootBoxNftAddress
            );
            numItemsAllocated = openSeaCreatureLootBox.itemsPerLootbox();
        }
        return creatureSupply < (CREATURE_SUPPLY - numItemsAllocated);
    }

    function tokenURI(uint256 _optionId) override external view returns (string memory) {
        return string(abi.encodePacked(baseURI, Strings.toString(_optionId)));
    }

    /**
     * Hack to get things to work automatically on OpenSea.
     * Use transferFrom so the frontend doesn't have to worry about different method names.
     */
    function transferFrom(
        address,
        address _to,
        uint256 _tokenId
    ) public {
        mint(_tokenId, _to);
    }

    /**
     * Hack to get things to work automatically on OpenSea.
     * Use isApprovedForAll so the frontend doesn't have to worry about different method names.
     */
    function isApprovedForAll(address _owner, address _operator)
        public
        view
        returns (bool)
    {
        if (owner() == _owner && _owner == _operator) {
            return true;
        }

        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        if (
            owner() == _owner &&
            address(proxyRegistry.proxies(_owner)) == _operator
        ) {
            return true;
        }

        return false;
    }

    /**
     * Hack to get things to work automatically on OpenSea.
     * Use isApprovedForAll so the frontend doesn't have to worry about different method names.
     */
    function ownerOf(uint256) public view returns (address _owner) {
        return owner();
    }
}
```
```js
//CreatureAccessory.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC1155Tradable.sol";

/**
 * @title CreatureAccessory
 * CreatureAccessory - a contract for Creature Accessory semi-fungible tokens.
 */
contract CreatureAccessory is ERC1155Tradable {
    constructor(address _proxyRegistryAddress)
        ERC1155Tradable(
            "OpenSea Creature Accessory",
            "OSCA",
            "https://creatures-api.opensea.io/api/accessory/{id}",
            _proxyRegistryAddress
        ) {}

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-erc1155";
    }
}
```
```js
//CreatureAccessoryLootBox.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./ERC1155Tradable.sol";
import "./LootBoxRandomness.sol";

/**
 * @title CreatureAccessoryLootBox
 * CreatureAccessoryLootBox - a randomized and openable lootbox of Creature
 * Accessories.
 */
contract CreatureAccessoryLootBox is ERC1155Tradable, ReentrancyGuard {
  using LootBoxRandomness for LootBoxRandomness.LootBoxRandomnessState;
  using SafeMath for uint256;

  LootBoxRandomness.LootBoxRandomnessState state;

  /**
   * @dev Example constructor. Sets minimal configuration.
   * @param _proxyRegistryAddress The address of the OpenSea/Wyvern proxy registry
   *                              On Rinkeby: "0xf57b2c51ded3a29e6891aba85459d600256cf317"
   *                              On mainnet: "0xa5409ec958c83c3f309868babaca7c86dcb077c1"
   */
  constructor(address _proxyRegistryAddress)
  ERC1155Tradable(
    "OpenSea Creature Accessory Loot Box",
    "OSCALOOT",
    "",
    _proxyRegistryAddress
  ) {}

  function setState(
    address _factoryAddress,
    uint256 _numOptions,
    uint256 _numClasses,
    uint256 _seed
  ) public onlyOwner {
    LootBoxRandomness.initState(state, _factoryAddress, _numOptions, _numClasses, _seed);
  }

  function setTokenIdsForClass(
    uint256 _classId,
    uint256[] memory _tokenIds
  ) public onlyOwner {
      LootBoxRandomness.setTokenIdsForClass(state, _classId, _tokenIds);
  }

  function setOptionSettings(
    uint256 _option,
    uint256 _maxQuantityPerOpen,
    uint16[] memory _classProbabilities,
    uint16[] memory _guarantees
  ) public onlyOwner {
    LootBoxRandomness.setOptionSettings(state, _option, _maxQuantityPerOpen, _classProbabilities, _guarantees);
  }

  ///////
  // MAIN FUNCTIONS
  //////

  function unpack(
    uint256 _optionId,
    address _toAddress,
    uint256 _amount
  ) external {
    // This will underflow if _msgSender() does not own enough tokens.
    _burn(_msgSender(), _optionId, _amount);
    // Mint nfts contained by LootBox
    LootBoxRandomness._mint(state, _optionId, _toAddress, _amount, "", address(this));
  }

  /**
   *  @dev Mint the token/option id.
   */
  function mint(
    address _to,
    uint256 _optionId,
    uint256 _amount,
    bytes memory _data
  ) override public nonReentrant {
    require(_isOwnerOrProxy(_msgSender()), "Lootbox: owner or proxy only");
    require(_optionId < state.numOptions, "Lootbox: Invalid Option");
    // Option ID is used as a token ID here
    _mint(_to, _optionId, _amount, _data);
  }

  /**
   *  @dev track the number of tokens minted.
   */
  function _mint(
    address _to,
    uint256 _id,
    uint256 _quantity,
    bytes memory _data
  ) override internal  {
    tokenSupply[_id] = tokenSupply[_id].add(_quantity);
    super._mint(_to, _id, _quantity, _data);
  }

  function _isOwnerOrProxy(
    address _address
  ) internal view returns (bool) {
    ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
    return owner() == _address || address(proxyRegistry.proxies(owner())) == _address;
  }
}
```
```js
// CreatureAccessoryFactory.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./IFactoryERC1155.sol";
import "./ERC1155Tradable.sol";

/**
 * @title CreatureAccessoryFactory
 * CreatureAccessory - a factory contract for Creature Accessory semi-fungible
 * tokens.
 */
contract CreatureAccessoryFactory is FactoryERC1155, Ownable, ReentrancyGuard {
    using Strings for string;
    using SafeMath for uint256;

    address public proxyRegistryAddress;
    address public nftAddress;
    address public lootBoxAddress;
    string
        internal constant baseMetadataURI = "https://creatures-api.opensea.io/api/";
    uint256 constant UINT256_MAX = ~uint256(0);

    /*
     * Optionally set this to a small integer to enforce limited existence per option/token ID
     * (Otherwise rely on sell orders on OpenSea, which can only be made by the factory owner.)
     */
    uint256 constant SUPPLY_PER_TOKEN_ID = UINT256_MAX;

    // The number of creature accessories (not creature accessory rarity classes!)
    uint256 constant NUM_ITEM_OPTIONS = 6;

    /*
     * Three different options for minting CreatureAccessories (basic, premium, and gold).
     */
    uint256 public constant BASIC_LOOTBOX = NUM_ITEM_OPTIONS + 0;
    uint256 public constant PREMIUM_LOOTBOX = NUM_ITEM_OPTIONS + 1;
    uint256 public constant GOLD_LOOTBOX = NUM_ITEM_OPTIONS + 2;
    uint256 public constant NUM_LOOTBOX_OPTIONS = 3;

    uint256 public constant NUM_OPTIONS = NUM_ITEM_OPTIONS +
        NUM_LOOTBOX_OPTIONS;

    constructor(
        address _proxyRegistryAddress,
        address _nftAddress,
        address _lootBoxAddress
    ) {
        proxyRegistryAddress = _proxyRegistryAddress;
        nftAddress = _nftAddress;
        lootBoxAddress = _lootBoxAddress;
    }

    /////
    // FACTORY INTERFACE METHODS
    /////

    function name() override external pure returns (string memory) {
        return "OpenSea Creature Accessory Pre-Sale";
    }

    function symbol() override external pure returns (string memory) {
        return "OSCAP";
    }

    function supportsFactoryInterface() override external pure returns (bool) {
        return true;
    }

    function factorySchemaName() override external pure returns (string memory) {
        return "ERC1155";
    }

    function numOptions() override external pure returns (uint256) {
        return NUM_LOOTBOX_OPTIONS + NUM_ITEM_OPTIONS;
    }

    function uri(uint256 _optionId) override external pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    baseMetadataURI,
                    "factory/",
                    Strings.toString(_optionId)
                    )
                );
    }

    function canMint(uint256 _optionId, uint256 _amount)
        override
        external
        view
        returns (bool)
    {
        return _canMint(_msgSender(), _optionId, _amount);
    }

    function mint(
        uint256 _optionId,
        address _toAddress,
        uint256 _amount,
        bytes calldata _data
    ) override external nonReentrant() {
        return _mint(_optionId, _toAddress, _amount, _data);
    }

    /**
     * @dev Main minting logic implemented here!
     */
    function _mint(
        uint256 _option,
        address _toAddress,
        uint256 _amount,
        bytes memory _data
    ) internal {
        require(
            _canMint(_msgSender(), _option, _amount),
            "CreatureAccessoryFactory#_mint: CANNOT_MINT_MORE"
        );
        if (_option < NUM_ITEM_OPTIONS) {
            require(
                _isOwnerOrProxy(_msgSender()) || _msgSender() == lootBoxAddress,
                "Caller cannot mint accessories"
            );
            // Items are pre-mined (by the owner), so transfer them (We are an
            // operator for the owner).
            ERC1155Tradable items = ERC1155Tradable(nftAddress);
            // Option is used as a token ID here
            items.safeTransferFrom(
                owner(),
                _toAddress,
                _option,
                _amount,
                _data
            );
        } else if (_option < NUM_OPTIONS) {
            require(_isOwnerOrProxy(_msgSender()), "Caller cannot mint boxes");
            uint256 lootBoxOption = _option - NUM_ITEM_OPTIONS;
            // LootBoxes are not premined, so we need to create or mint them.
            // lootBoxOption is used as a token ID here.
            _createOrMint(
                lootBoxAddress,
                _toAddress,
                lootBoxOption,
                _amount,
                _data
            );
        } else {
            revert("Unknown _option");
        }
    }

    /*
     * Note: make sure code that calls this is non-reentrant.
     * Note: this is the token _id *within* the ERC1155 contract, not the option
     *       id from this contract.
     */
    function _createOrMint(
        address _erc1155Address,
        address _to,
        uint256 _id,
        uint256 _amount,
        bytes memory _data
    ) internal {
        ERC1155Tradable tradable = ERC1155Tradable(_erc1155Address);
        // Lazily create the token
        if (!tradable.exists(_id)) {
            tradable.create(_to, _id, _amount, "", _data);
        } else {
            tradable.mint(_to, _id, _amount, _data);
        }
    }

    /**
     * Get the factory's ownership of Option.
     * Should be the amount it can still mint.
     * NOTE: Called by `canMint`
     */
    function balanceOf(address _owner, uint256 _optionId)
        override
        public
        view
        returns (uint256)
    {
        if (_optionId < NUM_ITEM_OPTIONS) {
            if (!_isOwnerOrProxy(_owner) && _owner != lootBoxAddress) {
                // Only the factory's owner or owner's proxy,
                // or the lootbox can have supply
                return 0;
            }
            // The pre-minted balance belongs to the address that minted this contract
            ERC1155Tradable lootBox = ERC1155Tradable(nftAddress);
            // OptionId is used as a token ID here
            uint256 currentSupply = lootBox.balanceOf(owner(), _optionId);
            return currentSupply;
        } else {
            if (!_isOwnerOrProxy(_owner)) {
                // Only the factory owner or owner's proxy can have supply
                return 0;
            }
            // We explicitly calculate the token ID here
            uint256 tokenId = (_optionId - NUM_ITEM_OPTIONS);
            ERC1155Tradable lootBox = ERC1155Tradable(lootBoxAddress);
            uint256 currentSupply = lootBox.totalSupply(tokenId);
            // We can mint up to a balance of SUPPLY_PER_TOKEN_ID
            return SUPPLY_PER_TOKEN_ID.sub(currentSupply);
        }
    }

    function _canMint(
        address _fromAddress,
        uint256 _optionId,
        uint256 _amount
    ) internal view returns (bool) {
        return _amount > 0 && balanceOf(_fromAddress, _optionId) >= _amount;
    }

    function _isOwnerOrProxy(address _address) internal view returns (bool) {
        ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
        return
            owner() == _address ||
            address(proxyRegistry.proxies(owner())) == _address;
    }
}
```