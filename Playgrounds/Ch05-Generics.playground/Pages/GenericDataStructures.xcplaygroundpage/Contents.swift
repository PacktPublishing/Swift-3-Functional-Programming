//: [Previous](@previous)

import Foundation

enum GenericTree <T> {
    case empty
    case leaf(T)
    indirect case node(GenericTree, GenericTree)
}

let ourGenericTree = GenericTree.node(GenericTree.leaf("First"), GenericTree.node(GenericTree.leaf("Second"), GenericTree.leaf("Third")))
print(ourGenericTree)

struct Queue<Element> {
    private var elements = [Element]()
    mutating func enQueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func deQueue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.remove(at: 0)
    }
}

//: [Next](@next)
