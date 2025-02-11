// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Structs {
    struct User {
        uint8 age;
        string name;
    }
    struct Favorites {
        uint favoriteNumber;
        uint birthDayOfMonth;
        string favoriteColor;
        uint[] luckyLottoNumbers;
        mapping (uint => uint) numberPairs;
    }
    // Favorites memory myFavorites = Favorites(
    //     7,
    //     19,
    //     "crimson",
    //     [uint(1), 2, 3, 4, 5]
    // );
    Favorites[] public userFavorites;
    mapping(address => User) public users;

    function register(uint8 age, string memory name) external returns(bool) {
        users[msg.sender] = User(age, name);
        return true;
    }

    function addFavorite(
        uint _favNumber,
        uint _birthDay,
        string calldata _favColor,
        uint[5] calldata _lotteryNumbers
    ) public {
        Favorites storage newFav = userFavorites.push();
        newFav.favoriteNumber = _favNumber;
        newFav.birthDayOfMonth = _birthDay;
        newFav.favoriteColor = _favColor;
        newFav.luckyLottoNumbers = _lotteryNumbers;
        newFav.numberPairs[33] = 66;
    } // alternatively can make an instance in memory and push it to storage
}