pragma solidity ^0.4.17;

contract BaseContract{

    string internal contractName ;
    constructor() public{
        contractName = "Inheritance Example";
    }

    // internal function. can only be accesses by derived contracts.
    function add(uint a, uint b) internal pure returns(uint){
        return a+b;
    }
}

contract DerivedContract is BaseContract{

    constructor() public{
        
    }

    function compute(uint a, uint b, string memory operation) public pure returns(uint){
        string memory operationAdd = "add";
        if(keccak256(bytes(operation)) == keccak256(bytes(operationAdd))){
            // call to parent method.
            return add(a, b);
        }
        return 0;
    }

    function getContractDetails() public view returns (string){
        // accessing parent contract variable.
        return contractName;
    }
}