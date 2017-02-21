//: [Previous](@previous)

import Foundation

func sendRequest(completion: @escaping (_ response: String?, _ error: Error?) -> Void) {
    // execute some time consuming operation, if successfull {
    completion("Response", nil)
    //}
}

sendRequest() {
    (response: String?, error: Error?) in
    if let result = response {
        print(result)
    } else if let serverError = error {
        // Error
    }
}

//: [Next](@next)
