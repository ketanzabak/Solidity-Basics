pragma solidity ^0.4.17;

contract OperatorExample{

    function add(uint number1 , uint number2) public view returns(uint){
        return number1+ number2;
    }

    function subtract(uint number1 , uint number2) public view returns(uint){
        return number1- number2;
    }

    function isGreater(uint number1 , uint number2) public view returns(boolean){
        return number1 > number2;
    }

    function isEqual(uint number1 , uint number2) public view returns(boolena){
        return number1 == number2;
    }

    function findLargerNumber(uint number1 , uint number2) public view returns(uint){
        return number1 > number2 ? number1 : number2;
    }

    // apart from above operators there are many other operators like bitwise operators(AND, OR, XOR, etc), 
    // Logical operator (&&, ||, !)
    
}
