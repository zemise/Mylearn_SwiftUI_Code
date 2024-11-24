import Foundation

// 类型别名
typealias dog = Int
var a: dog = 5
var b: Int = 20
print(a, b)

// 类型转换
var c = 100
print("c值等于 = \(c)")
print("c值等于 = " + String(c))


// ??语法 可用于转换
var message = "hello"
print(Int(message) ?? 100)

print(Int(200.5))
print(Bool(0))
