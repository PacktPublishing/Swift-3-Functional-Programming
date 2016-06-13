//: [Previous](@previous)

import Foundation

func mapOptionals<T, V>(transform: T -> V, input: T?) -> V? {
    switch input {
    case .Some(let value): return transform(value)
    case .None: return .None
    }
}

class User {
    var name: String?
}

func extractUserName(name: String) -> String {
    return "\(name)"
}

var nonOptionalUserName: String {
    let user = User()
    user.name = "John Doe"
    let someUserName = mapOptionals(extractUserName, input: user.name)
    return someUserName ?? ""
}

infix operator <^> { associativity left }

func <^><T, V>(transform: T -> V, input: T?) -> V? {
    switch input {
    case .Some(let value): return transform(value)
    case .None: return .None
    }
}

var nonOptionalUserName2: String {
    let user = User()
    user.name = "John Doe"
    let someUserName = extractUserName <^> user.name
    return someUserName ?? ""
}

// Mutliple optional value mapping

func apply<T, V>(transform: (T -> V)?, input: T?) -> V? {
    switch transform {
    case .Some(let fx): return fx <^> input
    case .None: return .None
    }
}

infix operator <*> { associativity left }
func <*><T, V>(transform: (T -> V)?, input: T?) -> V? {
    switch transform {
    case .Some(let fx): return fx <^> input
    case .None: return .None
    }
}
/*
func extractFullUserName(firstName: String)(lastName: String) -> String {
    return "\(firstName) \(lastName)"
}
*/

func extractFullUserName(firstName: String) -> (String) -> String {
    return { (lastName: String) -> String in
        return "\(firstName) \(lastName)"
    }
}

class User2 {
    var firstName: String?
    var lastName: String?
}

var fullName: String {
    let user = User2()
    user.firstName = "John"
    user.lastName = "Doe"
    let fullUserName = extractFullUserName <^> user.firstName <*> user.lastName
    return fullUserName ?? ""
}

let optionalString: String? = "A String literal"
let result = optionalString.map { "\($0) is mapped" }

let optionalArray: [String?] = ["First", "Second", nil, "Fourth"]
let nonOptionalArray = optionalArray.flatMap { $0 }
print(nonOptionalArray)



//: [Next](@next)
