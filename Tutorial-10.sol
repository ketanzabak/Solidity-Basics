pragma solidity ^0.4.17;

/**
    contract to demonstrate functioin overloading.
    For function overloading, parameter count/type must be changes. You cannot overload a
    function just by changing the return type.
 */
contract FunctionOverloading{

    function add(uint no1, uint no2) public returns (uint){
        return no1+no2;
    }

    function add(uint no1, uint no2, uint no3) public returns(uint){
        return no1+no2+no3;
    }
}