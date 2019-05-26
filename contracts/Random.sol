pragma solidity >=0.4.21 <0.6.0;
pragma experimental ABIEncoderV2;


import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "iexec-doracle-base/contracts/IexecDoracle.sol";

contract Random is Ownable, IexecDoracle{

    string public data;

    constructor(address _iexecHubAddress)

    public IexecDoracle(_iexecHubAddress) {}

    function updateSettings(
        address _authorizedApp,
        address _authorizedDataset,
        address _authorizedWorkerPool,
        bytes32 _requiredTag,
        uint256 _requiredTrust) public onlyOwner {
        _iexecDoracleUpdateSettings(_authorizedApp, _authorizedDataset, _authorizedWorkerPool, _requiredTag, _requiredTrust);
    }

    function decodeResult(bytes memory result) public pure returns (string memory) {
        return abi.decode(result, (string));
    }

    function processResult(bytes32 _oracleCallID) public {
        data = decodeResult(_iexecDoracleGetVerifiedResult(_oracleCallID));
    }
}