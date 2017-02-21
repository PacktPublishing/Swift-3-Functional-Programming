//: [Previous](@previous)

import Foundation


let optionalDict: Dictionary<String, Int>? = ["One": 1, "Two": 2, "Three": 3]
let implicitlyUnwrappedDict: Dictionary<String, Int>! = ["One": 1, "Two": 2, "Three": 3]

let firstValue = optionalDict?["One"]
let implictlyUnwrappedFirstValue = implicitlyUnwrappedDict["One"]

//: [Next](@next)
