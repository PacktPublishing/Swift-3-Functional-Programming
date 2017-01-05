//: [Previous](@previous)

import Foundation

let twoDimensionalArray = [[1, 3, 5], [2, 4, 6]]

let oneDimArray2 = twoDimensionalArray.joined().map { $0 }
oneDimArray2

let oneDimensionalArray = twoDimensionalArray.joined().map { $0 + 2 }
print(oneDimensionalArray)
//: [Next](@next)
