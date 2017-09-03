# Ethereum Toy App

This app is a toy application that allows users to vote for a candidate in an election. It is based off the [Medium tutorial](https://medium.com/@mvmurthy/full-stack-hello-world-voting-ethereum-dapp-tutorial-part-1-40d2d0d807c2)


# How to set up a new Ethereum project

1. Install testrpc and web3js. testrpc is an in-memory
blockchain simulator, and web3js is the Ethereum javascript api

```
npm install ethereumjs-testrpc web3@0.20.1
```

2. Write the contract (Contract.sol), docs for solidity can
be found [here](https://solidity.readthedocs.io/en/develop/)

3. Compile the contract using solc within the node console

```
npm install solc
```

Make sure that the testrpc is running in a different console and type the following into the node console: 

```javascript
Web3 = require('web3')
web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

code = fs.reqdFileSync('Voting.sol').toString()
solc = require('solc')
compiledcode = solc.compile(code)
```

4. Deploy the contract by reating the contract object

```javascript
abiDefinition = JSON.parse(compiledCode.contracts[':Voting'].interface)

VotingContract = web3.eth.contract(abiDefnition)

byteCode = compiledCode.contracts[':Voting'].bytecode

deployedContract = VotingContract.new(['Rama', 'Nick', 'Jose'], { data: byteCode, from: web3.eth.accounts[0], gas: 4700000})

deployedContract.address
contractInstance = VotingContract.at(deployedContract.address)

```