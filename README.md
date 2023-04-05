# Everscale JSON Generator
###### A library for on-chain JSON generation in Solidity language for Everscale.

### Use
*   Install package:
    ```bash
    npm i @alvvo/everscale-json-generator
    ```
*   Example of smart-contract:
    ```solidity
    pragma ton-solidity >= 0.58.1;

    pragma AbiHeader time;
    pragma AbiHeader expire;
    pragma AbiHeader pubkey;

    import "@alvvo/everscale-json-generator/src/JSONGenerator.sol";

    contract Sample {

        constructor() public {
            tvm.accept();
        }

        /**
        *   @notice Sample of use this library 
        */
        function getJson() public returns(string json) {
            return(
                /**
                *   @dev Create JSON
                */
                JSONGenerator._createJSON([
                    /**
                    *   @dev Create single JSON element
                    */
                    JSONGenerator._addSingle("singleString", "text", true),
                    JSONGenerator._addSingle("singleNumber", format("{}", 0), false),
                    /**
                    *   @dev Create single-type arrays (named & unnamed)
                    */
                    JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true),
                    JSONGenerator._addSingleTypeArray(false, "array1", [format("{}", 0), format("{}", 1)], false),
                    /**
                    *   @dev Create multiple-type arrays (named & unnamed)
                    */
                    JSONGenerator._addMultipleTypeArray(true, "array2", [format("{}", 0), "text1"], [false, true]),
                    JSONGenerator._addMultipleTypeArray(false, "array3", [format("{}", 0), "text1"], [false, true]),
                    /**
                    *   @dev Create objects (named & unnamed)
                    */
                    JSONGenerator._addObject(true, "object0",
                        [
                            JSONGenerator._addSingle("singleString", "text", true),
                            JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true),
                            JSONGenerator._addMultipleTypeArray(true, "array2", [format("{}", 0), "text1"], [false, true])
                        ]
                    ),
                    JSONGenerator._addObject(false, "object1",
                        [
                            JSONGenerator._addSingle("singleString", "text", true),
                            JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true),
                            JSONGenerator._addMultipleTypeArray(true, "array2", [format("{}", 0), "text1"], [false, true])
                        ]
                    ),
                    /**
                    *   @dev Create object arrays (named & unnamed)
                    */
                    JSONGenerator._addSingleTypeArray(true, "array4", 
                        [
                            JSONGenerator._addObject(true, "object0",
                                [
                                    JSONGenerator._addSingle("singleString", "text", true),
                                    JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true)
                                ]
                            ),
                            JSONGenerator._addObject(true, "object1",
                                [
                                    JSONGenerator._addSingle("singleString", "text", true),
                                    JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true)
                                ]
                            )
                        ], 
                        false
                    ),
                    JSONGenerator._addSingleTypeArray(false, "array5", 
                        [
                            JSONGenerator._addObject(true, "object0",
                                [
                                    JSONGenerator._addSingle("singleString", "text", true),
                                    JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true)
                                ]
                            ),
                            JSONGenerator._addObject(true, "object1",
                                [
                                    JSONGenerator._addSingle("singleString", "text", true),
                                    JSONGenerator._addSingleTypeArray(true, "array0", ["text0", "text1"], true)
                                ]
                            )
                        ], 
                        false
                    )
                ])
            );
        }
    }
    ```
### Description
*   ##### JSONGenerator._createJSON: 
    ```solidity
    function _createJSON(string[] elements) internal virtual returns(string json)
    ```
    This method is essential in JSON generation as it forms the final JSON format for an array of objects:
    *   `elements` - Array of string elements.
    *   `json` - The formated JSON.
*   ##### JSONGenerator._addSingle:    
    ```solidity
    function _addSingle(string name,
        string value,
        bool isStringValue
    ) internal virtual returns(string element)
    ```
    This function creates a single key-value pair:
    *   `name` - The key name of the key-value pair.
    *   `value` - The value of the key-value pair.
    *   `isStringValue` - A flag indicating whether the value is a string or not.
    *   `element` - String of key-value pair.
*   ##### JSONGenerator._addSingleTypeArray:    
    ```solidity
    function _addSingleTypeArray(
        bool isNamed,
        string name,
        string[] values,
        bool isStringValues
    ) internal virtual returns(string element)
    ```
    This function creates a single-type array key-value pair:
    *   `isNamed` - The parameter specifies whether the array will have a key name or not.
    *   `name` - The key name of the key-value pair.
    *   `values` - The value of the key-value pair.
    *   `isStringValues` - A flag indicating whether the value is a string or not.
    *   `element` - String of key-value pair.
*   ##### JSONGenerator._addMultipleTypeArray:    
    ```solidity
    function _addMultipleTypeArray(
        bool isNamed,
        string name,
        string[] values,
        bool[] isStringValues
    ) internal virtual returns(string element)
    ```
    This function creates a single-type array key-value pair:
    *   `isNamed` - The parameter specifies whether the array will have a key name or not.
    *   `name` - The key name of the key-value pair.
    *   `values` - The value of the key-value pair.
    *   `isStringValues` - Arrays of flags indicating whether the value is a string or not.
    *   `element` - String of key-value pair.
*   ##### JSONGenerator._addObject:    
    ```solidity
    function _addObject(
        bool isNamed,
        string name,
        string[] elements
    ) internal virtual returns(string element)
    ```
    The function for forming an object from elements:
    *   `isNamed` - The parameter specifies whether the array will have a key name or not.
    *   `name` - The key name of the key-value pair.
    *   `elements` - Array of string elements.
    *   `element` - String of key-value pair.