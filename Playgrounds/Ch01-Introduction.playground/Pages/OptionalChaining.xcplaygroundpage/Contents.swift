//: [Previous](@previous)

import Foundation


// Optional chaining
class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let jeanMarc = Person()
// This can be used for calling methods and subscripts through optional chaining too
if let roomCount = jeanMarc.residence?.numberOfRooms {
    // Use the roomCount
}


//: [Next](@next)
