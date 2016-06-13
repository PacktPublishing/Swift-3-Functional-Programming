//
//  Urls.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Foundation
import Alamofire

enum Urls {
    case PostTodo
    case GetTodos
    case GetTodo
    case DeleteTodo
    case DeleteAll
    case Update
}

extension Urls {
    func httpMethodUrl() -> (Alamofire.Method, String) {
        let baseUrl = "http://localhost:8080/"
        switch self {
        case .PostTodo:
            return (.POST, "\(baseUrl)postTodo")
        case .GetTodos:
            return (.GET, "\(baseUrl)todos")
        case .GetTodo:
            return (.GET, "\(baseUrl)todo")
        case .DeleteTodo:
            return (.DELETE, "\(baseUrl)deleteTodo")
        case .DeleteAll:
            return (.DELETE, "\(baseUrl)deleteAll")
        case .Update:
            return (.POST, "\(baseUrl)updateTodo")
        }
    }
}