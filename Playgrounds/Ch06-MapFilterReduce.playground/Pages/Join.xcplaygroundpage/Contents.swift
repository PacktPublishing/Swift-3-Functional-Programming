//: [Previous](@previous)

import Foundation

func join<Element: Equatable>(elements: [Element], separator: String) -> String {

    return elements.reduce("") {
        initial, element in
        let aSeparator = (element == elements.last) ? "" : separator
        return "\(initial)\(element)\(aSeparator)"
    }
}

let items = ["First", "Second", "Third"]
let commaSeparatedItems = join(elements: items, separator: ", ")


//: [Next](@next)
