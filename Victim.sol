// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
contract Victim {
   mapping(address => uint256) balances;
   function deposit() public payable {
      balances[msg.sender] += msg.value;
   }
   function withdraw(uint _amount) public {
     require(_amount <= balances[msg.sender],"Insufficient balance");
     (bool success,) = msg.sender.call{value:_amount}("");
     require(success, "Transfer failed.");
     balances[msg.sender] -= _amount;
   }
   function contractBalance() public view returns(uint256){
        return address(this).balance;
   }
}