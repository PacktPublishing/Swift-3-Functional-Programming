//: [Previous](@previous)

import Foundation

enum MLSTeam {
    case Montreal
    case Toronto
    case NewYork
    case Columbus
    case LA
    case Seatle
}

// let theTeam = MLSTeam.Montreal

/*
enum MLSTeam {
    case Montreal, Toronto, NewYork, Columbus, LA, Seatle
}
*/
 
var theTeam = MLSTeam.Montreal

theTeam = .NewYork

// Associated values

enum Length {
    case US(Double)
    case Metric(Double)
}

let lengthMetric = Length.Metric(1.6)

// Raw values

enum HttpError: Int {
    case BadRequest = 400
    case Unauthorized = 401
    case Forbidden = 403
}

let possibleError = HttpError(rawValue: 400)
print(possibleError)


//: [Next](@next)
