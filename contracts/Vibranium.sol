// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract Vibranium is ERC20 {
    mapping (address =>uint)public buyer;
    address owner;
    struct customer{
    address toAddress;
    uint amount;
    }
    customer[] public customers;
    constructor() ERC20("VIBRANIUM", "VBM") {
        owner = msg.sender;
        // _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    event minting(string message,address indexed _from, address indexed _to, uint amount);
    event burning(string message, address indexed _of, uint amount);
    event transfering(string message, address indexed _from, address indexed _to,uint amount);

    //function to add buyer in queue
    function requestTokens(address _toAddress,uint _amount)public{
        customers.push(customer({toAddress:_toAddress,amount:_amount}));
    }

    function mintToken() public onlyOwner {
        //loop to mint tokens for buyers in queue
        while (customers.length!=0) {
            uint i = customers.length -1;
            if (customers[i].toAddress != address(0)) { // Check for non-zero address
            _mint(customers[i].toAddress, customers[i].amount);
            emit minting("Token minted", address(this), customers[i].toAddress, customers[i].amount);
            customers.pop();
            }
        }
    }

    //function to burn tokens
    function burnToken(address _of, uint amount)public {
        _burn(_of, amount);
        emit burning("Token burnt", _of, amount);
    }
    //function to transfer tokens
    function transferToken(address _from, address _to,uint amount)public {
        transfer(_to, amount);
        emit transfering("Tokens transferred", _from, _to,amount);
    }

    //function to check the buyer queue
    function getBuyerBalance()public view returns(customer[] memory){
        return customers;
    }

    
    modifier onlyOwner(){
        require(msg.sender == owner);_;
    }
}
