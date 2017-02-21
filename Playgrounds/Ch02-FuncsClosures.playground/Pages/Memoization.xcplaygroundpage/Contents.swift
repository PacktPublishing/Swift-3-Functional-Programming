//: [Previous](@previous)

import Foundation

// Simple memoization

var memo = Dictionary<Int, Int>()

func memoizedPower2(n: Int) -> Int {
    if let memoizedResult = memo[n] {
        return memoizedResult
    }
    var y = 1
    for _ in 0...n-1 {
        y *= 2
    }
    memo[n] = y
    return y
}
print(memoizedPower2(n: 2))
print(memoizedPower2(n: 3))
print(memoizedPower2(n: 4))
print(memo) // result: [2: 4, 3: 8, 4: 16]

// Advanced memoization

func memoize<T: Hashable, U>(fn: @escaping ((T) -> U, T) -> U) -> (T) -> U {
    var memo = Dictionary<T, U>()
    var result: ((T) -> U)!
    result = {
        x in
        if let q = memo[x] { return q }
        let r = fn(result, x)
        memo[x] = r
        return r
    }
    return result
}

let factorial = memoize {
    factorial, x in
    x == 0 ? 1 : x * factorial(x - 1)
}

print(factorial(5))

let powerOf2 = memoize {
    pow2, x in
    x == 0 ? 1 : 2 * pow2(x - 1)
}

print(powerOf2(5))

