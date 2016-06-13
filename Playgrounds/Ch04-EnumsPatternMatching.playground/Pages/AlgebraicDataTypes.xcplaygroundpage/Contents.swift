//: [Previous](@previous)

import Foundation

enum Dimension {
    case US(Double, Double)
    case Metric(Double, Double)
}

let sizeMetric = Dimension.Metric(5.0, 4.0)

enum NHLTeam {
    case Canadiens
    case Senators
    case Rangers
    case Penguins
    case BlackHawks
    case Capitals
}

enum MLSTeam {
    case Montreal
    case Toronto
    case NewYork
    case Columbus
    case LA
    case Seatle
}

enum Team {
    case Hockey(NHLTeam)
    case Soccer(MLSTeam)
}

struct HockeyAndSoccerTeams {
    var hockey: NHLTeam
    var soccer: MLSTeam
}

/*
enum HockeyAndSoccerTeams {
    case Value(hockey: NHLTeam, soccer: MLSTeam)
}
*/

// Recursion Types

enum Tree {
    case Empty
    case Leaf(Int)
    indirect case Node(Tree, Tree)
}

let ourTree = Tree.Node(Tree.Leaf(1), Tree.Node(Tree.Leaf(2), Tree.Leaf(3)))
print(ourTree)

func searchInTree(search: Int, tree: Tree) -> Bool {
    switch tree {
    case .Leaf(let x):
        return x == search
    case .Node(let l as Tree, let r as Tree):
        return searchInTree(search, tree:l) || searchInTree(search, tree:r)
    default:
        return false
    }
}

let isFound = searchInTree(3, tree: ourTree) // will return true
print(isFound)


//: [Next](@next)
