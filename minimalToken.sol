// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Mytoken is ERC20, Ownable(msg.sender) {
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) payable {
        _mint(msg.sender, initialSupply);
    }
    
    function releaseToken(address _to, uint256 _amount) public onlyOwner {
        _transfer(owner(), _to, _amount);
    }

    function transfer(address _to, uint256 _amount) public override returns (bool){
    require(balanceOf(msg.sender) >= _amount, "Insufficient balance bro");
    _transfer(msg.sender, _to, _amount);    
    //transfer function takes care of updating the balance too
    return true; 
    
 }

}









/*
//SPDX-LICENSE-IDENTIFIER: MIT
pragma solidity ^0.8.7;

contract AdisToken {
//to store the address of the token holder and the balances we will need a mapping 
mapping(address => uint256) public balance;
uint256 public totalSupply;

constructor(){
totalSupply = 11000; //Initializing the variables via the constructor, simple classic way and 11 because that is my date of birth :) 
balance[msg.sender] = totalSupply; //Assigning all the tokens to the person who deploys the contract 
}

//Now we will create a transfers function for the deduction and the addition on both the sides 

function transfer(address _to, uint256 _amount) external{
require(balance[msg.sender] >= _amount, "Insufficient balance bro");
balance[msg.sender] = balance[msg.sender]- _amount;
balance[_to] = balance[_to] + _amount;
}
} */


