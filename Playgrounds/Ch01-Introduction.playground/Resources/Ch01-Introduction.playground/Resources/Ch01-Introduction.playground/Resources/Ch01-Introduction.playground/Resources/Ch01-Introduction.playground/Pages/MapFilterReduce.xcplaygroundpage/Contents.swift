//: [Previous](@previous)

import Foundation

// map

// Return an `Array` containing the results of calling `transform(x)` on each element `x` of `self`
// func map<U>(transform: (T) -> U) -> [U]
let numbers = [10, 30, 91, 50, 100, 39, 74]
var formattedNumbers: [String] = []

for number in numbers {
    let formattedNumber = "\(number)$"
    formattedNumbers.append(formattedNumber)
}

let mappedNumbers = numbers.map { "\($0)$" }

// filter

// Return an Array containing the elements x of self for which includeElement(x)` is `true`
// func filter(includeElement: (T) -> Bool) -> [T]
let evenNumbers = numbers.filter { $0 % 2 == 0 }


// reduce

// Return the result of repeatedly calling `combine` with an accumulated value initialized to `initial` and each element of `self`, in turn, i.e. return `combine(combine(...combine(combine(initial, self[0]), self[1]),...self[count-2]), self[count-1])`.
// func reduce<U>(initial: U, combine: (U, T) -> U) -> U
let total = numbers.reduce(0) { $0 + $1 }

//: [Next](@next)
