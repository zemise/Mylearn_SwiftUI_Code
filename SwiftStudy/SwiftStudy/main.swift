//
// main.swift
// Using Swift 5.0
//
// Created by Zemise on 2024/10/11
// Copyright (c) 2023 SwiftStudy. All rights reserved.
//

import Foundation

// 闭包部分
print("=========================================================")
// 函数
func hello() {
    print("hello")
}

func hello_arg(name: String) {
    print("你好\(name)")
}

func sums(a: Int, b: Int) -> Int {
    a + b
}

// 调用
hello()

// 匿名函数
let hi = {
    print("hello hi")
}

// 调用匿名函数
hi()

// 匿名函数调用参数
let hi_arg = { (name: String) in
    print("你好，\(name)")
}

hi_arg("张三")

print(sums(a: 3, b: 6))

let sum_arg = { (a: Int, b: Int) -> Int in
    a + b
}

print(sum_arg(3, 5))

func hi_2() -> String {
    "你好， 张三"
}

print(hi_2())

let hi_3 = { () -> String in
    "你好，李四"
}

print(hi_3())

func sayHi(action: () -> Void) {
    action()
    print("最近阿妹和三名")
}

let hi_4 = {
    print("你好---")
}

sayHi(action: hi_4)

sayHi {
    print("this is a test")
}

sayHi {
    hi_4()
}

sayHi {
    () in print("another tesr")
}

print("================================================")

// 函数的参数是另一个函数
func travel(action: () -> Void) {
    print("我现在出发了")
    action()
    print("我已经到了")
}

// 这种是函数的最后一个参数是闭包参数时，可以使用这种写法
travel {
    print("++++")
}

// 正常写法
travel(action: {
    print("------")
})

print("================================================")

func fly(action: (String, Int) -> String) {
    print("我准备飞了")
    print(action("郑州", 4))
    print("我已经飞到了")
}

fly(action: { (place: String, time: Int) -> String in

//    print("我\(time)点坐飞机去\(place)")
    "我\(time)点坐飞机去\(place)"
})

fly {
    "我\($1)点坐飞机去\($0)"
}

print("================================================")

func driver() -> (String) -> Void {
    return { (place: String) in
        print("我想去\(place)")
    }
}

let r = driver() // 接受返回的函数
r("郑州") // 调用这个函数

print("================================================")

func read(book: String) -> () -> Void {
    print("我正在读\(book)")
    var count = 0
    return {
        count += 1
        print("第\(count)次读\(book)")
    }
}

let a = read(book: "三国演义")
a()
a()

// 重温数组的方法
print("=========================================================")

let numbers = [1, 2, 3, 4, 5, 6]
let n1 = numbers.map { (n: Int) in
    n * n
}

print(n1)

// map的作用：产生新的数组，每一个元素要经过map的加工
let n2 = numbers.map {
    $0 * $0
}

print(n2)

// filter的作用：产生新的数组，每一个元素要经过filter判断过滤，true返回，false抛弃
let n3 = numbers.filter {
    $0 > 2
}

print(n3)

let n4 = numbers.filter {
    $0 > 2
}
.filter {
    $0 < 5
}

print(n4)

// reduce的作用是，设定一个初始值，数组中的每一个数字与其作用
let n5 = numbers.reduce(100) {
    $0 + $1
}

print(n5)

print("====================================================")
// 类1

import SwiftUI

class Car {
    var countOfWheels: Int
    var countOfWindows: Int
    var countOfDoor: Int
    private var color: Color
    var brandName: String?

    private static var countOfCars = 0

    init() {
        self.countOfWheels = 4
        self.countOfWindows = 4
        self.countOfDoor = 4
        self.color = .white

        Self.countOfCars += 1
    }

    func changeColor(color: Color) {
        self.color = color
    }

    func getColor() -> Color {
        return self.color
    }

    func getBrandName() -> String? {
        return self.brandName
    }

    static func getCountOfCars() -> Int {
        return Car.countOfCars
    }
}

var aCar: Car = .init()
print(aCar.countOfDoor)

aCar.changeColor(color: .black)
print(aCar.getColor())

print(Car.getCountOfCars())


print("====================================================")
// 类2

class Student{
    private var name:String
    private var hobbies:[String]
    
    init(name:String){
        self.name = name
        self.hobbies = ["basketball", "football","tabletennis"]
    }
 }
