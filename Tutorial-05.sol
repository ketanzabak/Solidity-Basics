pragma solidity ^0.4.17;

/**
Create an integer dynamic array. In constructor add first n numbers in the array.
Create two functions :
    1: Return length of array
    2: Return element at given index. If the index is not in the range of array length, return -1.

*/
contract ArrayExample{
    
    int[] arr;
    constructor(int size) public{
        for(int index=0; index<size; index++){
            arr.push(index+1);
        }
    }

    function getArraySize() public view returns(uint){
        return arr.length;
    }

    function getElement(uint index) public view returns(int){
        if(index >= arr.length){
            return -1;
        }
        return arr[index];
    }
}