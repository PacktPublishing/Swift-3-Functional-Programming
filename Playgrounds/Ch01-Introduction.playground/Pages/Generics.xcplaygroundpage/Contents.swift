//: [Previous](@previous)

import Foundation

// Generics

func swapTwoIntegers( a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

func swapTwoValues<T>( a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

//: [Next](@next)
