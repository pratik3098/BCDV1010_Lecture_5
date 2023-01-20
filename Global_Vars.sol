// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Global_Vars
 * @dev Global_Vars & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Global_Vars {
    
    mapping(address => uint) balances;
    event Txn(uint block_num, uint block_timestamp,address txn_origin);
    function deposit() payable external {
        // deposit sizes are restricted to 1 ether
       require(1 wei < msg.value);
       balances[msg.sender] += msg.value;
       emit Txn(block.number, block.timestamp, tx.origin);

    } 


    function getBalance() public view returns(uint){

        return balances[msg.sender];

    }


}