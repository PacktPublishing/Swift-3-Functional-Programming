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
    let lastModified: Date
    
    func addNewProduct(item: FunctionalProduct) -> (date: Date, products: [FunctionalProduct]) {
        let newProducts = self.products + [item]
        return (date: Date(), products: newProducts)
    }
}



//: [Next](@next)
