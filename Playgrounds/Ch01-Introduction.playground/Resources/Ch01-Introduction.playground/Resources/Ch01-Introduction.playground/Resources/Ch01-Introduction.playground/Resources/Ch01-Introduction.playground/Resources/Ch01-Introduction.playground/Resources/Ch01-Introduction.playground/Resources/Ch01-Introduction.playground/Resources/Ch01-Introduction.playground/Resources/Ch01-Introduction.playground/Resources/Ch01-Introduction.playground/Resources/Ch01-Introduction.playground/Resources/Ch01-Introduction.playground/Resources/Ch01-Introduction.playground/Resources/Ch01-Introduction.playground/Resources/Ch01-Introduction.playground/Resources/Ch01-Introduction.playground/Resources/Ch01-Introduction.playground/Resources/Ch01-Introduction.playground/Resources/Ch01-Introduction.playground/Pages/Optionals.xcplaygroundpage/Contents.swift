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

// Optional chaining
class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let jeanMarc = Person()
// This can be used for calling methods and subscripts through optional chaining too
if let roomCount = jeanMarc.residence?.numberOfRooms {
    // Use the roomCount
}
//: [Next](@next)
