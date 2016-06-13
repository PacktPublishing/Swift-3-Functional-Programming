//: [Previous](@previous)

import Foundation

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello Ms \(name)!")
}

func extractValue(dict: [String: Int]) {
    guard let
        firstValue = dict["One"],
        secondValue = dict["Two"],
        thirdValue = dict["Three"]
        else {
            return
    }
    // Do something with three values
}


//: [Next](@next)
