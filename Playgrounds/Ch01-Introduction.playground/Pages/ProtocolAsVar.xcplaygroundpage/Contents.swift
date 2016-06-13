//: [Previous](@previous)

import Foundation

protocol HttpProtocol{
    func didRecieveResults(results:NSDictionary)
}

struct WebServiceManager {
    var delegate:HttpProtocol?
    let data: NSData
    func test() {
        do {
            let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            self.delegate?.didRecieveResults(jsonResult)
        } catch let error as NSError {
            print("json error" + error.localizedDescription)
        }
    }
}

//: [Next](@next)
