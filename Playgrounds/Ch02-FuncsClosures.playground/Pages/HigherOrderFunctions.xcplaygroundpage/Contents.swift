//: [Previous](@previous)

import Foundation

func subtractTwoValues(a: Int, b: Int) -> Int {
    return a - b
}

func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}

func square(a: Int) -> Int {
    return a * a
}

func triple(a: Int) -> Int {
    return a * a * a // or return square(a) * a
}

func subtractTwoSquaredValues(a: Int, b: Int) -> Int {
    return (a * a) - (b * b)
}

func addTwoSquaredValues(a: Int, b: Int) -> Int {
    return (a * a) + (b * b)
}

func multiplyTwoTripledValues(a: Int, b: Int) -> Int {
    return (a * a * a) * (b * b * b)
}

typealias AddSubtractOperator = (Int, Int) -> Int
typealias SquareTripleOperator = (Int) -> Int

func calculate(a: Int, b: Int, funcA: AddSubtractOperator, funcB: SquareTripleOperator) -> Int {
    return funcA(funcB(a), funcB(b))
}

print("The result of adding two squared values is: \(calculate(a: 2, b: 2, funcA: addTwoValues, funcB: square))") // prints “The result of adding two squared value is: 8”

print("The result of subtracting two tripled value is: \(calculate(a: 3, b: 2, funcA:  subtractTwoValues, funcB: triple))") // prints “The result of adding two tripled value is: 19”

//: [Next](@next)
