//: [Previous](@previous)

import Foundation

func reduce<Element, Value>(elements: [Element], initial: Value, combine: (Value, Element) -> Value) -> Value {
    var result = initial
    for element in elements {
        result = combine(result, element)
    }
    return result
}

// Sum of an array

let listOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sumOfNumbers = reduce(listOfNumbers, initial: 0, combine: +)

print(sumOfNumbers)

// Product of an array

let productOfNumbers = reduce(listOfNumbers, initial: 1, combine: *)

print(productOfNumbers)

// Removing nil values from an array

let optionalArray: [String?] = ["First", "Second", nil, "Fourth"]
let nonOptionalArray = optionalArray.flatMap { $0 }

print(nonOptionalArray)

// Removing duplicates from an array

let arrayWithDuplicates = [1, 1, 2, 3, 3, 4, 4, 5, 6, 7]

arrayWithDuplicates.reduce([]) { (a: [Int], b: Int) -> [Int] in
    if a.contains(b) {
        return a
    } else {
        return a + [b]
    }
}

// Partitioning an array

typealias Accumlator = (leftPartition: [Double], rightPartition: [Double])

func partition(list: [Double], criteria: (Double) -> Bool) -> Accumlator {
    return list.reduce((leftPartition: [Double](), rightPartition: [Double]())) { (accumlator: Accumlator, pivot: Double) -> Accumlator in
        if criteria(pivot) {
            return (leftPartition: accumlator.leftPartition + [pivot], rightPartition: accumlator.rightPartition)
        } else {
            return (rightPartition: accumlator.rightPartition + [pivot], leftPartition: accumlator.leftPartition)
        }
    }
}

let numbersToPartition = [3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
partition(numbersToPartition) { $0 % 2 == 0 }



//: [Next](@next)
