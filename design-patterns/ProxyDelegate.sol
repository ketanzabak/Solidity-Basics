/** 
    Immutability is one of the most important features of blockchain. Once the contract 
    is deployed, it can't be changed. However to adopt to a changing environment, fix bugs/error,
    it is important to achieve mutability in smart contracts.

    This can be achieved using proxy contracts. The proxy contract stores the address of particular
    contract module and delegates all the call. Whenever there is any change in contract a new contract
    is deployed and the address is updated in proxy. The old contract cannot be changed but 
    the new one can be used to serve further requests.

    Reference : https://fravoll.github.io/solidity-patterns/proxy_delegate.html
*/

contract Proxy {
    address delegate;
    address owner = msg.sender;

    function upgradeDelegate(address newDelegateAddress) public {
        require(msg.sender == owner);
        delegate = newDelegateAddress;
    }

    function() external payable {
        assembly {
            let _target := sload(0)
            calldatacopy(0x0, 0x0, calldatasize)
            let result := delegatecall(gas, _target, 0x0, calldatasize, 0x0, 0)
            returndatacopy(0x0, 0x0, returndatasize)
            switch result case 0 {revert(0, 0)} default {return (0, returndatasize)}
        }
    }
}