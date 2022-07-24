// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
 
 contract SimpleStorage{
     string  public a;   
     function setter(string memory b) public {
         a=b;
     } 
     function getter() public view returns(string memory){
         return a;
     }
 }
