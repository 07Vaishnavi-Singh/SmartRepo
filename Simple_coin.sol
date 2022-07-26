//SPDX License Identifier:MIT
pragma solidity ^0.8.0;
contract Coin{

address public minter;
mapping(address=>uint) public balance;
constructor(){
    minter=msg.sender;

} 
function  mint(address _receiver, uint _amount ) public {
   require(minter==msg.sender,"You are not the sender");
   require(_amount<1e60,"Amount enetered is not valid");
   balance[_receiver]+=_amount;

}


function send(address receiver,uint amount) public {
    require(amount<=balance[msg.sender],"Insufficuent balance ");
balance[msg.sender]-=amount;
balance[receiver]+=amount;
}



}
