//: [Previous](@previous)

import Foundation

/*
struct Point {
    let x: Double
    let y: Double
}

let firstPoint = Point(x: 3.0, y: 5.5)
let secondPoint = Point(x: 7.0, y: 9.5)

let isEqual = (firstPoint == secondPoint) // Compile error - Binary operator '==' cannot be apploed to two 'Point' operands
*/

/*
struct Point: Equatable {
    let x: Double
    let y: Double
}

func ==(lhs: Point, rhs:Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == lhs.y)
}

let firstPoint = Point(x: 3.0, y: 5.5)
let secondPoint = Point(x: 7.0, y: 9.5)

let isEqual = (firstPoint == secondPoint)
*/


struct Point: Equatable, Comparable {
    let x: Double
    let y: Double
}

func ==(lhs: Point, rhs:Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == lhs.y)
}

func <(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

let firstPoint = Point(x: 3.0, y: 5.5)
let secondPoint = Point(x: 7.0, y: 9.5)

let isEqual = (firstPoint == secondPoint)
let isLess = (firstPoint < secondPoint)

//: [Next](@next)
