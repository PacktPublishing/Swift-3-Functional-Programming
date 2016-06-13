//: [Previous](@previous)

import Foundation


/// Lazy List

/// Operator
infix operator <|| { associativity right precedence 100 }

func <|| <T>(lhs: T, @autoclosure(escaping) rhs: () -> LazyList<T>) -> LazyList<T> {
    return .Node(data: lhs, next: rhs)
}

/// Lazy List
enum LazyList<Element: Equatable> {
    case End
    case Node(data: Element, next: () -> LazyList<Element>)
    
    var size: Int {
        switch self {
        case .Node(_, let next):
            return 1 + next().size
        case .End:
            return 0
        }
    }
    
    var elements: [Element] {
        switch self {
        case .Node(let data, let next):
            return [data] + next().elements
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
    
    static func empty() -> LazyList {
        return .End
    }
    
    func cons(element: Element) -> LazyList {
        return .Node(data: element, next: { self })
    }
    
    func removeLast() -> (element: Element, linkedList: LazyList)? {
        switch self {
        case .Node(let data, let next):
            return (data, next())
        case .End:
            return nil
        }
    }
    
    func map<T>(transform: Element -> T) -> LazyList<T> {
        switch self {
        case .End:
            return .End
        case .Node(let data, let next):
            return transform(data) <|| next().map(transform)
        }
    }
    
    func filter(predicate: (Element -> Bool)) -> LazyList<Element> {
        switch self {
        case .End:
            return .End
        case .Node(let data, let next):
            return predicate(data) ? data <|| next().filter(predicate) : next().filter(predicate)
        }
    }
    
    func reduce<Value>(initial: Value, combine: (Value, Element) -> Value) -> Value {
        switch self {
        case .End:
            return initial
        case .Node(let data, let next):
            return next().reduce(combine(initial, data), combine: combine)
        }
    }
    
    static func contains(key: Element, list: LazyList<Element>) -> Bool {
        switch list {
        case .End:
            return false
        case .Node(let data, let next):
            if key == data {
                return true
            } else {
                return contains(key, list: next())
            }
        }
    }
}

let ourLazyList = 3 <|| 2 <|| 1 <||  LazyList.End // Node(3, (Function))
print(ourLazyList.size) // prints 3

//let mappedLazyList = ourLazyList.map { $0 }

print(ourLazyList.elements)

let newLazyList = ourLazyList.cons(5)

print(newLazyList.elements)

let (element, lazyList) = ourLazyList.removeLast()!
print(element)
print(lazyList)


//: [Next](@next)
