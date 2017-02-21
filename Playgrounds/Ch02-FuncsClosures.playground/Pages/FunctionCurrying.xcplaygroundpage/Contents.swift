//: [Previous](@previous)

import Foundation

func extractFullName(firstName: String, lastName: String) -> String {
    return "\(firstName) \(lastName)"
}

// Pre Swift 3.0
//func curriedExtractFullUserName(firstName: String)(lastName: String) -> String {
//    return "\(firstName) \(lastName)"
//}
//
//let fnIncludingFirstName = curriedExtractFullUserName("John")
//let extractedFullName = fnIncludingFirstName(lastName: "Doe")

// Swift 3.0 syntax

// Before:
//func curried(x: Int)(y: String) -> Float {
//    return Float(x) + Float(y)!
//}

// Swift 3.0 syntax:
func curried(x: Int) -> (String) -> Float {
    return {
        (y: String) -> Float in
        return Float(x) + Float(y)!
    }
}

// Explicitly return closures

func explicityRetunClosure(firstName: String) -> (String) -> String {
    return {
        (lastName: String) -> String in
        return "\(firstName) \(lastName)"
    }
}

let fnIncludingFirstName = explicityRetunClosure(firstName: "John")
let extractedFullName = fnIncludingFirstName("Doe")

//: [Next](@next)
