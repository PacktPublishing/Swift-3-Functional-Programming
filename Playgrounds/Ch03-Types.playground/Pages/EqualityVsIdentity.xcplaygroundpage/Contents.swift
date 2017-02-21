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

let tarang = User(name: "Tarang")
let sangeeth = User(name: "Sangeeth")

if tarang === sangeeth {
    print("Identical")
} else {
    print("Not identical") // prints "Not identical"
}

//: [Next](@next)
