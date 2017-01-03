//: [Previous](@previous)

import Foundation

// Wildcard pattern

for _ in 1...5 {
    print("The value in range is ignored")
}

let anOptionalString: String? = nil

switch anOptionalString {
case _?: print ("Some")
case nil: print ("None")
}

let twoNumbers = (3.14, 1.618)

switch twoNumbers {
case (_, let phi): print("pi: \(phi)")
}

// Value-binding pattern

let position = (5, 7)

switch position {
case let (x, y):
    print("x:\(x), y:\(y)")
}

// Identifier pattern

let ourConstant = 7

switch ourConstant {
case 7: print("7")
default: print("a value")
}

// Tuple pattern

let name = "John"
let age: Int? = 27
let address: String? = "New York, New York, US"

switch (name, age, address) {
case (let name, _?, _):
    print(name)
default: ()
}

// Enumeration case pattern

enum Dimension {
    case us(Double, Double)
    case metric(Double, Double)
}

let dimension = Dimension.metric(9.0, 6.0)

func convert(dimension: Dimension) -> Dimension {
    switch dimension {
    case let .us(length, width):
        return .metric(length * 0.304, width * 0.304)
    case let .metric(length, width):
        return .us(length * 3.280, width * 3.280)
    }
}

print(convert(dimension: dimension))

// Optional pattern


//let anOptionalString: String? = nil

switch anOptionalString {
case let something?: print("\(something)")
case nil: print ("None")
}

// Type casting patterns


//let anyValue: Any = 7
//
//switch anyValue {
//case is Int: print(anyValue + 3)
//case let ourValue as Int: print(ourValue + 3)
//default: ()
//}




let anyValue: Any = 7

switch anyValue {
case is Double: print(anyValue)
case let ourValue as Int: print(ourValue + 3)
default: ()
}

// Expression pattern


//let position = (3, 5)
//
//switch position {
//case (0, 0):
//    print("(0, 0) is at the origin.")
//case (-4...4, -6...6):
//    print("(\(position.0), \(position.1)) is near the origin.")
//default:
//    print("The position is:(\(position.0), \(position.1)).")
//}


func ~=(pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}

switch position {
case ("0", "0"):
    print("(0, 0) is at the origin.")
default:
    print("The position is: (\(position.0), \(position.1)).")
}
