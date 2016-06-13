//: [Previous](@previous)

import Foundation

class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}
let julie = User(name: "Julie")

struct Student {
    var user: User
}

let student = Student(user:julie)
student.user.name // prints "Julie"
let anotherStudent = student
julie.name = "Julie Jr."
anotherStudent.user.name // prints "Julie Jr."

//: [Next](@next)
