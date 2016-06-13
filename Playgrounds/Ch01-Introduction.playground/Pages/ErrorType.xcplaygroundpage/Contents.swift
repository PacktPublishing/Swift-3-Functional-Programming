//: [Previous](@previous)

import Foundation

// Error Type

enum HttpError: ErrorType {
    case BadRequest
    case Unauthorized
    case Forbidden
    case RequestTimeOut
    case UnsupportedMediaType
    case InternalServerError
    case NotImplemented
    case BadGateway
    case ServiceUnavailable
}

//: [Next](@next)
