// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract GarageManager {
    mapping(address => Car) public garage;
    Car[] public userCars;
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    function addCar(
        string calldata _make,
        string calldata _model,
        string calldata _color,
        uint _numberOfDoors
    ) external {
        Car storage newCar = userCars.push();
        newCar.make = _make;
        newCar.model = _model;
        newCar.color = _color;
        newCar.numberOfDoors = _numberOfDoors;
        garage[msg.sender] = newCar;
    }

    function getMyCars() external returns(Car[] memory) {
        //return all cars owned by calling user, loop through like in returnallfavorites in mappings.sol
    }

    function getUserCars() external returns(Car[] memory) {

    }

    function updateCar(uint _index) external {

    }

    function resetMyGarage() external {

    }
}