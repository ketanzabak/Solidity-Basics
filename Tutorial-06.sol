pragma solidity ^0.4.17;

/**
    Create a contract which includes enum variable Size(High, Medium & Low).
    Create functions to set and get the value for enum.
 */
contract EnumExample{
    enum Size{
        HIGH,
        MEDIUM,
        LOW
    }

    Size size ;

    constructor() public {
        size = Size.MEDIUM;
    }
    function setSize(uint inputSize) public {
        size = Size( inputSize);
    }

    function getSize() public view returns (string){
        if(Size.HIGH == size) return "High";
        if(Size.LOW == size) return "Low";
        if(Size.MEDIUM == size) return "Medium";
        return "";
    }

    function getDefaultSize() public pure returns(Size){
        return Size.MEDIUM;
    }

}