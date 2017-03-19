//
//  Urls.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-25.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Foundation

enum Urls {
    case postTodo
    case getTodos
    case getTodo
    case deleteTodo
    case deleteAll
    case update
}

extension Urls {
    func httpMethodUrl() -> (String, String) {
        let baseUrl = "http://localhost:8080/"
        switch self {
        case .postTodo:
            return ("POST", "\(baseUrl)postTodo")
        case .getTodos:
            return ("GET", "\(baseUrl)todos")
        case .getTodo:
            return ("GET", "\(baseUrl)todo")
        case .deleteTodo:
            return ("DELETE", "\(baseUrl)deleteTodo")
        case .deleteAll:
            return ("DELETE", "\(baseUrl)deleteAll")
        case .update:
            return ("POST", "\(baseUrl)updateTodo")
        }
    }
}
