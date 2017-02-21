//
//  loadTodosAction.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-29.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Delta

struct LoadTodosAction: ActionType {
    let todos: [Todo]
    
    func reduce(state: State) -> State {
        state.todos.value = state.todos.value + todos
        return state
    }
}
