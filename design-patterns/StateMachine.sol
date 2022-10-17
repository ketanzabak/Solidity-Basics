pragma solidity ^0.4.17;

// code reference: https://medium.com/coinmonks/state-machines-in-solidity-9e2d8a6d7a11

contract StateMachine {    
    enum States { 
        AwaitQuestion, GotQuestion, AwaitAnswer, GotAnswer 
    }
    
    // initial state.
    States public state = States.AwaitQuestion;

    modifier onlyState(States expected) {
        require(state == expected, "Not permitted in this state");
        _;
    }
    function setQuestion() public onlyState(States.AwaitQuestion) {
        state = States.GotQuestion;
    }
    
    function getQuestion() public onlyState(States.GotQuestion) {
        state = States.AwaitAnswer;
    }
    
    function setAnswer() public onlyState(States.AwaitAnswer) {
        state = States.GotAnswer;
    }
    
    function getAnswer() public onlyState(States.GotAnswer) {
        state = States.AwaitQuestion;
    }
}