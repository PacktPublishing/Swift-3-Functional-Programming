//: [Previous](@previous)

import Foundation

func sendRequest(responseType: String.Type, completion: (responseData:String, error:NSError?) -> Void) {
    // execute some time consuming operation, if successfull {
    completion(responseData: "Response", error: nil)
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
