//: [Previous](@previous)

import Foundation

/// Tree

//enum Tree<Element: Comparable> {
//    case leaf(Element)
//    indirect case node(lhs: Tree, rhs: Tree)
//}
//
//let functionalTree = Tree.node(lhs: Tree.leaf("First"), rhs: Tree.node(lhs:
//    Tree.leaf("Second"), rhs: Tree.leaf("Third")))

enum Tree<Element: Comparable> {
    case leaf(Element)
    indirect case node(lhs: Tree, rhs: Tree)
    
    static func contains(_ key: Element, tree: Tree<Element>) -> Bool {
        switch tree {
        case .leaf(let element):
            return key == element
        case node(let lhs, let rhs):
            return contains(key, tree:lhs) || contains(key, tree:rhs)
        }
    }
}

let functionalTree = Tree.node(lhs: Tree.leaf("First"), rhs: Tree.node(lhs: Tree.leaf("Second"), rhs: Tree.leaf("Third")))
print(functionalTree)

let secondFT = Tree.node(lhs: functionalTree, rhs: Tree.node(lhs: Tree.leaf("Fourth"), rhs: Tree.leaf("Fifth")))
let thirdFT = Tree.node(lhs: Tree.node(lhs: Tree.leaf("Fourth"), rhs: Tree.leaf("Fifth")), rhs: functionalTree)

print(secondFT)
print(thirdFT)

let isFound = Tree.contains("First", tree: functionalTree) // will return true
print(isFound)


/// BST

enum BinarySearchTree<Element: Comparable> {
    case leaf
    indirect case node(lhs: BinarySearchTree, element: Element, rhs: BinarySearchTree)
    
    var size: Int {
        switch self {
        case .leaf:
            return 0
        case .node(let lhs, _, let rhs):
            return 1 + lhs.size + rhs.size
        }
    }
    
    var elements: [Element] {
        switch self {
        case .leaf:
            return []
        case .node(let lhs, let element, let rhs):
            return lhs.elements + [element] + rhs.elements
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .leaf:
            return true
        case .node(_, _, _):
            return false
        }
    }
    
    init() {
        self = .leaf
    }
    
    static func empty() -> BinarySearchTree {
        return .leaf
    }
    
    init(element: Element) {
        self = .node(lhs: .leaf, element: element, rhs: .leaf)
    }
    
    static func contains(_ item: Element, tree: BinarySearchTree<Element>) -> Bool {
        switch tree {
        case .leaf:
            return false
        case .node(let lhs, let element, let rhs):
            if item < element {
                return contains(item, tree: lhs)
            } else if item > element {
                return contains(item, tree: rhs)
            }
            return true
        }
    }
}

//let functionalBST = BinarySearchTree.node(lhs: BinarySearchTree.leaf, element: 5, rhs: BinarySearchTree.node(lhs: BinarySearchTree.leaf, element: 9, rhs: BinarySearchTree.leaf))

let functionalBST = BinarySearchTree.node(lhs: BinarySearchTree.node(lhs: BinarySearchTree.leaf, element: 1, rhs: BinarySearchTree.leaf), element: 5, rhs: BinarySearchTree.node(lhs: BinarySearchTree.leaf, element: 9, rhs: BinarySearchTree.leaf))

let iFound = BinarySearchTree.contains(9, tree: functionalBST) // will return true
print(isFound)
print(functionalBST.size) // prints "3"
print(functionalBST.elements)
print(functionalBST.isEmpty)

let emptyBST = BinarySearchTree<Int>.empty()
print(emptyBST.isEmpty)


let secondFunctionalBST = BinarySearchTree.node(lhs: functionalBST, element: 5, rhs: BinarySearchTree.node(lhs: BinarySearchTree.leaf, element: 9, rhs: BinarySearchTree.leaf))


print(secondFunctionalBST.size) // prints "4"

print(secondFunctionalBST.elements)

//: [Next](@next)
