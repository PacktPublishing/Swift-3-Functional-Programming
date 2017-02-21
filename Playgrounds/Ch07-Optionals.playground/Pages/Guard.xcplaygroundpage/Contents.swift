//: [Previous](@previous)

import Foundation

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello Ms \(name)!")
}

greet(person: ["name": "Neco"]) // prints "Hello Ms Neco!"

func extractValue(dict: [String: Int]) {
    guard let firstValue = dict["One"],
        let secondValue = dict["Two"],
        let thirdValue = dict["Three"]
        else {
            return
    }
    print("\(firstValue) \(secondValue) \(thirdValue)")
}

//: [Next](@next)
