//: [Previous](@previous)

import Foundation

/// Stack

/// Operators
infix operator <<| { associativity right precedence 100 }

func <<| <T>(lhs: T, rhs: Stack<T>) -> Stack<T> {
    return .Node(data: lhs, next: rhs)
}

/// Stack

enum Stack<Element: Equatable> {
    case End
    indirect case Node(data: Element, next: Stack<Element>)
    
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
    
    static func empty() -> Stack {
        return .End
    }
    
    func cons(element: Element) -> Stack {
        return .Node(data: element, next: self)
    }
    
    func pop() -> (element: Element, linkedList: Stack)? {
        switch self {
        case .Node(let data, let next):
            return (data, next)
        case .End:
            return nil
        }
    }
    
    func map<T>(transform: Element -> T) -> Stack<T> {
        switch self {
        case .End:
            return .End
        case .Node(let data, let next):
            return transform(data) <<| next.map(transform)
        }
    }
    
    func filter(predicate: (Element -> Bool)) -> Stack<Element> {
        switch self {
        case .End:
            return .End
        case .Node(let data, let next):
            return predicate(data) ? data <<| next.filter(predicate) : next.filter(predicate)
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
    
    static func contains(key: Element, list: Stack<Element>) -> Bool {
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

let stack = Stack<Int>.End.cons(1).cons(2).cons(3)

if let (elment, stack) = stack.pop() {
    print(elment)
    let newStack = stack.pop()
    print(newStack)
}

//: [Next](@next)
