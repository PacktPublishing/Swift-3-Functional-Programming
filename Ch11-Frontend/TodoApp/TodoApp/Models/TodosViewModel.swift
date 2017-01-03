//
//  Todos.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import ReactiveCocoa

struct TodosViewModel {
    let todos: [Todo]
    
    func todoForIndexPath(_ indexPath: IndexPath) -> Todo {
        return todos[indexPath.row]
    }
}
