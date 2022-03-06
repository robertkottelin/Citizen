
pragma experimental ABIEncoderV2;
pragma solidity ^0.5.1; 

contract Citizen {
    
    // Structs
    struct Citizens{
        uint age;
        string Name;
        string[] citizenData;
    }

    // Mappings
    mapping(address => Citizens) citizenMap;

    // Variables
    uint addressRegistryCount;

    // Arrays
    address [] citizenArray;
    //string [] citizenData;

    // Functions
    constructor() public {
        addressRegistryCount=0;
        addCitizen(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 29, "Test Patient");
    }

    function addCitizen(address _address,uint _age,string memory _Name) public{
        //creating the object of the structure in solidity 
        Citizens storage citizen=citizenMap[_address];
        citizen.age=_age; 
        citizen.Name=_Name;
        addressRegistryCount++;
        citizenArray.push(_address);
    }

    function addCitizenData(address _address, string memory _Data) public {
        Citizens storage citizen=citizenMap[_address];
        citizen.citizenData.push(_Data);
    }

    function getCitizen(address _address) public view returns(uint, string memory, address){
        return(citizenMap[_address].age,citizenMap[_address].Name,_address);
    }

    function getCitizenData(address _address) public view returns(string memory){
        for (uint i=0; i < 100; i++) {
            return(citizenMap[_address].citizenData[i]);
        }
    }

/*
    function modifyCitizenData() {

    }
*/

/*
    function deleteCitizenData() {

    }
*/


/*
    function getCitizenByName(string memory _Name) public view returns(uint, string memory){
        return(citizenMap[_Name].age,citizenMap[_Name]._Name);
    }
*/

/*
    function getAllCitizenAddresses() public view returns( address  [] memory){
        return citizenArray;
    }
*/








/*
    function getAllCitizens() public view returns(address[] memory){
        address[] memory ret = new address[](addressRegistryCount);
        for (uint i = 0; i < addressRegistryCount; i++) {
            ret[i] = addresses[i];
        return ret;
    }
*/
}