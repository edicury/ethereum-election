pragma solidity ^0.4.4;

contract Election {
    // Voter struct
    struct Voter {
        uint vote;
        bool voted;
        uint8 weight;
    }
    // Candidate struct
    struct Candidate {
        bytes32 name;
        uint id;
        uint votes;
    }
    // Defines public voter
    address public voter;
    // Defines all voters in current election
    mapping(address => Voter) public voters;
    // Defines all candidates in current election
    Candidate[] public candidates;
    // Election constructor which constructs the election, and the current voter
    function Election(bytes32[] names) public {
        voter = msg.sender;
        voters[voter].weight = 1;
        for(uint i = 0; i < names.length ; i++) {
            candidates.push(Candidate({name: names[i], id: i, votes: 0}));
        }
    }
    // Gives msg.sender's vote to chosen candidate
    function Vote(uint candidate) public {
        Voter storage voter = voters[msg.sender];
        // Reverts if msg.sender already voted.
        require(!voter.voted);
        voter.voted = true;
        voter.vote = candidate;
        candidates[candidate].votes += voter.weight;
        
    }
    // Calculates election winner's votes
    function ElectionWinner() public view returns (uint candidate_){
        uint winningVoteCount = 0;
        for (uint c = 0; c < candidates.length; c++) {
            if (candidates[c].votes > winningVoteCount) {
                winningVoteCount = candidates[c].votes;
                candidate_ = c;
            }
        }
    }
}