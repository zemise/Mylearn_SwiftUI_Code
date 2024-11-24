// 元组

import Foundation

var a = ("a", 1, 1.5, 100, true)

var b = a

print(a)

print(a.0)

b.0 = "123"
// 这里可以看到是深拷贝
print(a.0)

var c:(name1:Int, name2:Int, name3:String) = (100, 200, "hello")
print(c.name3)

var (age1, age2) = (1,2)
print(age1)

