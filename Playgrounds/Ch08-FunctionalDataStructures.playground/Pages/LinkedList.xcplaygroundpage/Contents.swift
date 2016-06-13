//: [Previous](@previous)

import Foundation

/// Operator
infix operator <| { associativity right precedence 100 }

func <| <T>(lhs: T, rhs: LinkedList<T>) -> LinkedList<T> {
    return .Node(data: lhs, next: rhs)
}

/// LinkedList

enum LinkedList<Element: Equatable> {
    case End
    indirect case Node(data: Element, next: LinkedList<Element>)
    
    var size: Int {
        switch self {
        case .Node(_, let next):
            return 1 + next.size
        case .End:
            return 0
        }
    }
    
    var elements: [Element] {
        switch self {
        case .Node(let data, let next):
            return [data] + next.elements
        case .End:
            return []
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .Node(_ , _):
            return false
        case .End:
            return true
        }
    }
    
    static func empty() -> LinkedList {
        return .End
    }
    
    func cons(element: Element) -> LinkedList {
        return .Node(data: element, next: self)
    }
    
    func map<T>(transform: Element -> T) -> LinkedList<T> {
        switch self {
        case .End:
            return .End
        case .Node(let data, let next):
            return transform(data) <| next.map(transform)
        }
    }
    
    func filter(predicate: (Element -> Bool)) -> LinkedList<Element> {
        switch self {
        case .End:
            return .End
        case .Node(let data, let next):
            return predicate(data) ? data <| next.filter(predicate) : next.filter(predicate)
        }
    }
    
    func reduce<Value>(initial: Value, combine: (Value, Element) -> Value) -> Value {
        switch self {
        case .End:
            return initial
        case .Node(let data, let next):
            return next.reduce(combine(initial, data), combine: combine)
        }
    }
    
    static func contains(key: Element, list: LinkedList<Element>) -> Bool {
        switch list {
        case .End:
            return false
        case .Node(let data, let next):
            if key == data {
                return true
            } else {
                return contains(key, list: next)
            }
        }
    }
}

let functionalLinkedList = LinkedList<Int>.End.cons(1).cons(2).cons(3)
print(functionalLinkedList)

// map

let mappedFunctionalLL = functionalLinkedList.map { $0 * 2 }
print(mappedFunctionalLL)

let functionalLLWithCons = 3 <| 2 <| 1 <| .End

// reduce

let reducedFunctionalLL = functionalLinkedList.reduce(0) { $0 + $1}
print(reducedFunctionalLL)

// filter

let filteredFunctionalLL = functionalLinkedList.filter { $0 % 2 == 0 }
print(filteredFunctionalLL)

let secondLL = functionalLinkedList.cons(4)
let thirdLL = functionalLinkedList.cons(5)
let fourthLL = LinkedList<Int>.Node(data: 1, next: secondLL)
print(functionalLinkedList.size)
print(functionalLinkedList.elements)

let emptyLL = LinkedList<Int>.End
print(emptyLL.isEmpty)

print(functionalLinkedList.isEmpty)

print(LinkedList.contains(1, list: functionalLinkedList))


//: [Next](@next)
