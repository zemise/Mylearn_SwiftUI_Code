import UIKit

var greeting = "Hello, playground"

// checked version
class RichMan {
    private var money: Int = 1000000000

    init() {}

    func getMoney() -> Int {
        return money
    }
}

let richman = RichMan()
richman.getMoney()

extension RichMan {
    var donatedMoney: Float {
        Float(money) * 0.3
    }

    func getDonatedMoney() -> Float {
        Float(money) * 0.3
    }

    class func playgame() {
        print("class for func playgame")
    }
}

extension RichMan {
    convenience init(money: Int) {
        self.init()
        self.money = money * 3
    }
}

richman.donatedMoney
richman.getDonatedMoney()
RichMan.playgame()

let richman02 = RichMan(money: 2)
richman02.donatedMoney
richman02.getDonatedMoney()
RichMan.playgame()

extension RichMan {
    subscript(propertyName: String) -> Int {
        if propertyName == "money" {
            return money
        } else {
            return 0
        }
    }
}

richman[""]
richman["money"]

extension RichMan {
    struct BaseInfo {
        var teleNO: String
    }

    func getTeleNo() -> String {
        let baseInfo = BaseInfo(teleNO: "9988")
        return baseInfo.teleNO
    }
}

richman.getTeleNo()
