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

    static func dirving() {
        print("BMW")
    }

    // required 子类必须都实现这个关键字标记的方法
    required init(clubLabel: String) {
        print(clubLabel)
    }

    init() {}

    func getMoney() -> Int {
        self.money
    }
}

class PoorMan: CharityProtocol {
    private var money: Int = 500

    var donatedMoney: Float = 1.0

    static func dirving() {
        print("BYD drving")
    }

    required init(clubLabel: String) {
        print(clubLabel)
    }

    init() {}

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

    static func dirving() -> Void

    init(clubLabel: String)

    func hasChildren() -> Bool
}

extension CharityProtocol {
    func hasChildren() -> Bool {
        return false
    }
}

let club = CharityClub()

let richman = RichMan()

let poorman = PoorMan()

richman.hasChildren()
poorman.hasChildren()

club.addMember(man: richman)
club.addMember(man: poorman)

class Person {
    private var clubLabel: String
    private var money: Int = 20000
    required init(clubLabel: String) {
        self.clubLabel = clubLabel
    }
}

extension Person: CharityProtocol {
    var donatedMoney: Float {
        return Float(self.money) * 1 / 3
    }

    func participateActivity(name: String) {
        print("richman has joined")
    }

    static func dirving() {
        print("BMW drving")
    }
}

var person = Person(clubLabel: "superman")
club.addMember(man: person)

protocol NewCharityProtocol: CharityClub {
    var donatedMoneySecond: Float { get }
}
