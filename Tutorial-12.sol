pragma solidity ^0.4.17;

// abstract contract. "draw" is an abstract function.
contract Shape{
    function draw() pure returns(string);
}

contract Rectangle is Shape{
    function draw() pure returns(string){
        return "This is Rectangle";
    }
}
