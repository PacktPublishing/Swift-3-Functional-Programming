//
//  ReactiveCocoa.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift
import Delta

extension MutableProperty: Delta.ObservablePropertyType {
    public typealias ValueType = Value
}

struct RAC {
    var target : NSObject!
    var keyPath : String!
    var nilValue : AnyObject!
    
    init(_ target: NSObject!, _ keyPath: String, nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
}

//infix operator ~>
//func ~> (signal: RACSignal, rac: RAC) {
//    rac.assignSignal(signal)
//}
//
//func RACObserve(_ target: NSObject!, keyPath: String) -> RACSignal  {
//    return target.rac_valuesForKeyPath(keyPath, observer: target)
//}
