
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0 ;

contract Lottery{

    address  public manager; // for storing manager's  address
    address payable[] public players; // for storing players addresses

   

constructor(){
  manager=msg.sender; // only manager in charge can call the contract
}

function repeater() public view returns(bool) {  

  for(uint i =0;i<players.length;i++){
  
if (msg.sender ==players[i]){
return false ;
}
 }
 return true;
}
  function participate() public payable {

 require(msg.sender!=manager,"Manager cannot enter ");
 require(repeater(),"You cannot reparticipate "); 
 require(msg.value>= 1 ether,"Minimum 1 ether should be paid");

    } 

    function randNumber() public view returns(uint){
   
uint rand= uint(sha256(abi.encodePacked(block.difficulty,block.number,players))); // random number generation 
  uint  n=rand%(players.length);//  a random number under length of array 
return n;

    }


function displayWinner() public payable returns(address ){
    require(msg.sender==manager);
 address contractAddress=address(this); // gives the address of the current contract 
  players[randNumber()].transfer(contractAddress.balance); 
  return contractAddress;

}



}
