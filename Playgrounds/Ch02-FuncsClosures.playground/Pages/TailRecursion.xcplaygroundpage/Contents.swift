//: [Previous](@previous)

import Foundation

func factorial(n: Int, currentFactorial: Int = 1) -> Int {
    return n == 0 ? currentFactorial : factorial(n - 1, currentFactorial: currentFactorial * n)
}

print(factorial(3))

/*
factorial(3, currentFactorial: 1)
return factorial(2, currentFactorial: 1 * 3) // n = 3
return factorial(1, currentFactorial: 3 * 2) // n = 2
return 6 // n = 1
*/



//: [Next](@next)
