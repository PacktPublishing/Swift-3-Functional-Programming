//: [Previous](@previous)

import Foundation

/// Tree

enum Tree<Element: Comparable> {
    case Leaf(Element)
    indirect case Node(lhs: Tree, rhs: Tree)
    
    static func contains(key: Element, tree: Tree<Element>) -> Bool {
        switch tree {
        case .Leaf(let element):
            return key == element
        case .Node(let lhs, let rhs):
            return contains(key, tree:lhs) || contains(key, tree:rhs)
        }
    }
}

let functionalTree = Tree.Node(lhs: Tree.Leaf("First"), rhs: Tree.Node(lhs: Tree.Leaf("Second"), rhs: Tree.Leaf("Third")))
print(functionalTree)

let secondFT = Tree.Node(lhs: functionalTree, rhs: Tree.Node(lhs: Tree.Leaf("Fourth"), rhs: Tree.Leaf("Fifth")))
let thirdFT = Tree.Node(lhs: Tree.Node(lhs: Tree.Leaf("Fourth"), rhs: Tree.Leaf("Fifth")), rhs: functionalTree)

print(secondFT)
print(thirdFT)

let isFound = Tree.contains("First", tree: functionalTree) // will return true
print(isFound)

/// Operator

infix operator <^> { associativity left }

func <^><T, V>(transform: T -> V, input: T?) -> V? {
    switch input {
    case .Some(let value): return transform(value)
    case .None: return .None
    }
}


/// BST

enum BinarySearchTree<Element: Comparable> {
    case Leaf
    indirect case Node(lhs: BinarySearchTree, element: Element, rhs: BinarySearchTree)
    
    var size: Int {
        switch self {
        case .Leaf:
            return 0
        case .Node(let lhs, _, let rhs):
            return 1 + lhs.size + rhs.size
        }
    }
    
    var elements: [Element] {
        switch self {
        case .Leaf:
            return []
        case .Node(let lhs, let element, let rhs):
            return lhs.elements + [element] + rhs.elements
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .Leaf:
            return true
        case .Node(_, _, _):
            return false
        }
    }
    
    init() {
        self = .Leaf
    }
    
    static func empty() -> BinarySearchTree {
        return .Leaf
    }
    
    init(element: Element) {
        self = .Node(lhs: .Leaf, element: element, rhs: .Leaf)
    }
    
    static func contains(item: Element, tree: BinarySearchTree<Element>) -> Bool {
        switch tree {
        case .Leaf:
            return false
        case .Node(let lhs, let element, let rhs):
            if item < element {
                return contains(item, tree: lhs)
            } else if item > element {
                return contains(item, tree: rhs)
            }
            return true
        }
    }
}

let functionalBST = BinarySearchTree.Node(lhs: BinarySearchTree.Leaf, element: 5, rhs: BinarySearchTree.Node(lhs: BinarySearchTree.Leaf, element: 9, rhs: BinarySearchTree.Leaf))


let iFound = BinarySearchTree.contains(9, tree: functionalBST) // will return true
print(isFound)
print(functionalBST.size) // prints "2"
print(functionalBST.elements)
print(functionalBST.isEmpty)

let emptyBST = BinarySearchTree<Int>.empty()
print(emptyBST.isEmpty)


let secondFunctionalBST = BinarySearchTree.Node(lhs: functionalBST, element: 5, rhs: BinarySearchTree.Node(lhs: BinarySearchTree.Leaf, element: 9, rhs: BinarySearchTree.Leaf))


print(secondFunctionalBST.size) // prints "4"

print(secondFunctionalBST.elements)


//: [Next](@next)
