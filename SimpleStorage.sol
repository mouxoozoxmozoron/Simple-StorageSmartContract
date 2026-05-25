// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //tells the version the compiler to be used

contract SimpleStorage{
    //variaable
    // uint256 FavouriteNumber;
    // uint256 AsignedFavNumber = 0;
    // string FavoriteName = "mussa";
    // int MixedNumbers = -3;
    // bytes32 MyByyteNumber = "40";
    // bool HasFavoriteNumber = true;

    //functions

    uint public myfavouriteNumber;

    //think of arrays
    // uint256[] favouriteNumber; // able to receive arrays data

    //custome type struct
    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    //this is now we call our custom type Person
    //but what if we want to add more people??
    // Person public Moux = Person({
    //     favouriteNumber : 45,
    //     name :"mussa aron"
    //  });

    //let create an array with our custom Person type
    Person[] public listOfPeople;

    //maping or dictionary
    mapping(string => uint256 ) public NameToFavoriteNumberMapping;

    //so we created a function to be updating our favourite number variable
    //virtual key word for overiding
    function store(uint256 _favouriteNumber) public virtual {
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