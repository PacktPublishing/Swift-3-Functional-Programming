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
let sumOfNumbers = reduce(elements: listOfNumbers, initial: 0, combine: +)
print(sumOfNumbers)

// Product of an array

let productOfNumbers = reduce(elements: listOfNumbers, initial: 1, combine: *)
print(productOfNumbers)

// Removing nil values from an array

let optionalArray: [String?] = ["First", "Second", nil, "Fourth"]
let nonOptionalArray = optionalArray.flatMap { $0 }
print(nonOptionalArray)

// Removing duplicates from an array

let arrWithDuplicates = [1, 1, 2, 3, 3, 4, 4, 5, 6, 7]

let arrWithoutDuplicates = arrWithDuplicates.reduce([]) {
	(a: [Int], b: Int) -> [Int] in
    if a.contains(b) {
        return a
    } else {
        return a + [b]
    }
}
print(arrWithoutDuplicates)
// Partitioning an array

typealias Accumlator = (lPartition: [Int], rPartition: [Int])

func partition(list: [Int], criteria: (Int) -> Bool) -> Accumlator {
    return list.reduce((lPartition: [Int](), rPartition: [Int]())) {
        (accumlator: Accumlator, pivot: Int) -> Accumlator in
        if criteria(pivot) {
            return (lPartition: accumlator.lPartition + [pivot], rPartition: accumlator.rPartition)
        } else {
            return (rPartition: accumlator.rPartition + [pivot], lPartition: accumlator.lPartition)
        }
    }
}

let numbersToPartition = [3, 4, 5, 6, 7, 8, 9]
print(partition(list: numbersToPartition) { $0 % 2 == 0 })

// Generic version:

func genericPartition<T>(list: [T], criteria: (T) -> Bool) -> (lPartition: [T], rPartition: [T]) {

    return list.reduce((lPartition: [T](), rPartition: [T]())) {
        (accumlator: (lPartition: [T], rPartition: [T]), pivot: T) -> (lPartition: [T], rPartition: [T]) in
        if criteria(pivot) {
            return (lPartition: accumlator.lPartition + [pivot], rPartition: accumlator.rPartition)
        } else {
            return (rPartition: accumlator.rPartition + [pivot], lPartition: accumlator.lPartition)
        }
    }
}

let doublesToPartition = [3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
let partitioned = genericPartition(list: doublesToPartition) {
	$0.truncatingRemainder(dividingBy: 2.0) == 0
}
print(partitioned)

