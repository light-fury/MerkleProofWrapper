// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IMerkleProofWrapper {
    function verify(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf
    ) external pure returns (bool);

    function verifyCalldata(
        bytes32[] calldata proof,
        bytes32 root,
        bytes32 leaf
    ) external pure returns (bool);

    function processProof(bytes32[] memory proof, bytes32 leaf) external pure returns (bytes32);

    function processProofCalldata(bytes32[] calldata proof, bytes32 leaf) external pure returns (bytes32);

    function multiProofVerify(
        bytes32[] memory proofs,
        bool[] memory proofFlag,
        bytes32 root,
        bytes32[] memory leaves
    ) external pure returns (bool);

    function multiProofVerifyCalldata(
        bytes32[] calldata proofs,
        bool[] calldata proofFlag,
        bytes32 root,
        bytes32[] memory leaves
    ) external pure returns (bool);

    function processMultiProof(
        bytes32[] memory proofs,
        bool[] memory proofFlag,
        bytes32[] memory leaves
    ) external pure returns (bytes32);

    function processMultiProofCalldata(
        bytes32[] calldata proofs,
        bool[] calldata proofFlag,
        bytes32[] memory leaves
    ) external pure returns (bytes32);
}
