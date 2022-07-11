//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    uint8 public numWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        require(
            numWhitelistedAddresses <= maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numWhitelistedAddresses += 1;
    }
}