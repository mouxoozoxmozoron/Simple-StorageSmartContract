// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {SimpleStorage} from "./SimpleStorage.sol";

//inheritance
contract AddFiveStorage is SimpleStorage{
    //let overide our inherited class
    function store(uint _favouriteNumber) public override {
        //since we inherited the whle class, we have access to all properties
        myfavouriteNumber = _favouriteNumber +5;
    }
}