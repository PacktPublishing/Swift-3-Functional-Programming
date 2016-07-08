//: [Previous](@previous)

import Foundation

func apply<T, V>(fn: ([T]) -> V, args: [T]) -> V {
    return fn(args)
}

let numbers = [1, 3, 5]

func incrementValues(a: [Int]) -> [Int] {
    return a.map { $0 + 1 }
}

let applied = apply(fn: incrementValues, args: numbers)

//: [Next](@next)
