//: [Previous](@previous)

import Foundation

// Error Protocol

enum HttpError: ErrorProtocol {
    case badRequest
    case unauthorized
    case forbidden
    case requestTimeOut
    case unsupportedMediaType
    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnavailable
}

//: [Next](@next)
