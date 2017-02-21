//: [Previous](@previous)

import Foundation


/// Lazy List

/// Operator
precedencegroup AssociativityRight {
    associativity: right
}

infix operator <|| : AssociativityRight

func <|| <T>(lhs: T, rhs: @autoclosure @escaping () -> LazyList<T>) -> LazyList<T> {
    return .node(data: lhs, next: rhs)
}

/// Lazy List
enum LazyList<Element: Equatable> {
    case end
    case node(data: Element, next: () -> LazyList<Element>)
    
    var size: Int {
        switch self {
        case .node(_, let next):
            return 1 + next().size
        case .end:
            return 0
        }
    }
    
    var elements: [Element] {
        switch self {
        case .node(let data, let next):
            return [data] + next().elements
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
    
    static func empty() -> LazyList {
        return .end
    }
    
    func cons(_ element: Element) -> LazyList {
        return .node(data: element, next: { self })
    }
    
    func removeLast() -> (element: Element, linkedList: LazyList)? {
        switch self {
        case .node(let data, let next):
            return (data, next())
        case .end:
            return nil
        }
    }
    
    func map<T>(_ transform: @escaping (Element) -> T) -> LazyList<T> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return transform(data) <|| next().map(transform)
        }
    }
    
    func filter(_ predicate: @escaping ((Element) -> Bool)) -> LazyList<Element> {
        switch self {
        case .end:
            return .end
        case .node(let data, let next):
            return predicate(data) ? data <|| next().filter(predicate) : next().filter(predicate)
        }
    }
    
    func reduce<Value>(_ initial: Value, combine: (Value, Element) -> Value) -> Value {
        switch self {
        case .end:
            return initial
        case .node(let data, let next):
            return next().reduce(combine(initial, data), combine: combine)
        }
    }
    
    static func contains(_ key: Element, list: LazyList<Element>) -> Bool {
        switch list {
        case .end:
            return false
        case .node(let data, let next):
            if key == data {
                return true
            } else {
                return contains(key, list: next())
            }
        }
    }
}

let ourLazyList = 3 <|| 2 <|| 1 <||  LazyList.end // node(3, (Function))
print(ourLazyList.size) // prints 3

//let mappedLazyList = ourLazyList.map { $0 }

print(ourLazyList.elements)

let newLazyList = ourLazyList.cons(5)

print(newLazyList.elements)

let (element, lazyList) = ourLazyList.removeLast()!
print(element)
print(lazyList)

