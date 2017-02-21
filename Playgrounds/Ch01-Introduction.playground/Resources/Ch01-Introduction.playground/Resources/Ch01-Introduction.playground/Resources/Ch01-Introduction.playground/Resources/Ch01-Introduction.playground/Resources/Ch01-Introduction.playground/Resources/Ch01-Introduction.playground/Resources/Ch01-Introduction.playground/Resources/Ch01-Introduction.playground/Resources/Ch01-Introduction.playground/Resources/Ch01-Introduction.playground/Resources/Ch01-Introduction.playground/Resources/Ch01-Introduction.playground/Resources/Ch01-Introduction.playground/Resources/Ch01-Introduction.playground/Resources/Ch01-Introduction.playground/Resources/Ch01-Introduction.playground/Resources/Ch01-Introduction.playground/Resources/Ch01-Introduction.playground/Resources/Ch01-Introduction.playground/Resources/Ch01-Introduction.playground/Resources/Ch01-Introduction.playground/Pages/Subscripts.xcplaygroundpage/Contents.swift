//: [Previous](@previous)

import Foundation

// Subscripts

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let fiveTimesTable = TimesTable(multiplier: 5)
print("six times five is \(fiveTimesTable[6])")
// prints "six times five is 30”

//: [Next](@next)
