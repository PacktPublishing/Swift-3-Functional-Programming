//: [Previous](@previous)

import Foundation

// Collections

// Arrays and Dictionaries
var cheeses = ["Brie", "Tete de Moine", "Cambozola", "Camembert"]
cheeses[2] = "Roquefort"
var cheeseWinePairs = [
    "Brie":"Chardonnay",
    "Camembert":"Champagne",
    "Gruyere":"Sauvignon Blanc"
]

cheeseWinePairs ["Cheddar"] = "Cabarnet Sauvignon"
// To create an empty array or dictionary
let emptyArray = [String]()
let emptyDictionary = Dictionary<String, Float>()
cheeses = []
cheeseWinePairs = [:]


// Iteration over dictionaries

for (cheese, wine) in cheeseWinePairs {
    print("\(cheese): \(wine)")
}

//: [Next](@next)
