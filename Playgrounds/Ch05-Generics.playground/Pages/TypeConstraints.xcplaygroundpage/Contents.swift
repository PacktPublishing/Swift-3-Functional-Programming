//: [Previous](@previous)

import Foundation

protocol NumericType {
	static func +(lhs: Self, rhs: Self) -> Self
	static func -(lhs: Self, rhs: Self) -> Self
	static func *(lhs: Self, rhs: Self) -> Self
	static func /(lhs: Self, rhs: Self) -> Self
	static func %(lhs: Self, rhs: Self) -> Self
}

extension Double : NumericType { }
extension Float  : NumericType { }
extension Int    : NumericType { }
extension Int8   : NumericType { }
extension Int16  : NumericType { }
extension Int32  : NumericType { }
extension Int64  : NumericType { }
extension UInt   : NumericType { }
extension UInt8  : NumericType { }
extension UInt16 : NumericType { }
extension UInt32 : NumericType { }
extension UInt64 : NumericType { }

func calculate<T: NumericType>(a: T, b: T, funcA: (T, T) -> T, funcB: (T) -> T) -> T {

	return funcA(funcB(a), funcB(b))
}

func addTwoValues(a: Int, b: Int) -> Int {
	return a + b
}

func square(a: Int) -> Int {
	return a * a
}

print("The result of adding two squared values is: \(calculate(a: 2, b: 2, funcA: addTwoValues, funcB: square))") // prints “The result of adding two squared value is: 8”

func format(a: String) -> String {
	return "formatted \(a)"
}

func appendStrings(a: String, b: String) -> String {
	return a + b
}

//print("The result is: \(calculate(a: "2", b: "2", funcA: appendStrings, funcB: format))") // Compile error - Cannot convert value of types '(String, b: String) -> String' to expected argument type'(_, _) -> _'



//: [Next](@next)
