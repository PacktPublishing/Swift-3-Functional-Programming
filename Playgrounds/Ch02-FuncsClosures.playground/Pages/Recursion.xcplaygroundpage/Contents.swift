//: [Previous](@previous)

import Foundation

/*
func factorial(n: Int) -> Int {
    return n * factorial(n - 1)
}
*/

func factorial(n: Int) -> Int {
    return n == 0 || n == 1 ? 1 : n * factorial(n - 1)
}

print(factorial(3))

// recursive example

func powerOfTwo(n: Int) -> Int {
    return n == 0 ? 1 : 2 * powerOfTwo(n - 1)
}

let fnResult = powerOfTwo(3)

// Non-recursive version

func power2(n: Int) -> Int {
    var y = 1
    for _ in 0...n-1 {
        y *= 2
    }
    return y
}

let result = power2(4)

// Recursive example

func repateString(str: String, n: Int) -> String {
    return n == 0 ? "" : str + repateString(str , n: n - 1)
}

print(repateString("Hello", n: 4))

// Non-recursive version

func repeatString(str: String, n: Int) -> String {
    var ourString = ""
    for _ in 1...n {
        ourString += str
    }
    return ourString
}

print(repeatString("Hello", n: 4))




//: [Next](@next)
