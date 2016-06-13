//: [Previous](@previous)

import Foundation

/*
protocol Semigroup {
    func operation(element: Self) -> Self
}

extension Int: Semigroup {
    func operation(element: Int) -> Int {
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

infix operator <> { associativity left precedence 150 }

func <> <S: Semigroup> (x: S, y: S) -> S {
    return x.operation(y)
}

if numberA <> (numberB <> numberC) == (numberA <> numberB) <> numberC {
    print("Operation is associative")
}

extension Array: Semigroup {
    func operation(element: Array) -> Array {
        return self + element
    }
}

print([1, 2, 3, 4] <> [5, 6, 7]) // "[1, 2, 3, 4, 5, 6, 7]"

func sconcat <S: Semigroup> (initial: S, elements: [S]) -> S {
    return elements.reduce(initial, combine: <>)
}

print(sconcat(0, elements:[1, 2, 3])) // 6
//print(sconcat("", elements: ["A", "B", "C"])) // ABC
print(sconcat([], elements: [[1, 2], [3, 4, 5]])) // [1, 2, 3, 4, 5]

*/


infix operator <> { associativity left precedence 150 }

func <> <S: Semigroup> (x: S, y: S) -> S {
    return x.operation(y)
}

protocol Semigroup {
    func operation(element: Self) -> Self
}

extension Int: Semigroup {
    func operation(element: Int) -> Int {
        return self + element
    }
}

extension String : Semigroup {
    func operation(element: String) -> String {
        return self + element
    }
}

extension Array : Semigroup {
    func operation(element: Array) -> Array {
        return self + element
    }
}

func sconcat <S: Semigroup> (initial: S, elements: [S]) -> S {
    return elements.reduce(initial, combine: <>)
}

print(sconcat(0, elements:[1, 2, 3])) // 6
print(sconcat("", elements: ["A", "B", "C"])) // ABC
print(sconcat([], elements: [[1, 2], [3, 4, 5]])) // [1, 2, 3, 4, 5]

//: [Next](@next)
