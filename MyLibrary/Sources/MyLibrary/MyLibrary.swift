// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct MyLibrary {
    var text = "Hello, World"

    public func printText() {
        print(text)
    }
}

public class Person {
    public var name: String = "Hello!!!"
    var age: Int?

    public init(name: String) {
        self.name = name
    }
}
