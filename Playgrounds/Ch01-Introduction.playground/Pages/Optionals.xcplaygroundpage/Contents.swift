//: [Previous](@previous)

import Foundation

// Optional value either contains a value or contains nil
var optionalString: String? = "A String literal"
optionalString = nil

optionalString = "An optional String"
print(optionalString!)

let nilName: String? = nil
if let familyName = nilName {
    let greetingfamilyName = "Hello, Mr. \(familyName)"
} else {
    // Optional does not have a value
}

//: [Next](@next)
