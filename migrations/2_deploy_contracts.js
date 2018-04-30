var Election = artifacts.require("./Election.sol");
module.exports = function(deployer) {
  // Define Election Candidates in the constructor.
  deployer.deploy(Election,["Bob", "John", "Carl"]);
};
