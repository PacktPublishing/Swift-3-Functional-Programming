//
//  WebServiceManager.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Alamofire

func sendRequest(_ url: Urls,
                 request: RequestProtocol,
                 completion: @escaping (_ responseData: AnyObject?, _ error: Error?) -> Void) {
    // Add headers
    let headers = configureHeaders(request)
    // Get request method and full url
    let (method, url) = url.httpMethodUrl()
    var urlRequest = URLRequest(url: URL(string: url)!)
    urlRequest.httpMethod = method
    urlRequest.allHTTPHeaderFields = headers
    
    // Fetch request
    let manager = Alamofire.SessionManager.default
    manager.request(urlRequest as URLRequestConvertible)
        .validate()
        .responseJSON {
            response in
            if (response.result.error == nil) {
                debugPrint("HTTP Response Body: \(response.data)")
                completion(response.result.value as AnyObject?, nil)
            } else {
                debugPrint("HTTP Request failed: \(response.result.error)")
                completion(nil, response.result.error)
            }
    }
}

func configureHeaders(_ request: RequestProtocol) -> [String: String] {
    let listOfProperties = request.getPropertyNames()
    var configuredRequestHeaders = Dictionary<String, String>()
    
    for property in listOfProperties {
        let (propertyValue, propertyName) = request[property]
        if propertyName != nil {
            configuredRequestHeaders[propertyName!] = propertyValue
        }
    }
    configuredRequestHeaders["accepts"] = "JSON"
    
    return configuredRequestHeaders
}
