// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Project {
    struct Event {
        string description;
        uint256 timestamp;
    }

    Event[] public timelineEvents;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // 1. Add a timeline event
    function addEvent(string calldata description) external onlyOwner {
        timelineEvents.push(Event(description, block.timestamp));
    }

    // 2. Get event count
    function getEventCount() external view returns (uint256) {
        return timelineEvents.length;
    }

    // 3. Get event details by index
    function getEvent(uint256 index) external view returns (string memory, uint256) {
        require(index < timelineEvents.length, "Invalid index");
        Event storage e = timelineEvents[index];
        return (e.description, e.timestamp);
    }
}

