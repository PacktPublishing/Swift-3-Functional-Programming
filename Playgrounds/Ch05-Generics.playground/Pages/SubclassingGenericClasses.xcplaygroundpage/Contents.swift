//: [Previous](@previous)

import Foundation

class Container<Item> {
}

// GenericContainer stays generic
class GenericContainer<Item>: Container<Item> {
}

// SpecificContainer becomes a container of Int type
class SpecificContainer: Container<Int> {
}
