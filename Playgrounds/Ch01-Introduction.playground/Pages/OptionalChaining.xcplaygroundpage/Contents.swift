//: [Previous](@previous)

import Foundation


// Optional chaining

class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let liz = Person()
if let roomCount = liz.residence?.numberOfRooms { // This can be used for calling methods and subscripts through optional chaining too
    // Use the roomCount
}


//: [Next](@next)
