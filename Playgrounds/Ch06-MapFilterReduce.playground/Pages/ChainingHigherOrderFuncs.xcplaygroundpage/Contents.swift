//: [Previous](@previous)

import Foundation

struct User {
    let name: String
    let age: Int
}

let users = [
    User(name: "Fehiman",  age: 60),
    User(name: "Alain",    age: 45),
    User(name: "Jean-Marc", age: 69),
    User(name: "Tamina",   age: 6),
    User(name: "Neco",  age: 29)
]

let totalAge = users.map { return $0.age }.reduce(0) { return $0 + $1 }


//: [Next](@next)
