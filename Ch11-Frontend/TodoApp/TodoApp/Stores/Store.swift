//
//  Store.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveSwift
import ReactiveCocoa
import Delta

struct Store: StoreType {
    var state: ObservableProperty<State>
    
    init(state: State) {
        self.state = ObservableProperty(state)
    }
}

var store = Store(state: State())
