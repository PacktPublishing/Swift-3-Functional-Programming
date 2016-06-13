//
//  State.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveCocoa

private let initialTodos: [Todo] = []

struct State {
    let todos = MutableProperty(initialTodos)
    let filter = MutableProperty(TodoFilter.All)
    let notSynced = MutableProperty(TodoFilter.NotSyncedWithBackend)
    let selectedTodoItem = MutableProperty(TodoFilter.Selected)
}