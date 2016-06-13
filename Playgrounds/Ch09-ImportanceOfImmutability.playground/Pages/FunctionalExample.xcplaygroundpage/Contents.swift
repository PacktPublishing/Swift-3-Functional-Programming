//: [Previous](@previous)

import Foundation

struct Producer {
    let name: String
    let address: String
}

struct FunctionalProduct {
    let name: String
    let price: Double
    let quantity: Int
    let producer: Producer
}

struct FunctionalProductTracker {
    let products: [FunctionalProduct]
    let lastModified: NSDate
    
    func addNewProduct(item: FunctionalProduct) -> (date: NSDate, products: [FunctionalProduct]) {
        let newProducts = self.products + [item]
        return (date: NSDate(), products: newProducts)
    }
}



//: [Next](@next)
