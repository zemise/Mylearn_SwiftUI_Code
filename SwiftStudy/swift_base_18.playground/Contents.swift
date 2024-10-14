import UIKit

var greeting = "Hello, playground"

class Richman {
    private var money: Int = 10000
    private var boat: String

    init() {
        boat = ""
    }

    init(_ boatName: String) {
        boat = boatName
    }

    private func doDeinit() {
        print("\ndoDeinit")
    }

    // 被系统回收之前，做点事
    deinit {
        self.doDeinit()
        print("我被清理回收了")
    }
}

var richman: Richman? = Richman("vip")
richman = nil



// 方法内的对象在方法结束后，会自动销毁，此事如果有xigou
func test() {
    let richmanOfFunc = Richman()
}


test()
