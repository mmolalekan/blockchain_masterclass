// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

// Video 12: If Else
// your knowledge of If Else in JS suffices both for If Else and ternary

// Video 13: For and While loop
// The more the loop, the more the gas
contract ForAndWhileLoop {
    function loops() external pure returns (uint256) {
        uint256 s;
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) continue;
            s += i;
            if (i == 5) break;
        }

        uint256 j = 0;
        while (j < 10) {
            j++;
        }

        return s;
    }
}

// Video 14: Error
contract Errors {
    function testRequire(uint256 _i) public pure {
        require(_i <= 10, "i > 10"); // the longer the mesage, the more the gas
        //code
    }

    function testRevert(uint256 _i) public pure {
        if (_i > 1) {
            revert("i > 10");
        }
    }

    uint256 public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }

    error MyError(address caller, uint256 i);

    function testCustomError(uint256 _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }

    /**
    Notes:
        Solidity throws error with revert, require and assert
            1. revert() is used to revert the transaction
            2. require() is used to validate the input
            3. assert() is used to validate the code
            Revert and require do the same thing, but reverse if better for nested checks
        gas is refunded when error is thrown in a transaction, states updates and reverted 
        But gas already spent before the error is not refunded.
        custom error saves gas (^0.8 version)
    */
}

// Video 15: Function Modifier
contract FunctionModifier {
    // 1. Basic Example
    bool public paused;
    uint256 public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    // 2. Input example:
    modifier cap(uint256 _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint256 _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    // 3. Sandwiches a function: some code + function + some more code,
    modifier sandwich() {
        // code here
        count += 10;
        _;
        // more code here
        count * 2;
    }

    function foo() external sandwich {
        count += 1;
    }
    /**
    Notes:
        Function modifiers allow you to reuse code before and/or after function
        remember to add _; after definining the  modifier
        Usage: basic code addition, input validation, function sandwiching
    */
}

// Video 16: Constructor
contract Constructor {
    address public owner;
    uint256 public x;

    constructor(uint256 _x) {
        owner = msg.sender;
        x = _x;
    }

    /**
    Notes:
    Constructor: A special function that is called once when a contract is deployed
    Mainly used to initialize state variables
    constructor has no function keyword
    */
}

// Video 17: Ownable (Practice)
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {
        // code
    }

    function anyOneCanCall() external {
        // code
    }
}

// Video 18: Function Outputs
contract FunctionOutputs {
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    function returnManyNamed() public pure returns (uint256 x, bool b) {
        // return (1, true); // method 1
        // method 2: saves gas
        x = 1;
        b = true;
        // return (x, b); // method 3
    }

    function destructuringAssignments() public pure {
        (uint256 x, bool b) = returnMany(); // get both
        (, bool _b) = returnMany(); // get some
    }

    /**
    Notes:
        1. Return multiple outputs
        2. Named outputs
        3. Destructuring Assignment
    */
}

// Video 19: Array
contract Array {
    uint256[] public nums = [1, 2, 3];
    uint256[3] public numsFixed = [4, 5, 6];

    function arrayMethods() external {
        nums.push(4);
        uint256 x = nums[1];
        nums[2] = 777;
        delete nums[1];
        nums.pop();
        uint256 len = nums.length;

        // create array in memory
        uint256[] memory a = new uint256[](5);
        a[1] = 123;
    }

    function returnArray() external view returns (uint256[] memory) {
        return nums;
    }

    /**
    Array could be dynamic or fixed size
        1. Dynamic array: uint256[] public arr = [1,2,3];
        2. Fixed size array: uint256[3] public arr = [1,2,3];
    
    Declaration and Inititialization
        declaration: int[] public nums;
        initialization: nums = [1,2,3];
        both at once: uint[] public nums = [1,2,3];
    
    Array methods: 
        push: not possible with fixed size array 
        get: nums[] 
        update nums[] = value 
        delete: Deletes the value at the specified index and sets to default value, but doesn't affect the size
        pop: removes the last element, and shrinks the array size. Not possible with fixed size array
     length
    
    Creating array in memory
        Only fixed array is possible. Hence pop and push is not possible

    Returning array from function:
        Not recommended because the bigger it is, the more gas you use
    */
}

// Video 20: Array Remove An Element By Shifting (Practice)
// Not gas efficient but preserves the order
contract ArrayShift {
    uint256[] public arr;

    function example() public {
        arr = [1, 2, 3];
        delete arr[1];
    }

    // [1,2,3] -- remove(1) --> [1,3,3] --> [1,3]
    // [1,2 ,3 ,4, 5, 6] -- remove(2) --> [1,2,4,5,6,6] --> [1,2,4,5,6]
    // [1] -- remove(0) --> [1] --> [] edge cases
    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2); // [1,2,4,5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0); // []
        assert(arr.length == 0);
    }
}

// Video 21: Array Remove An Element By Replacing Last (Practice)
// Gas efficient but doesn't preserves the order
contract ArrayReplaceLast {
    uint256[] public arr;

    // [1, 2, 3, 4] -- remove(1) --> [1, 4, 3]
    // [1,4, 3] -- remove(2) --> [1, 4]
    function remove(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4];
        remove(1); // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2); // [1,4]

        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
