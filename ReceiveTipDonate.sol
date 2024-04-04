// SPDX-License-Identifier: MIT
//Contract for taking all funds that were passed to the receive function 
//and donating them to charity.
pragma solidity ^0.8.20;

contract Contract {
   address public owner;
   address public charity;
    constructor (address _charity){
        owner = msg.sender;
        charity = _charity;
    }

    receive () external payable{ } //This will let the owner receive some crypto
//The receive function must be external, payable, it cannot receive arguments and it cannot return anything.
//You'll notice that receive does not use the function keyword. This is because it is a special function (like constructor). 
//It is the function that runs when a contract is sent ether without any calldata, or when the calldata does not match a function signature on the contract.
//Another option to receive ether without specifying a function signature on a contract is to use a payable fallback function.

    function tip() public payable {
//Now we will make sure that the call is successful, 
//if yes only then some action should happen, 
//if not the transaction should fail and no ether should be sent
//The line below is using destructuring of tuples, since we are only interested in the success of an event. 
(bool s,) = owner.call{value: msg.value}(" "); //No data is being passed with no brackets
require(s); // To confirm that the event occurred is successful. 
    }

function donate() external payable{
 (bool s,) = charity.call{value: address(this).balance}(" ");
require (s);
}
  
}

