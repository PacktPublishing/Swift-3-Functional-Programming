//: [Previous](@previous)

import Foundation

let twoDimensionalArray = [[1, 3, 5], [2, 4, 6]]
let oneDimensionalArray = twoDimensionalArray.flatMap { $0 }
oneDimensionalArray

let transofrmedOneDimensionalArray = twoDimensionalArray.flatMap { $0.map { $0 + 2 } }
transofrmedOneDimensionalArray

let threeDimensionalArray = [[1, [3, 5]], [2, [4, 6]]]
let twoDimensionalArray2 = threeDimensionalArray.flatMap { $0 }
twoDimensionalArray2

//: [Next](@next)
