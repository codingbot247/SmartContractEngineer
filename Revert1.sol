// SPDX-License-Identifier: MIT
//challenge: Add a payable constructor method that requires a 1 ether deposit.
//If at least 1 ether is not sent to the constructor, revert the transaction.
pragma solidity ^0.8.20;

contract Contract {

    constructor() payable {

     //Here the transaction would be reverted automatically if the condition is not met and the string given in the args would be shown
     require (msg.value >=1, "invalid amount sent");

        }
    }
    
