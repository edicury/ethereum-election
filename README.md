    Ethereum Election Smart Contract

>   Solidity contract made to emulate Election.

    Define the candidates in the deploy migrations,
    start the contract,
    make the voters with each address vote.

> Start the contract
```sh
$ cd Election
$ truffle compile
$ truffle develop
> migrate --reset
> var election
> Election.deployed().then(function(e){election = e;});
> election.Vote(0);
```

    Get the winner Candidate with :
```sh
> Election.deployed().then(function(election){console.log(election.ElectionWinner.call();)});
```


### Requirements
- Node.js
- Truffle

> Based on Solidity Docs.