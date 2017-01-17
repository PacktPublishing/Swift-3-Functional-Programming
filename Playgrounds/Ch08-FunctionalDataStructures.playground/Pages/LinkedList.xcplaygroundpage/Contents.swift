//: [Previous](@previous)

import Foundation

/// Operator
precedencegroup AssociativityRight {
    associativity: right
}

infix operator <| : AssociativityRight

func <| <T>(lhs: T, rhs: LinkedList<T>) -> LinkedList<T> {
    return .node(data: lhs, next: rhs)
}

/// LinkedList
enum LinkedList<Element: Equatable> {
    case end
    indirect case node(data: Element, next: LinkedList<Element>)
    
    var size: Int {
        switch self {
        case .node(_, let next):
            return 1 + next.size
        case .end:
            return 0
        }
    }
    
    var elements: [Element] {
        switch self {
        case .node(let data, let next):
            return [data] + next.elements
        case .end:
            return []
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .node(_ , _):
            return false
        case .end:
            return true
        }
    }
    
    static func empty() -> LinkedList {
        return .end
    }
    
    func cons(_ element: Element) -> LinkedList {
        return .node(data: element, next: self)
    }
    
    func map<T>(_ transform: (Element) -> T) -> LinkedList<T> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return transform(data) <| next.map(transform)
        }
    }
    
    func filter(_ predicate: ((Element) -> Bool)) -> LinkedList<Element> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return predicate(data) ? data <| next.filter(predicate) : next.filter(predicate)
        }
    }
    
    func reduce<Value>(_ initial: Value, combine: (Value, Element) -> Value) -> Value {
        switch self {
        case .end:
            return initial
        case .node(let data, let next):
            return next.reduce(combine(initial, data), combine: combine)
        }
    }
    
    static func contains(_ key: Element, list: LinkedList<Element>) -> Bool {
        switch list {
        case .end:
            return false
        case .node(let data, let next):
            if key == data {
                return true
            } else {
                return contains(key, list: next)
            }
        }
    }
}

let functionalLinkedList = LinkedList<Int>.end.cons(1).cons(2).cons(3)
print(functionalLinkedList)

let functionalLLWithCons = 3 <| 2 <| 1 <| .end


let secondLL = functionalLinkedList.cons(4)
let thirdLL = functionalLinkedList.cons(5)
let fourthLL = LinkedList<Int>.node(data: 1, next: secondLL)
print(functionalLinkedList.size)
print(functionalLinkedList.elements)

let emptyLL = LinkedList<Int>.end
print(emptyLL.isEmpty)

print(functionalLinkedList.isEmpty)

print(LinkedList.contains(1, list: functionalLinkedList))

// map

let mappedFunctionalLL = functionalLinkedList.map { $0 * 2 }
print(mappedFunctionalLL)


// filter

let filteredFunctionalLL = functionalLinkedList.filter { $0 % 2 == 0 }
print(filteredFunctionalLL)

// reduce

let reducedFunctionalLL = functionalLinkedList.reduce(0) { $0 + $1}
print(reducedFunctionalLL)

//: [Next](@next)
