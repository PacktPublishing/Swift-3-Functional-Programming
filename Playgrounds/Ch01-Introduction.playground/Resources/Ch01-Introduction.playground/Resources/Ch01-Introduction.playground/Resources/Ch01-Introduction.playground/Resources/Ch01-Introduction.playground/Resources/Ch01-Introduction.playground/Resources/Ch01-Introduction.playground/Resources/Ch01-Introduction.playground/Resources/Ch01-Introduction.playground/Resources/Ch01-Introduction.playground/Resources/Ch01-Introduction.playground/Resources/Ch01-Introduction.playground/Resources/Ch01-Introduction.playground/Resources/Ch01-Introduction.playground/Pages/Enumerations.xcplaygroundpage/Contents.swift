//: [Previous](@previous)

import Foundation

// Enumerations

enum MLSTeam {
    case montreal
    case toronto
    case newYork
    case columbus
    case losAngeles
    case seattle
}

let theTeam = MLSTeam.montreal

// Pattern matching

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

// Algebraic data types

enum NHLTeam { case canadiens, senators, rangers, penguins, blackHawks, capitals }

enum Team {
    case hockey(NHLTeam)
    case soccer(MLSTeam)
}

//struct HockeyAndSoccerTeams {
//    var hockey: NHLTeam
//    var soccer: MLSTeam
//}

// product type

enum HockeyAndSoccerTeams {
    case value(hockey: NHLTeam, soccer: MLSTeam)
}

//: [Next](@next)
