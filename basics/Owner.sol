pragma solidity ^0.4.17;

// This tutorial aims to demonstrate function modifier.
// Reference: https://www.tutorialspoint.com/solidity/solidity_function_modifiers.htm

contract Owner{
    address owner;
    

    constructor() public{
        owner = msg.sender;
    }

    // the function body is inserted at special symbol"_;"
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

   modifier costs(uint price) {
      if (msg.value >= price) {
         _;
      }
   }
}

contract Register is Owner {
   mapping (address => bool) registeredAddresses;
   uint price;

   constructor(uint initialPrice) public { price = initialPrice; }
   
   function register() public payable costs(price) {
      registeredAddresses[msg.sender] = true;
   }

   // only owner is allowed to change the price.
   function changePrice(uint _price) public onlyOwner {
      price = _price;
   }
}