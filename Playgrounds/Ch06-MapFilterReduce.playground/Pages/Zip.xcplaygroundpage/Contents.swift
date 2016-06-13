//: [Previous](@previous)

import Foundation

let numbers = [3, 5, 9, 10]
let alphabeticNumbers = ["Three", "Five", "Nine", "Ten"]

let zipped = zip(alphabeticNumbers, numbers).map { $0 }

zipped

//: [Next](@next)
