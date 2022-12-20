/**
    As we saw the contract can be upgraded using ProxyDelegate Pattern. However even though we upgrade the
    contract, the data still resides in the old contract. 
    
    One way of dealing with this situation is to copy complete data from old contract to new one. But the
    problem with this approach is that it is very expensive to write complete data to new contract.

    Eternal Storage pattern is used in such cases. Eternal storage is a smart contract which is used to
    store only the data. So the actual logic of smart contract is kept in differnt smart contract and the data
    in another contract. This way even if the new contract is deployed, it can access the data
    from eternal storage. This eternal storage smart contract works as a storage solution.

    Access must be restricted which accessing the data from eternal storage. 

    Following contract ,EternalStorage, demonstrate eternal storage to store key (bytes32) , value(uint) pair. Getter and Setter
    methods are used to read and write the data.

    The latestVersion stores the address of smart contract which will add the data. Only a particular contract
    can access the data making it secure. This is achieved by "onlyLatestVersion" modifier.
    
    Also only owner of EternalStorage is allowed to update the version.

 */

 contract EternalStorage {

    address owner = msg.sender;
    address latestVersion;

    mapping(bytes32 => uint) uIntStorage;

    modifier onlyLatestVersion() {
       require(msg.sender == latestVersion);
        _;
    }

    function upgradeVersion(address _newVersion) public {
        require(msg.sender == owner);
        latestVersion = _newVersion;
    }

    function getUint(bytes32 _key) external view returns(uint) {
        return uIntStorage[_key];
    }

    // add key-value pair.
    function setUint(bytes32 _key, uint _value) onlyLatestVersion external {
        uIntStorage[_key] = _value;
    }
}