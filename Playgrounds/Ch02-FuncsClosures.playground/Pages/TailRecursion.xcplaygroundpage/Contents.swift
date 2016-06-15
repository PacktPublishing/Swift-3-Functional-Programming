//: [Previous](@previous)

import Foundation

func factorial(n: Int, currentFactorial: Int = 1) -> Int {
    return n == 0 ? currentFactorial : factorial(n: n - 1, currentFactorial: currentFactorial * n)
}

print(factorial(n: 3))

/*
factorial(n: 3, currentFactorial: 1)
return factorial(n: 2, currentFactorial: 1 * 3) // n = 3
return factorial(n: 1, currentFactorial: 3 * 2) // n = 2
return 6 // n = 1
*/



//: [Next](@next)
