import Vapor
import VaporMustache


let app = Application()

/**
	This first route will return the welcome.html
	view to any request to the root directory of the website.

	Views referenced with `app.view` are by default assumed
	to live in <workDir>/Resources/Views/ 

	You can override the working directory by passing
	--workDir to the application upon execution.
*/
app.get("/") { request in
	return try app.view("welcome.html")
}

/**
	Return JSON requests easy by wrapping
	any JSON data type (String, Int, Dict, etc)
	in JSON() and returning it.

	Types can be made convertible to JSON by
	conforming to JSONRepresentable. The User
	model included in this example demonstrates this.

	By conforming to JSONRepresentable, you can pass
	the data structure into any JSON data as if it
	were a native JSON data type.
*/
app.get("json") { request in
    return JSON([
        "number": 123,
        "string": "test",
        "array": JSON([
            0, 1, 2, 3
        ]),
        "dict": JSON([
            "name": "Vapor",
            "lang": "Swift"
        ])
    ])
}

// Functional Swift

/// Post a todo item
app.post("postTodo") { request in
    guard let id = request.headers.headers["id"]?.values,
        name = request.headers.headers["name"]?.values,
        description = request.headers.headers["description"]?.values,
        notes = request.headers.headers["notes"]?.values,
        completed = request.headers.headers["completed"]?.values,
        synced = request.headers.headers["synced"]?.values
        else {
            return JSON(["message": "Please include mandatory parameters"])
    }
    
    let todoItem = Todo(id: Int(id[0])!,
                      name: name[0],
               description: description[0],
                     notes: notes[0],
                 completed: completed[0].toBool()!,
                    synced: synced[0].toBool()!)
    
    let todos = TodoStore.sharedInstance
    todos.addOrUpdateItem(item: todoItem)
    
    let json:[JSONRepresentable] = todos.listItems().map { $0 }
    return JSON(json)
}

/// List todo items
app.get("todos") { request in
    
    let todos = TodoStore.sharedInstance
    let json:[JSONRepresentable] = todos.listItems().map { $0 }
    return JSON(json)
}

/// Get a specific todo item
app.get("todo") { request in
    
    guard let id = request.headers.headers["id"]?.values else {
        return JSON(["message": "Please provide the id of todo item"])
    }
    
    let todos = TodoStore.sharedInstance.listItems()
    var json = [JSONRepresentable]()
    
    let item = todos.filter { $0.id == Int(id[0])! }
    if item.count > 0 {
        json.append(item[0])
    }
    
    return JSON(json)
}

/// Delete a specific todo item
app.delete("deleteTodo") { request in
    guard let id = request.headers.headers["id"]?.values else {
        return JSON(["message": "Please provide the id of todo item"])
    }
    
    let todos = TodoStore.sharedInstance
    todos.delete(id: Int(id[0])!)
    
    return JSON(["message": "Item is deleted"])
}

/// Delete all items
app.delete("deleteAll") { request in
    TodoStore.sharedInstance.deleteAll()
    
    return JSON(["message": "All items are deleted"])
}

/// Update a specific todo item
app.post("updateTodo") { request in
    guard let id = request.headers.headers["id"]?.values,
        name = request.headers.headers["name"]?.values,
        description = request.headers.headers["description"]?.values,
        notes = request.headers.headers["notes"]?.values,
        completed = request.headers.headers["completed"]?.values,
        synced = request.headers.headers["synced"]?.values
        else {
            return JSON(["message": "Please include mandatory parameters"])
    }
    
    let todoItem = Todo(id: Int(id[0])!,
                      name: name[0],
               description: description[0],
                     notes: notes[0],
                 completed: completed[0].toBool()!,
                    synced: synced[0].toBool()!)
    
    let todos = TodoStore.sharedInstance
    todos.update(item: todoItem)
    return JSON(["message": "Item is updated"])
}


/**
	This route shows the various ways to access 
	request data with a manual (not type safe) route.

	Visit "data/<some-string>" to view the output.
*/
app.any("data/:id") { request in
	return JSON([
		"request.path": request.uri.path ?? "",
		"request.data": "\(request.data)",
		"request.parameters": "\(request.parameters)",
	])
}

/**
	Here's an example of using type-safe routing to ensure 
	only requests to "posts/<some-integer>" will be handled.

	String is the most general and will match any request
	to "posts/<some-string>". To make your data structure
	work with type-safe routing, make it StringInitializable.

	The User model included in this example is StringInitializable.
*/
app.get("posts", Int.self) { request, postId in 
	return "Requesting post with ID \(postId)"
}

/**
	This will set up the appropriate GET, PUT, and POST
	routes for basic CRUD operations. Check out the
	UserController in App/Controllers to see more.

	Controllers are also type-safe, with their types being
	defined by which StringInitializable class they choose
	to receive as parameters to their functions.
*/
app.resource("users", controller: UserController.self)

/**
    A custom validator definining what
    constitutes a valid name. Here it is 
    defined as an alphanumeric string that
    is between 5 and 20 characters.
*/
class Name: ValidationSuite {
    static func validate(input value: String) throws {
        let evaluation = OnlyAlphanumeric.self
            && Count.min(5)
            && Count.max(20)

        try evaluation.validate(input: value)
    }
}

/**
    By using `Valid<>` properties, the
    employee class ensures only valid
    data will be stored.
*/
class Employee {
    var email: Valid<Email>
    var name: Valid<Name>

    init(request: Request) throws {
        email = try request.data["email"].validated()
        name = try request.data["name"].validated()
    }
}

/**
    Allows any instance of employee
    to be returned as JSON
*/
extension Employee: JSONRepresentable {
    func makeJson() -> JSON {
        return JSON([
            "email": email.value,
            "name": name.value
        ])
    }
}

app.any("validation") { request in
    return try Employee(request: request)
}

/**
	This simple plaintext response is useful
	when benchmarking Vapor.
*/
app.get("plaintext") { request in
	return "Hello, World!"
}

/**
	Vapor automatically handles setting
	and retreiving sessions. Simply add data to
	the session variable and–if the user has cookies
	enabled–the data will persist with each request.
*/
app.get("session") { request in
	let json = JSON([
		"session.data": "\(request.session)",
		"request.cookies": "\(request.cookies)",
		"instructions": "Refresh to see cookie and session get set."
	])
	var response = Response(status: .ok, json: json)

	request.session?["name"] = "Vapor"
	response.cookies["test"] = "123"

	return response
}

/**
 Add Localization to your app by creating
 a `Localization` folder in the root of your
 project.
 /Localization
 |- en.json
 |- es.json
 |_ default.json
 The first parameter to `app.localization` is
 the language code.
 */
app.get("localization", String.self) { request, lang in
    return JSON([
        "title": app.localization[lang, "welcome", "title"],
        "body": app.localization[lang, "welcome", "body"]
        ])
}

/**
 Middleware is a great place to filter
 and modifying incoming requests and outgoing responses.
 Check out the middleware in App/Middelware.
 You can also add middleware to a single route by
 calling the routes inside of `app.middleware(MiddelwareType) {
 app.get() { ... }
 }`
 */
app.globalMiddleware.append(SampleMiddleware())

/**
 Appending a provider allows it to boot
 and initialize itself as a dependency.
 Includes are relative to the Views (`Resources/Views`)
 directory by default.
 */
app.providers.append(VaporMustache.Provider(withIncludes: [
    "header": "Includes/header.mustache"
    ]))

let port = app.config["app", "port"].int ?? 80

// Print what link to visit for default port
print("Visit http://localhost:\(port)")
app.start()
