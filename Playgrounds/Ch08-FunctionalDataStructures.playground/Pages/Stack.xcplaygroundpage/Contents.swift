//: [Previous](@previous)

import Foundation

/// Stack

/// Operators

precedencegroup AssociativityRight {
    associativity: right
}

infix operator <<| : AssociativityRight

func <<| <T>(lhs: T, rhs: Stack<T>) -> Stack<T> {
    return .node(data: lhs, next: rhs)
}

/// Stack

enum Stack<Element: Equatable> {
    case end
    indirect case node(data: Element, next: Stack<Element>)
    
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
    
    static func empty() -> Stack {
        return .end
    }
    
    func cons(_ element: Element) -> Stack {
        return .node(data: element, next: self)
    }
    
    func pop() -> (element: Element, list: Stack)? {
        switch self {
        case .node(let data, let next):
            return (data, next)
        case .end:
            return nil
        }
    }
    
    func map<T>(_ transform: (Element) -> T) -> Stack<T> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return transform(data) <<| next.map(transform)
        }
    }
    
    func filter(_ predicate: ((Element) -> Bool)) -> Stack<Element> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return predicate(data) ? data <<| next.filter(predicate) : next.filter(predicate)
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
    
    static func contains(_ key: Element, list: Stack<Element>) -> Bool {
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

let stack = Stack<Int>.end.cons(1).cons(2).cons(3)

if let (elment, stack) = stack.pop() {
    print(elment)
	if let newStack = stack.pop() {
		print(newStack)
	} else {
		print("Stack is empty")
	}
}

//: [Next](@next)
