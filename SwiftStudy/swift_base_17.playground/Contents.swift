import UIKit

var greeting = "Hello, playground"

class Person {
    var name: String = ""
    var age: Int?

    func eat() {
        print("吃东西")
    }

    class func live() {
        print("每个人都要活着")
    }
}

class Teacher: Person {
    override class func live() {
        print("作为老师---也要活着")
    }
    
    override func eat() {
        print("作为老师---进职工餐厅吃东西")
    }

    func teaching() {
        print("作为老师---特殊技能----教学生")
    }
}

class Student: Person {
    override func eat() {
        print("作为学生---进学校餐厅吃东西")
    }

    func study() {
        print("作为学生---普通技能----努力学习")
    }
}

print("\n测试================================")

Person.live()
Teacher.live()
Student.live()


var student01 = Student()
student01.eat()
student01.study()

var teacher01 = Teacher()
teacher01.eat()
teacher01.teaching()


