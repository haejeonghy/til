//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// contract MyNFTs is ERC721 {
//     constructor() public ERC721("MyNFT", "NFT") {}
// }

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    // 라이브러리 Counters 를 이용해 변수 토큰의 ID(_tokenIds)를 관리
    // 하나의 토큰 id는 유니크해야 한다.
    Counters.Counter private _tokenIds; 
    
    // 컨트랙트 이름 변경
    constructor() public ERC721("MyNFTs", "NFT") {}

    // 컨트랙트 Ownable 에 포함된 onlyOwner를 통해, 함수를 실행한 지갑의 주소와 오너의 주소가 같은지 검사
    // 함수를 실행한 지갑의 주소와 오너의 주소가 같다면, 함수를 정상적으로 실행한다.
    // NFT를 생성할 때, 파라미터 tokenURI 를 전달한다.
    // tokenURI 는 NFT에 적용할 정보를 담고 있는 json 객체의 엔드포인트
    // tokenURI 에 접근하면 NFT의 규칙에 맞는 json 객체를 불러올 수 있어야 한다.
    /*
    tokenURI 스키마

    {
        "title": "Asset Metadata",
        "type": "object",
        "properties": {
            "name": {
                "type": "string",
                "description": "Identifies the asset to which this NFT represents"
            },
            "description": {
                "type": "string",
                "description": "Describes the asset to which this NFT represents"
            },
            "image": {
                "type": "string",
                "description": "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
            }
        }
    }   

    {
        "name": "name #1", // NFT의 이름
        "description": "description", // NFT에 대한 설명
        "image": "imageUri", // image URI
        "attributes": [ // 개발자가 사용하려고 넣어둔 메타데이터
            {
                "trait_type": "Background",
                "value": "White"
            }
        ]
    }
    // 테스트를 위해, 새로운 JSON 메타데이터를 생성
    // json 파일을 아마존 s3 버킷에 업로드
    // 이 s3 버킷에 위치한 json 파일의 uri를 복사한 다음, Remix의 배포 탭에서 mintNFT 를 실행
    // 주소는 컨트랙트의 오너 지갑 주소를 입력
    {
        "name": "Codestates #1",
        "description": "Deep dive into Blockchain Engineering Bootcamp!",
        "image": "https://urclass-images.s3.ap-northeast-2.amazonaws.com/beb/section4/unit4/Gray.png",
        "attributes": [
            {
            "trait_type": "Power",
            "value": "Max"
            }
        ]
    }
    
     */

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}