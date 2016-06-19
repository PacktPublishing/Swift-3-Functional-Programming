//: [Previous](@previous)

import Foundation

class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let julie = User(name: "Julie")
let steve = User(name: "Steve")
let alain = User(name: "Alain")
let users = [alain, julie, steve]

let copyOfUsers = users
users[0].name = "Jean-Marc"

print(users[0].name) // prints "Jean-Marc"
print(copyOfUsers[0].name) // prints "Jean-Marc"


//: [Next](@next)
