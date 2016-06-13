//
//  Todo.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Argo
import Curry

enum TodoFilter: Int {
    case All
    case Active
    case Completed
    case NotSyncedWithBackend
    case Selected
}

struct Todo {
    let id: Int
    let name: String
    let description: String
    let notes: String?
    let completed: Bool
    let synced: Bool
    let selected: Bool?
}

extension Todo: Decodable {
    static func decode(json: JSON) -> Decoded<Todo> {
        return curry(Todo.init)
            <^> json <| "id"
            <*> json <| "name"
            <*> json <| "description"
            <*> json <|? "notes"
            <*> json <| "completed"
            <*> json <| "synced"
            <*> json <|? "selected"
    }
}

extension Todo: Equatable {}

func == (lhs: Todo, rhs: Todo) -> Bool {
    return lhs.id == rhs.id
}