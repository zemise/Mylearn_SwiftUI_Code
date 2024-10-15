import UIKit

var greeting = "Hello, playground"

struct RichMan {
    var name: String

    struct BaseInfoStruct {
        var age: Int
        var sex: Sex
    }

    class BaseInfoClass {}

    enum Sex {
        case male
        case female
    }

    var baseInfo: BaseInfoStruct
    var baseInfoClass: BaseInfoClass

    init() {
        name = "name"

        baseInfo = BaseInfoStruct(age: 11, sex: .male)
        baseInfoClass = BaseInfoClass()
    }
}

var richman = RichMan()

let baseInfo: RichMan.BaseInfoStruct = richman.baseInfo

// 方法里内嵌
func getName() -> String {
    class BaseInfoClass {
        var name = ""
    }

    let baseInfoClass = BaseInfoClass()

    return baseInfoClass.name
}
