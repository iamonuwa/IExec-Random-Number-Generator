pragma solidity >=0.4.21 <0.6.0;
pragma experimental ABIEncoderV2;


import './Random.sol';

contract RandomRequester is Random {

    constructor(address _iexecHubAddress)
    public Random(_iexecHubAddress) {}

    function submit() public {
        IexecODBLibOrders.RequestOrder memory order;
        order.params = "";

        iexecClerk.signRequestOrder(order);
        iexecClerk.broadcastRequestOrder(order);
    }

}