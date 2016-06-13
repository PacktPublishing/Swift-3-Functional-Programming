//: [Previous](@previous)

import Foundation

let numbers = [10, 30, 91, 50, 100, 39, 74]
let total = numbers.reduce(0) { $0 + $1 }
total

let total2 = numbers.reduce(0, combine: +)
total2

func reduce<Element, Value>(elements: [Element], initial: Value, combine: (Value, Element) -> Value) -> Value {
    var result = initial
    for element in elements {
        result = combine(result, element)
    }
    return result
}

let total3 = reduce(numbers, initial: 0) { $0 + $1 }
total3

// map function in terms of reduce

func mapIntermsOfReduce<Element, ElementResult>(elements: [Element], transform: Element -> ElementResult) -> [ElementResult] {
    return reduce(elements, initial: [ElementResult]()) {
        $0 + [transform( $1 )]
    }
}

let result = mapIntermsOfReduce(numbers, transform: { $0 + 2 })

// filter function in terms of reduce

func filterIntermsOfReduce<Element>(elements: [Element], predicate: Element -> Bool) -> [Element] {
    return reduce(elements, initial: []) {
        predicate($1) ? $0 + [ $1 ] : $0
    }
}

let result2 = filterIntermsOfReduce(numbers) { $0 % 2 == 0 }

// flatMap in terms of reduce

func flatMapIntermsOfReduce<Element>(elements: [Element], transform: (Element) -> Element?) -> [Element] {
    return reduce(elements, initial: []) {
        guard let transformationResult = transform($1) else {
            return $0
        }
        return $0 + [transformationResult]
    }
}

let anArrayOfNumbers = [1, 3, 5]
let oneDimensionalArray = flatMapIntermsOfReduce(anArrayOfNumbers) { $0 + 5 }
oneDimensionalArray

// flatten in terms of reduce

func flattenIntermsOfReduce<Element>(elements: [[Element]]) -> [Element] {
    return elements.reduce([]) { $0 + $1 }
}

let flattened = flattenIntermsOfReduce([[1, 3, 5], [2, 4, 6]])


//: [Next](@next)
