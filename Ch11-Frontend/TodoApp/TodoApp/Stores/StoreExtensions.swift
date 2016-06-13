//
//  StoreExtensions.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveCocoa
import Result

// MARK: Properties
extension Store {
    var todos: MutableProperty<[Todo]> {
        return state.value.todos
    }
    
    var activeFilter: MutableProperty<TodoFilter> {
        return state.value.filter
    }
    
    var selectedTodoItem: MutableProperty<TodoFilter> {
        return state.value.selectedTodoItem
    }
    
}

// MARK: SignalProducers
extension Store {
    var activeTodos: SignalProducer<[Todo], NoError> {
        return activeFilter.producer.flatMap(.Latest) { filter -> SignalProducer<[Todo], NoError> in
            switch filter {
            case .All: return self.todos.producer
            case .Active: return self.incompleteTodos
            case .Completed: return self.completedTodos
            case .NotSyncedWithBackend: return self.notSyncedWithBackend
            case .Selected: return self.selectedTodo
            }
        }
    }
    
    var completedTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { $0.completed }
        }
    }
    
    var incompleteTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { !$0.completed }
        }
    }
    
    var incompleteTodosCount: SignalProducer<Int, NoError> {
        return incompleteTodos.map { $0.count }
    }
    
    var allTodosCount: SignalProducer<Int, NoError> {
        return todos.producer.map { $0.count }
    }
    
    var todoStats: SignalProducer<(Int, Int), NoError> {
        return allTodosCount.zipWith(incompleteTodosCount)
    }
    
    var notSyncedWithBackend: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { !$0.synced }
        }
    }
    
    var selectedTodo: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { todo in
                if let selected = todo.selected {
                    return selected
                } else {
                    return false
                }
            }
        }
    }
    
    func producerForTodo(todo: Todo) -> SignalProducer<Todo, NoError> {
        return store.todos.producer.map { todos in
            return todos.filter { $0 == todo }.first
            }.ignoreNil()
    }
}

