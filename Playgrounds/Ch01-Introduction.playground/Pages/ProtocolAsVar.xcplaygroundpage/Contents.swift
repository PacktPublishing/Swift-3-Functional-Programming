//: [Previous](@previous)

import Foundation

protocol HttpProtocol{
    func didRecieveResults(results:NSDictionary)
}

struct WebServiceManager {
    var delegate:HttpProtocol?
    let data: Data
    func test() {
        do {
            let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: self.data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            self.delegate?.didRecieveResults(results: jsonResult)
        } catch let error as NSError {
            print("json error" + error.localizedDescription)
        }
    }
}

//: [Next](@next)
