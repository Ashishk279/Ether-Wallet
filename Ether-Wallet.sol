// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <=0.8.20;

contract MultiAddressPayment{
    // Function to send ethers to multiple address
    address owner;
    address payable[] public recipients;

    event TransferReceived(address _from, uint[] _amount);
    constructor(address payable[] memory _recipients){
        owner = msg.sender;
        for(uint i = 0; i < _recipients.length; i++){
            recipients.push(_recipients[i]);
        }
    }

    function deposite() external payable onlyOwner{}

    function sendEther( uint256[] memory _amounts) external payable onlyOwner{
        for (uint256 i = 0; i < recipients.length; i++){
            recipients[i].transfer(_amounts[i]);
        }
        emit TransferReceived(msg.sender, _amounts);
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner will send the ether.");
        _;
    }
    

    // When Put the addresses in the constructor use this 
    // ["0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"]
    // ["0x617F2E2fD72FD9D5503197092aC168c91465E7f2","0x17F6AD8Ef982297579C203069C1DbfFE4348c372","0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678"]
    
}
