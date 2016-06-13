//: [Previous](@previous)

import Foundation

// Enumerations

enum MLSTeam {
    case Montreal
    case Toronto
    case NewYork
    case Columbus
    case LA
    case Seattle
}
let theTeam = MLSTeam.Montreal

// Pattern matching

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

// Algebraic data types

enum NHLTeam { case Canadiens, Senators, Rangers, Penguins, BlackHawks, Capitals}

enum Team {
    case Hockey(NHLTeam)
    case Soccer(MLSTeam)
}

struct HockeyAndSoccerTeams {
    var hockey: NHLTeam
    var soccer: MLSTeam
}

/* product type
 
 enum HockeyAndSoccerTeams {
 case Value(hockey: NHLTeam, soccer: MLSTeam)
 }
 
 */

//: [Next](@next)
