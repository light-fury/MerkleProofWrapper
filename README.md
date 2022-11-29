# MerkleProofWrapper

These functions deal with verification of Merkle Tree proofs.
* The proofs can be generated using the JavaScript library <br>
https://github.com/miguelmota/merkletreejs.
* Note: The hashing algorithm should be keccak256 and pair sorting should be enabled.
* Note: This contract is not a standalone contract. This will work like a library contract.

Here is the usage of the library.<br>
https://forum.openzeppelin.com/t/how-to-use-merkleproof-library/2818/2 <br>
And here's another usage of it.<br>
https://medium.com/codex/using-merkle-trees-for-smart-contracts-24ccf6f75a0a <br>

With this MerkleProofWrapper, we can do like this. <br>
`MerkleProofWrapper(address _merkleProofWrapperAddress).verify(_merkleProof, root, leaf)` <br>
By doing this, we can reduce the size of the contract deployed.

## Overview

Wrapper contract based on OpenZeppelin's MerkleProof library.  
If you use this contract, you can verify single / multiple leaves on the `MerkleTree` if they exist or not.  
This contract does not have any variables in itself.

## How to Use

1. Deploy smart contract via Bunzz
2. Write front-end or back-end projects which use `MerkleTree` to store date like whitelists or sensitive informations.
3. Generate `MerkleTree` and store the Proofs and Leaves on backend
4. Share the leaf for specific user, proofs for that leaf and root of the `MerkleTree` to the user upon user's request
5. Users can use the deployed MerkleProofWrapper smart contract to verify if those are correct
6. DeFi builders can use the deployed MerkleProofWrapper smart contract to verify the user's request.  
For this:
    * Users can get leaves and proofs from the backend.
    * Root of the `MerkleTree` must be stored in the DeFi's main smart contract.
    * Inside the main smart contract, call the deployed MerkleProofWrapper contract to verify the user's request. This will reduce the size of the main smart contract for DeFi builders.

## Functions

<br>

### `verify`

Returns true if a `leaf` can be proved to be a part of a Merkle tree defined by `root`. For this, a `proof` must be provided, containing sibling hashes on the branch from the leaf to the root of the tree. Each pair of leaves and each pair of pre-images are assumed to be sorted.
| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       | bytes32[] memory | array of the proof for the leaf   |
| root        | bytes32          | hash of the root                  |
| leaf        | bytes32          | leaf to verify the existence      |

It returns `True` / `False` depends on the result.

<br>

### `verifyCalldata`

Calldata version of [verify](#verify)

| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       |bytes32[] calldata| array of the proof for the leaf   |
| root        | bytes32          | hash of the root                  |
| leaf        | bytes32          | leaf to verify the existence      |

It returns `True` / `False` depends on the result.

<br>

### `processProof`

Returns the rebuilt hash obtained by traversing a Merkle tree up from `leaf` using `proof`. A `proof` is valid if and only if the rebuilt hash matches the root of the tree. When processing the proof, the pairs of leafs & pre-images are assumed to be sorted.
| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       | bytes32[] memory | array of the proof for the leaf   |
| leaf        | bytes32          | leaf to verify the existence      |

It returns `bytes32` hash of the root.

<br>

### `processProofCalldata`

Calldata version of [processProof](#processproof)

| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       |bytes32[] calldata| array of the proof for the leaf   |
| leaf        | bytes32          | leaf to verify the existence      |

It returns `bytes32` hash of the root.

<br>

### `multiProofVerify`

Returns true if the `leaves` can be simultaneously proven to be a part of a merkle tree defined by `root`, according to `proof` and `proofFlags` as described in {processMultiProof}.  
CAUTION: Not all merkle trees admit multiproofs. See {processMultiProof} for details.
| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       | bytes32[] memory | array of the proof for the leaf   |
| proofFlags  | bool[] memory    | determine another leaf/inner node or a proof sibling node|
| root        | bytes32          | hash of the root                  |
| leaves      | bytes32[] memory | array of the hash of the leaves   |

It returns `True` / `False` depends on the result.

<br>

### `multiProofVerifyCalldata`

Calldata version of [multiProofVerify](#multiproofverify)

| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       |bytes32[] calldata| array of the proof for the leaf   |
| proofFlags  | bool[] calldata  | determine another leaf/inner node or a proof sibling node|
| root        | bytes32          | hash of the root                  |
| leaves      | bytes32[] memory | array of the hash of the leaves   |

It returns `True` / `False` depends on the result.

<br>

### `processMultiProof`

Returns the root of a tree reconstructed from `leaves` and sibling nodes in `proof`. The reconstruction proceeds by incrementally reconstructing all inner nodes by combining a leaf/inner node with either another leaf/inner node or a proof sibling node, depending on whether each `proofFlags` item is true or false respectively.  
CAUTION: Not all merkle trees admit multiproofs. To use multiproofs, it is sufficient to ensure that:   
1) the tree is complete (but not necessarily perfect),   
2) the leaves to be proven are in the opposite order they are in the tree (i.e., as seen from right to left starting at the deepest layer and continuing at the next layer).

| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       |bytes32[] calldata| array of the proof for the leaf   |
| proofFlags  | bool[] calldata  | determine another leaf/inner node or a proof sibling node|
| leaves      | bytes32[] memory | array of the hash of the leaves   |

It returns `bytes32` hash of the root.

<br>

### `processMultiProofCalldata`

Calldata version of [processMultiProof](#processmultiproof)

| name        | type             | description                       |
| :---        |    :----:        |          ---:                     |
| proof       |bytes32[] calldata| array of the proof for the leaf   |
| proofFlags  | bool[] calldata  | determine another leaf/inner node or a proof sibling node|
| leaves      | bytes32[] memory | array of the hash of the leaves   |

It returns `bytes32` hash of the root.

