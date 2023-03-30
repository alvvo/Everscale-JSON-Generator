pragma ton-solidity >= 0.58.1;

/**
*   @title A library for on-chain JSON generation in Solidity language for Everscale.
*   @author Allvo {https://github.com/alvvo}.
*   @notice You can use this library in your projects for creating dynamic JSON.
*/
library JSONGenerator {

    /**
    *   @notice This method is essential in JSON generation 
    *   as it forms the final JSON format for an array of objects.
    *   @param elements Array of string elements.
    *   that can be created using other functions of the library
    *   @return json - The formated JSON.
    */
    function _createJSON(string[] elements) internal virtual returns(string json) {
        for(uint16 i = 0; i < uint16(elements.length); i++) {
            if(i != uint16(elements.length) - 1) {
                json = json + elements[i] + ",";
            }
            else {
                json = json + elements[i];
            }
        }
        return(
            "\u007B" + json + "\u007D"
        );
    }

    /**
    *   @notice This function creates a single key-value pair.
    *   @param name The key name of the key-value pair.
    *   @param value The value of the key-value pair.
    *   @param isStringValue A flag indicating whether the value is a string or not.
    *   @return element - String of key-value pair.
    */
    function _addSingle(
        string name,
        string value,
        bool isStringValue
    ) internal virtual returns(string element) {
        if(isStringValue) {
            element = "\u0022" + name + "\u0022" + ": " + "\u0022" + value + "\u0022";
        }
        else {
            element = "\u0022" + name + "\u0022" + ": " + value;
        }
        return(element);
    }

    /**
    *   @notice This function creates a array key-value pair.
    *   @param name The key name of the key-value pair.
    *   @param values The value of the key-value pair.
    *   @param isStringValues Arrays of flags indicating whether the value is a string or not.
    *   @return element - String of key-value pair.
    */
    function _addArray(
        string name,
        string[] values,
        bool isStringValues
    ) internal virtual returns(string element) {
        if(isStringValues) {
            for(uint16 i = 0; i < values.length; i++) {
                if(i != uint16(values.length) - 1) {
                    element = element + "\u0022" + values[i] + "\u0022" + ",";
                }
                else {
                    element = element + "\u0022" + values[i] + "\u0022";
                }
            }
        }
        else {
            for(uint16 i = 0; i < values.length; i++) {
                if(i != uint16(values.length) - 1) {
                    element = element + values[i] + ",";
                }
                else {
                    element = element + values[i];
                }
            }
        }
        return(
            "\u0022" + name + "\u0022" + ": " + "[" + element + "]"
        );
    }

    /**
    *   @notice The function for forming an object from elements
    *   @param name The key name of the key-value pair.
    *   @param elements Array of string elements.
    *   @return element - String of key-value pair.
    */
    function _addObject(
        string name,
        string[] elements
    ) internal virtual returns(string element) {
        for(uint16 i = 0; i < elements.length; i++) {
            if(i != uint16(elements.length) - 1) {
                element = element + elements[i] + ",";
            }
            else {
                element = element + elements[i];
            }
        }
        return(
            "\u0022" + name + "\u0022" + ": " + "\u007B" + element + "\u007D"
        );
    }

}