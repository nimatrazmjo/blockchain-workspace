//SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract Employee {
    enum Department {
        Gardening,
        Clothing,
        Tools
    }

    string firstName;
    string lastName;
    uint256 hourlyPay;
    Department department;

    constructor(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Department _department
    ) {
        firstName = _firstName;
        lastName = _lastName;
        hourlyPay = _hourlyPay;
        department = _department;
    }

    function getWeeklyPay(uint256 _hoursWorked) public view returns (uint256) {
        if (_hoursWorked > 40) {
            return (40 * hourlyPay) + ((_hoursWorked - 40) * hourlyPay * 2);
        }
        return _hoursWorked * hourlyPay;
    }

    function getFirstName() public view returns (string memory) {
        return firstName;
    }
}

contract Manager is Employee {
    Employee[] public employees;

    constructor(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Department _department
    ) Employee(_firstName, _lastName, _hourlyPay, _department) {}

    function addSubornidate(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Department _department
    ) public {
        employees.push(
            new Employee(_firstName, _lastName, _hourlyPay, _department)
        );
    }

    function getSubornates() public view returns (string[] memory) {
        string[] memory names = new string[](employees.length);
        for (uint256 i = 0; i < employees.length; i++) {
            names[i] = employees[i].getFirstName();
        }
        return names;
    }
}
