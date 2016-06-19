//
//  WebServiceManager.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Alamofire

func sendRequest(url: Urls,
             request: RequestProtocol,
          completion: (responseData: AnyObject?,
                              error: NSError?) -> Void) {
    // Add headers
    let headers = configureHeaders(request)
    // Get request method and full url
    let (method, url) = url.httpMethodUrl()
    
    // Fetch request
    Alamofire.request(method, url, headers: headers, encoding: .JSON)
        .validate()
        .responseJSON { response in
            if (response.result.error == nil) {
                debugPrint("HTTP Response Body: \(response.data)")
                completion(responseData: response.result.value, error: nil)
            } else {
                debugPrint("HTTP Request failed: \(response.result.error)")
                completion(responseData: nil, error: response.result.error)
            }
    }
}

func configureHeaders(request: RequestProtocol) -> [String: String] {
    let listOfProperties = request.getPropertyNames()
    var configuredRequestHeaders = Dictionary<String, String>()
    
    for property in listOfProperties {
        let (propertyValue, propertyName) = request[property]
        if propertyName != nil {
            configuredRequestHeaders[propertyName!] = propertyValue
        }
    }
    
    return configuredRequestHeaders
}
