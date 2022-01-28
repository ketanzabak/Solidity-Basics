pragma solidity ^0.4.17;

// This contract demonstrate the use of conditional statement : if-else.
contract ConditionalStatementExample{
    function isEven(uint number) public pure return(bool){
        // verify if the number is even. return true if number if even, false otherwise.
        if(number %2 ==0 ){
            return true;
        }
        
        return false;
    }
}