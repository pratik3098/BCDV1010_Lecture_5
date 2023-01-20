// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {
    
    address[] dynamic_registry;

   
    error InvalidIndex(uint index, uint array_size);


    event validIndex(uint index, uint array_size);

     function retrieveRequire(uint _index) public  returns (address){
       // require(_index < dynamic_registry.length); 
        require(_index < dynamic_registry.length, "Invalid Index");

        emit validIndex(_index,dynamic_registry.length );
        return dynamic_registry[_index];

    }


    function retrieveIfElse(uint _index) public view  returns (address){
         if(_index < dynamic_registry.length) { 
             return dynamic_registry[_index];
             
         }else{

             //revert();
            // revert("invalid Index");

             revert InvalidIndex(_index,dynamic_registry.length);
         }        
    }


    function retrieveAssert(uint _index) public view  returns (address){
        assert(_index < dynamic_registry.length); 
        return dynamic_registry[_index];

    }


    function getDynamicSize() public view returns (uint){
        return dynamic_registry.length;
    }
    
    // 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
    // 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c

    function insert(address val) public{
         dynamic_registry.push(val);   
    }
  

    function dynamicPop() public{
         dynamic_registry.pop();
    }



    function getArray() public view returns(address[] memory)
   {
     return dynamic_registry;
   }



}