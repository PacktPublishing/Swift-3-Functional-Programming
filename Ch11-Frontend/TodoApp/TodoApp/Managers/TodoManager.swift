//
//  TodoManager.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Alamofire
import Argo

func addTodo(completion:(responseData:[Todo]?, error: NSError?) -> Void) {
    let newRequest = TodoRequest(id: 1, name: "Saturday Grocery", description: "Bananas, Pineapple, Beer, Orange juice, ...", notes: "Cehck expiry date of orange juice", completed: false, synced: true)
    sendRequest(Urls.PostTodo, request: newRequest) { (response, error) in
        if error == nil {
            let todos: [Todo]? = decode(response!)
            completion(responseData: todos, error: nil)
            print("request was successfull: \(todos)")
        } else {
            completion(responseData: nil, error: error)
            print("Error: \(error?.localizedDescription)")
        }
    }
}

func listTodos(completion:(responseData:[Todo]?, error: NSError?) -> Void) {
    sendRequest(Urls.GetTodos, request: RequestModel()) { (response, error) in
        if error == nil {
            let todos: [Todo]? = decode(response!)
            completion(responseData: todos, error: nil)
            print("request was successfull: \(todos)")
        } else {
            completion(responseData: nil, error: error)
            print("Error: \(error?.localizedDescription)")
        }
    }
}

func addOrUpdateTodo(todo: [Todo]?, completion:(responseData:[Todo]?, error: NSError?) -> Void) {
    if let todoItem = todo?.first {
        let newRequest = TodoRequest(id: todoItem.id, name: todoItem.name, description: todoItem.description, notes: todoItem.notes!, completed: todoItem.completed, synced: true)
        sendRequest(Urls.PostTodo, request: newRequest) { (response, error) in
            if error == nil {
                let todos: [Todo]? = decode(response!)
                let newTodo = todoSyncedLens.set(true, todoItem)
                store.dispatch(UpdateTodoAction(todo: newTodo))
                completion(responseData: todos, error: nil)
                print("request was successfull: \(todos)")
            } else {
                completion(responseData: nil, error: error)
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
}

func updateTodo(todo: [Todo]?, completion:(responseData:[Todo]?, error: NSError?) -> Void) {
    if let todoItem = todo?.first {
        let newRequest = TodoRequest(id: todoItem.id, name: todoItem.name, description: todoItem.description, notes: todoItem.notes!, completed: todoItem.completed, synced: true)
        sendRequest(Urls.Update, request: newRequest) { (response, error) in
            if error == nil {
                let todos: [Todo]? = decode(response!)
                let newTodo = todoSyncedLens.set(true, todoItem)
                store.dispatch(UpdateTodoAction(todo: newTodo))
                completion(responseData: todos, error: nil)
                print("request was successfull: \(todos)")
            } else {
                completion(responseData: nil, error: error)
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
}
