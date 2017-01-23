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

struct FunctionalProduct {
    let name: String
    let price: Double
    let quantity: Int
    let producer: Producer
    
    init(name: String, price: Double, quantity: Int, producer: Producer) {
        
        self.name = name
        self.price = price
        self.quantity = quantity
        self.producer = producer
    }
    
    init(product: FunctionalProduct, name: String?, price: Double?, quantity: Int?, producer: Producer?) {
        
        self.name = name ?? product.name
        self.price = price ?? product.price
        self.quantity = quantity ?? product.quantity
        self.producer = producer ?? product.producer
    }
}

let producer = Producer(name: "ABC", address: "Toronto, Ontario, Canada")
var bananas = Product(name: "Banana", price: 0.79, quantity: 2, producer: producer)
var oranges = Product(name: "Orange", price: 2.99, quantity: 1, producer: producer)
var apples = Product(name: "Apple", price: 3.99, quantity: 3, producer: producer)

let mexicanBananas = FunctionalProduct(name: bananas.name, price: bananas.price, quantity: bananas.quantity, producer: Producer(name: "XYZ", address: "New Mexico, Mexico"))


struct FunctionalProductTracker {
    let products: [FunctionalProduct]
    let lastModified: Date
    
    init(products: [FunctionalProduct], lastModified: Date) {
        
        self.products = products
        self.lastModified = lastModified
    }
    
    init(productTracker: FunctionalProductTracker, products: [FunctionalProduct]? = nil, lastModified: Date? = nil) {
        
        self.products = products ?? productTracker.products
        self.lastModified = lastModified ?? productTracker.lastModified
    }
    
    func addNewProduct(item: FunctionalProduct) -> (date: Date, products: [FunctionalProduct]) {
            
            let newProducts = self.products + [item]
            return (date: Date(), products: newProducts)
    }
    
    func addNewProduct(item: FunctionalProduct) -> FunctionalProductTracker {
        
        return FunctionalProductTracker(productTracker: self, products: self.products + [item])
    }
}



//: [Next](@next)
