// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../../interfaces/IWormhole.sol";

import "./HubSetters.sol";
import "./HubStructs.sol";
import "./HubMessages.sol";
import "./HubGetters.sol";

contract Hub is HubSetters, HubGetters, HubStructs, HubMessages, HubEvents {
    constructor(uint16 chainId_, address wormhole_, address tokenBridge_) {
        setOwner(_msgSender());
        setChainId(chainId_);
        setWormhole(wormhole_);
        setTokenBridge(tokenBridge_);
    }

    function completeDeposit(bytes calldata encodedMessage) public {}

    function completeWithdraw(bytes calldata encodedMessage) public {}

    function completeBorrow(bytes calldata encodedMessage) public {}

    function completeRepay(bytes calldata encodedMessage) public {}

    function completeLiquidation(bytes calldata encdoedMessage) public {}

    function repay() public {}

    function liquidate(address vault, address[] memory tokens) public {}

    function sendWormholeMessage(bytes memory payload)
        internal
        returns (uint64 sequence)
    {
        sequence = wormhole().publishMessage(
            0, // nonce
            payload,
            consistencyLevel()
        );
    }
}