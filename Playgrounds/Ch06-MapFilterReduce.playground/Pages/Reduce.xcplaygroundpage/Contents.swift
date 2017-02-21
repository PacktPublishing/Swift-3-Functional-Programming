//: [Previous](@previous)

import Foundation

let numbers = [10, 30, 91, 50, 100, 39, 74]
let total = numbers.reduce(0) { $0 + $1 }
total

let total2 = numbers.reduce(0, +)
total2

func reduce<Element, Value>(elements: [Element], initial: Value, combine: (Value, Element) -> Value) -> Value {

	var result = initial
	for element in elements {
		result = combine(result, element)
	}

	return result
}

let total3 = reduce(elements: numbers, initial: 0) { $0 + $1 }
total3

// map function in terms of reduce

func mapIntermsOfReduce<Element, ElementResult>(elements: [Element], transform: (Element) -> ElementResult) -> [ElementResult] {

	return reduce(elements: elements, initial: [ElementResult]()) {
		$0 + [transform( $1 )]
	}
}

let result = mapIntermsOfReduce(elements: numbers, transform: { $0 + 2 })
result

// filter function in terms of reduce

func filterIntermsOfReduce<Element>(elements: [Element], predicate: (Element) -> Bool) -> [Element] {

	return reduce(elements: elements, initial: []) {
		predicate($1) ? $0 + [ $1 ] : $0
	}
}

let result2 = filterIntermsOfReduce(elements: numbers) { $0 % 2 == 0 }

// flatMap in terms of reduce

func flatMapIntermsOfReduce<Element>(elements: [Element], transform: (Element) -> Element?) -> [Element] {

	return reduce(elements: elements, initial: []) {
        guard let transformationResult = transform($1) else {
            return $0
        }
        return $0 + [transformationResult]
    }
}

let anArrayOfNumbers = [1, 3, 5]
let oneDimensionalArray = flatMapIntermsOfReduce(elements: anArrayOfNumbers) { $0 + 5 }


func flatMapIntermsOfReduce<Element>(elements: [[Element]], transform: (Element) -> Element) -> [Element] {

	return elements.reduce([]) { $0 + $1 }
}

let aTwoDimArrayOfNumbers = [[1, 3, 5],[2, 4, 6]]
let flatMappedArray = flatMapIntermsOfReduce(elements: aTwoDimArrayOfNumbers) { $0 }

let flattend = aTwoDimArrayOfNumbers.flatMap { $0 }
flattend

// flatten in terms of reduce

func flattenIntermsOfReduce<Element>(elements: [[Element]]) -> [Element] {
    return elements.reduce([]) { $0 + $1 }
}

let flattened = flattenIntermsOfReduce(elements: aTwoDimArrayOfNumbers)
print(flattened)
let joinedd = aTwoDimArrayOfNumbers.joined().map { $0 }
print(joinedd)

//: [Next](@next)
