//: [Previous](@previous)

import Foundation

let twoDimArray = [[1, 3, 5], [2, 4, 6]]
let oneDimArray = twoDimArray.flatMap { $0 }
oneDimArray

let oneDimArray2 = twoDimArray.joined().map { $0 }
oneDimArray2


let transofrmedOneDimArray = twoDimArray.flatMap { $0.map { $0 + 2 } }
transofrmedOneDimArray


let threeDimArray = [[1, [3, 5]], [2, [4, 6]]]
let twoDimArray2 = threeDimArray.flatMap { $0 }
twoDimArray2

//: [Next](@next)
