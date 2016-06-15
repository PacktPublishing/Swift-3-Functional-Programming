//: [Previous](@previous)

import Foundation

class SomeClass {
    func funcName(firstParam: String, secondParam: String) {
        // function body
    }
}

let someClassInstance = SomeClass()
let paramName = "parameter name"
let secondParamName = "second Parameter"
someClassInstance.funcName(firstParam: paramName, secondParam: secondParamName)

class StaticClass {
    class func funcName(firstParam: String, secondParam: String) {
        // function body
    }
}

StaticClass.funcName(firstParam: paramName, secondParam: secondParamName)

// Parameters with default values

func functionName(parameter: Int = 3) {
    print("\(parameter) is provided.")
}
functionName(parameter: 5) // prints “5 is provided.”
functionName() // prints “3 is provided”

// Parameters as Tuples - deprecated

let numbers = [3, 5, 9, 10]
func convert(numbers: [Int], multiplier: Int) -> [String] {
    let convertedValues = numbers.enumerated().map { (index, element) in
        return "\(index): \(element * multiplier)"
    }
    return convertedValues
}

// Pre Swift 3.0

//let parameters = (numbers, multiplier: 3)
//convert(parameters)


// Variadic functions

func greet(names: String...) {
    for name in names {
        print("Greetings, \(name)")
    }
}
// To call this function
greet(names: "Steve", "Craig") // prints twice
greet(names: "Steve", "Craig", "Johny") // prints three times

//: [Next](@next)
