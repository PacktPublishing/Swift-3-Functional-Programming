//: [Previous](@previous)

import Foundation

// What are Generics and what kind of problems they solve?


func swapTwoValues(a: inout Int, b: inout Int) {
	let tempA = a
	a = b
	b = tempA
}

func swapTwoValues(a: inout String, b: inout String) {
	let tempA = a
	a = b
	b = tempA
}

func swapTwoValues(a: Any, b: Any) -> (a: Any, b: Any) {
	let temp = a
	let newA = b
	let newB = temp
	return (newA, newB)
}


var name = "John Doe"
var phoneNumber = 5141111111

let (a, b) = swapTwoValues(a: name, b: phoneNumber)

func swapTwoValues<T>(a: T, b: T) -> (a: T, b: T) {
	let temp = a
	let newA = b
	let newB = temp
	return (newA, newB)
}

//let (a, b) = swapTwoValues(a: name, b: phoneNumber) // Compile error - Cannot invke 'swapTwoValues' with an argument list of type 'String, b: Int)'

func addTwoValues(a: Int, b: Int) -> Int {
	return a + b
}

func square(a: Int) -> Int {
	return a * a
}

func addTwoSquaredValues(a: Int, b: Int) -> Int {
	return (a * a) + (b * b)
}

//typealias AddSubtractOperator = (Int, Int) -> Int
//typealias SquareTripleOperator = (Int) -> Int
//
//func calcualte(a: Int, b: Int, funcA: AddSubtractOperator, funcB: SquareTripleOperator) -> Int {
//
//	return funcA(funcB(a), funcB(b))
//}
//
//print("The result of adding two squared values is: \(calcualte(a: 2, b: 2, funcA: addTwoValues, funcB: square))") // prints “The result of adding two squared value is: 8”


//func calcualte<T>(a: T, b: T, funcA: (T, T) -> T, funcB: (T) -> T) -> T {
//
//	return funcA(funcB(a), funcB(b))
//}

// Swift 3.0 examples

typealias AddSubtractOperator<T> = (T, T) -> T
typealias SquareTripleOperator<T> = (T) -> T

func calcualte<T>(a: T, b: T, funcA: AddSubtractOperator<T>, funcB: SquareTripleOperator<T>) -> T {

	return funcA(funcB(a), funcB(b))
}

print("The result of adding two squared values is: \(calcualte(a: 2, b: 2, funcA: addTwoValues, funcB: square))") // prints “The result of adding two squared value is: 8”

typealias StringDictionary<T> = Dictionary<String, T>
typealias DictionaryOfStrings<T: Hashable> = Dictionary<T, String>
typealias IntFunction<T> = (T) -> Int
typealias Vec3<T> = (T, T, T)
typealias BackwardTriple<T1, T2, T3> = (T3, T2, T1)


//: [Next](@next)
