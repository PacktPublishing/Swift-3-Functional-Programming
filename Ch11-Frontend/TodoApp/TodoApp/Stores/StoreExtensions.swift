//
//  StoreExtensions.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift
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
        return activeFilter.producer.flatMap(.latest) {
            filter -> SignalProducer<[Todo], NoError> in
            switch filter {
            case .all: return self.todos.producer
            case .active: return self.incompleteTodos
            case .completed: return self.completedTodos
            case .notSyncedWithBackend: return self.notSyncedWithBackend
            case .selected: return self.selectedTodo
            }
        }
    }
    
    var completedTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map {
            todos in
            return todos.filter { $0.completed }
        }
    }
    
    var incompleteTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map {
            todos in
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
        return allTodosCount.zip(with: incompleteTodosCount)
    }
    
    var notSyncedWithBackend: SignalProducer<[Todo], NoError> {
        return todos.producer.map {
            todos in
            return todos.filter { !$0.synced }
        }
    }
    
    var selectedTodo: SignalProducer<[Todo], NoError> {
        return todos.producer.map {
            todos in
            return todos.filter {
                todo in
                if let selected = todo.selected {
                    return selected
                } else {
                    return false
                }
            }
        }
    }
    
    func producerForTodo(_ todo: Todo) -> SignalProducer<Todo, NoError> {
        return store.todos.producer.map {
            todos in
            return todos.filter { $0 == todo }.first
            }.skipNil()
    }
}

