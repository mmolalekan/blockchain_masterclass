// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

// Video 1: New features

// Video 2: Hello World
contract HelloWorld {
    string public myString = "hello world";

    /**
    Notes:
        file naming: capitalized e.g. HelloWorld.sol
        Add license at the top e.g. 
            1. // SPDX-License-Identifier; MIT
            2. // SPDX-License-Identifier; UNLICENSED
        Add pragma:
            with caret ^: pragma solidity ^0.8.7;
            Best practice: target a particular compiler without ^
        ; ends LOCs
        public: readable after deployment

        remix-related:
            ctrl + s: compiles
            shift + alt + f: formats the code
    */
}

// Video 3: Value Types
contract ValueTypes {
    bool public b = true;
    uint256 public u = 123;
    int256 public i = -123;
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 public b32 =
        0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
    /**
    Notes:
        values: stores actual value e.g. boolean and int
        References: stores the address/ref to an actual value e.g. an array
        
        values:
            bool: true or false
            uint256: unsigned (+ve only) int
                uint = uint256
                uint8 = 0 to 2^8 - 1. same for others
            int: signed (+ve and -ve) int
                int256 = -2^255 to 2^255 - 1
            address: address of an account
            bytes32: byte array of length 32. Used when handling crytograhic hash function Keccak256
    */
}

// Video 4: Introduction to Functions
contract FunctionIntro {
    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }

    function sub(uint256 x, uint256 y) external pure returns (uint256) {
        return x - y;
    }

    /**
    Notes:
        external: accessible after deployment
        pure: function does not read/write any state
    */
}

// video 5, 6, 7: State, local and global Variables
contract Variables {
    // State variables
    uint256 public i;
    bool public b;
    address public myAddress;

    function foo() external {
        // Local variables
        uint256 x = 123;
        bool f = false;
        x += 456;
        f = true;

        // update state variables
        i = 123;
        b = true;
        myAddress = address(1);
    }

    function globalVars()
        external
        view
        returns (
            address,
            uint256,
            uint256
        )
    {
        address sender = msg.sender;
        uint256 timestamp = block.timestamp;
        uint256 blockNum = block.number;
        return (sender, timestamp, blockNum);
    }

    /**
    Notes:
        Types of variables: local, state and global
            state variables: stores data on the blockchain. Stored in the contract, but outside of any function
            local variable: stored in a function.
            global variables: stores information such as blockchain transactions and account that call the function
                    msg.sender (address): stores the address that called the contract
                    block.timestamp (uint): stores the unique timestamp the variable was called
                    block.number (uint): stores the current block number

        view: can read data from state and global variables
        
        // personal:
            public:
                Exposes state variables (via an auto getter).
                Also makes functions callable from inside & outside.
            external:
                Exposes functions but not state variables. 
                Callable only from outside the contract (or via this.f() inside, but that uses an external call, which costs more gas)
    */
}

// Video 8: View and Pure Functions
contract ViewAndPureFunctions {
    uint256 public num;

    function viewFunc() external view returns (uint256) {
        return num;
    }

    function purefunc() external pure returns (uint256) {
        return 1;
    }

    function addToNum(uint256 x) external view returns (uint256) {
        return num + x;
    }

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }

    /**
    Notes:
        view: reads (does not write) data from the blockchain
        pure: doesnt read data from the blockchain
        neither view nor pure: modifies the state variables
    */
}

// video 9: Counter Application (Practice)
contract Counter {
    uint256 public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

// Video 10: Default Values
contract DefaultValues {
    bool public b;
    uint256 public u;
    int256 public i;
    address public a;
    bytes32 public b32;

    /**
    Notes:
        If you don't assign a value to a variable, it assumes a default
        bool = false
        uint = 0
        int = 0
        address = 0x00...(sequence of 40 zeros)
        bytes32 = 0x00...(sequence of 64 zeros)
        later: mapping, structs, enums, fixed sized arrays
    */
}

// Video 11: Constants
contract Constants {
    // lower gas: 378
    address public constant MY_ADDRESS =
        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint256 public constant MY_UINT = 123;
    /**
    Notes:
        constant variables:
            doesn't ever change
            Why: saves gas when a function interacts with it
            How: contant keyword, capitalized variable name seperated with _

    */
}

contract Var {
    // higher gas: 2489
    address public myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}
