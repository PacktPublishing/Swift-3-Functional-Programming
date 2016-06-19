//: [Previous](@previous)

import Foundation

// String literal

let aVegetable = "Arugula"

// Initializing an Empty String
var anEmptyString = ""
var anotherEmptyString = String()

if anEmptyString.isEmpty {
    print("String is empty")
}

// Concatenating Strings and Characters

let string1 = "Hello"
let string2 = " Mr"
var welcome = string1 + string2

var instruction = "Follow us please"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)


// String Interpolation

let multiplier = 3
let message = "\(multiplier) times 7.5 is \(Double (multiplier) * 7.5)"
// message is "3 times 2.5 is 22.5”

//: [Next](@next)
