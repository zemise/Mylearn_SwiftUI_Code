import Foundation

// 可选类型
var a: Int? = 10
var b: Int? = nil

print(a)

print(b)

// 不确定的值，在这里是也是转换为了option类型
print(Int("100"))

// 确定有值的话，可以感叹号强制解包
print(a!)

var value: String? = ""

value = nil

if value == nil {
    print("value没有值")
} else {
    print("value的值 = " + value!)
}
