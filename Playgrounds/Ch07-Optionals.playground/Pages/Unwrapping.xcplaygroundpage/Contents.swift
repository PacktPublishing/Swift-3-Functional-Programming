//: [Previous](@previous)

import Foundation

var anOptional: Optional<String>

var optionalString: String? = "A String literal"

// Unwrapping optionals

print(optionalString)

// Force unwrapping

print(optionalString!)

// nil checking

if optionalString != nil {
    print(optionalString!)
}

// Optional binding

let nilName:String? = nil
if let familyName = nilName {
    let greetingfamilyName = "Hello, Mr. \(familyName)"
} else {
    // Optional does not have a value
}

let dict = ["One": 1, "Two": 2, "Three": 3]

if let firstValue = dict["One"] {
    if let secondValue = dict["Two"] {
        if let thirdValue = dict["Three"] {
            // Do something with three values
        }
    }
}

// Multiple optional binding

if let firstValue = dict["One"],
    let secondValue = dict["Two"],
    let thirdValue = dict["Three"] {
    print("\(firstValue) \(secondValue) \(thirdValue)") // prints 1 2 3
}

//: [Next](@next)
