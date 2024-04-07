// SPDX-License-Identifier: MIT
/* ::Challenge:: Create a public function withdraw that will withdraw all funds from the contract and send them to the deployer of the contract.
Require that only the deployer of the contract be allowed to call this function.
For all other addresses, this function should revert.*/
pragma solidity ^0.8.20;

contract Contract {

    address deployer;

    //Making the constructor fucntion payable would mean that it can receive ether
    constructor() payable {
    deployer = msg.sender;
     //Here the transaction would be reverted automatically if the condition is not met and the string given in the args would be shown
     require (msg.value >=1, "invalid amount sent");

        }
        function withdraw() public {
               require (msg.sender == deployer);
               //above line checks that the address calling the withdraw function is the same as the deployer address. 
              payable (msg.sender).transfer 
              (address(this).balance);
              //we first make the owner address payable, then call the transfer function on it
              //Then we fetch the address of the current contract  passing the balance of the contract (address(this).balance) 
    
    }

}
    
