//: [Previous](@previous)

import Foundation

class AClass {
    func instanceMethod(param1: String, param2: String) {
        // function body
    }
    
    class func classMethod(param1: String, param2: String) {
        // function body
    }
}

let aClassInstance = AClass()
aClassInstance.instanceMethod(param1: "first string", param2: "second string")
AClass.classMethod(param1: "first string", param2: "second string")



//funcName(firstParam: "some String", secondParam: "some String")

//func functionName(firstParameter: ParameterType, secondParameter:
//    ParameterType) {
//    // function body
//}
//
//// To call:
//functionName(firstParameter: paramName, secondParameter: secondParamName)


func functionName(externalParamName localParamName: String) {
    
}

functionName(externalParamName: "")


// Parameters with default values

func functionName(param: Int = 3) {
    print("\(param) is provided.")
}

functionName(param: 5) // prints “5 is provided.”
functionName() // prints “3 is provided”

// Parameters as Tuples - deprecated

let numbers = [3, 5, 9, 10]

func convert(numbers: [Int], multiplier: Int) -> [String] {
    let convertedValues = numbers.enumerated().map { (index, element) in
        return "\(index): \(element * multiplier)"
    }
    return convertedValues
}

let resultOfConversion = convert(numbers: numbers, multiplier: 3)

// Pre Swift 3.0

let parameters = (numbers: numbers, multiplier: 3)
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
