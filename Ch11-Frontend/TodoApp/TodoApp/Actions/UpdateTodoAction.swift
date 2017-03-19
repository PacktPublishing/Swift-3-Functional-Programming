//
//  UpdateTodoAction.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-29.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Delta

struct UpdateTodoAction: ActionType {
    let todo: Todo
    
    func reduce(state: State) -> State {
        state.todos.value = state.todos.value.map {
            todo in
            guard todo == self.todo else { return todo }
            
            return Todo(todoId: todo.todoId,
                        name: self.todo.name,
                        description: self.todo.description,
                        notes: self.todo.notes,
                        completed: self.todo.completed,
                        synced: !todo.synced,
                        selected: todo.selected)
        }
        
        return state
    }
}
