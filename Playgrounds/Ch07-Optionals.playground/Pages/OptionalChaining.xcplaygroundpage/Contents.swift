//: [Previous](@previous)

import Foundation

class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let residence = Residence()
residence.numberOfRooms = 5

let sangeeth = Person()
sangeeth.residence = residence

if let roomCount = sangeeth.residence?.numberOfRooms {
    // Use the roomCount
    print(roomCount)
}

let roomCount = sangeeth.residence!.numberOfRooms


//: [Next](@next)
