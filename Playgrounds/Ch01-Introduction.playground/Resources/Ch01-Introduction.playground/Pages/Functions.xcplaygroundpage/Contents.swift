//: [Previous](@previous)

import Foundation

// Functions

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}

greet(name: "Jorge", day: "Saturday")

// Variable number of arguments in functions - Variadic Parameters
func sumOf(numbers:Int...) -> (Int, Int) {
    var sum = 0
    var counter = 0
    for number in numbers {
        sum += number
        counter += 1
    }
    return (sum, counter)
}

sumOf()
sumOf(numbers: 7, 9, 45)

// inout parameters

func swapTwoInts( a: inout Int, b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// Nested functions

func returnTwenty() -> Int {
    var y = 10
    func add() {
        y += 10
    }
    add()
    return y
}

returnTwenty()

// Return another function as its value
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

//: [Next](@next)
