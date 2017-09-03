pragma solidity ^0.4.11;
// Specify compiler version

contract Voting {
	/*
	mapping below is a hash table that maps the name of the candidate (as a byte32)
	to the number of votes (as an unsigned integer)
	 */
	
	mapping (bytes32 => uint8) public votesRecieved;

	/*
	Solidity doesn't let you pass in a string array into the constructor, so, we'll
	have to use an array of bytes32 to store the list of candidates
	 */
	
	bytes32[] public candidateList;

	/*
	This is the constructor that is called once you deploy the contract to the blockchain.
	Once deployed, we will pass an array of candidates who will be running in
	the election
	 */
	function Voting(bytes32[] candidateNames) {
		candidateList = candidateNames;
	}

	// This function returns the total votes a candidate has received so far
	function totalVotesFor(bytes32 candidate) returns (uint8) {
		if (validCandidate(candidate) == false) throw;
		return votesReceived[candidate];
	}

	// This function increments the vote count for the specified candidate. This is
	// equivalent to casting a vote
	function voteForCandidate(bytes32 candidate) {
		if (validCandidate(candidate) == false) throw;
		votesReceived[candidate] += 1;
	}

	// Check if the candidate is valid by ensuring its membership
	// within the candidates array
	function validCandidate(bytes32 candidate) returns (bool) {
		for (uint i = 0; i < candidateList.length; i++) {
			if (candidateList[i] == candidate) {
				return true;
			}
		}
		return false;
	}
}
