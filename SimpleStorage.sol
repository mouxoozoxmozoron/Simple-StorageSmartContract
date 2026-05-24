// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage{

    uint public myfavouriteNumber;

    //custome type struct
    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    //let create an array with our custom Person type
    Person[] public listOfPeople;

    //maping or dictionary
    mapping(string => uint256 ) public NameToFavoriteNumberMapping;

    //so we created a function to be updating our favourite number variable
    function store(uint256 _favouriteNumber) public {
        myfavouriteNumber = _favouriteNumber;
        Retrieval(); //calling view funciton inside this will increase gas fee 43864 
    }

//free gas fee callable view or pure function 43724
    function Retrieval() public view returns(uint256){
        return myfavouriteNumber;
    }

    //then adding a function to add data in list of people
    function addPeople(string memory _name, uint _favouriteNumber) public{
        //then use .push function to directly add people
        listOfPeople.push(Person(_favouriteNumber, _name));
        NameToFavoriteNumberMapping[_name] = _favouriteNumber;
    }
}