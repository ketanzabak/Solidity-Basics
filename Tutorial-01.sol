pragma solidity ^0.4.17;

contract VariablesExample{
    string public message;
    uint public number;

    constructor() public{
        message = 'String example';
        number = 20;
    }

    function getMessage() public returns(string){
        return message;
    }

    function getNumber() public returns(uint){
        return number;
    }
}