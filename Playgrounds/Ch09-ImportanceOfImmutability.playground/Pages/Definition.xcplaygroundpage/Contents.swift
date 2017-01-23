//: [Previous](@previous)

import Foundation

struct Producer {
    let name: String
    let address: String
}

class Product {
    var name: String = ""
    var price: Double = 0.0
    var quantity: Int = 0
    var producer: Producer
    
    init(name: String, price: Double, quantity: Int, producer: Producer) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.producer = producer
    }
}

let producer = Producer(name: "ABC", address: "Toronto, Ontario, Canada")
var bananas = Product(name: "Banana", price: 0.79, quantity: 2, producer: producer)
var oranges = Product(name: "Orange", price: 2.99, quantity: 1, producer: producer)
var apples = Product(name: "Apple", price: 3.99, quantity: 3, producer: producer)

var products = [bananas, oranges, apples]

class ProductTracker {
    private var products: [Product] = []
    private var lastModified: NSDate?
    
    func addNewProduct(item: Product) -> (date: NSDate, productCount: Int) {
        products.append(item)
        lastModified = NSDate()
        return (date: lastModified!, productCount: products.count)
    }
    
    func lastModifiedDate() -> NSDate? {
        return lastModified
    }
    
    func productList() -> [Product] {
        return products
    }
}

// Low coupling

let numbers: [Int] = [1, 2, 3, 4, 5]
let sumOfEvens = numbers.reduce(0) {
    $0 + (($1 % 2 == 0) ? $1 : 0)
}


print(numbers) // [1, 2, 3, 4, 5]
print(sumOfEvens) // 6

// Avoiding temporal coupling

func sendRequest() {
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    
    var url: URL?
    var request: URLRequest
    
    /* First request block starts: */
    url = URL(string: "https://httpbin.org/get")
    request = URLRequest(url: url! as URL)
    request.httpMethod = "GET"
    
    let task = session.dataTask(with: request, completionHandler: {
        (data: Data?, response: URLResponse?, error: Error?) -> Void in
        
        if (error == nil) {
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Task Succeeded: HTTP \(statusCode)")
        } else {
            print("URL Session Task Failed: %@", error!.localizedDescription);
        }
    })
    task.resume()
    /* First request block ends */
    
    /* Second request block starts */
    url = URL(string: "http://requestb.in/1g4pzn21") // replace with a new requestb.in
    request = URLRequest(url: url! as URL)
    
    let secondTask = session.dataTask(with: request, completionHandler: {
        (data: Data?, response: URLResponse?, error: Error?) -> Void in
        
        if (error == nil) {
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Task Succeeded: HTTP \(statusCode)")
        } else {
            print("URL Session Task Failed: %@", error!.localizedDescription);
        }
    })
    secondTask.resume()
}

print(sendRequest())

//: [Next](@next)
