//: [Previous](@previous)

import Foundation

// Any and AnyObject - not recommended

class Movie {
    var director: String
    var name: String
    init(name: String, director: String) {
        self.director = director
        self.name = name
    }
}

let objects: [AnyObject] = [
    Movie(name: "The Shawshank Redemption", director: "Frank Darabont"),
    Movie(name: "The Godfather", director: "Francis Ford Coppola")
]

for object in objects {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

// Shorter syntax
for movie in objects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

//: [Next](@next)
