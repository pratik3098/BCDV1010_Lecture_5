// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Payee
 * @dev Payee & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Payee {
    
    mapping(address => uint) balances;
      
    function deposit() payable external {
        // deposit sizes are restricted to 1 ether
        require(msg.value == 1 ether);
       // an address cannot deposit twice
       require(balances[msg.sender] == 0);
       balances[msg.sender] += msg.value;

    } 


    function getBalance() public view returns(uint){

        return balances[msg.sender];

    }




     
}