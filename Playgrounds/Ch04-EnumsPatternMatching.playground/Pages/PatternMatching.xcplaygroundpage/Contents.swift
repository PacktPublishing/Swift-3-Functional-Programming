//: [Previous](@previous)

import Foundation

enum Dimension {
    case US(Double, Double)
    case Metric(Double, Double)
}

enum MLSTeam {
    case Montreal
    case Toronto
    case NewYork
    case Columbus
    case LA
    case Seattle
}

let theTeam = MLSTeam.Montreal

switch theTeam {
case .Montreal:
    print("Montreal Impact")
case .Toronto:
    print("Toronto FC")
case .NewYork:
    print("Newyork Redbulls")
case .Columbus:
    print("Columbus Crew")
case .LA:
    print("LA Galaxy")
case .Seattle:
    print("Seattle Sounders")
}

func convertDimension(dimension: Dimension) -> Dimension {
    switch dimension {
    case let .US(length, width):
        return .Metric(length * 0.304, width * 0.304)
    case let .Metric(length, width):
        return .US(length * 3.280, width * 3.280)
    }
}

let convertedDimension = convertDimension(Dimension.Metric(5.0, 4.0))


//: [Next](@next)
