pragma solidity ^0.4.17;

// loop examples
contract LoopExample{

    // example of while loop
    function whileLoopExample(uint number) public pure returns(uint){
        uint index = 1;
        uint sum = 0;
        while(index <= number){
            sum+= index;
            index++;
        }

        return sum;
    }

    // for loop example
    function forLoopExample(uint number)  public pure returns (uint){
        uint sum = 0;
        for(uint index =1; index<= number; index++){
            sum+= index;
        }

        return sum;
    }

    function continueStatementExample(uint number ) public pure returns(uint){
        uint sum = 0;
        for(uint index =1; index<= number; index++){
            if(index == 5){
                // do not add when index is 5.
                continue;
            }
            sum+= index;
        }

        return sum;
    }
}