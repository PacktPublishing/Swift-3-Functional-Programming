//: [Previous](@previous)

import Foundation

let numbers = [10, 30, 91, 50, 100, 39, 74]
let evenNumbers = numbers.filter { $0 % 2 == 0 }

func filter<Element>(elements: [Element], predicate: ((Element) -> Bool)) -> [Element] {
    var result = [Element]()
    for element in elements {
        if predicate(element) {
            result.append(element)
        }
    }
    return result
}

let filteredArray = filter(elements: numbers) { $0 % 2 == 0 }
filteredArray

//: [Next](@next)
