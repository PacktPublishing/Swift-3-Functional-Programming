//: [Previous](@previous)

import Foundation

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
}

struct IntContainer: Container {
    typealias ItemType = Int
    mutating func append(item: ItemType) {
        // append item to the container
    }
}

//: [Next](@next)
