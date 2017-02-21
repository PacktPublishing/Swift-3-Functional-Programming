//: [Previous](@previous)

import Foundation

enum MLSTeam {
    case montreal
    case toronto
    case newYork
    case columbus
    case losAngeles
    case seattle
}

//let theTeam = MLSTeam.montreal

/*
 
 enum MLSTeam {
 case montreal, toronto, newYork, columbus, losAngeles, Seattle
 }
*/

var theTeam = MLSTeam.montreal


theTeam = .newYork

// Associated values

enum Length {
    case us(Double)
    case metric(Double)
}

let lengthMetric = Length.metric(1.6)

// Raw values

enum HttpError: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
}

let possibleError = HttpError(rawValue: 400)
print(possibleError?.rawValue ?? 404) // prints 400

