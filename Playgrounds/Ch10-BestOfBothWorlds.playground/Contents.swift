import UIKit

/*
class User {
    let name = "Constant name"
    var age: Int = 0

    func incrementUserAgeByOne() {
        self.age += 1
    }
}

let object1 = User()
object1.age = 2
object1.incrementUserAgeByOne()

let object2 = object1


print(object2.age)
object2.incrementUserAgeByOne()
print(object1.age)

let object3 = User()
object3.age = 5

object3.incrementUserAgeByOne()
print(object3.age)
print(object1.age)
*/

class User {
    fileprivate let name: String
    fileprivate let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func incrementUserAge(n: Int) -> Int {
        return self.age + n
    }
}

let object1 = User(name: "Grace", age: 1)
//object1.age = 2
let object2 = object1
//object1.incrementUserAgeByOne()
print(object2.age)
//object2.incrementUserAgeByOne()
print(object1.age)

let object3 = User(name: "John Doe", age: 3)
//object3.age = 5

object3.incrementUserAge(n: 5)
print(object3.age)
print(object1.age)


class BaseViewController: UIViewController { }


var view: UIView

view = UIButton()
view = UILabel()
view = UITextField()

view.bounds
view.frame.origin


protocol UserProtocol {
    func greet(name: String) -> String
    func login(username: String, password: String) -> Bool
}

extension UserProtocol {
    func logout(userName: String) -> Bool {
        return true
    }
}

enum UserType: UserProtocol {
    case Admin
    case EndUser
    
    func greet(name: String) -> String {
        switch self {
        case .Admin:
            return "Welcome \(name) - You are Admin"
        case .EndUser:
            return "Welcome \(name)!"
        }
    }
    func login(username: String, password:String) -> Bool {
        return true
    }
}

let adminUser: UserType = UserType.Admin
adminUser.greet(name: "Cindy")


protocol MobileAppUserProtocol: UserProtocol {
    associatedtype applicationModuleList
    func listSelectedModules() -> [applicationModuleList]
}

enum MobileAppUserType: MobileAppUserProtocol {
    case Admin
    case EndUser
    
    func greet(name: String) -> String {
        switch self {
        case .Admin:
            return "Welcome \(name) - You are Admin"
        case .EndUser:
            return "Welcome \(name)!"
        }
    }
    func login(username: String, password:String) -> Bool {
        return true
    }
    func listSelectedModules() -> [String] {
        return ["Accounting", "CRM"]
    }
}

let mobileUser: MobileAppUserType = MobileAppUserType.Admin
mobileUser.logout(userName: "Su Tamina")

mobileUser.listSelectedModules()


// FRP
/*
@IBOutlet weak var textFieldUserName: UITextField!

let userNameSignalProducer = textFieldUserName.rac_textSignal().toSignalProducer.map {
    text in
    text as! String
}


userNameSignalProducer.startWithNext {
    results in
    print("User name:\(results)")
}
*/
