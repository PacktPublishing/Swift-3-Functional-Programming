
//: [Previous](@previous)

import Foundation

/*
protocol Semigroup {
    func operation(_ element: Self) -> Self
}

extension Int: Semigroup {
    func operation(_ element: Int) -> Int {
        return self + element
    }
}

let number: Int = 5
number.operation(3)

// Associativity

let numberA: Int = 3
let numberB: Int = 5
let numberC: Int = 7

if numberA.operation(numberB.operation(numberC)) == (numberA.operation(numberB)).operation(numberC) {
    print("Operation is associative")
}

precedencegroup AssociativityLeft {
	associativity: left
}

infix operator <> : AssociativityLeft

func <> <S: Semigroup> (x: S, y: S) -> S {
    return x.operation(y)
}

if (numberA <> (numberB <> numberC)) == ((numberA <> numberB) <> numberC) {
    print("Operation is associative")
}

extension Array: Semigroup {
    func operation(_ element: Array) -> Array {
        return self + element
    }
}

print([1, 2, 3, 4] <> [5, 6, 7]) // prints "[1, 2, 3, 4, 5, 6, 7]"

extension String: Semigroup {
    func operation(_ element: String) -> String {
        return "\(self)\(element)"
    }
}

func sconcat <S: Semigroup> (initial: S, elements: [S]) -> S {
    return elements.reduce(initial, <>)
}

print(sconcat(initial: 0, elements:[1, 2, 3])) // 6
print(sconcat(initial: "", elements: ["A", "B", "C"])) // ABC
print(sconcat(initial: [], elements: [[1, 2], [3, 4, 5]])) // [1, 2, 3, 4, 5]
*/

precedencegroup AssociativityLeft {
    associativity: left
}

infix operator <> : AssociativityLeft

func <> <S: Semigroup> (x: S, y: S) -> S {
    return x.operation(y)
}

protocol Semigroup {
    func operation(_ element: Self) -> Self
}

extension Int: Semigroup {
    func operation(_ element: Int) -> Int {
        return self + element
    }
}

extension String : Semigroup {
    func operation(_ element: String) -> String {
        return self + element
    }
}

extension Array : Semigroup {
    func operation(_ element: Array) -> Array {
        return self + element
    }
}

func sconcat <S: Semigroup> (initial: S, elements: [S]) -> S {
    return elements.reduce(initial, <>)
}

print(sconcat(initial: 0, elements:[1, 2, 3])) // 6
print(sconcat(initial: "", elements: ["A", "B", "C"])) // ABC
print(sconcat(initial: [], elements: [[1, 2], [3, 4, 5]])) // [1, 2, 3, 4, 5]


//: [Next](@next)
