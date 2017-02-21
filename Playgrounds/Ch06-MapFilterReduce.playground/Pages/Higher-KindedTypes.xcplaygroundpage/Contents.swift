//: [Previous](@previous)

import Foundation

let intArray: Array<Int> = [1, 2, 3]
let newArray = intArray.map { String($0) } // produces Array<String>
print(newArray)
let intSet: Set<Int> = [1, 2, 3]
let newSet = intSet.map { String($0) }   // produces Set<String>
print(newSet)

//protocol Functor {
//	associatedtype A
//	func fmap<FB where FB ~= Self>(f: A -> FB.A) -> FB
//}
//: [Next](@next)
