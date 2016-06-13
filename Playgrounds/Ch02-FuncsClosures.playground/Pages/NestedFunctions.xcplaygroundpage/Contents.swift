//: [Previous](@previous)

import Foundation

func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
    func plus(a: Int, b: Int) -> Int {
        return a + b
    }
    func minus(a: Int, b: Int) -> Int {
        return a - b
    }
    return isPlus ? plus : minus
}

//: [Next](@next)
