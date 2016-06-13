//: [Previous](@previous)

import Foundation

enum GenericTree <T> {
    case Empty
    case Leaf(T)
    indirect case Node(GenericTree, GenericTree)
}

let ourGenericTree = GenericTree.Node(GenericTree.Leaf("First"), GenericTree.Node(GenericTree.Leaf("Second"), GenericTree.Leaf("Third")))
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
        return elements.removeAtIndex(0)
    }
}

//: [Next](@next)
