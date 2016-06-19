//: [Previous](@previous)

import Foundation

// var simpleMathOperator: (Double, Double) -> Double

typealias SimpleOperator = (Double, Double) -> Double

var simpleMathOperator: SimpleOperator

func addTwoNumbers(a: Double, b: Double) -> Double { return a + b }

func subtractTwoNumbers(a: Double, b: Double) -> Double { return a - b }

func divideTwoNumbers(a: Double, b: Double) -> Double { return a / b }

func multiplyTwoNumbers(a: Double, b: Double) -> Double { return a * b }

// Assignment

simpleMathOperator = multiplyTwoNumbers

let result = simpleMathOperator(3.0, 4.0) // result is 12

// Assignment

simpleMathOperator = addTwoNumbers
let result2 = simpleMathOperator(3.5, 5.5) // result is 9

//// Parameter type of a function

func calculateResult(mathOperator: SimpleOperator, a: Double, b: Double) -> Double {
    return mathOperator(a, b)
}

print("The result is \(calculateResult(mathOperator: simpleMathOperator, a: 3.5, b: 5.5))") // prints “The result is 9.0”

// Return type of a function

func choosePlusMinus(isPlus: Bool) -> SimpleOperator {
    return isPlus ? addTwoNumbers : subtractTwoNumbers
}

let chosenOperator = choosePlusMinus(isPlus: true)
print("The result is \(chosenOperator(3.5, 5.5))") // prints “The result is 9.0”

//: [Next](@next)
