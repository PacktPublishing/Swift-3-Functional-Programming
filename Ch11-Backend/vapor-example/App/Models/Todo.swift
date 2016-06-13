import Vapor

final class Todo {
    var id: Int
    var name: String
    var description: String
    var notes: String
    var completed: Bool
    var synced: Bool
    
    init(id: Int, name: String, description: String, notes: String, completed: Bool, synced: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.notes = notes
        self.completed = completed
        self.synced = synced
    }
}

/**
	This allows instances of Todo to be
	passed into Json arrays and dictionaries
	as if it were a native JSON type.
 */
extension Todo: JsonRepresentable {
    func makeJson() -> Json {
        
        return Json([
            "id":id,
            "name": "\(name)",
            "description": "\(description)",
            "notes": "\(notes)",
            "completed": completed,
            "synced": synced
            ])
    }
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

///**
//	If a data structure is StringInitializable,
//	it's Type can be passed into type-safe routing handlers.
//*/
//extension Todo: StringInitializable {
//
////    convenience init?(from string: String) throws {
////        self.init(name: string, description: description, notes: notes, completed: completed)
////    }
////    convenience init?(from name: String) throws {
////        self.init(name: name, description: "", notes: "", completed: "")
////    }
//
//    convenience init?(from string: String) throws {
//        self.init(name: string)
//    }
//}