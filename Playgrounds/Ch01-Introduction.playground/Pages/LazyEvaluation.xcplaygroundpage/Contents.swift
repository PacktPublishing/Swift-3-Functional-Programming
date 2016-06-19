//: [Previous](@previous)
//: ### Lazy evaluation

import Foundation

let oneToFour = [1, 2, 3, 4]
let firstNumber = oneToFour.lazy.map({ $0 * 3}).first!
print(firstNumber) // The result is going to be 3
//: [Next](@next)
