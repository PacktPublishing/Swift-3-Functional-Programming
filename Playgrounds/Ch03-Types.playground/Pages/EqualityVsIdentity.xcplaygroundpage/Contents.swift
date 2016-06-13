//: [Previous](@previous)

import Foundation

class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let firstNumber = 1
let secondNumber = 1

if firstNumber == secondNumber {
    print("Two numbers are equal") // prints "Two numbers are equal\n"
}

let julie = User(name: "Julie")
let steve = User(name: "Steve")

if julie === steve {
    print("Identical")
} else {
    print("Not identical")
}

//: [Next](@next)
