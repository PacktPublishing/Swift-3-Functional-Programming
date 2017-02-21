//: [Previous](@previous)

import Foundation

// For loops

let scores = [65, 75, 92, 87, 68]
var teamScore = 0

for score in scores {
    if score > 70 {
        teamScore = teamScore + 3
    } else {
        teamScore = teamScore + 1
    }
}

// C style for loops
/*
 var count = 0
 for var i = 0; i < 3; ++i {
 count += i
 }
 */

var count = 0
for i in 0...3 {
    count += i
}

// while loops

var n = 2
while n < 100 {
    n = n * 2
}

var m = 2
repeat {
    m = m * 2
} while m < 100

// stride

let fourToTwo = Array(stride(from: 4, to: 1, by: -1)) // [4, 3, 2]
let fourToOne = Array(stride(from:4, through: 1, by: -1)) // [4, 3, 2, 1]

// if

let anEmptyString = ""
if anEmptyString.isEmpty {
    print("An empty String")
} else {
    // String is not empty.
}

// switch case

let aNumber = "Four or Five"
switch aNumber {
case "One":
    let one = "One"
case "Two", "Three":
    let twoOrThree = "Two or Three"
case let x where x.hasSuffix("Five"):
    let fourOrFive = "it is \(x)"
default:
    let anyOtherNumber = "Any other number"
}

// guard

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello Ms \(name)!")
}
//: [Next](@next)
