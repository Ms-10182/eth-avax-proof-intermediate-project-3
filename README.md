# Vibranium Exchange using ERC20

This fullstack project aims for the demo of token miniting, transfer and burning.

## Description
The smart contract can be deployed on any test net or hardhat, This contract is an ERC20 contract. ```customer[] public customers``` is an array to store the buyers in a queue. A buyer can addup into queue by calling ```requestTokens()```. Multiple buyers will be added in queue. Then then contract owner will call ```mintToken()```that can only be called by owner which will mint tokens for all the buyers in the queue and make it empty. ```burnToken()``` will burn the token and ```transferToken()``` will transfer the token to other address.
```getBuyerBalance()``` is used to check the active queue list.

## Getting Started
### Executing the program
To run the code, follow these steps:
1) git clone ```repo```
2) copy the ```Vibranium.sol```into remix and deploy on test net.
if deploying on remix evm the front end of remix will be used to interact.
3) After deploying on test net copy the address of contract and paste in ```contractAddress``` inside ```app.js```, and copy abi and paste in ```contractABI``` inside same ```app.js```.
4) Now open ```index.html``` in browser and start interacting.

### Interaction with FrontEnd
1) Always click ```connect wallet``` button whenever the page relodes.
2) Add buyers in queue using ```request tokens```, you can check active queue by clicking ```Get Customer Requests```.
3) Using the owner account click ```Mint Tokens```. After transaction check supply using ```Get Total Supply```.
4) For burn tokens switch to the account you want to burn token of, enter the address of the same account and amount and click ```Burn Tokens```.
5) For Transfer token switch to account you want to transfer from, enter from , to address and amount then click ```Transfer Tokens```.
6) You can check all the transaction and address on sepolia ether scan.
