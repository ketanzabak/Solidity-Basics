pragma solidity ^0.4.17;

contract StructExample {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    // memory is temporary place to store the data(just like  RAM).
    // function arguments are in memory.
    function create(string memory _text) public {
        todos.push(Todo(_text, false));

        // there is one more way to create struct. 
        // you can create empty struct and then initialise the members.
    }

    function get(uint _index) public view returns (string memory text, bool completed) {
        // storage hold the data between function calls.
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}