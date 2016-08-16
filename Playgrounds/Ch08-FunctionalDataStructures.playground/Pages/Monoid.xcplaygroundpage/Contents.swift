//: [Previous](@previous)

import Foundation

// Semigroup from previous section

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

// Monoid

protocol Monoid: Semigroup {
    static func identity() -> Self
}

extension Int: Monoid {
    static func identity() -> Int {
        return 0
    }
}

extension String: Monoid {
    static func identity() -> String {
        return ""
    }
}

extension Array: Monoid {
    static func identity() -> Array {
        return []
    }
}

// To test

let numberA: Int = 3
let numberB: Int = 5
let numberC: Int = 7

numberA <> Int.identity() // 3
"A" <> String.identity() // A

func mconcat <M: Monoid> (_ elements: [M]) -> M {
    return elements.reduce(M.identity(), <>)
}

print(mconcat([1, 2, 3])) // 6
print(mconcat(["A", "B", "C"])) // ABC
print(mconcat([[1, 2], [3, 4, 5]])) // [1, 2, 3, 4, 5]

//: [Next](@next)
