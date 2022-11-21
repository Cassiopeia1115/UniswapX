// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.16;

import {ResolvedOrder, SignedOrder} from "../base/ReactorStructs.sol";

/// @notice Interface for order execution reactors
interface IReactor {
    /// @notice error thrown when the specified sender doesn't match the signer
    error InvalidSender();

    /// @notice Execute a single order using the given fill specification
    /// @param order The order definition and valid signature to execute
    /// @param fillContract The contract which will fill the order
    /// @param fillData The fillData to pass to the fillContract callback
    function execute(SignedOrder calldata order, address fillContract, bytes calldata fillData) external;

    /// @notice Execute the given orders at once with the specified fill specification
    /// @param orders The order definitions and valid signatures to execute
    /// @param fillContract The contract which will fill the order
    /// @param fillData The fillData to pass to the fillContract callback
    function executeBatch(SignedOrder[] calldata orders, address fillContract, bytes calldata fillData) external;
}