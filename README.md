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

        function getJson() public returns(string json){
            return(
                JSONGenerator._createJSON([
                    JSONGenerator._addSingle("single0", "value0", true),
                    JSONGenerator._addSingle("single1", "value1", true),
                    JSONGenerator._addObject("object0",
                        [
                            JSONGenerator._addSingle("single2", "value2", true),
                            JSONGenerator._addSingle("single3", "value3", true),
                            JSONGenerator._addArray("array0",
                                [
                                    "0", "1", "2"
                                ],
                                false
                            ),
                            JSONGenerator._addArray("array1",
                                [
                                    "element0", "element1", "element2"
                                ],
                                true
                            )
                        ]
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
*   ##### JSONGenerator._addArray:    
    ```solidity
    function _addArray(
        string name,
        string[] values,
        bool isStringValues
    ) internal virtual returns(string element)
    ```
    This function creates a array key-value pair:
    *   `name` - The key name of the key-value pair.
    *   `values` - The value of the key-value pair.
    *   `isStringValues` - Arrays of flags indicating whether the value is a string or not.
    *   `element` - String of key-value pair.
*   ##### JSONGenerator._addObject:    
    ```solidity
    function _addObject(
        string name,
        string[] elements
    ) internal virtual returns(string element)
    ```
    The function for forming an object from elements:
    *   `name` - The key name of the key-value pair.
    *   `elements` - Array of string elements.
    *   `element` - String of key-value pair.