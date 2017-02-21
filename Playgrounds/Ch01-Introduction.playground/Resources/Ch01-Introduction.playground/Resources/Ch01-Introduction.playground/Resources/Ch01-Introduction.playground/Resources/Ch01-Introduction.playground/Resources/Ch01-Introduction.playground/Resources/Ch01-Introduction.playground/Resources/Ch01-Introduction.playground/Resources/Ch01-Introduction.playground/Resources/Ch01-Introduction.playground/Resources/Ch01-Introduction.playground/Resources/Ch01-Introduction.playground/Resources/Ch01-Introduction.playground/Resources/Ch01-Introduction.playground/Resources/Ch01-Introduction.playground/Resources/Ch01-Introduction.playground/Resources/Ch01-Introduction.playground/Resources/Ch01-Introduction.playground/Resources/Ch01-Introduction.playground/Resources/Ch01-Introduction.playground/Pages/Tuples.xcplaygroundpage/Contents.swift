//: [Previous](@previous)

import Foundation

// Tuples

let http400Error = (400, "Bad Request")
// http400Error is of type (Int, String), and equals (400, "Bad Request")

// Decompose a Tuple's content
let (requestStatusCode, requestStatusMessage) = http400Error

//: [Next](@next)
