//: [Previous](@previous)

import Foundation

// struct with copying behavior

struct ourStruct {
    var data: Int = 3
}

var valueA = ourStruct()
var valueB = valueA // valueA is copied to valueB
valueA.data = 5 // Changes valueA, not valueB
print("\(valueA.data), \(valueB.data)") // prints "5, 3"

// class with referencing behavior

class ourClass {
    var data: Int = 3
}

var referenceA = ourClass()
var referenceB = referenceA // referenceA is copied to referenceB
referenceA.data = 5 // changes the instance referred to by referenceA and referenceB
print("\(referenceA.data), \(referenceB.data)") // prints "5, 5"

// Value and reference type constans

class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let grace = User(name: "Grace")
let tamina = User(name: "Tamina")

struct Student {
    var user: User
}

let student = Student(user: grace)
// student.user = tamina // compiler error - cannot assign to property: 'student' is a 'let' constant

tamina.name = "Su Tamina"
print(tamina.name) // prints "Su Tamina"

//: [Next](@next)
