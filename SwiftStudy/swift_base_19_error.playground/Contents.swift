import UIKit

var greeting = "Hello, playground"

enum LogicError: Error {
    case wrongValue
    case wrongProcessing
    case wrongParam(String)
}

func LogicFunc(input: Int) throws -> Bool {
    if input == 0 {
        throw LogicError.wrongValue
    }

    let temp = input + 10

    if temp < 20 {
        throw LogicError.wrongProcessing
    }

    if temp < 30 {
        throw LogicError.wrongParam("<30 error")
    }

    return temp == 50 ? true : false
}

defer {
    print("after try")
}

do {
    try LogicFunc(input: 10)
} catch var LogicError.wrongParam(parm) {
    print(parm)
}

let result = try! LogicFunc(input: 25)

func doLogic() throws -> Bool {
    var result = false

    do {
        result = try LogicFunc(input: 0)
    } catch LogicError.wrongValue {
        throw LogicError.wrongValue
    }

    return result
}
