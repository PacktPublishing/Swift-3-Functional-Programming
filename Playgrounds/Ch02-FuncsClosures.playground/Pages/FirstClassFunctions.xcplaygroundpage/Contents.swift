//: [Previous](@previous)

import Foundation

let name: String = "Your name"

func sayHello(name: String) {
    print("Hello, \(name)")
}

sayHello(name: "Your name") // or
sayHello(name: name)

var sayHelloFunc = sayHello

//: [Next](@next)
