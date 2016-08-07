//: [Previous](@previous)

import Foundation

func checkForPath(path: String) -> String? {
    // check for the path
    return "path"
}

//func readFile(path: String) -> String? {
//    if let restult = checkForPath(path: path) {
//        return restult
//    } else {
//        return nil
//    }
//}
//
//if let result = readFile(path: "path/to") {
//    // Do something with result
//}


enum Result: Error {
    case failure
    case success
}

func readFile(path: String) throws -> String {
    if let restult = checkForPath(path: path) {
        return restult
    } else {
        throw Result.failure
    }
}

do {
    let result = try readFile(path: "path/to")
} catch {
    print(error)
}

let result = try! readFile(path: "path/to")

let result2 = try? readFile(path: "path/to")


//: [Next](@next)
