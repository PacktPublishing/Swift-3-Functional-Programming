//: [Previous](@previous)

import Foundation

func sendRequest(responseType: String.Type, completion: (_ responseData:String, _ error:NSError?) -> Void) {
    // execute some time consuming operation, if successfull {
    completion("Response", nil)
    //}
}

sendRequest(responseType: String.self) {
    (response: String?, error: NSError?) in
    if let result = response {
        print(result)
    } else if let serverError = error {
        // Error
    }
}

//: [Next](@next)
