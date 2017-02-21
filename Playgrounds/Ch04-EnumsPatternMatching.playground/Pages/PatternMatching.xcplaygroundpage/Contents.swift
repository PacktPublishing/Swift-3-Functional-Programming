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

let theTeam = MLSTeam.montreal

switch theTeam {
case .montreal:
    print("Montreal Impact")
case .toronto:
    print("Toronto FC")
case .newYork:
    print("Newyork Redbulls")
case .columbus:
    print("Columbus Crew")
case .losAngeles:
    print("LA Galaxy")
case .seattle:
    print("Seattle Sounders")
}

enum Dimension {
    case us(Double, Double)
    case metric(Double, Double)
}

func convert(dimension: Dimension) -> Dimension {
    switch dimension {
    case let .us(length, width):
        return .metric(length * 0.304, width * 0.304)
    case let .metric(length, width):
        return .us(length * 3.280, width * 3.280)
    }
}

let convertedDimension = convert(dimension: Dimension.metric(5.0, 4.0))
print(convertedDimension)

//func convert(dimension: Dimension) -> Dimension {
//    switch dimension {
//    case let .us(length, width):
//        return .metric(length * 0.304, width * 0.304)
//    default:
//        return .us(0.0, 0.0)
//    }
//}


//: [Next](@next)
