//: [Previous](@previous)

import Foundation

// Functions

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Ted", day:"Saturday")

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
sumOf(7, 9, 45)

// mutable and immutable parameters

func alignRight(var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

// inout parameters

func swapTwoInts(inout a: Int, inout b: Int) {
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
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//: [Next](@next)
