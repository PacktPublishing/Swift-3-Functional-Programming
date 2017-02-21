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

let mexicanBananas2 = FunctionalProduct(name: bananas.name, price: bananas.price, quantity: bananas.quantity, producer: Producer(name: "XYZ", address: "New Mexico, Mexico"))

// Lens

struct Lens<Whole, Part> {
    let get: (Whole) -> Part
    let set: (Part, Whole) -> Whole
}

let prodProducerLens: Lens<FunctionalProduct, Producer> = Lens(get: { $0.producer }, set: { FunctionalProduct(name: $1.name, price: $1.price, quantity: $1.quantity, producer: $0) })

let mexicanBananas3 = prodProducerLens.set(Producer(name: "QAZ", address: "Yucatan, Mexico"), mexicanBananas2)

print(mexicanBananas3)

let chineeseProducer = Producer(name: "KGJ", address: "Beijing, China")


//let producerNameLens: Lens<FunctionalProduct, String> = Lens(get: { $0.producer }, set: { FunctionalProduct(name: $1.name, price: $1.price, quantity: <#T##Int#>, producer: <#T##Producer#>)

let producerAddressLens: Lens<Producer, String> = Lens(get: { $0.address }, set: { Producer(name: $1.name, address: $0)})

let chineeseProducer2 = producerAddressLens.set("Shanghai, China", chineeseProducer)

print(chineeseProducer2)

let chineeseBananaProducer = prodProducerLens.set(producerAddressLens.set("Shanghai, China", chineeseProducer), mexicanBananas3)

print(chineeseBananaProducer)

// Lens composition

precedencegroup AssociativityRight {
    associativity: right
}

infix operator >>> : AssociativityRight

func >>><A, B, C>(l: Lens<A,B>, r: Lens<B, C>) -> Lens<A, C> {
    return Lens(get: { r.get(l.get($0)) }, set: {
        (c, a) in
        l.set(r.set(c, l.get(a)), a)
    })
}

let prodProducerAddress = prodProducerLens >>> producerAddressLens
let mexicanBananaProducerAddress = prodProducerAddress.get(mexicanBananas3)

let newProducer = prodProducerAddress.set("Acupulco, Mexico", mexicanBananas3)
print(newProducer)

