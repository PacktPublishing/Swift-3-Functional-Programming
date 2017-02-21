//: [Previous](@previous)

import Foundation

// ARC
class AClassWithLazyClosure {
    lazy var aClosure: (Int, String) -> String = {
        [unowned self] (index: Int, stringToProcess: String) -> String in
        // closure body goes here
        return ""
    }
}

//: [Next](@next)
