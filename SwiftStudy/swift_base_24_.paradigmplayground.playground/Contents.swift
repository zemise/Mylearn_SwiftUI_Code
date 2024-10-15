import UIKit

var greeting = "Hello, playground"

print("范型=====================")

let strArr = [String]()

let intArr = [Int]()

func getIntTypeName(dataType: Int.Type) {
    print(dataType)
}

func getIntTypeName(dataType: String.Type) {
    print(dataType)
}

func getIntTypeName(dataType: Double.Type) {
    print(dataType)
}

getIntTypeName(dataType: Int.self)
getIntTypeName(dataType: String.self)
getIntTypeName(dataType: Double.self)

/// 1 ----- Int
/// Int ---- Int.Type

func getTypeName<T, E>(_ data1: T, _ data2: E) {
    let t = type(of: data1 as Any)
    print(t)

    let e = type(of: data2 as Any)
    print(e)
}

getTypeName("1", 1)

class RichMan<p> {
    private var property: p

    func getProperty() -> p {
        self.property
    }

    init(property: p) {
        self.property = property
    }
}

struct House {
    var name = "House"
}

struct Car {
    var name = "Car"
}

let richMan = RichMan(property: House())
let richMan02 = RichMan(property: Car())

richMan.getProperty().name
richMan02.getProperty().name

//

protocol PropertyProtocol {
    init()
}

class RichMan2<p: PropertyProtocol> {
    private var property: p

    func getProperty() -> p {
        self.property
    }

    init(property: p) {
        self.property = property
    }
}

struct House2: PropertyProtocol {
    var name = "House"
}

let richman2 = RichMan2(property: House2())
richman2.getProperty().name



