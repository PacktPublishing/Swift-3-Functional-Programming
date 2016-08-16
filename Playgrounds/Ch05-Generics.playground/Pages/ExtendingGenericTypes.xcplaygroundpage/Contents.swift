//: [Previous](@previous)

import Foundation

struct Queue<Element> {
    var elements = [Element]()
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

extension Queue {
    func peek() -> Element? {
        return elements.first
    }
}

//: [Next](@next)
