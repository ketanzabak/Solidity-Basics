pragma solidity ^0.4.17;

contract AccountBalance{
    // mapping example
    // store account no & balance.
    mapping(int => int) public balance;

    function getBalance(int _accountNumber) public view returns(int){
        return balance[_accountNumber];
    }

    function updateBalance(int _accountNumber, int _amount) public {
        balance[_accountNumber] = _amount;
    }
}
