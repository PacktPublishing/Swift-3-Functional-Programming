//: [Previous](@previous)

import Foundation

// Generics

func swapTwoIntegers(inout a: Int, inout b: Int) {
    let tempA = a
    a = b
    b = tempA
}

func swapTwoValues<T>(inout a: T, inout b: T) {
    let tempA = a
    a = b
    b = tempA
}

//: [Next](@next)
