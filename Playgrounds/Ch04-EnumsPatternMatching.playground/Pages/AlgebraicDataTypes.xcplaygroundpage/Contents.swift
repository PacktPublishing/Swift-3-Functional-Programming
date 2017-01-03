//: [Previous](@previous)

import Foundation

enum Dimension {
    case us(Double, Double)
    case metric(Double, Double)
}

let sizeMetric = Dimension.metric(5.0, 4.0)

enum NHLTeam {
    case canadiens
    case senators
    case rangers
    case penguins
    case blackHawks
    case capitals
}

enum MLSTeam {
    case montreal
    case toronto
    case newYork
    case columbus
    case losAngeles
    case seattle
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
    case value(hockey: NHLTeam, soccer: MLSTeam)
}
*/

// Recursion Types

enum Tree {
    case empty
    case leaf(Int)
    indirect case node(Tree, Tree)
}

let ourTree = Tree.node(Tree.leaf(1), Tree.node(Tree.leaf(2), Tree.leaf(3)))
print(ourTree) // prints node(Tree.leaf(1), Tree.node(Tree.leaf(2), Tree.leaf(3)))

func searchInTree(_ search: Int, tree: Tree) -> Bool {
    switch tree {
    case .leaf(let x):
        return x == search
    case .node(let l, let r):
        return searchInTree(search, tree:l) || searchInTree(search, tree:r)
    default:
        return false
    }
}

let isFound = searchInTree(3, tree: ourTree)
print(isFound) // prints true


//: [Next](@next)
