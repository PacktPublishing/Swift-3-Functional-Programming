//: [Previous](@previous)

import Foundation

protocol HttpProtocol{
    func didRecieveResults(results: Any)
}

struct WebServiceManager {
    var delegate:HttpProtocol?
    let data: Data
    func test() {
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: self.data, options: JSONSerialization.ReadingOptions.mutableContainers)
            self.delegate?.didRecieveResults(results: jsonResult)
        } catch let error as NSError {
            print("json error" + error.localizedDescription)
        }
    }
}

//: [Next](@next)
