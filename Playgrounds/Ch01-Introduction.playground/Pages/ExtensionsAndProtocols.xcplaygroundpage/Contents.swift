//: [Previous](@previous)

import Foundation

// Extensions

// Computed Properties
extension Double {
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.2884 }
}

let threeInch = 76.2.mm
let fiveFeet = 5.ft

// Protocols

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations and structs can all adopt protocols.
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class example"
    var anotherProperty: Int = 79799
    
    func adjust() {
        simpleDescription += " Now 100% adjusted..."
    }
}

var aSimpleClass = SimpleClass()
aSimpleClass.adjust()
let aDescription = aSimpleClass.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple struct"
    // Mutating to mark a method that modifies the structure - For classes we do not need to use mutating keyword
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var aSimpleStruct = SimpleStructure()
aSimpleStruct.adjust()
let aSimpleStructDescription = aSimpleStruct.simpleDescription

// Protocol extension

extension ExampleProtocol {
    var simpleDescription: String {
        get {
            return "The description is: \(self)"
        }
        set {
            self.simpleDescription = newValue
        }
    }
    
    mutating func adjust() {
        self.simpleDescription = "adjusted simple description"
    }
}

