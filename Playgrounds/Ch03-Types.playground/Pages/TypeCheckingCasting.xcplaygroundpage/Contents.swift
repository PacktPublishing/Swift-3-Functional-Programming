//: [Previous](@previous)

import Foundation

let aConstant = "String"

if aConstant is String {
    print("aConstant is a String")
} else {
    print("aConstant is not a String")
}

let anyString: Any = "string"

if anyString is String {
    print("anyString is a String")
} else {
    print("anyString is not a String")
}

