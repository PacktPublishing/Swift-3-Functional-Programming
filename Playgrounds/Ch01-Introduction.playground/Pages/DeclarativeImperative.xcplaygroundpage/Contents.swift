//: [Previous](@previous)
//: ### Declarative vs. Imperative

let numbers = [9, 29, 19, 79]

// Imperative example
var tripledNumbers:[Int] = []
for number in numbers {
    tripledNumbers.append(number * 3)
}
print(tripledNumbers)

// Declarative example
let tripledIntNumbers = numbers.map({ number in 3 * number })
print(tripledIntNumbers)

//: [Next](@next)