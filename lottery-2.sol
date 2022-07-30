// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;

contract Lottery{

address manager;
address payable[] public participants;


constructor(){
    manager=msg.sender;// global variable that transfers address to manager 
}

receive() external payable {         // receive function runs only once 
    require(msg.sender!=manager,"Manager cannot participate ");
    require(msg.value==1 ether, "Minimum amount of stack can be 3 ether " );
    participants.push(payable(msg.sender));


}


function getbalance() public view returns(uint){
    require(msg.sender==manager);
    address myAddress =address(this);
    return myAddress.balance; 

}

function winner() public view returns(uint){
require(msg.sender==manager);
uint random=uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
return random ;

}

function finalWinner() public payable {
require(msg.sender==manager);
require ( participants.length > 3);
uint n= winner()%participants.length;
 address  payable winnerAddress= participants[n];
 winnerAddress.transfer(getbalance());
 participants=new address payable[](0);
 
}




}
