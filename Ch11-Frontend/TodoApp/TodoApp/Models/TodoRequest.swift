//
//  TodoRequest.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import Foundation

struct TodoRequest: RequestProtocol {
    
    let todoId: Int
    let name: String
    let description: String
    let notes: String
    let completed: Bool
    let synced: Bool
    
    subscript(key: String) -> (String?, String?) {
        get {
            switch key {
            case "todoId": return (String(todoId), "todoId")
            case "name": return (name, "name")
            case "description": return (description, "description")
            case "notes": return (notes, "notes")
            case "completed": return (String(completed), "completed")
            case "synced": return (String(synced), "synced")
            default: return ("Cookie","test=123")
            }
        }
    }
}

struct RequestModel: RequestProtocol {
    subscript(key: String) -> (String?, String?) {
        get {
            switch key {
            default: return ("Cookie","test=123")
            }
        }
    }
}
