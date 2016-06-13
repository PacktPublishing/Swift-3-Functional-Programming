//
//  Store.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveCocoa
import Delta

struct Store: StoreType {
    var state: MutableProperty<State>
    
    init(state: State) {
        self.state = MutableProperty(state)
    }
}

var store = Store(state: State())
