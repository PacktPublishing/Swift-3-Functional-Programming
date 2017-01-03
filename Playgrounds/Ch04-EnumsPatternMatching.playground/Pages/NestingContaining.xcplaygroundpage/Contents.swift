//: [Previous](@previous)

import Foundation

enum SportTeam {
    
    enum NHL {
        case montreal
        case toronto
        var founded: Int {
            switch self {
            case .montreal: return 1909
            case .toronto: return 1917
            }
        }
    }
    
    enum MLS {
        case montreal
        case newYork
    }
}


struct NAAthlete {
    
    enum Conference {
        case eastern, western
        
        static func conferenceFrom(division: String) -> Conference {
            if division.contains("Metropolitan") || division.contains("Atlantic") {
                return .eastern
            } else {
                return .western
            }
        }
    }
    
    enum League {
        case nhl
        case mls
        case nba
        case mlb
        
        enum Team {
            case montreal
            case anaheim
            var conference: Conference {
                switch self {
                case .montreal: return .eastern
                case .anaheim: return .western
                }
            }
        }
        
    }
    let league: League
    let team: League.Team
    
    func properties() -> (League, League.Team) {
        return (self.league, self.team)
    }
    
    
}

let player = NAAthlete(league: .nhl, team: .montreal)
print(player.team.conference) // prints eastern
print(player.properties()) // prints (NAAthlete.League.nhl, NAAthlete.League.Team.montreal)
print(NAAthlete.Conference.conferenceFrom(division: "Metropolitan")) // prints eastern

//: [Next](@next)
