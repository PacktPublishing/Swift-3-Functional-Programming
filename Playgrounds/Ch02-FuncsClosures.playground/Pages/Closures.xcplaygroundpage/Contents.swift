//: [Previous](@previous)

import Foundation

// let closureName: (Int) -> (Int) = {/* */ } Example:
let closureName: (Int) -> (Int) = { _ in 10 }

// var closureName: (Int) -> (Int)?

typealias closureType = (Int, Int) -> (Int)

// Closures as arguments in function calls

func aFunc(closure: (Int) -> Int) -> Int  {
    // Statements, for example:
    return closure(5)
}

let result = aFunc(closure: {
    number in
    // Statements, for example:
    return number * 3
})

print(result) // prints 15


// Closures as function parameters

var anArray = [1, 2, 5, 3, 6, 4]

anArray.sort(by: {
    (param1: Int, param2: Int) -> Bool in
    return param1 < param2
})

// Simpler syntax with implied parameter types

anArray.sort(by: {
    (param1, param2) -> Bool in
    return param1 < param2
})

//// Simpler syntax with implied return type

anArray.sort(by: {
    (param1, param2) in
    return param1 < param2
})

// Simpler syntax with a trailing closure

anArray.sort {
    (param1, param2) in
    return param1 < param2
}

// Simpler syntax with shorthand argument notation

anArray.sort {
    return $0 < $1
}

// Simpler syntax if we have only one line of expression in our closures

anArray.sort { $0 < $1 }


//: [Next](@next)
