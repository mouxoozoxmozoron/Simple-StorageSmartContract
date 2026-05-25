// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
//importing the simple storage path to be able to access their fn
// import "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol"; //named import for optimized cost

//we will be creating logics to deploy and interact with another contract here
contract StorageFactory{
    
    //we need to create state variable to store our created contract
    // SimpleStorage public simplestorage;

    //we now need to be able to access all fn
    SimpleStorage[] public listOfSimpleStorageContract;

    //let have fn to create the simple storage contract
    function CreateSimpleStorageContract() public {
        //this fn with new keyword will create the simple storage contractr
        // simplestorage = new SimpleStorage();
        SimpleStorage newSimpleStorageList = new SimpleStorage();

        //every call of this fn should be deploying one contract after another
        listOfSimpleStorageContract.push(newSimpleStorageList);
    }

    //accessing fn from simpple sytorage
    function ssfStorefunction(uint256 _indexnumber, uint256 _favouriteNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContract[_indexnumber];
        mySimpleStorage.store(_favouriteNumber);
    }

    //reading data
    function ssfGetData(uint _indexnumber) public view returns(uint){
        // SimpleStorage mySimpleStorage =listOfSimpleStorageContract[_indexnumber];
        // return mySimpleStorage.Retrieval();

        return listOfSimpleStorageContract[_indexnumber].Retrieval();
    }
}