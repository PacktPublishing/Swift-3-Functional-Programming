//: [Previous](@previous)

import Foundation

enum GenericTree <T> {
	case empty
	case leaf(T)
	indirect case node(GenericTree, GenericTree)
}

print(GenericTree.node(GenericTree.leaf("First"), GenericTree.node(GenericTree.leaf("Second"), GenericTree.leaf("Third"))))
// prints node(GenericTree<Swift.String>.leaf("First"), GenericTree<Swift.String>.node(GenericTree<Swift.String>.leaf("Second"), GenericTree<Swift.String>.leaf("Third")))


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
