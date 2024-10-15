import UIKit

var greeting = "Hello, playground"

class RichMan: CharityProtocol {
    private var money: Int = 1000000

    var donatedMoney: Float {
        return Float(self.money) * 1 / 3
    }

    func participateActivity(name: String) {
        print("richman has joined")
    }

    func getMoney() -> Int {
        self.money
    }
}

class PoorMan: CharityProtocol {
    private var money: Int = 500

    var donatedMoney: Float = 1.0

    func participateActivity(name: String) {
        self.money -= 1
        print("poorman has join Activity")
    }
}

class CharityClub {
    private var members = [CharityProtocol]()

    func addMember(man: CharityProtocol) {
        self.members.append(man)
    }
}

protocol CharityProtocol {
    var donatedMoney: Float { get }

    func participateActivity(name: String)
}
