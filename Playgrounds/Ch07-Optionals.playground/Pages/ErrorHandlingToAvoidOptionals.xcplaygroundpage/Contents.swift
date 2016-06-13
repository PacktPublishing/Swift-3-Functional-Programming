//: [Previous](@previous)

import Foundation

func checkForPath(path: String) -> String? {
    // check for the path
    return "path"
}
/*

func readFile(path: String) -> String? {
    if let restult = checkForPath(path) {
        return restult
    } else {
        return nil
    }
}

if let result = readFile("path/to") {
    // Do something with result
}
*/

enum Result: ErrorType {
    case Failure
    case Success
}

func readFile(path: String) throws -> String {
    if let restult = checkForPath(path) {
        return restult
    } else {
        throw Result.Failure
    }
}

do {
    let result = try readFile("path/to")
} catch {
    print(error)
}

let result = try! readFile("path/to")

let result2 = try? readFile("path/to")


//: [Next](@next)
