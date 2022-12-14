// SPDX-License-Identifier: MIT
pragma solidity ^0.4.26;

/**
    As the blockchains are public, it is not possible to completely maintain the privacy 
    of any contract. Using private variables/functions we can restrict the access 
    upto certain limits. But for the publicly accessible variables/functions, it is important to add 
    access restriction. 
    One way of doing it is to add restrictions at start of every functions using require().
    However each function may need multiple validations so it won't be a feasible solution 
    to add restriction at the start of every function. 
    In such cases it is good practise to use modifiers which can take input parameter 
    and can be reused.

    In the following Lottery contract, modifier onlyManager is used to restrict 
    the access of pickWinner function to only the contract manager. 
    Multiple modifiers can be added to functions at a time. changeManager() function 
    reuses the same modifier.

    Also the enter() method has payble modifier. 
    It ensures that the function can send and receive ether. 
    It will reject the transactions with zero ether values.

    The enter() function validates the minimum amount of ether required to enter the contract.
 */
contract Lottery{
    address public manager;
    address[] public players;

    constructor() public{
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    function random() private view returns(uint){
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public onlyManager{
        uint index  = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address[](0);
    }

    function changeManager(address _newManager) public onlyManager{
        manager = _newManager;
    }

    modifier onlyManager(){
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns (address[] memory){
        return players;
    }
}