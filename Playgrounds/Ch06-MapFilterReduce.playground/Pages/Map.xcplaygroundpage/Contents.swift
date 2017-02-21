//: [Previous](@previous)

import Foundation

let numbers = [10, 30, 91, 50, 100, 39, 74]
var formattedNumbers: [String] = []

for number in numbers {
	let formattedNumber = "\(number)$"
	formattedNumbers.append(formattedNumber)
}

let mappedNumbers = numbers.map { "\($0)$" }

func calculate<T>(a: T, b: T, funcA: (T, T) -> T, funcB: (T) -> T) -> T {

	return funcA(funcB(a), funcB(b))
}

func calculate<T, U>(a: T, funcA: (T) -> U) -> U {

	return funcA(a)
}

func calculate<T, U>(a: [T], funcA: ([T]) -> [U]) -> [U] {

	return funcA(a)
}

func map<T, U>(a: [T], transform: ([T]) -> [U]) -> [U] {
	return transform(a)
}

func map<ElementInput, ElementResult>(elements: [ElementInput], transform: (ElementInput) -> ElementResult) -> [ElementResult] {

	var result: [ElementResult] = []
	for element in elements {
		result.append(transform(element))
	}
	return result
}

let result = map(elements: numbers, transform: { $0 + 2 })
print(result)

//: [Next](@next)
