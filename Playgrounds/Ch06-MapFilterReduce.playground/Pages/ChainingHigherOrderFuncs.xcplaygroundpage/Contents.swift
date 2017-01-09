//: [Previous](@previous)

import Foundation

struct User {
    let name: String
    let age: Int
}

let users = [
    User(name: "Fehiman",  age: 60),
    User(name: "Neco",  age: 29),
    User(name: "Grace",  age: 1),
    User(name: "Tamina",   age: 6),
    User(name: "Negar", age: 27)
]

let totalAge = users.map { $0.age }.reduce(0) { $0 + $1 }
totalAge

//: [Next](@next)
