// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Patricia {
    struct Node {
        uint8 index;
        uint8 value;
    }

    struct NodeInfo {
        NodeType nodeType;
        Node[] children;
        address[] holders;
        Node currentNode;
    }

    struct Trie {
        NodeInfo[] nodes;
    }

    mapping(bytes nodeHash => NodeInfo info) public infoOf;

    mapping(uint256 index => Trie fullTrie) public queryTrieNumber;

    mapping(uint256 index => Node node) public getNodeNumber;

    mapping(uint256 index => bytes nodeHash) public getNodeHashOfNumber;

    uint256 public nodeCount;

    uint256 public trieCount;

    enum NodeType { ROOT, BRANCH, EXTENSION, LEAF }

    function addNodes(uint8[5] memory _numbers) public {
        for (uint8 i = 0; i < _numbers.length; i++) {
            Node memory node = Node(
                i,
                _numbers[i]
            );

            getNodeNumber[i] = node;

            bytes memory nodeHash = getEncodedNode(getNodeNumber[i]);

            getNodeHashOfNumber[i] = nodeHash;

            infoOf[nodeHash].holders.push(msg.sender);
            infoOf[nodeHash].currentNode = node;

            if (i == 0) {
                infoOf[nodeHash].nodeType = NodeType.ROOT;
            } else if (i == _numbers.length - 1) {
                infoOf[nodeHash].nodeType = NodeType.LEAF;
            } else {
                infoOf[nodeHash].nodeType = NodeType.EXTENSION;
            }

            if (i > 0) {
                infoOf[nodeHash].children.push(getNodeNumber[i - 1]);
            }

            nodeCount++;
        }
        trieCount++;
    }

    function testNodeBool(bytes memory _node) public view returns (bool _isNull) {
        if (infoOf[_node].children.length != 0) {
            _isNull = false;
        } else {
            _isNull = true;
        }
    }

    function getNodeHolders(bytes memory _node) public view returns (address[] memory _holders) {
        _holders = infoOf[_node].holders;
    }

    function getEncodedNode(Node memory _decoded) public pure returns (bytes memory _encoded) {
        _encoded = abi.encode(_decoded);
    } 

    function getDecodedNode(bytes memory _encoded) public pure returns (Node memory _decoded) {
        _decoded = abi.decode(_encoded, (Node));
    }
}
