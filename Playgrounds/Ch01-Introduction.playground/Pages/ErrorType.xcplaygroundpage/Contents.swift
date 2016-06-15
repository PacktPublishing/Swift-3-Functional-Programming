//: [Previous](@previous)

import Foundation

// Error Type

enum HttpError: ErrorType {
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
