//: [Previous](@previous)

import Foundation

let content = "10,20,40,30,80,60"

func extractElements(_ content: String) -> [String] {
    return content.characters.split(separator: ",").map { String($0) }
}

let elements = extractElements(content)

func formatWithCurrency(content: [String]) -> [String] {
    return content.map {"\($0)$"}
}

let formattedElements = formatWithCurrency(content: elements)

let composedFunction = {
    data in
    formatWithCurrency(content: extractElements(data))
}

composedFunction(content)

// Composed function with custom operators

precedencegroup AssociativityLeft {
    associativity: left
}

infix operator |> : AssociativityLeft
func |> <T, V>(f: @escaping (T) -> V, g: @escaping (V) -> V ) -> (T) -> V {
    return { x in g(f(x)) }
}

let composedWithCustomOperator = extractElements |> formatWithCurrency
composedWithCustomOperator("10,20,40,30,80,60")
// The result will be: ["10$", "20$", "40$", "30$", "80$", "60$"]
//: [Next](@next)
