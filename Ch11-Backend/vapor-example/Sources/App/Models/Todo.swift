//
//  Todo.swift
//  VaporApp
//
//  Created by Fatih Nayebi on 2017-01-03.
//
//

import Vapor
import Fluent

final class Todo: Model {
    var id: Node?
    var todoId: Int
    var name: String
    var description: String
    var notes: String
    var completed: Bool
    var synced: Bool
    
    var exists: Bool = false
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        todoId = try node.extract("todoId")
        name = try node.extract("name")
        description = try node.extract("description")
        notes = try node.extract("notes")
        completed = try node.extract("completed")
        synced = try node.extract("synced")
        
    }
    
    init(todoId: Int, name: String, description: String, notes: String, completed: Bool, synced: Bool) {
        self.todoId = todoId
        self.name = name
        self.description = description
        self.notes = notes
        self.completed = completed
        self.synced = synced
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "todoId": todoId,
            "name": "\(name)",
            "description": "\(description)",
            "notes": "\(notes)",
            "completed": completed,
            "synced": synced
            ])
        
    }
    
    static func prepare(_ database: Database) throws {
        //
    }
    
    static func revert(_ database: Database) throws {
        //
    }
}

extension Todo: NodeConvertible {

}


extension String {
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
}

