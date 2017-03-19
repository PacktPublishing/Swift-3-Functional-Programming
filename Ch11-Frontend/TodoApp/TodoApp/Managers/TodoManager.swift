//
//  TodoManager.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Alamofire
import Argo

func addTodo(_ completion:@escaping (_ responseData: [Todo]?, _ error: Error?) -> Void) {
    let newRequest = TodoRequest(todoId: 1,
                                 name: "Saturday Grocery",
                                 description: "Bananas, Pineapple, Beer, Orange juice, ...",
                                 notes: "Cehck expiry date of orange juice",
                                 completed: false,
                                 synced: true)
    
    sendRequest(Urls.postTodo, request: newRequest) {
        (response, error) in
        if error == nil {
            let todos: [Todo]? = decode(response!)
            completion(todos, nil)
            print("request was successfull: \(todos)")
        } else {
            completion(nil, error)
            print("Error: \(error?.localizedDescription)")
        }
    }
}

func listTodos(_ completion:@escaping  (_ responseData:[Todo]?, _ error: Error?) -> Void) {
    sendRequest(Urls.getTodos, request: RequestModel()) {
        (response, error) in
        if error == nil {
            let todos: [Todo]? = decode(response!)
            completion(todos, nil)
            print("request was successfull: \(todos)")
        } else {
            completion(nil, error)
            print("Error: \(error?.localizedDescription)")
        }
    }
}

func addOrUpdateTodo(_ todo: [Todo]?, completion:@escaping (_ responseData:[Todo]?, _ error: Error?) -> Void) {
    if let todoItem = todo?.first {
        let newRequest = TodoRequest(todoId: todoItem.todoId,
                                     name: todoItem.name,
                                     description: todoItem.description,
                                     notes: todoItem.notes!,
                                     completed: todoItem.completed,
                                     synced: true)
        
        sendRequest(Urls.postTodo, request: newRequest) {
            (response, error) in
            if error == nil {
                let todos: [Todo]? = decode(response!)
                let newTodo = todoSyncedLens.set(true, todoItem)
                store.dispatch(UpdateTodoAction(todo: newTodo))
                completion(todos, nil)
                print("request was successfull: \(todos)")
            } else {
                completion(nil, error)
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
}

func updateTodo(_ todo: [Todo]?, completion:@escaping (_ responseData:[Todo]?, _ error: Error?) -> Void) {
    if let todoItem = todo?.first {
        let newRequest = TodoRequest(todoId: todoItem.todoId,
                                     name: todoItem.name,
                                     description: todoItem.description,
                                     notes: todoItem.notes!,
                                     completed: todoItem.completed,
                                     synced: true)
        
        sendRequest(Urls.update, request: newRequest) {
            (response, error) in
            if error == nil {
                let todos: [Todo]? = decode(response!)
                let newTodo = todoSyncedLens.set(true, todoItem)
                store.dispatch(UpdateTodoAction(todo: newTodo))
                completion(todos, nil)
                print("request was successfull: \(todos)")
            } else {
                completion(nil, error)
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
}
